; domain file of agents in the city domain on step 131 to solve the job 12

(define (domain agents-in-the-city)

(:requirements :strips :fluents :typing :negative-preconditions :equality :adl)

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
    (workshop-busy ?w - workshop)
    (agent-busy ?a - agent)
    (agent-commited ?a - agent ?i - item)  ; agent commited to assembly
    (workshop-allocated ?w - workshop ?i - item)
    (item-arranged-for-assembly ?i1 ?i2 - item) ; i1 - item required, i2 - item being assembled
    (required-roles-arranged-for-assembly ?i - item ?w - workshop) ; i - item to be assembled, w - workshop at which required roles are present
    (item-assembled ?i - item)
    (assemble-main-guy ?a - agent ?i - item) ; a - the agent who gets the item, i - item being assembled
    (assembly-procedure-complete ?i - item) ;  - item that got assembled and everythong is complete
    (assembly-item-consumed ?i1 ?i2 - item) ; i1 - item being condumed i2 - item being assembled

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
            (not (agent-at-facility ?a ?loc1))
    )
)
; item(item5, 5, roles([car, drone]), parts([item1, item4]))
; finalise the workshop for assembly of item 5
(:action prep_assemble_item5_finalise_workshop
    :parameters (?w - workshop)
    :precondition (and (not (workshop-busy ?w)))
    :effect (and 
        (workshop-busy ?w)
        (workshop-allocated ?w item5)
    )
)

; once workshop has been finalised, get item 1 for assembly
(:action prep_assemble_item5_arrange_item1
    :parameters (?a - agent ?w - workshop)
    :precondition (and 
        (or (agent-commited ?a item5) (not (agent-busy ?a)))
        (workshop-allocated ?w item5)
        (agent-carrying-item ?a item1)
        (agent-at-facility ?a ?w)
    )
    :effect (and 
        (item-arranged-for-assembly item1 item5)
        (agent-busy ?a)
        (agent-commited ?a item5)    
    )
)

; once workshop has been finalised, get item 4 for assembly
(:action prep_assemble_item5_arrange_item4
    :parameters (?a - agent ?w - workshop)
    :precondition (and 
        (or (agent-commited ?a item5) (not (agent-busy ?a)))
        (workshop-allocated ?w item5)
        (agent-carrying-item ?a item4)
        (agent-at-facility ?a ?w)
    )
    :effect (and 
        (item-arranged-for-assembly item4 item5)
        (agent-busy ?a)
        (agent-commited ?a item5) 
    )
)

; when workshop is fixed and item has reached...make sure required roles are there
(:action prep_assemble_item5_arrange_roles
    :parameters (?c - car ?d - drone ?w - workshop)
    :precondition (and 
        (or (agent-commited ?c item5) (not (agent-busy ?c)))
        (or (agent-commited ?d item5) (not (agent-busy ?d)))
        (workshop-allocated ?w item5)
   
        (agent-at-facility ?c ?w)
        (agent-at-facility ?d ?w)
    )
    :effect (and 
        (required-roles-arranged-for-assembly item5 ?w)
        (agent-commited ?c item5)
        (agent-commited ?d item5)
    )
)

(:action assemble_i5_car
    :parameters ( ?c - car ?w - workshop)
    :precondition (and 
        (workshop-allocated ?w item5)
        (item-arranged-for-assembly item1 item5)
        (item-arranged-for-assembly item4 item5)
        (required-roles-arranged-for-assembly item5 ?w)   
    )
    :effect (and 
        (item-assembled item5)    
        (assemble-main-guy ?c item5)
    )
)

(:action assemble_i5_drone
    :parameters ( ?d - drone ?w - workshop)
    :precondition (and 
        (workshop-allocated ?w item5)
        (item-arranged-for-assembly item1 item5)
        (item-arranged-for-assembly item4 item5)
        (required-roles-arranged-for-assembly item5 ?w)   
    )
    :effect (and 
        (item-assembled item5)     
        (assemble-main-guy ?d item5)  
    )
)

(:action consume_item1_assemble_i5
    :parameters (?a - agent)
    :precondition (and 
        (item-assembled item5)
        (agent-carrying-item ?a item1)
        (agent-commited ?a item5)        
    )
    :effect (and 
        (not (agent-busy ?a))
        (not (agent-carrying-item ?a item1))
        (not (agent-commited ?a item5))
        (assembly-item-consumed item1 item5)
    )
)

(:action consume_item4_assemble_i5
    :parameters (?a - agent)
    :precondition (and 
        (item-assembled item5)
        (agent-carrying-item ?a item4)
        (agent-commited ?a item5)        
    )
    :effect (and 
        (not (agent-busy ?a))
        (not (agent-carrying-item ?a item4))
        (not (agent-commited ?a item5))
        (assembly-item-consumed item4 item5)
    )
)

