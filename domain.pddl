; domain file of agents in the city domain on step 131 to solve the job 12

(define (domain agents-in-the-city)

(:requirements :strips :fluents :typing :negative-preconditions :equality)

(:types ; enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    truck motorcycle - agent
    item
    workshop storage resourcenode - location
    job
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    agent-at-workshop ?a - agent ?w - workshop ; motorcycle is at workshop
    job-12-completed ?j - job12
    assembled-item ?i - item
    resourcenode-item ?rn - resourcenode ?i - item ;  stores which resource node has which item
    agent-location ?a - agent ?l - location
    item-location ?i - item ?l - location  ; 
)


(:functions ;todo: define numeric functions here
)

)