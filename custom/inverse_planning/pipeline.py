from goal_inference import infer_goal
from inverse_planning_env import DEMOS
from pddlgym.planning import run_async_value_iteration, vi_finish_helper
from collections import OrderedDict, defaultdict
import gym
import time
import pddlgym
import pickle
import os
import numpy as np
import sys

# Hyperparameters
QUARTILE = 0.25
outdir = 'results'
do_precomputation = True #"if not exists"
test_qvals = True
do_goal_inference = True #"if not exists"
test_goal_inference = True
vi_maxiters = { True : 10000, False : 250000 } # biased? : max_iters
horizon = 100
gamma = 0.9 # todo optimize
beta = 1. # todo optimize
env_names = [
    "InversePlanningDoorsKeysGems-v0",
    # "InversePlanningBlocks-v0",
    # "InversePlanningIntrusionDetection-v0",
    # "InversePlanningLogistics-v0",
    # "InversePlanningCampus-v0",
    # "InversePlanningTaxi-v0",
]

def create_headers(verbose=False):
    """headers[env_name][initial_state] -> [goals]"""
    headers = OrderedDict()
    for env_name in env_names:
        headers[env_name] = OrderedDict()
        env = gym.make(env_name)

        # desperate times
        if env_name == "InversePlanningTaxi-v0":
            problem_prefix_to_group = env.get_problem_groups()
            problem_prefixes = sorted(problem_prefix_to_group)

        else:
            # Group the problems that have the same initial state but different goals
            problem_prefix_to_group = defaultdict(list)
            for problem in env.problems:
                fname_alone = os.path.split(problem.problem_fname)[-1]
                split = fname_alone.split("_")
                prefix = "_".join(split[:-1])
                goal = split[-1][:-len(".pddl")]
                problem_prefix_to_group[prefix].append(goal)
            problem_prefixes = sorted(problem_prefix_to_group)

        env.close()

        for initial_state in problem_prefixes:
            headers[env_name][initial_state] = problem_prefix_to_group[initial_state]

    if verbose:
        print("All headers:")
        for env_name in headers:
            print(env_name)
            for initial_state in headers[env_name]:
                print("  {}".format(initial_state))
                print("    {}".format(headers[env_name][initial_state]))

    return headers

def get_qval_run_id(env_name, initial_state, goal, biased):
    return "qval_run_{}_{}_{}_{}".format(env_name, initial_state, goal, biased)

def get_goal_inference_run_id(env_name, initial_state, goal, biased, demonstration_idx):
    if DEMOS == "nonoptimal":
        return "goal_inference_run_{}_{}_{}_{}_{}".format(env_name, initial_state, goal, biased, demonstration_idx)
    return "goal_inference_run_{}_{}_{}_{}".format(env_name, initial_state, goal, biased)

def save_results(run_id, results):
    outfile = os.path.join(outdir, run_id + '.pkl')
    with open(outfile, 'wb') as f:
        pickle.dump(results, f)
    print("Dumped results to {}.".format(outfile))

def load_results(run_id):
    outfile = os.path.join(outdir, run_id + '.pkl')
    with open(outfile, 'rb') as f:
        results = pickle.load(f)
    return results

def results_exist(run_id):
    outfile = os.path.join(outdir, run_id + '.pkl')
    return os.path.exists(outfile)

def create_env(env_name, initial_state, goal):
    env = gym.make(env_name)
    if hasattr(env, '_problem_index_to_problem_file'):
        problem_fname = initial_state + '-' + goal + '.pddl'
        found_problems = [os.path.split(p)[-1] == problem_fname for p in env._problem_index_to_problem_file]
    else:
        problem_fname = initial_state + '_' + goal + '.pddl'
        found_problems = [os.path.split(p.problem_fname)[-1] == problem_fname for p in env.problems]
    assert sum(found_problems) == 1
    problem_index = np.argwhere(found_problems)[0,0]
    env.fix_problem_index(problem_index)
    env.reset()
    return env

def compute_qvals(env_name, initial_state, goal, biased):
    env = create_env(env_name, initial_state, goal)
    if DEMOS == "nonoptimal" and len(env._state_buffer) == 0:
        print("Skipping env", env_name, initial_state, goal)
        return {}
    qvals = next(run_async_value_iteration(env, iter_plans=False, use_cache=False,
                gamma=gamma, epsilon=0., vi_maxiters=vi_maxiters[biased], biased=biased, ret_qvals=True))
    env.close()
    return qvals

def run_test_qvals(env_name, initial_state, goal, qvals):
    env = create_env(env_name, initial_state, goal)
    env.reset()
    state = env.get_state()
    plan = vi_finish_helper(env, state, qvals, actions_for_state=None, horizon=horizon)
    total_reward = 0
    for action in plan:
        _, reward, _, _ = env.step(action)
        total_reward += reward
    print("Reward accrued following qvals:", total_reward)
    env.close()