(:action post_assemble_i5_freeup_everything
    :parameters (?c - car ?d - drone ?w - workshop)
    :precondition (and 
        (item-assembled item5)

        (assembly-item-consumed item1 item5)
        (assembly-item-consumed item4 item5)

        (required-roles-arranged-for-assembly item5 ?w)

        (or (agent-commited ?c item5) (agent-commited ?d item5))  ; if agent is still committed
        (workshop-allocated ?w item5)
    )
    :effect (and 
        (not (item-assembled item5))
        (not (agent-commited ?c item5))
        (not (agent-commited ?d item5))
        (not (agent-busy ?c))
        (not (agent-busy ?d))
        (not (required-roles-arranged-for-assembly item5 ?w))
        (not (workshop-allocated ?w item5))
        (not (workshop-busy ?w))

        (not (assembly-item-consumed item1 item5))
        (not (assembly-item-consumed item4 item5))

        (assembly-procedure-complete item5)
    )
)

(:action release_assembled_item5
    :parameters (?a - agent)
    :precondition (and (assembly-procedure-complete item5))
    :effect (and 
        (assemble-main-guy ?a item5)
        (agent-carrying-item ?a item5)
        
        (not (assembly-procedure-complete item5))
    )
)

; item(item6, 5, roles([truck, motorcycle]), parts([item2, item3, item0, item1, item4])).

; finalise the workshop for assembly of item 5
(:action prep_assemble_item6_finalise_workshop
    :parameters (?w - workshop)
    :precondition (and (not (workshop-busy ?w)))
    :effect (and 
        (workshop-busy ?w)
        (workshop-allocated ?w item5)
    )
)

; once workshop has been finalised, get item 0 for assembly
(:action prep_assemble_item6_arrange_item0
    :parameters (?a - agent ?w - workshop)
    :precondition (and 
        (or (agent-commited ?a item6) (not (agent-busy ?a)))
        (workshop-allocated ?w item6)
        (agent-carrying-item ?a item0)
        (agent-at-facility ?a ?w)
    )
    :effect (and 
        (item-arranged-for-assembly item0 item5)
        (agent-busy ?a)
        (agent-commited ?a item6)    
    )
)

; once workshop has been finalised, get item 1 for assembly
(:action prep_assemble_item6_arrange_item1
    :parameters (?a - agent ?w - workshop)
    :precondition (and 
        (or (agent-commited ?a item6) (not (agent-busy ?a)))
        (workshop-allocated ?w item6)
        (agent-carrying-item ?a item1)
        (agent-at-facility ?a ?w)
    )
    :effect (and 
        (item-arranged-for-assembly item1 item6)
        (agent-busy ?a)
        (agent-commited ?a item6)    
    )
)

; once workshop has been finalised, get item 2 for assembly
(:action prep_assemble_item6_arrange_item2
    :parameters (?a - agent ?w - workshop)
    :precondition (and 
        (or (agent-commited ?a item6) (not (agent-busy ?a)))
        (workshop-allocated ?w item6)
        (agent-carrying-item ?a item2)
        (agent-at-facility ?a ?w)
    )
    :effect (and 
        (item-arranged-for-assembly item2 item6)
        (agent-busy ?a)
        (agent-commited ?a item6)    
    )
)


; once workshop has been finalised, get item 3 for assembly
(:action prep_assemble_item6_arrange_item3
    :parameters (?a - agent ?w - workshop)
    :precondition (and 
        (or (agent-commited ?a item6) (not (agent-busy ?a)))
        (workshop-allocated ?w item6)
        (agent-carrying-item ?a item3)
        (agent-at-facility ?a ?w)
    )
    :effect (and 
        (item-arranged-for-assembly item3 item6)
        (agent-busy ?a)
        (agent-commited ?a item6)    
    )
)

; once workshop has been finalised, get item 4 for assembly
(:action prep_assemble_item6_arrange_item4
    :parameters (?a - agent ?w - workshop)
    :precondition (and 
        (or (agent-commited ?a item6) (not (agent-busy ?a)))
        (workshop-allocated ?w item6)
        (agent-carrying-item ?a item4)
        (agent-at-facility ?a ?w)
    )
    :effect (and 
        (item-arranged-for-assembly item4 item6)
        (agent-busy ?a)
        (agent-commited ?a item6) 
    )
)

; when workshop is fixed and item has reached...make sure required roles are there
(:action prep_assemble_item6_arrange_roles
    :parameters (?t - truck ?m - motorcycle ?w - workshop)
    :precondition (and 
        (or (agent-commited ?t item5) (not (agent-busy ?t)))
        (or (agent-commited ?m item5) (not (agent-busy ?m)))
        (workshop-allocated ?w item5)

        (agent-at-facility ?t ?w)
        (agent-at-facility ?m ?w)
    )
    :effect (and 
        (required-roles-arranged-for-assembly item6 ?w)
        (agent-commited ?t item6)
        (agent-commited ?m item6)
    )
)

