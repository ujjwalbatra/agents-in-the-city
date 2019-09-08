; domain file of agents in the city domain on step 131 to solve the job 12

(define (domain agents-in-the-city)

(:requirements :strips :typing)

(:types ; enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    truck motorcycle drone car - agent
    item
    workshop storage resourceNode shop - facility
)

; un-comment following line if constants are needed
;(:constants )


(:predicates ;todo: define predicates here
    (item-in-resourceNode ?i - item ?rn - resourceNode) ; item i is in respource node rn
    (agent-at-facility ?a - agent ?f - facility)  ; agent is at facility l
    (agent-carrying-item ?a - agent ?i - item)  ; agent is carrying item i
    (item-in-storage ?i - item ?s - storage)  ; item is in storage
)

(:action give
    :parameters (?a1 ?a2 - agent ?i - item ?f - facility)
    :precondition (and 
        (agent-carrying-item ?a1 ?i)
        (agent-at-facility ?a1 ?f)
        (agent-at-facility ?a2 ?f)
        (not (agent-carrying-item ?a2 ?i))
    )
    :effect (and 
    (not (agent-carrying-item ?a1 ?i))
    (agent-carrying-item ?a2 ?i)
    )
)


; take an item from agent and add it to the storage
(:action store
    :parameters (?a - agent ?s - storage ?i - item)
    :precondition (and 
        (agent-carrying-item ?a ?i)
        (agent-at-facility ?a ?s)
    )
    :effect (and 
        (not (agent-carrying-item ?a ?i))
        (item-in-storage ?i ?s)
    )
)

; item taken by an agent from a resource node
(:action gather
    :parameters (?a - agent ?i - item ?n - resourceNode)
    :precondition (and (item-in-resourceNode ?i ?n)
                (agent-at-facility ?a ?n)
    )
    :effect (and 
        (agent-carrying-item ?a ?i)
    )
)


(:action goto
    :parameters (?a - agent ?loc1 ?loc2 - facility)
    :precondition (and (agent-at-facility ?a ?loc1) (not (= ?loc1 ?loc2)))
    :effect (and (agent-at-facility ?a ?loc2)
                (not (agent-at-facility ?a ?loc1)))
)

(:action assemble_i5_car
    :parameters ( ?c - car ?d - drone ?a1 ?a2 - agent ?w - workshop)
    :precondition (and 
    
        (agent-carrying-item ?a1 item1)
        (agent-carrying-item ?a2 item4)

        (agent-at-facility ?d ?w)
        (agent-at-facility ?c ?w)
        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item1))
        (not (agent-carrying-item ?a2 item4))
        
        (agent-carrying-item ?c item5)      
    )
)

(:action assemble_i5_drone
    :parameters ( ?c - car ?d - drone ?a1 ?a2 - agent ?w - workshop)
    :precondition (and 
    
        (agent-carrying-item ?a1 item1)
        (agent-carrying-item ?a2 item4)

        (agent-at-facility ?d ?w)
        (agent-at-facility ?c ?w)
        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item1))
        (not (agent-carrying-item ?a2 item4))
        
        (agent-carrying-item ?d item5)
    )
)


(:action assemble_i8_car
    :parameters ( ?c - car ?d - drone ?a1 ?a2 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item5)
        (agent-carrying-item ?a2 item4)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        
        (agent-at-facility ?d ?w)
        (agent-at-facility ?c ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item5))
        (not (agent-carrying-item ?a2 item4))

        (agent-carrying-item ?c item8)
    )
)

(:action assemble_i8_drone
    :parameters ( ?c - car ?d - drone ?a1 ?a2 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item5)
        (agent-carrying-item ?a2 item4)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)

        (agent-at-facility ?d ?w)
        (agent-at-facility ?c ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item5))
        (not (agent-carrying-item ?a2 item4))

        (agent-carrying-item ?d item8)
    )
)

)
