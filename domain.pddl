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
    (agent-at-facility ?a - agent ?l - facility)  ; agent is at facility l
    (agent-carrying-item ?a - agent ?i - item)  ; agent is carrying item i
    (item-in-storage ?i - item ?s - storage)  ; item is in storage
    (job-complete ?s - storage ?i - item)  ; job completion requires certain item(s) in a particular storage
    (is_assembling ?a - agent ?i - item ?w - workshop)
    (is_assisting_assemble ?a - agent ?i - item ?w - workshop)
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
        
        (is_assembling ?c item5 ?w)

        (is_assisting_assemble ?d item5 ?w)
        (is_assisting_assemble ?a1 item5 ?w)
        (is_assisting_assemble ?a2 item5 ?w)
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
        
        (is_assembling ?d item5 ?w)

        (is_assisting_assemble ?c item5 ?w)
        (is_assisting_assemble ?a1 item5 ?w)
        (is_assisting_assemble ?a2 item5 ?w)
    )
)

(:action assist_assmble_i5
    :parameters (?a1 ?a2 ?a3 ?a4 - agent ?w - workshop)
    :precondition (and 
        (is_assembling ?a1 item5 ?w)

        (is_assisting_assemble ?a2 item5 ?w)
        (is_assisting_assemble ?a3 item5 ?w)
        (is_assisting_assemble ?a4 item5 ?w)
    )
    :effect (and 
        (agent-carrying-item ?a1 item5)

        (not (is_assembling ?a1 item5 ?w))
        (not (is_assisting_assemble ?a2 item5 ?w))
        (not (is_assisting_assemble ?a3 item5 ?w))
        (not (is_assisting_assemble ?a4 item5 ?w))
    )
)



(:action assemble_i6
    :parameters (?t - truck ?m - motorcycle ?w - workshop)
    :precondition (and 
        (or (agent-carrying-item ?m item0)
            (agent-carrying-item ?t item0)
        )
        
        (or (agent-carrying-item ?t item1)
            (agent-carrying-item ?m item1)
        )
        
        (or (agent-carrying-item ?t item2)
            (agent-carrying-item ?m item2)
        )
    
        (or (agent-carrying-item ?t item3)
            (agent-carrying-item ?m item3)
        )
        
        (or (agent-carrying-item ?t item4)
            (agent-carrying-item ?m item4)
        )

        (agent-at-facility ?t ?w)
        (agent-at-facility ?m ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?m item0))
        (not (agent-carrying-item ?t item0))
        
        (not (agent-carrying-item ?m item1))
        (not (agent-carrying-item ?t item1))
       
        (not (agent-carrying-item ?m item2))
        (not (agent-carrying-item ?t item2))
    
        (not (agent-carrying-item ?m item3))
        (not (agent-carrying-item ?t item3))
        
        (not (agent-carrying-item ?m item4))
        (not (agent-carrying-item ?t item4))

        (agent-carrying-item ?t item6)
        (agent-carrying-item ?m item6)
    )
)


(:action assemble_i7
    :parameters ( ?c - car ?m - motorcycle ?w - workshop)
    :precondition (and 
        (or (agent-carrying-item ?m item0)
            (agent-carrying-item ?c item0)
        )
        
        (or (agent-carrying-item ?c item1)
            (agent-carrying-item ?m item1)
        )
        
        (or (agent-carrying-item ?c item2)
            (agent-carrying-item ?m item2)
        )
    
        (or (agent-carrying-item ?c item3)
            (agent-carrying-item ?m item3)
        )
        
        (or (agent-carrying-item ?c item4)
            (agent-carrying-item ?m item4)
        )


        (agent-at-facility ?c ?w)
        (agent-at-facility ?m ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?m item0))
        (not (agent-carrying-item ?c item0))
        
        (not (agent-carrying-item ?m item1))
        (not (agent-carrying-item ?c item1))
       
        (not (agent-carrying-item ?c item2))
        (not (agent-carrying-item ?m item2))
    
        (not (agent-carrying-item ?c item3))
        (not (agent-carrying-item ?m item3))
        
        (not (agent-carrying-item ?c item4))
        (not (agent-carrying-item ?m item4))

        (agent-carrying-item ?c item7)
        (agent-carrying-item ?m item7)
    )
)


(:action assemble_i8
    :parameters ( ?c - car ?d - drone ?w - workshop)
    :precondition (and 
        (or (agent-carrying-item ?d item0)
            (agent-carrying-item ?c item0)
        )
        
        (or (agent-carrying-item ?d item4)
            (agent-carrying-item ?c item4)
        )

        (agent-at-facility ?d ?w)
        (agent-at-facility ?c ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?d item0))
        (not (agent-carrying-item ?c item0))
        
        (not (agent-carrying-item ?d item4))
        (not (agent-carrying-item ?c item4))

        (agent-carrying-item ?c item8)
        (agent-carrying-item ?d item8)
    )
)


; just converting one type of item to another type for now
(:action assemble_i9
    :parameters (?t - truck ?m - motorcycle ?w - workshop)
    :precondition (and 

        (or (agent-carrying-item ?m item0)
            (agent-carrying-item ?t item0)
        )
        
        (or (agent-carrying-item ?t item1)
            (agent-carrying-item ?m item1)
        )
        
        (or (agent-carrying-item ?t item6)
            (agent-carrying-item ?m item6)
        )
    
        (or (agent-carrying-item ?t item7)
            (agent-carrying-item ?m item7)
        )
        
        (or (agent-carrying-item ?t item4)
            (agent-carrying-item ?m item4)
        )


        (agent-at-facility ?t ?w)
        (agent-at-facility ?m ?w)
      
    )
    :effect (and 
        (not (agent-carrying-item ?m item0))
        (not (agent-carrying-item ?t item0))
        
        (not (agent-carrying-item ?m item1))
        (not (agent-carrying-item ?t item1))
       
        (not (agent-carrying-item ?t item6))
        (not (agent-carrying-item ?m item6))
    
        (not (agent-carrying-item ?t item7))
        (not (agent-carrying-item ?m item7))
        
        (not (agent-carrying-item ?t item4))
        (not (agent-carrying-item ?m item4))

        (agent-carrying-item ?t item9)
        (agent-carrying-item ?m item9)
    )
)

(:action assemble_i10
    :parameters ( ?c - car ?m - motorcycle ?w - workshop)
    :precondition (and 
             
        (or (agent-carrying-item ?c item1)
            (agent-carrying-item ?m item1)
        )
        
        (or (agent-carrying-item ?c item5)
            (agent-carrying-item ?m item5)
        )
    
        (or (agent-carrying-item ?c item6)
            (agent-carrying-item ?m item6)
        )
        
        (agent-at-facility ?c ?w)
        (agent-at-facility ?m ?w)
    )
    :effect (and 
        (not (agent-carrying-item ?m item1))
        (not (agent-carrying-item ?c item1))
       
        (not (agent-carrying-item ?c item5))
        (not (agent-carrying-item ?m item5))
    
        (not (agent-carrying-item ?c item6))
        (not (agent-carrying-item ?m item6))

        (agent-carrying-item ?c item10)
        (agent-carrying-item ?m item10)
    )
)

)