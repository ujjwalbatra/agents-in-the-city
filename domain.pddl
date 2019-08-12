; domain file of agents in the city domain on step 131 to solve the job 12

(define (domain agents-in-the-city)

(:requirements :strips :fluents :typing :negative-preconditions :equality)

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
    (job-complete ?s - storage ?i - item)  ; job completion requires certain item(s) in a particular storage
    (is_assembling ?a - agent ?i - item ?w - workshop)
    (is_assisting_assemble ?a - agent ?i - item ?w - workshop)
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

(:action job_complete
    :parameters (?i - item ?s - storage)
    :precondition (and 
        (item-in-storage ?i ?s)    
    )
    :effect (and 
        (job-complete ?s ?i)
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


(:action assemble_i6_truck
    :parameters (?t - truck ?m - motorcycle ?a1 ?a2 ?a3 ?a4 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item0)
        (agent-carrying-item ?a2 item1)
        (agent-carrying-item ?a3 item2)
        (agent-carrying-item ?a4 item3)

        (agent-at-facility ?t ?w)
        (agent-at-facility ?m ?w)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        (agent-at-facility ?a3 ?w)
        (agent-at-facility ?a4 ?w)

    )
    :effect (and 
        (not (agent-carrying-item ?a1 item0))
        (not (agent-carrying-item ?a2 item1))
        (not (agent-carrying-item ?a3 item2))
        (not (agent-carrying-item ?a4 item3))
        
        (agent-carrying-item ?t item6)
    )
)

(:action assemble_i6_motorcycle
    :parameters (?t - truck ?m - motorcycle ?a1 ?a2 ?a3 ?a4 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item0)
        (agent-carrying-item ?a2 item1)
        (agent-carrying-item ?a3 item2)
        (agent-carrying-item ?a4 item3)

        (agent-at-facility ?t ?w)
        (agent-at-facility ?m ?w)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        (agent-at-facility ?a3 ?w)
        (agent-at-facility ?a4 ?w)

    )
    :effect (and 
        (not (agent-carrying-item ?a1 item0))
        (not (agent-carrying-item ?a2 item1))
        (not (agent-carrying-item ?a3 item2))
        (not (agent-carrying-item ?a4 item3))
        
        (agent-carrying-item ?m item6)
    )
)


(:action assemble_i7_car
    :parameters ( ?c - car ?m - motorcycle ?a1 ?a2 ?a3 ?a4 ?a5 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item0)
        (agent-carrying-item ?a2 item1)
        (agent-carrying-item ?a3 item2)
        (agent-carrying-item ?a4 item3)
        (agent-carrying-item ?a5 item4)

        (agent-at-facility ?c ?w)
        (agent-at-facility ?m ?w)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        (agent-at-facility ?a3 ?w)
        (agent-at-facility ?a4 ?w)
        (agent-at-facility ?a5 ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item0))
        (not (agent-carrying-item ?a2 item1))
        (not (agent-carrying-item ?a3 item2))
        (not (agent-carrying-item ?a4 item3))
        (not (agent-carrying-item ?a5 item4))

        (agent-carrying-item ?c item7)
    )
)

(:action assemble_i7_motorcycle
    :parameters ( ?c - car ?m - motorcycle ?a1 ?a2 ?a3 ?a4 ?a5 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item0)
        (agent-carrying-item ?a2 item1)
        (agent-carrying-item ?a3 item2)
        (agent-carrying-item ?a4 item3)
        (agent-carrying-item ?a5 item4)

        (agent-at-facility ?c ?w)
        (agent-at-facility ?m ?w)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        (agent-at-facility ?a3 ?w)
        (agent-at-facility ?a4 ?w)
        (agent-at-facility ?a5 ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item0))
        (not (agent-carrying-item ?a2 item1))
        (not (agent-carrying-item ?a3 item2))
        (not (agent-carrying-item ?a4 item3))
        (not (agent-carrying-item ?a5 item4))

        (agent-carrying-item ?m item7)
    )
)


(:action assemble_i8_car
    :parameters ( ?c - car ?d - drone ?a1 ?a2 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item0)
        (agent-carrying-item ?a2 item4)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        
        (agent-at-facility ?d ?w)
        (agent-at-facility ?c ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item0))
        (not (agent-carrying-item ?a2 item4))

        (agent-carrying-item ?c item8)
    )
)

(:action assemble_i8_drone
    :parameters ( ?c - car ?d - drone ?a1 ?a2 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item0)
        (agent-carrying-item ?a2 item4)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)

        (agent-at-facility ?d ?w)
        (agent-at-facility ?c ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item0))
        (not (agent-carrying-item ?a2 item4))

        (agent-carrying-item ?d item8)
    )
)

(:action assemble_i9_truck
    :parameters (?t - truck ?m - motorcycle ?a1 ?a2 ?a3 ?a4 ?a5 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item0)
        (agent-carrying-item ?a2 item1)
        (agent-carrying-item ?a3 item4)
        (agent-carrying-item ?a4 item6)
        (agent-carrying-item ?a5 item7)

        (agent-at-facility ?t ?w)
        (agent-at-facility ?m ?w)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        (agent-at-facility ?a3 ?w)
        (agent-at-facility ?a4 ?w)
        (agent-at-facility ?a5 ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item0))
        (not (agent-carrying-item ?a2 item1))
        (not (agent-carrying-item ?a3 item4))
        (not (agent-carrying-item ?a4 item6))
        (not (agent-carrying-item ?a5 item7))

        (agent-carrying-item ?t item9)
    )
)

(:action assemble_i9_motorcycle
    :parameters (?t - truck ?m - motorcycle ?a1 ?a2 ?a3 ?a4 ?a5 - agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item0)
        (agent-carrying-item ?a2 item1)
        (agent-carrying-item ?a3 item4)
        (agent-carrying-item ?a4 item6)
        (agent-carrying-item ?a5 item7)

        (agent-at-facility ?t ?w)
        (agent-at-facility ?m ?w)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        (agent-at-facility ?a3 ?w)
        (agent-at-facility ?a4 ?w)
        (agent-at-facility ?a5 ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item0))
        (not (agent-carrying-item ?a2 item1))
        (not (agent-carrying-item ?a3 item4))
        (not (agent-carrying-item ?a4 item6))
        (not (agent-carrying-item ?a5 item7))

        (agent-carrying-item ?m item9)
    )
)

(:action assemble_i10_car
    :parameters ( ?c - car ?m - motorcycle ?a1 ?a2 ?a3 -agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item1)
        (agent-carrying-item ?a2 item5)
        (agent-carrying-item ?a3 item6)
        
        (agent-at-facility ?c ?w)
        (agent-at-facility ?m ?w)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        (agent-at-facility ?a3 ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item1))
        (not (agent-carrying-item ?a2 item5))
        (not (agent-carrying-item ?a3 item6))

        (agent-carrying-item ?c item10)
    )
)

(:action assemble_i10_motorcycle
    :parameters ( ?c - car ?m - motorcycle ?a1 ?a2 ?a3 -agent ?w - workshop)
    :precondition (and 
        (agent-carrying-item ?a1 item1)
        (agent-carrying-item ?a2 item5)
        (agent-carrying-item ?a3 item6)
        
        (agent-at-facility ?c ?w)
        (agent-at-facility ?m ?w)

        (agent-at-facility ?a1 ?w)
        (agent-at-facility ?a2 ?w)
        (agent-at-facility ?a3 ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?a1 item1))
        (not (agent-carrying-item ?a2 item5))
        (not (agent-carrying-item ?a3 item6))

        (agent-carrying-item ?m item10)
    )
)

)