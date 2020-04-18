
(define (problem ipc-grid-10-5-10) (:domain grid)
  (:objects
        key_0 - key
	key_1 - key
	key_2 - key
	key_3 - key
	key_4 - key
	key_5 - key
	key_6 - key
	key_7 - key
	key_8 - key
	key_9 - key
	place_0_0 - place
	place_0_1 - place
	place_0_2 - place
	place_0_3 - place
	place_0_4 - place
	place_1_0 - place
	place_1_1 - place
	place_1_2 - place
	place_1_3 - place
	place_1_4 - place
	place_2_0 - place
	place_2_1 - place
	place_2_2 - place
	place_2_3 - place
	place_2_4 - place
	place_3_0 - place
	place_3_1 - place
	place_3_2 - place
	place_3_3 - place
	place_3_4 - place
	place_4_0 - place
	place_4_1 - place
	place_4_2 - place
	place_4_3 - place
	place_4_4 - place
	place_5_0 - place
	place_5_1 - place
	place_5_2 - place
	place_5_3 - place
	place_5_4 - place
	place_6_0 - place
	place_6_1 - place
	place_6_2 - place
	place_6_3 - place
	place_6_4 - place
	place_7_0 - place
	place_7_1 - place
	place_7_2 - place
	place_7_3 - place
	place_7_4 - place
	place_8_0 - place
	place_8_1 - place
	place_8_2 - place
	place_8_3 - place
	place_8_4 - place
	place_9_0 - place
	place_9_1 - place
	place_9_2 - place
	place_9_3 - place
	place_9_4 - place
	shape_0 - shape
	shape_1 - shape
	shape_2 - shape
	shape_3 - shape
	shape_4 - shape
	shape_5 - shape
	shape_6 - shape
	shape_7 - shape
	shape_8 - shape
	shape_9 - shape
  )
  (:goal (and
	(at-robot place_7_4)))
  (:init 
	(at key_0 place_6_0)
	(at key_1 place_6_0)
	(at key_2 place_1_0)
	(at key_3 place_0_0)
	(at key_4 place_6_0)
	(at key_5 place_9_0)
	(at key_6 place_3_0)
	(at key_7 place_5_0)
	(at key_8 place_0_0)
	(at key_9 place_9_0)
	(at-robot place_0_0)
	(conn place_0_0 place_0_1)
	(conn place_0_0 place_1_0)
	(conn place_0_1 place_0_0)
	(conn place_0_1 place_0_2)
	(conn place_0_2 place_0_1)
	(conn place_0_2 place_0_3)
	(conn place_0_2 place_1_2)
	(conn place_0_3 place_0_2)
	(conn place_0_3 place_0_4)
	(conn place_0_4 place_0_3)
	(conn place_1_0 place_0_0)
	(conn place_1_0 place_1_1)
	(conn place_1_0 place_2_0)
	(conn place_1_1 place_1_0)
	(conn place_1_1 place_1_2)
	(conn place_1_2 place_0_2)
	(conn place_1_2 place_1_1)
	(conn place_1_2 place_1_3)
	(conn place_1_3 place_1_2)
	(conn place_1_3 place_1_4)
	(conn place_1_4 place_1_3)
	(conn place_2_0 place_1_0)
	(conn place_2_0 place_2_1)
	(conn place_2_0 place_3_0)
	(conn place_2_1 place_2_0)
	(conn place_2_1 place_2_2)
	(conn place_2_1 place_3_1)
	(conn place_2_2 place_2_1)
	(conn place_2_2 place_2_3)
	(conn place_2_3 place_2_2)
	(conn place_2_3 place_2_4)
	(conn place_2_4 place_2_3)
	(conn place_3_0 place_2_0)
	(conn place_3_0 place_3_1)
	(conn place_3_0 place_4_0)
	(conn place_3_1 place_2_1)
	(conn place_3_1 place_3_0)
	(conn place_3_1 place_3_2)
	(conn place_3_2 place_3_1)
	(conn place_3_2 place_3_3)
	(conn place_3_3 place_3_2)
	(conn place_3_3 place_3_4)
	(conn place_3_4 place_3_3)
	(conn place_4_0 place_3_0)
	(conn place_4_0 place_4_1)
	(conn place_4_0 place_5_0)
	(conn place_4_1 place_4_0)
	(conn place_4_1 place_4_2)
	(conn place_4_1 place_5_1)
	(conn place_4_2 place_4_1)
	(conn place_4_2 place_4_3)
	(conn place_4_3 place_4_2)
	(conn place_4_3 place_4_4)
	(conn place_4_4 place_4_3)
	(conn place_5_0 place_4_0)
	(conn place_5_0 place_5_1)
	(conn place_5_0 place_6_0)
	(conn place_5_1 place_4_1)
	(conn place_5_1 place_5_0)
	(conn place_5_1 place_5_2)
	(conn place_5_2 place_5_1)
	(conn place_5_2 place_5_3)
	(conn place_5_3 place_5_2)
	(conn place_5_3 place_5_4)
	(conn place_5_4 place_5_3)
	(conn place_6_0 place_5_0)
	(conn place_6_0 place_6_1)
	(conn place_6_0 place_7_0)
	(conn place_6_1 place_6_0)
	(conn place_6_1 place_6_2)
	(conn place_6_2 place_6_1)
	(conn place_6_2 place_6_3)
	(conn place_6_3 place_6_2)
	(conn place_6_3 place_6_4)
	(conn place_6_4 place_6_3)
	(conn place_7_0 place_6_0)
	(conn place_7_0 place_7_1)
	(conn place_7_0 place_8_0)
	(conn place_7_1 place_7_0)
	(conn place_7_1 place_7_2)
	(conn place_7_2 place_7_1)
	(conn place_7_2 place_7_3)
	(conn place_7_3 place_7_2)
	(conn place_7_3 place_7_4)
	(conn place_7_4 place_7_3)
	(conn place_8_0 place_7_0)
	(conn place_8_0 place_8_1)
	(conn place_8_0 place_9_0)
	(conn place_8_1 place_8_0)
	(conn place_8_1 place_8_2)
	(conn place_8_2 place_8_1)
	(conn place_8_2 place_8_3)
	(conn place_8_3 place_8_2)
	(conn place_8_3 place_8_4)
	(conn place_8_3 place_9_3)
	(conn place_8_4 place_8_3)
	(conn place_9_0 place_8_0)
	(conn place_9_0 place_9_1)
	(conn place_9_1 place_9_0)
	(conn place_9_1 place_9_2)
	(conn place_9_2 place_9_1)
	(conn place_9_2 place_9_3)
	(conn place_9_3 place_8_3)
	(conn place_9_3 place_9_2)
	(conn place_9_3 place_9_4)
	(conn place_9_4 place_9_3)
	(key-shape key_0 shape_0)
	(key-shape key_1 shape_1)
	(key-shape key_2 shape_2)
	(key-shape key_3 shape_3)
	(key-shape key_4 shape_4)
	(key-shape key_5 shape_5)
	(key-shape key_6 shape_6)
	(key-shape key_7 shape_7)
	(key-shape key_8 shape_8)
	(key-shape key_9 shape_9)
	(lock-shape place_1_2 shape_1)
	(lock-shape place_2_1 shape_2)
	(lock-shape place_3_2 shape_4)
	(lock-shape place_4_1 shape_7)
	(lock-shape place_4_2 shape_6)
	(lock-shape place_5_1 shape_5)
	(lock-shape place_6_1 shape_9)
	(lock-shape place_6_2 shape_0)
	(lock-shape place_7_1 shape_3)
	(lock-shape place_9_2 shape_8)
	(locked place_1_2)
	(locked place_2_1)
	(locked place_3_2)
	(locked place_4_1)
	(locked place_4_2)
	(locked place_5_1)
	(locked place_6_1)
	(locked place_6_2)
	(locked place_7_1)
	(locked place_9_2)
	(move place_0_0)
	(move place_0_1)
	(move place_0_2)
	(move place_0_3)
	(move place_0_4)
	(move place_1_0)
	(move place_1_1)
	(move place_1_2)
	(move place_1_3)
	(move place_1_4)
	(move place_2_0)
	(move place_2_1)
	(move place_2_2)
	(move place_2_3)
	(move place_2_4)
	(move place_3_0)
	(move place_3_1)
	(move place_3_2)
	(move place_3_3)
	(move place_3_4)
	(move place_4_0)
	(move place_4_1)
	(move place_4_2)
	(move place_4_3)
	(move place_4_4)
	(move place_5_0)
	(move place_5_1)
	(move place_5_2)
	(move place_5_3)
	(move place_5_4)
	(move place_6_0)
	(move place_6_1)
	(move place_6_2)
	(move place_6_3)
	(move place_6_4)
	(move place_7_0)
	(move place_7_1)
	(move place_7_2)
	(move place_7_3)
	(move place_7_4)
	(move place_8_0)
	(move place_8_1)
	(move place_8_2)
	(move place_8_3)
	(move place_8_4)
	(move place_9_0)
	(move place_9_1)
	(move place_9_2)
	(move place_9_3)
	(move place_9_4)
	(open place_0_0)
	(open place_0_1)
	(open place_0_2)
	(open place_0_3)
	(open place_0_4)
	(open place_1_0)
	(open place_1_1)
	(open place_1_3)
	(open place_1_4)
	(open place_2_0)
	(open place_2_2)
	(open place_2_3)
	(open place_2_4)
	(open place_3_0)
	(open place_3_1)
	(open place_3_3)
	(open place_3_4)
	(open place_4_0)
	(open place_4_3)
	(open place_4_4)
	(open place_5_0)
	(open place_5_2)
	(open place_5_3)
	(open place_5_4)
	(open place_6_0)
	(open place_6_3)
	(open place_6_4)
	(open place_7_0)
	(open place_7_2)
	(open place_7_3)
	(open place_7_4)
	(open place_8_0)
	(open place_8_1)
	(open place_8_2)
	(open place_8_3)
	(open place_8_4)
	(open place_9_0)
	(open place_9_1)
	(open place_9_3)
	(open place_9_4)
	(pickup key_0)
	(pickup key_1)
	(pickup key_2)
	(pickup key_3)
	(pickup key_4)
	(pickup key_5)
	(pickup key_6)
	(pickup key_7)
	(pickup key_8)
	(pickup key_9)
	(unlock place_0_0 key_0)
	(unlock place_0_0 key_1)
	(unlock place_0_0 key_2)
	(unlock place_0_0 key_3)
	(unlock place_0_0 key_4)
	(unlock place_0_0 key_5)
	(unlock place_0_0 key_6)
	(unlock place_0_0 key_7)
	(unlock place_0_0 key_8)
	(unlock place_0_0 key_9)
	(unlock place_0_1 key_0)
	(unlock place_0_1 key_1)
	(unlock place_0_1 key_2)
	(unlock place_0_1 key_3)
	(unlock place_0_1 key_4)
	(unlock place_0_1 key_5)
	(unlock place_0_1 key_6)
	(unlock place_0_1 key_7)
	(unlock place_0_1 key_8)
	(unlock place_0_1 key_9)
	(unlock place_0_2 key_0)
	(unlock place_0_2 key_1)
	(unlock place_0_2 key_2)
	(unlock place_0_2 key_3)
	(unlock place_0_2 key_4)
	(unlock place_0_2 key_5)
	(unlock place_0_2 key_6)
	(unlock place_0_2 key_7)
	(unlock place_0_2 key_8)
	(unlock place_0_2 key_9)
	(unlock place_0_3 key_0)
	(unlock place_0_3 key_1)
	(unlock place_0_3 key_2)
	(unlock place_0_3 key_3)
	(unlock place_0_3 key_4)
	(unlock place_0_3 key_5)
	(unlock place_0_3 key_6)
	(unlock place_0_3 key_7)
	(unlock place_0_3 key_8)
	(unlock place_0_3 key_9)
	(unlock place_0_4 key_0)
	(unlock place_0_4 key_1)
	(unlock place_0_4 key_2)
	(unlock place_0_4 key_3)
	(unlock place_0_4 key_4)
	(unlock place_0_4 key_5)
	(unlock place_0_4 key_6)
	(unlock place_0_4 key_7)
	(unlock place_0_4 key_8)
	(unlock place_0_4 key_9)
	(unlock place_1_0 key_0)
	(unlock place_1_0 key_1)
	(unlock place_1_0 key_2)
	(unlock place_1_0 key_3)
	(unlock place_1_0 key_4)
	(unlock place_1_0 key_5)
	(unlock place_1_0 key_6)
	(unlock place_1_0 key_7)
	(unlock place_1_0 key_8)
	(unlock place_1_0 key_9)
	(unlock place_1_1 key_0)
	(unlock place_1_1 key_1)
	(unlock place_1_1 key_2)
	(unlock place_1_1 key_3)
	(unlock place_1_1 key_4)
	(unlock place_1_1 key_5)
	(unlock place_1_1 key_6)
	(unlock place_1_1 key_7)
	(unlock place_1_1 key_8)
	(unlock place_1_1 key_9)
	(unlock place_1_2 key_0)
	(unlock place_1_2 key_1)
	(unlock place_1_2 key_2)
	(unlock place_1_2 key_3)
	(unlock place_1_2 key_4)
	(unlock place_1_2 key_5)
	(unlock place_1_2 key_6)
	(unlock place_1_2 key_7)
	(unlock place_1_2 key_8)
	(unlock place_1_2 key_9)
	(unlock place_1_3 key_0)
	(unlock place_1_3 key_1)
	(unlock place_1_3 key_2)
	(unlock place_1_3 key_3)
	(unlock place_1_3 key_4)
	(unlock place_1_3 key_5)
	(unlock place_1_3 key_6)
	(unlock place_1_3 key_7)
	(unlock place_1_3 key_8)
	(unlock place_1_3 key_9)
	(unlock place_1_4 key_0)
	(unlock place_1_4 key_1)
	(unlock place_1_4 key_2)
	(unlock place_1_4 key_3)
	(unlock place_1_4 key_4)
	(unlock place_1_4 key_5)
	(unlock place_1_4 key_6)
	(unlock place_1_4 key_7)
	(unlock place_1_4 key_8)
	(unlock place_1_4 key_9)
	(unlock place_2_0 key_0)
	(unlock place_2_0 key_1)
	(unlock place_2_0 key_2)
	(unlock place_2_0 key_3)
	(unlock place_2_0 key_4)
	(unlock place_2_0 key_5)
	(unlock place_2_0 key_6)
	(unlock place_2_0 key_7)
	(unlock place_2_0 key_8)
	(unlock place_2_0 key_9)
	(unlock place_2_1 key_0)
	(unlock place_2_1 key_1)
	(unlock place_2_1 key_2)
	(unlock place_2_1 key_3)
	(unlock place_2_1 key_4)
	(unlock place_2_1 key_5)
	(unlock place_2_1 key_6)
	(unlock place_2_1 key_7)
	(unlock place_2_1 key_8)
	(unlock place_2_1 key_9)
	(unlock place_2_2 key_0)
	(unlock place_2_2 key_1)
	(unlock place_2_2 key_2)
	(unlock place_2_2 key_3)
	(unlock place_2_2 key_4)
	(unlock place_2_2 key_5)
	(unlock place_2_2 key_6)
	(unlock place_2_2 key_7)
	(unlock place_2_2 key_8)
	(unlock place_2_2 key_9)
	(unlock place_2_3 key_0)
	(unlock place_2_3 key_1)
	(unlock place_2_3 key_2)
	(unlock place_2_3 key_3)
	(unlock place_2_3 key_4)
	(unlock place_2_3 key_5)
	(unlock place_2_3 key_6)
	(unlock place_2_3 key_7)
	(unlock place_2_3 key_8)
	(unlock place_2_3 key_9)
	(unlock place_2_4 key_0)
	(unlock place_2_4 key_1)
	(unlock place_2_4 key_2)
	(unlock place_2_4 key_3)
	(unlock place_2_4 key_4)
	(unlock place_2_4 key_5)
	(unlock place_2_4 key_6)
	(unlock place_2_4 key_7)
	(unlock place_2_4 key_8)
	(unlock place_2_4 key_9)
	(unlock place_3_0 key_0)
	(unlock place_3_0 key_1)
	(unlock place_3_0 key_2)
	(unlock place_3_0 key_3)
	(unlock place_3_0 key_4)
	(unlock place_3_0 key_5)
	(unlock place_3_0 key_6)
	(unlock place_3_0 key_7)
	(unlock place_3_0 key_8)
	(unlock place_3_0 key_9)
	(unlock place_3_1 key_0)
	(unlock place_3_1 key_1)
	(unlock place_3_1 key_2)
	(unlock place_3_1 key_3)
	(unlock place_3_1 key_4)
	(unlock place_3_1 key_5)
	(unlock place_3_1 key_6)
	(unlock place_3_1 key_7)
	(unlock place_3_1 key_8)
	(unlock place_3_1 key_9)
	(unlock place_3_2 key_0)
	(unlock place_3_2 key_1)
	(unlock place_3_2 key_2)
	(unlock place_3_2 key_3)
	(unlock place_3_2 key_4)
	(unlock place_3_2 key_5)
	(unlock place_3_2 key_6)
	(unlock place_3_2 key_7)
	(unlock place_3_2 key_8)
	(unlock place_3_2 key_9)
	(unlock place_3_3 key_0)
	(unlock place_3_3 key_1)
	(unlock place_3_3 key_2)
	(unlock place_3_3 key_3)
	(unlock place_3_3 key_4)
	(unlock place_3_3 key_5)
	(unlock place_3_3 key_6)
	(unlock place_3_3 key_7)
	(unlock place_3_3 key_8)
	(unlock place_3_3 key_9)
	(unlock place_3_4 key_0)
	(unlock place_3_4 key_1)
	(unlock place_3_4 key_2)
	(unlock place_3_4 key_3)
	(unlock place_3_4 key_4)
	(unlock place_3_4 key_5)
	(unlock place_3_4 key_6)
	(unlock place_3_4 key_7)
	(unlock place_3_4 key_8)
	(unlock place_3_4 key_9)
	(unlock place_4_0 key_0)
	(unlock place_4_0 key_1)
	(unlock place_4_0 key_2)
	(unlock place_4_0 key_3)
	(unlock place_4_0 key_4)
	(unlock place_4_0 key_5)
	(unlock place_4_0 key_6)
	(unlock place_4_0 key_7)
	(unlock place_4_0 key_8)
	(unlock place_4_0 key_9)
	(unlock place_4_1 key_0)
	(unlock place_4_1 key_1)
	(unlock place_4_1 key_2)
	(unlock place_4_1 key_3)
	(unlock place_4_1 key_4)
	(unlock place_4_1 key_5)
	(unlock place_4_1 key_6)
	(unlock place_4_1 key_7)
	(unlock place_4_1 key_8)
	(unlock place_4_1 key_9)
	(unlock place_4_2 key_0)
	(unlock place_4_2 key_1)
	(unlock place_4_2 key_2)
	(unlock place_4_2 key_3)
	(unlock place_4_2 key_4)
	(unlock place_4_2 key_5)
	(unlock place_4_2 key_6)
	(unlock place_4_2 key_7)
	(unlock place_4_2 key_8)
	(unlock place_4_2 key_9)
	(unlock place_4_3 key_0)
	(unlock place_4_3 key_1)
	(unlock place_4_3 key_2)
	(unlock place_4_3 key_3)
	(unlock place_4_3 key_4)
	(unlock place_4_3 key_5)
	(unlock place_4_3 key_6)
	(unlock place_4_3 key_7)
	(unlock place_4_3 key_8)
	(unlock place_4_3 key_9)
	(unlock place_4_4 key_0)
	(unlock place_4_4 key_1)
	(unlock place_4_4 key_2)
	(unlock place_4_4 key_3)
	(unlock place_4_4 key_4)
	(unlock place_4_4 key_5)
	(unlock place_4_4 key_6)
	(unlock place_4_4 key_7)
	(unlock place_4_4 key_8)
	(unlock place_4_4 key_9)
	(unlock place_5_0 key_0)
	(unlock place_5_0 key_1)
	(unlock place_5_0 key_2)
	(unlock place_5_0 key_3)
	(unlock place_5_0 key_4)
	(unlock place_5_0 key_5)
	(unlock place_5_0 key_6)
	(unlock place_5_0 key_7)
	(unlock place_5_0 key_8)
	(unlock place_5_0 key_9)
	(unlock place_5_1 key_0)
	(unlock place_5_1 key_1)
	(unlock place_5_1 key_2)
	(unlock place_5_1 key_3)
	(unlock place_5_1 key_4)
	(unlock place_5_1 key_5)
	(unlock place_5_1 key_6)
	(unlock place_5_1 key_7)
	(unlock place_5_1 key_8)
	(unlock place_5_1 key_9)
	(unlock place_5_2 key_0)
	(unlock place_5_2 key_1)
	(unlock place_5_2 key_2)
	(unlock place_5_2 key_3)
	(unlock place_5_2 key_4)
	(unlock place_5_2 key_5)
	(unlock place_5_2 key_6)
	(unlock place_5_2 key_7)
	(unlock place_5_2 key_8)
	(unlock place_5_2 key_9)
	(unlock place_5_3 key_0)
	(unlock place_5_3 key_1)
	(unlock place_5_3 key_2)
	(unlock place_5_3 key_3)
	(unlock place_5_3 key_4)
	(unlock place_5_3 key_5)
	(unlock place_5_3 key_6)
	(unlock place_5_3 key_7)
	(unlock place_5_3 key_8)
	(unlock place_5_3 key_9)
	(unlock place_5_4 key_0)
	(unlock place_5_4 key_1)
	(unlock place_5_4 key_2)
	(unlock place_5_4 key_3)
	(unlock place_5_4 key_4)
	(unlock place_5_4 key_5)
	(unlock place_5_4 key_6)
	(unlock place_5_4 key_7)
	(unlock place_5_4 key_8)
	(unlock place_5_4 key_9)
	(unlock place_6_0 key_0)
	(unlock place_6_0 key_1)
	(unlock place_6_0 key_2)
	(unlock place_6_0 key_3)
	(unlock place_6_0 key_4)
	(unlock place_6_0 key_5)
	(unlock place_6_0 key_6)
	(unlock place_6_0 key_7)
	(unlock place_6_0 key_8)
	(unlock place_6_0 key_9)
	(unlock place_6_1 key_0)
	(unlock place_6_1 key_1)
	(unlock place_6_1 key_2)
	(unlock place_6_1 key_3)
	(unlock place_6_1 key_4)
	(unlock place_6_1 key_5)
	(unlock place_6_1 key_6)
	(unlock place_6_1 key_7)
	(unlock place_6_1 key_8)
	(unlock place_6_1 key_9)
	(unlock place_6_2 key_0)
	(unlock place_6_2 key_1)
	(unlock place_6_2 key_2)
	(unlock place_6_2 key_3)
	(unlock place_6_2 key_4)
	(unlock place_6_2 key_5)
	(unlock place_6_2 key_6)
	(unlock place_6_2 key_7)
	(unlock place_6_2 key_8)
	(unlock place_6_2 key_9)
	(unlock place_6_3 key_0)
	(unlock place_6_3 key_1)
	(unlock place_6_3 key_2)
	(unlock place_6_3 key_3)
	(unlock place_6_3 key_4)
	(unlock place_6_3 key_5)
	(unlock place_6_3 key_6)
	(unlock place_6_3 key_7)
	(unlock place_6_3 key_8)
	(unlock place_6_3 key_9)
	(unlock place_6_4 key_0)
	(unlock place_6_4 key_1)
	(unlock place_6_4 key_2)
	(unlock place_6_4 key_3)
	(unlock place_6_4 key_4)
	(unlock place_6_4 key_5)
	(unlock place_6_4 key_6)
	(unlock place_6_4 key_7)
	(unlock place_6_4 key_8)
	(unlock place_6_4 key_9)
	(unlock place_7_0 key_0)
	(unlock place_7_0 key_1)
	(unlock place_7_0 key_2)
	(unlock place_7_0 key_3)
	(unlock place_7_0 key_4)
	(unlock place_7_0 key_5)
	(unlock place_7_0 key_6)
	(unlock place_7_0 key_7)
	(unlock place_7_0 key_8)
	(unlock place_7_0 key_9)
	(unlock place_7_1 key_0)
	(unlock place_7_1 key_1)
	(unlock place_7_1 key_2)
	(unlock place_7_1 key_3)
	(unlock place_7_1 key_4)
	(unlock place_7_1 key_5)
	(unlock place_7_1 key_6)
	(unlock place_7_1 key_7)
	(unlock place_7_1 key_8)
	(unlock place_7_1 key_9)
	(unlock place_7_2 key_0)
	(unlock place_7_2 key_1)
	(unlock place_7_2 key_2)
	(unlock place_7_2 key_3)
	(unlock place_7_2 key_4)
	(unlock place_7_2 key_5)
	(unlock place_7_2 key_6)
	(unlock place_7_2 key_7)
	(unlock place_7_2 key_8)
	(unlock place_7_2 key_9)
	(unlock place_7_3 key_0)
	(unlock place_7_3 key_1)
	(unlock place_7_3 key_2)
	(unlock place_7_3 key_3)
	(unlock place_7_3 key_4)
	(unlock place_7_3 key_5)
	(unlock place_7_3 key_6)
	(unlock place_7_3 key_7)
	(unlock place_7_3 key_8)
	(unlock place_7_3 key_9)
	(unlock place_7_4 key_0)
	(unlock place_7_4 key_1)
	(unlock place_7_4 key_2)
	(unlock place_7_4 key_3)
	(unlock place_7_4 key_4)
	(unlock place_7_4 key_5)
	(unlock place_7_4 key_6)
	(unlock place_7_4 key_7)
	(unlock place_7_4 key_8)
	(unlock place_7_4 key_9)
	(unlock place_8_0 key_0)
	(unlock place_8_0 key_1)
	(unlock place_8_0 key_2)
	(unlock place_8_0 key_3)
	(unlock place_8_0 key_4)
	(unlock place_8_0 key_5)
	(unlock place_8_0 key_6)
	(unlock place_8_0 key_7)
	(unlock place_8_0 key_8)
	(unlock place_8_0 key_9)
	(unlock place_8_1 key_0)
	(unlock place_8_1 key_1)
	(unlock place_8_1 key_2)
	(unlock place_8_1 key_3)
	(unlock place_8_1 key_4)
	(unlock place_8_1 key_5)
	(unlock place_8_1 key_6)
	(unlock place_8_1 key_7)
	(unlock place_8_1 key_8)
	(unlock place_8_1 key_9)
	(unlock place_8_2 key_0)
	(unlock place_8_2 key_1)
	(unlock place_8_2 key_2)
	(unlock place_8_2 key_3)
	(unlock place_8_2 key_4)
	(unlock place_8_2 key_5)
	(unlock place_8_2 key_6)
	(unlock place_8_2 key_7)
	(unlock place_8_2 key_8)
	(unlock place_8_2 key_9)
	(unlock place_8_3 key_0)
	(unlock place_8_3 key_1)
	(unlock place_8_3 key_2)
	(unlock place_8_3 key_3)
	(unlock place_8_3 key_4)
	(unlock place_8_3 key_5)
	(unlock place_8_3 key_6)
	(unlock place_8_3 key_7)
	(unlock place_8_3 key_8)
	(unlock place_8_3 key_9)
	(unlock place_8_4 key_0)
	(unlock place_8_4 key_1)
	(unlock place_8_4 key_2)
	(unlock place_8_4 key_3)
	(unlock place_8_4 key_4)
	(unlock place_8_4 key_5)
	(unlock place_8_4 key_6)
	(unlock place_8_4 key_7)
	(unlock place_8_4 key_8)
	(unlock place_8_4 key_9)
	(unlock place_9_0 key_0)
	(unlock place_9_0 key_1)
	(unlock place_9_0 key_2)
	(unlock place_9_0 key_3)
	(unlock place_9_0 key_4)
	(unlock place_9_0 key_5)
	(unlock place_9_0 key_6)
	(unlock place_9_0 key_7)
	(unlock place_9_0 key_8)
	(unlock place_9_0 key_9)
	(unlock place_9_1 key_0)
	(unlock place_9_1 key_1)
	(unlock place_9_1 key_2)
	(unlock place_9_1 key_3)
	(unlock place_9_1 key_4)
	(unlock place_9_1 key_5)
	(unlock place_9_1 key_6)
	(unlock place_9_1 key_7)
	(unlock place_9_1 key_8)
	(unlock place_9_1 key_9)
	(unlock place_9_2 key_0)
	(unlock place_9_2 key_1)
	(unlock place_9_2 key_2)
	(unlock place_9_2 key_3)
	(unlock place_9_2 key_4)
	(unlock place_9_2 key_5)
	(unlock place_9_2 key_6)
	(unlock place_9_2 key_7)
	(unlock place_9_2 key_8)
	(unlock place_9_2 key_9)
	(unlock place_9_3 key_0)
	(unlock place_9_3 key_1)
	(unlock place_9_3 key_2)
	(unlock place_9_3 key_3)
	(unlock place_9_3 key_4)
	(unlock place_9_3 key_5)
	(unlock place_9_3 key_6)
	(unlock place_9_3 key_7)
	(unlock place_9_3 key_8)
	(unlock place_9_3 key_9)
	(unlock place_9_4 key_0)
	(unlock place_9_4 key_1)
	(unlock place_9_4 key_2)
	(unlock place_9_4 key_3)
	(unlock place_9_4 key_4)
	(unlock place_9_4 key_5)
	(unlock place_9_4 key_6)
	(unlock place_9_4 key_7)
	(unlock place_9_4 key_8)
	(unlock place_9_4 key_9)
))
        