;Header and description

(define (domain test)

;remove requirements that are not needed
(:requirements :strips :fluents  :typing :conditional-effects :negative-preconditions :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    facility
    agent
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (agent-at-facility ?a - agent ?f - facility)
    (mission-successful ?a)
)

(:functions
    (distance ?from ?to)
    (total-cost)
)

(:action goto
    :parameters (?a - agent ?loc1 ?loc2 - facility)
    :precondition (and 
        (agent-at-facility ?a ?loc1)    
        (not (= ?loc1 ?loc2))
    )
    :effect (and (agent-at-facility ?a ?loc2)
            (not (agent-at-facility ?a ?loc1))
            (increase (total-cost) (distance ?loc1 ?loc2))
    )
)

(:action fake
    :parameters (?a - agent)
    :precondition (and 
        (or (agent-at-facility ?a facility2) (agent-at-facility ?a facility3)))
    :effect (and (mission-successful ?a))
)


)