def get_demonstrations(env_name, initial_state, goal):
    demonstrations = []
    env = create_env(env_name, initial_state, goal)
    plans = env.load_demonstrations_for_problem()
    # assert len(plans) == 2
    for plan in plans:
        states = env.run_demo(plan)
        assert len(states) == len(plan) + 1
        demonstration = list(zip(states[:-1], plan))
        demonstrations.append(demonstration)
    env.close()
    return demonstrations
    # Uncomment to get a demonstration using computed qvals
    # demonstration = []
    # env = create_env(env_name, initial_state, goal)
    # obs, _ = env.reset()
    # plan = next(run_async_value_iteration(env, iter_plans=False, use_cache=False, gamma=gamma,
    #     epsilon=0., vi_maxiters=vi_maxiters[True], biased=True, ret_qvals=False, horizon=horizon))
    # for action in plan:
    #     demonstration.append((obs, action))
    # return demonstration

def compute_goal_inference_posteriors(demonstration, goals, goal_qvals, env_name, initial_state, goal):
    env = create_env(env_name, initial_state, goal)  # Just for valid actions
    goal_distribution_per_step = [np.ones(len(goals)) / len(goals)]
    valid_action_time_total = 0
    for t in range(1, len(demonstration)+1):
        demo_t = demonstration[:t]
        # Run goal inference
        goal_distribution, valid_action_time = infer_goal(demo_t, goal_qvals, env, beta=beta)
        valid_action_time_total += valid_action_time
        goal_distribution_per_step.append(goal_distribution)
    env.close()
    return goal_distribution_per_step, valid_action_time_total

def run_test_goal_inference(goals, goal, posteriors):
    goal_idx = goals.index(goal)
    half_posterior = np.array(posteriors[int(QUARTILE*len(posteriors))])
    last_posterior = np.array(posteriors[-1])
    half_result = goal_idx in np.argwhere(half_posterior == max(half_posterior))
    end_result = (goal_idx in np.argwhere(last_posterior == max(last_posterior)))
    print("Goal is top at half?", half_result)
    print("Goal is top at end?", end_result)
    return end_result

def get_posterior_for_true_goal(goal_idx, gi_results):
    posteriors = gi_results["posteriors"]
    return posteriors[int(QUARTILE*len(posteriors))][goal_idx]

def get_true_goal_top_ranked(goal_idx, gi_results):
    posteriors = gi_results["posteriors"]
    posterior = posteriors[int(QUARTILE*len(posteriors))]
    return goal_idx in np.argwhere(posterior == max(posterior))

def report_results():
    for biased in [True]:
        print("### Results for biased={}".format(biased))

        headers = create_headers()

        for env_name in env_names:
            all_posterior_true_goal = []
            all_true_goal_top_ranked = []
            all_initial_time_cost = []
            all_marginal_time_cost_per_step = []
            all_average_cost_per_step = []
            all_states_visited = []

            for initial_state in headers[env_name]:
                for goal_idx, goal in enumerate(headers[env_name][initial_state]):
                    # qval_run_id = get_qval_run_id(env_name, initial_state, goal, biased=biased)
                    # qval_results = load_results(qval_run_id)
                    
                    demonstrations = get_demonstrations(env_name, initial_state, goal)
                    for demonstration_idx, demonstration in enumerate(demonstrations):
                    
                        gi_run_id = get_goal_inference_run_id(env_name, initial_state, goal, biased=biased,
                            demonstration_idx=demonstration_idx)
                        gi_results = load_results(gi_run_id)

                        # Accuracy
                        posterior_true_goal = get_posterior_for_true_goal(goal_idx, gi_results)
                        true_goal_top_ranked = get_true_goal_top_ranked(goal_idx, gi_results)

                        # Speed
                        # initial_time_cost = qval_results['time_elapsed']
                        # num_steps = len(gi_results['posteriors'])
                        # marginal_time_cost_per_step = gi_results['time_elapsed'] / num_steps
                        # average_cost_per_step = (marginal_time_cost_per_step * num_steps + initial_time_cost) / num_steps
                        # states_visited = vi_maxiters[biased]

                        all_posterior_true_goal.append(posterior_true_goal)
                        all_true_goal_top_ranked.append(true_goal_top_ranked)
                        # all_initial_time_cost.append(initial_time_cost)
                        # all_marginal_time_cost_per_step.append(marginal_time_cost_per_step)
                        # all_average_cost_per_step.append(average_cost_per_step)
                        # all_states_visited.append(states_visited)

                        del gi_results
                    # del qval_results

            # print("all_marginal_time_cost_per_step:", all_marginal_time_cost_per_step)

            print("**** {} ****".format(env_name))
            print("\nPosterior true goal")
            print("mean: ", np.mean(all_posterior_true_goal))
            print("std: ", np.std(all_posterior_true_goal))

            print("\nTrue goal top ranked")
            print("mean: ", np.mean(all_true_goal_top_ranked))
            print("std: ", np.std(all_true_goal_top_ranked))

            # print("\nInitial time cost")
            # print("mean: ", np.mean(all_initial_time_cost))
            # print("std: ", np.std(all_initial_time_cost))

            # print("\nMarginal time cost per step")
            # print("mean: ", np.mean(all_marginal_time_cost_per_step))
            # print("std: ", np.std(all_marginal_time_cost_per_step))

            # print("\nAverage cost per step")
            # print("mean: ", np.mean(all_average_cost_per_step))
            # print("std: ", np.std(all_average_cost_per_step))

            # print("\nStates visited")
            # print("mean: ", np.mean(all_states_visited))
            # print("std: ", np.std(all_states_visited))

