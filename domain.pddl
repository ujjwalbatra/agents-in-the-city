; domain file of agents in the city domain on step 131 to solve the job 12

(define (domain agents-in-the-city)

(:requirements :strips :fluents :typing :negative-preconditions :equality)

(:types ; enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    truck motorcycle drone car - agent
    item
    workshop storage resourceNode shop - facility
    agent facility - location  ; agent and facitlity are of type location to have a latitude and longitude
)

(:functions (
    agent-used-capacity ?a - agent ?i - item)  ; agent has used x amount of capacity
    (location-latitude ?l - location) ; latitude of location type object
    (location-longitude ?l - location) ; longitude of location type object 
)

; un-comment following line if constants are needed
;(:constants )


(:predicates ;todo: define predicates here
    (item-in-resourceNode ?i - item ?rn - resourceNode) ; item i is in respource node rn
    (agent-at-facility ?a - agent ?l - facility)  ; agent is at facility l
    (agent-carrying-item ?a - agent ?i - item)  ; agent is carrying item i
    (item-in-storage ?i - item ?s - storage)  ; item is in storage
    (job-complete ?s - storage ?i - item)  ; job completion requires certain item(s) in a particular storage
    
    (assembly-require-part ?i1 - item ?i2 - item)  ; i1 - item to be assembled, i2 - item required
    (item-require-role ?i - item ?a - agent)  ; i - item to be assembled, agents rewuired for assembly
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
        (decrease (agent-used-capacity ?a ?i) 1)
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

; give from agent 1 to 2
(:action give
    :parameters (?a1 ?a2 - agent ?f - facility ?i - item)
    :precondition (and 
            (not (= ?a1 ?a2))
            (agent-at-facility ?a1 ?f)
            (agent-at-facility ?a2 ?f)
            (agent-carrying-item ?a1 ?i)
            (> (agent-used-capacity ?a1 ?i) 0)
    )
    :effect (and 
        (agent-carrying-item ?a2 ?i)
        (increase (agent-used-capacity ?a2 ?i) 1)
        (decrease (agent-used-capacity ?a1 ?i) 1)
    )
)



; item taken by an agent from a resource node
(:action gather
    :parameters (?a - agent ?i - item ?n - resourceNode)
    :precondition (and (item-in-resourceNode ?i ?n)
                (agent-at-facility ?a ?n)
    )
    :effect (and 
        (increase (agent-used-capacity ?a ?i) 2)
        (agent-carrying-item ?a ?i)
    )
)


(:action goto
    :parameters (?a - agent ?loc1 ?loc2 - facility)
    :precondition (and (agent-at-facility ?a ?loc1) (not (= ?loc1 ?loc2)))
    :effect (and (agent-at-facility ?a ?loc2)
                (not (agent-at-facility ?a ?loc1)))
)

; just converting one type of item to another type for now
(:action assemble_i9
    :parameters (?i1 ?i2 ?i3 ?i4 ?i5 - item ?t - truck ?m - motorcycle ?w - workshop)
    :precondition (and 
        (assembly-require-part item9 ?i1) ; hard code this
        (assembly-require-part item9 ?i2)
        (assembly-require-part item9 ?i3)
        (assembly-require-part item9 ?i4)
        (assembly-require-part item9 ?i5)

        (not (= ?i1 ?i2))
        (not (= ?i1 ?i3))
        (not (= ?i1 ?i4))
        (not (= ?i1 ?i5))
        (not (= ?i2 ?i3))
        (not (= ?i2 ?i4))
        (not (= ?i2 ?i5))
        (not (= ?i3 ?i4))
        (not (= ?i3 ?i5))
        (not (= ?i4 ?i5))

        (agent-carrying-item ?t ?i1)
        (agent-carrying-item ?t ?i2)
        (agent-carrying-item ?m ?i3)
        (agent-carrying-item ?m ?i4)
        (agent-carrying-item ?m ?i5)

        (agent-at-facility ?t ?w)
        (agent-at-facility ?m ?w)
      
    )
    :effect (and 
        (not (agent-carrying-item ?t ?i1))
        (not (agent-carrying-item ?m ?i1))

        (agent-carrying-item ?t item9)
    )
)

)