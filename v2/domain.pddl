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
    (assembly-agents-released ?i - item) ; i - item being assembled

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

; finalise the workshop for assembly of item 5
(:action prep_assemble_item5_finalise_workshop
    :parameters (?w - workshop)
    :precondition (and (not (workshop-busy ?w))
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
        (item-arranged-for-assembly item1 item5)
        (agent-busy ?a)
        (agent-commited ?a item5) 
    )
)

; when workshop is fixed and item has reached...make sure required roles are there
(:action prep_assemble_item5_arrange_roles
    :parameters (?c - car ?d - drone ?w - workshop)
    :precondition (and 
        (or  (agent-commited ?c item5) (not (agent-busy ?c)))
        (or (agent-commited ?d item5) (not (agent-busy ?d)))
        (workshop-allocated ?w item5)
        (item-arranged-for-assembly item1 item5)
        (item-arranged-for-assembly item4 item5)
        (agent-at-facility ?c ?w)
        (agent-at-facility ?d ?w)
    )
    :effect (and (required-roles-arranged-for-assembly item5 ?w))
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

(:action consume_item_assemble_i5
    :parameters (?a1 ?a2 - agent)
    :precondition (and 
        (item-assembled item5)
        (agent-carrying-item ?a1 item4)
        (agent-carrying-item ?a2 item1)

        (agent-commited ?a1 item5) 
        (agent-commited ?a2 item5)        
    )
    :effect (and 
        (not (agent-busy ?a1))
        (not (agent-busy ?a2))
        (not (agent-carrying-item ?a1 item4))
        (not (agent-carrying-item ?a2 item1))
        (not (agent-commited ?a1 item5))
        (not (agent-commited ?a2 item5))
        (assembly-agents-released item5)
    )
)


(:action post_assemble_i5_freeup_everything
    :parameters (?c - car ?d - drone ?a - agent ?w - workshop)
    :precondition (and 
        (assembly-agents-released item5)
        (item-assembled item5)
        (required-roles-arranged-for-assembly item5 ?w)
        (or (agent-commited ?c item5) (agent-commited ?d item5))
        (workshop-allocated ?w item5)
        (assemble-main-guy ?a item5)
    )
    :effect (and 
        (not (assembly-agents-released item5))
        
        (not (item-assembled item5))
        
        (not (agent-commited ?c item5))
        (not (agent-commited ?d item5))
        
        (not (agent-busy ?c))
        (not (agent-busy ?d))
        
        (not (required-roles-arranged-for-assembly item5 ?w))
        (not (workshop-allocated ?w item5))
        (not (workshop-busy ?w))

        (agent-carrying-item ?a item5)
    )
)



)
