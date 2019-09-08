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
        (not (agent-busy ?a))
        (not (assembly-required-agent ?a item5))
        (not (assembly-required-agent ?a item6))
        (not (assembly-required-agent ?a item7))
        (not (assembly-required-agent ?a item8))
        (not (assembly-required-agent ?a item9))
        (not (assembly-required-agent ?a item10))
    )
    :effect (and (agent-at-facility ?a ?loc2)
            (not (agent-at-facility ?a ?loc1))
            (increase (total-cost) (distance ?loc1 ?loc2))
            (mission-successful ?a)
    )
)

)