(:action assemble_i6_truck
    :parameters ( ?t - truck ?w - workshop)
    :precondition (and 
        (workshop-allocated ?w item6)

        (item-arranged-for-assembly item0 item6)
        (item-arranged-for-assembly item1 item6)
        (item-arranged-for-assembly item2 item6)
        (item-arranged-for-assembly item3 item6)
        (item-arranged-for-assembly item4 item6)

        (required-roles-arranged-for-assembly item6 ?w)   
    )
    :effect (and 
        (item-assembled item6)    
        (assemble-main-guy ?t item6)
    )
)

(:action assemble_i6_motorcycle
    :parameters ( ?m - motorcycle ?w - workshop)
    :precondition (and 
        (workshop-allocated ?w item6)

        (item-arranged-for-assembly item0 item6)
        (item-arranged-for-assembly item1 item6)
        (item-arranged-for-assembly item2 item6)
        (item-arranged-for-assembly item3 item6)
        (item-arranged-for-assembly item4 item6)

        (required-roles-arranged-for-assembly item6 ?w)   
    )
    :effect (and 
        (item-assembled item6)     
        (assemble-main-guy ?m item6)  
    )
)

(:action consume_item0_assemble_i6
    :parameters (?a - agent)
    :precondition (and 
        (item-assembled item6)
        (agent-carrying-item ?a item0)
        (agent-commited ?a item6)        
    )
    :effect (and 
        (not (agent-busy ?a))
        (not (agent-carrying-item ?a item0))
        (not (agent-commited ?a item6))
        (assembly-item-consumed item0 item6)
    )
)

(:action consume_item1_assemble_i6
    :parameters (?a - agent)
    :precondition (and 
        (item-assembled item6)
        (agent-carrying-item ?a item1)
        (agent-commited ?a item6)        
    )
    :effect (and 
        (not (agent-busy ?a))
        (not (agent-carrying-item ?a item1))
        (not (agent-commited ?a item6))
        (assembly-item-consumed item1 item6)
    )
)

(:action consume_item2_assemble_i6
    :parameters (?a - agent)
    :precondition (and 
        (item-assembled item6)
        (agent-carrying-item ?a item2)
        (agent-commited ?a item6)        
    )
    :effect (and 
        (not (agent-busy ?a))
        (not (agent-carrying-item ?a item2))
        (not (agent-commited ?a item6))
        (assembly-item-consumed item2 item6)
    )
)

(:action consume_item3_assemble_i6
    :parameters (?a - agent)
    :precondition (and 
        (item-assembled item6)
        (agent-carrying-item ?a item3)
        (agent-commited ?a item6)        
    )
    :effect (and 
        (not (agent-busy ?a))
        (not (agent-carrying-item ?a item3))
        (not (agent-commited ?a item6))
        (assembly-item-consumed item3 item6)
    )
)

(:action consume_item4_assemble_i6
    :parameters (?a - agent)
    :precondition (and 
        (item-assembled item6)
        (agent-carrying-item ?a item4)
        (agent-commited ?a item6)        
    )
    :effect (and 
        (not (agent-busy ?a))
        (not (agent-carrying-item ?a item4))
        (not (agent-commited ?a item6))
        (assembly-item-consumed item4 item6)
    )
)


(:action post_assemble_i6_freeup_everything
    :parameters (?t - truck ?m - motorcycle ?w - workshop)
    :precondition (and 
        (assembly-item-consumed item0 item6)
        (assembly-item-consumed item1 item6)
        (assembly-item-consumed item2 item6)
        (assembly-item-consumed item3 item6)
        (assembly-item-consumed item4 item6)

        (item-assembled item6)
        (required-roles-arranged-for-assembly item6 ?w)
        (or (agent-commited ?t item6) (agent-commited ?m item6))  ; if agent is still committed
        (workshop-allocated ?w item6)
    )
    :effect (and 

        (not (item-assembled item6))
        (not (agent-commited ?t item6))
        (not (agent-commited ?m item6))
        (not (agent-busy ?t))
        (not (agent-busy ?m))
        (not (required-roles-arranged-for-assembly item6 ?w))
        (not (workshop-allocated ?w item6))
        (not (workshop-busy ?w))

        (assembly-procedure-complete item6)
    )
)

(:action release_assembled_item6
    :parameters (?a - agent)
    :precondition (and (assembly-procedure-complete item6))
    :effect (and 
        (assemble-main-guy ?a item6)
        (agent-carrying-item ?a item6)
        
        (not (assembly-procedure-complete item6))
    )
)

)
