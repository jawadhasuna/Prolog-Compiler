(define (domain grocery_htn)
(:requirements :typing :htn)
(:types
robot location
)
(:predicates
(at ?r - robot ?l - location)
(groceries-at ?l - location)
(has-groceries ?r - robot)
)
;; Primitive Actions
(:action move
:parameters (?r - robot ?from - location ?to - location)
:precondition (at ?r ?from)
:effect (and
(not (at ?r ?from))
(at ?r ?to))
)
(:action pick-up
:parameters (?r - robot ?l - location)
:precondition (and
(at ?r ?l)
(groceries-at ?l))
:effect (and
(not (groceries-at ?l))
(has-groceries ?r))
)
(:action drop
:parameters (?r - robot ?l - location)
:precondition (and
(at ?r ?l)
(has-groceries ?r))
:effect (and
(not (has-groceries ?r))
(groceries-at ?l))
)
;; Abstract Task
(:task deliver-groceries
:parameters (?r - robot ?store - location ?home - location)
)
;; Method
(:method deliver-all-method
  :parameters (?r - robot ?store1 - location ?store2 - location ?home - location)
  :task (deliver-all-groceries ?r ?store1 ?store2 ?home)
  :precondition (at ?r ?home)
  :subtasks (and
    (t1 (move ?r ?home ?store1))
    (t2 (pick-up ?r ?store1))
    (t3 (move ?r ?store1 ?store2))
    (t4 (pick-up ?r ?store2))
    (t5 (move ?r ?store2 ?home))
    (t6 (drop ?r ?home))
  )
  :ordering (and
    (< t1 t2)
    (< t2 t3)
    (< t3 t4)
    (< t4 t5)
    (< t5 t6)
  )
)
)
)