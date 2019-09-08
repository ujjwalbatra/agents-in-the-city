(define (problem complete-jobs) (:domain agents-in-the-city)

(:objects 
    ; initialising all trucks
    truck1 truck2 truck3 truck4 truck5 truck6 truck7 truck8 truck9 truck10 truck11 truck12 - truck 

    ; initialising all motorcycles    
    motorcycle1 motorcycle2 motorcycle3 motorcycle4 motorcycle5 motorcycle6 - motorcycle

    ; initialising all drones
    drone1 drone2 drone3 drone4 - drone

    ; initialising all cars
    car1 car2 car3 car4 car5 car6 car7 car8 car9 car10 - car

    ; initialising all items
    item0 item1 item2 item3 item4 item5 item6 item7 item8 item9 item10 - item

    ; initialising all workshops
    workshop0 workshop1 workshop2 workshop3 - workshop

    ; initialising all storages
    storage0 storage1 storage2 storage3 storage4 - storage

    ; initialising all resource nodes
    node0 node1 node2 node3 node4 node5 node6 node7 node8 node9 node10 - resourceNode
)

(:init
    ;todo: put the initial state's facts and numeric values here

    ; resourcenodes containing item
    ;; initialising all items in resource nodes
    (item-in-resourceNode item0 node0)
    (item-in-resourceNode item2 node1)
    (item-in-resourceNode item1 node2)
    (item-in-resourceNode item4 node3)
    (item-in-resourceNode item3 node4)
    (item-in-resourceNode item1 node5)
    (item-in-resourceNode item3 node6)
    (item-in-resourceNode item1 node7)
    (item-in-resourceNode item1 node8)
    (item-in-resourceNode item2 node9)
    (item-in-resourceNode item4 node10)

    ; initial location of the agents
    (agent-at-facility truck1 storage0)
    (agent-at-facility truck2 storage1)
    (agent-at-facility truck3 storage2)
    (agent-at-facility truck4 storage3)
    (agent-at-facility truck5 storage0)
    (agent-at-facility truck6 storage1)
    (agent-at-facility truck7 storage2)
    (agent-at-facility truck8 storage3)
    (agent-at-facility truck9 storage0)
    (agent-at-facility truck10 storage1)
    (agent-at-facility truck11 storage2)
    (agent-at-facility truck12 storage3)


    (agent-at-facility motorcycle1 storage0)
    (agent-at-facility motorcycle2 storage1)
    (agent-at-facility motorcycle3 storage2)
    (agent-at-facility motorcycle4 storage3)
    (agent-at-facility motorcycle5 storage2)
    (agent-at-facility motorcycle6 storage3)

    (agent-at-facility car1 storage0)
    (agent-at-facility car2 storage1)
    (agent-at-facility car3 storage2)
    (agent-at-facility car4 storage3)
    (agent-at-facility car5 storage0)
    (agent-at-facility car6 storage1)
    (agent-at-facility car7 storage2)
    (agent-at-facility car8 storage3)
    (agent-at-facility car9 storage0)
    (agent-at-facility car10 storage1)

    (agent-at-facility drone1 storage0)
    (agent-at-facility drone2 storage1)
    (agent-at-facility drone3 storage2)
    (agent-at-facility drone4 storage3)
)

(:goal (and
    ;(job-complete s0 i9)
    ; (agent-carrying-item motorcycle1 item8)
    (item-in-storage item8 storage0)
    ;todo: put the goal condition here
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
