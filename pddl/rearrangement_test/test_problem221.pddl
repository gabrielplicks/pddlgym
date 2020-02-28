(define (problem rearrangement) 
    (:domain rearrangement)

    (:objects
    
	pawn-0 - moveable
	pawn-1 - moveable
	bear-2 - moveable
	pawn-3 - moveable
	robot - moveable
	loc-0-0 - static
	loc-0-1 - static
	loc-0-2 - static
	loc-1-0 - static
	loc-1-1 - static
	loc-1-2 - static
	loc-2-0 - static
	loc-2-1 - static
	loc-2-2 - static
    )

    (:init
    
	(IsPawn pawn-0)
	(IsPawn pawn-1)
	(IsBear bear-2)
	(IsPawn pawn-3)
	(IsRobot robot)
	(At pawn-0 loc-0-2)
	(At pawn-1 loc-1-1)
	(At bear-2 loc-0-2)
	(At pawn-3 loc-2-2)
	(At robot loc-2-2)
	(Handsfree robot)

    ; Action literals
    
	(Pick pawn-0)
	(Place pawn-0)
	(Pick pawn-1)
	(Place pawn-1)
	(Pick bear-2)
	(Place bear-2)
	(Pick pawn-3)
	(Place pawn-3)
	(MoveTo loc-0-0)
	(MoveTo loc-0-1)
	(MoveTo loc-0-2)
	(MoveTo loc-1-0)
	(MoveTo loc-1-1)
	(MoveTo loc-1-2)
	(MoveTo loc-2-0)
	(MoveTo loc-2-1)
	(MoveTo loc-2-2)
    )

    (:goal (and  (At bear-2 loc-1-1) ))
)
    