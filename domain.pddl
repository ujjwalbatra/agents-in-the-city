; domain file of agents in the city domain on step 131 to solve the job 12

(define (domain agents-in-the-city)

(:requirements :strips :fluents :typing :negative-preconditions :equality)

(:types ; enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    truck motorcycle drone car - agent
    item
    workshop storage resourceNode - location
)

(:functions (
    agent-used-capacity ?a - agent ?i - item)  ; agent has used x amount of capacity
)

; un-comment following line if constants are needed
;(:constants )


(:predicates ;todo: define predicates here
    (item-in-resourceNode ?i - item ?rn - resourceNode) ; item i is in respource node rn
    (agent-at-location ?a - agent ?l - location)  ; agent is at location l
    (agent-carrying-item ?a - agent ?i - item)  ;  agent is carrying item i
    (item-in-storage ?i - item ?s - storage)  ; item is in storage
)

(:action store
    :parameters (?a - agent ?s - storage ?i - item)
    :precondition (and 
                (agent-carrying-item ?a ?i)
                (agent-at-location ?a ?s)
    )
    :effect (and 
        (not (agent-carrying-item ?a ?i))
        (item-in-storage ?i ?s)
    )
)


(:action gather-item
    :parameters (?a - agent ?i - item ?n - resourceNode)
    :precondition (and (item-in-resourceNode ?i ?n)
                (agent-at-location ?a ?n)
    )
    :effect (and 
        (increase (agent-used-capacity ?a ?i) 2)
        (agent-carrying-item ?a ?i)
    )
)


(:action goto
    :parameters (?a - agent ?loc1 - location ?loc2 - location)
    :precondition (and (agent-at-location ?a ?loc1))
    :effect (and (agent-at-location ?a ?loc2)
                (not (agent-at-location ?a ?loc1)))
)


)