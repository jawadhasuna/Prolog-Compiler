(define (domain treasure-hunt)
  (:requirements :strips)

  (:predicates
    (at ?p ?l)
    (connected ?l1 ?l2)
    (has-key ?p)
    (key-at ?l)
    (chest-at ?l)
    (chest-locked ?l)
    (treasure-found)
  )

  (:action move
    :parameters (?p ?from ?to)
    :precondition (and (at ?p ?from) (connected ?from ?to))
    :effect (and
      (at ?p ?to)
      (not (at ?p ?from))
    )
  )

  (:action pickup-key
    :parameters (?p ?l)
    :precondition (and (at ?p ?l) (key-at ?l))
    :effect (and
      (has-key ?p)
      (not (key-at ?l))
    )
  )

  (:action unlock-chest
    :parameters (?p ?l)
    :precondition (and (at ?p ?l) (chest-at ?l) (chest-locked ?l) (has-key ?p))
    :effect (and
      (not (chest-locked ?l))
    )
  )

  (:action open-chest
    :parameters (?p ?l)
    :precondition (and (at ?p ?l) (chest-at ?l) (not (chest-locked ?l)))
    :effect (and
      (treasure-found)
    )
  )
)