def run_pipeline(indices, mode, biased):
    """
    Precomputation phase:
    Environments x Initial States x Goals --> { 'qvals' : Value function, 'time' : s }

    Goal inference phase:
    Environments x Initial States x Goals  --> { 'posteriors' : Trajectory Length x Goals --> Float, 'time'  : s }
    """
    headers = create_headers()

    index_counter = 0
    if do_precomputation or do_goal_inference:
        for env_name in env_names:
            for initial_state in headers[env_name]:
                # Value function precomputation
                for goal in headers[env_name][initial_state]:
                    qval_run_id = get_qval_run_id(env_name, initial_state, goal, biased=biased)
                    if do_precomputation and mode == "qv":
                        index_counter += 1
                        if index_counter not in indices:
                            continue
                        if do_precomputation == "if not exists":
                            if results_exist(qval_run_id):
                                print("Found {}, skipping".format(qval_run_id))
                                continue
                        print("Doing index {}".format(index_counter))
                        start_time = time.time()
                        qvals = compute_qvals(env_name, initial_state, goal, biased=biased)
                        time_elapsed = time.time() - start_time
                        results = {"qvals" : qvals, "time_elapsed" : time_elapsed}
                        save_results(qval_run_id, results)
                        if test_qvals:
                            run_test_qvals(env_name, initial_state, goal, qvals)
                        del qvals

                # Goal inference
                for goal in headers[env_name][initial_state]:
                    if do_goal_inference and mode == "gi":
                        index_counter += 1
                        if index_counter not in indices:
                            continue
                        # if do_goal_inference == "if not exists":
                        #     if results_exist(gi_run_id):
                        #         print("Found {}, skipping".format(gi_run_id))
                        #         continue
                        print("Doing index {}".format(index_counter))

                        # Get demonstrations
                        demonstrations = get_demonstrations(env_name, initial_state, goal)
                        for demonstration_idx, demonstration in enumerate(demonstrations):
                            gi_run_id = get_goal_inference_run_id(env_name, initial_state, goal, 
                                biased=biased, demonstration_idx=demonstration_idx)
                            # Load qvals for all goals
                            goals = headers[env_name][initial_state]
                            goal_qvals = []
                            for g in goals:
                                qval_q_run_id = get_qval_run_id(env_name, initial_state, g, biased=biased)
                                results_g = load_results(qval_q_run_id) # too large
                                qvals_g = results_g["qvals"]
                                # qvals_g = os.path.join(outdir, qval_q_run_id + '.pkl')
                                goal_qvals.append(qvals_g)
                            start_time = time.time()
                            posteriors, time_to_ignore = compute_goal_inference_posteriors(demonstration, 
                                goals, goal_qvals, env_name, initial_state, goal)
                            time_elapsed = time.time() - start_time - time_to_ignore
                            results = {"posteriors" : posteriors, "time_elapsed" : time_elapsed}
                            save_results(gi_run_id, results)
                            if test_goal_inference:
                                run_test_goal_inference(goals, goal, posteriors)

def count_indices():
    headers = create_headers(verbose=False)
    index = 0
    for env_name in env_names:
        for initial_state in headers[env_name]:
            for goal in headers[env_name][initial_state]:
                index += 1
    return index

def print_help():
    print("Usage: python pipeline.py [biased or unbiased] [qv or gi] [start index] [end index]")
    print("where [index] ranges from 0 to {}".format(count_indices() - 1))


def main():
    if len(sys.argv) == 2 and sys.argv[1] == "report":
        report_results()
        sys.exit(0)
    elif len(sys.argv) != 5:
        print_help()
        sys.exit(0)
    else:
        biased_arg = sys.argv[1]
        mode = sys.argv[2]
        start_index = sys.argv[3]
        end_index = sys.argv[4]

    assert mode == "qv" or mode == "gi"
    assert biased_arg == "biased" or biased_arg == "unbiased"
    assert start_index.isdigit() and end_index.isdigit()
    biased = (biased_arg == "biased")

    run_pipeline(list(range(int(start_index), int(end_index))), mode, biased=biased)

if __name__ == "__main__":
    main()