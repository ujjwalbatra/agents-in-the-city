; domain file of agents in the city domain on step 131 to solve the job 12

(define (domain agents-in-the-city)

(:requirements :strips :fluents :typing :negative-preconditions :equality)

(:types ; enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    truck motorcycle drone - agent
    item
    workshop storage resourceNode - location
)

(:functions (agent-used-capacity ?a - agent))

; un-comment following line if constants are needed
;(:constants )


(:predicates ;todo: define predicates here
    (item-in-resourceNode ?i - item ?rn - resourceNode) ; item i is in respource node rn
    (agent-at-location ?a - agent ?l - location)  ; agent is at location l
    (capacity-increased)
)

(:action gather-item
    :parameters (?a - agent ?i - item ?n - resourceNode)
    :precondition (and (item-in-resourceNode ?i ?n)
                (agent-at-location ?a ?n))
    :effect (and 
        (capacity-increased))
)


(:action goto
    :parameters (?a - agent ?loc1 - location ?loc2 - location)
    :precondition (and (agent-at-location ?a ?loc1))
    :effect (and (agent-at-location ?a ?loc2)
                (not (agent-at-location ?a ?loc2)))
)


)