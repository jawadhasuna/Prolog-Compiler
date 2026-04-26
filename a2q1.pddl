(define (domain grocery)
(:requirements :typing)

(:types
    robot location
)

(:predicates
    (at ?r - robot ?l - location)
    (groceries-at ?l - location)
    (has-groceries ?r - robot)
)

(:action move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (at ?r ?from)
    :effect (and
        (not (at ?r ?from))
        (at ?r ?to)
    )
)

(:action pick-up
    :parameters (?r - robot ?l - location)
    :precondition (and
        (at ?r ?l)
        (groceries-at ?l)
    )
    :effect (and
        (not (groceries-at ?l))
        (has-groceries ?r)
    )
)

(:action drop
    :parameters (?r - robot ?l - location)
    :precondition (and
        (at ?r ?l)
        (has-groceries ?r)
    )
    :effect (and
        (not (has-groceries ?r))
        (groceries-at ?l)
    )
)
)