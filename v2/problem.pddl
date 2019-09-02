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

    sh0 sh1 sh2 sh3 sh4 sh5 sh6 - shop
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

    (not (item-arranged-for-assembly item1 item5))
    (not (item-arranged-for-assembly item4 item5))
    (not (item-arranged-for-assembly item0 item6))
    (not (item-arranged-for-assembly item1 item6))
    (not (item-arranged-for-assembly item2 item6))
    (not (item-arranged-for-assembly item3 item6))
    (not (item-arranged-for-assembly item4 item6))
    (not (item-arranged-for-assembly item0 item7))
    (not (item-arranged-for-assembly item1 item7))
    (not (item-arranged-for-assembly item2 item7))
    (not (item-arranged-for-assembly item3 item7))
    (not (item-arranged-for-assembly item4 item7))
    (not (item-arranged-for-assembly item0 item8))
    (not (item-arranged-for-assembly item4 item8))
    (not (item-arranged-for-assembly item0 item9))
    (not (item-arranged-for-assembly item1 item9))
    (not (item-arranged-for-assembly item6 item9))
    (not (item-arranged-for-assembly item7 item9))
    (not (item-arranged-for-assembly item4 item9))

    (not (assembly-resources-acquired item5))
    (not (assembly-resources-acquired item6))
    (not (assembly-resources-acquired item7))
    (not (assembly-resources-acquired item8))
    (not (assembly-resources-acquired item9))
    
    (not (required-roles-arranged-for-assembly item5))
    (not (required-roles-arranged-for-assembly item6))
    (not (required-roles-arranged-for-assembly item7))
    (not (required-roles-arranged-for-assembly item8))
    (not (required-roles-arranged-for-assembly item9))

    (not (workshop-busy workshop0))
    (not (workshop-busy workshop1))
    (not (workshop-busy workshop2))
    (not (workshop-busy workshop3))

    (not (assembly-lock item5))
    (not (assembly-lock item6))
    (not (assembly-lock item7))
    (not (assembly-lock item8))
    (not (assembly-lock item9))

    (not (agent-busy truck1))
    (not (agent-busy truck2))
    (not (agent-busy truck3))
    (not (agent-busy truck4))
    (not (agent-busy truck5))
    (not (agent-busy truck6))
    (not (agent-busy truck7))
    (not (agent-busy truck8))
    (not (agent-busy truck9))
    (not (agent-busy truck10))
    (not (agent-busy truck11))
    (not (agent-busy truck12))

    (not (agent-busy motorcycle1))
    (not (agent-busy motorcycle2))
    (not (agent-busy motorcycle3))
    (not (agent-busy motorcycle4))
    (not (agent-busy motorcycle5))
    (not (agent-busy motorcycle6))

    (not (agent-busy drone1))
    (not (agent-busy drone2))
    (not (agent-busy drone3))
    (not (agent-busy drone4))

    (not (agent-busy car1))
    (not (agent-busy car2))
    (not (agent-busy car3))
    (not (agent-busy car4))
    (not (agent-busy car5))
    (not (agent-busy car6))
    (not (agent-busy car7))
    (not (agent-busy car8))
    (not (agent-busy car9))
    (not (agent-busy car10))

    ; initial location of the agents
    (agent-at-facility truck1 storage0)
    (agent-at-facility truck2 storage1)
    (agent-at-facility truck3 storage2)
    (agent-at-facility truck4 storage3)


    (agent-at-facility motorcycle1 storage0)
    (agent-at-facility motorcycle2 storage1)
    (agent-at-facility motorcycle3 storage2)
    (agent-at-facility motorcycle4 storage3)

    (agent-at-facility car1 storage0)
    (agent-at-facility car2 storage1)
    (agent-at-facility car3 storage2)
    (agent-at-facility car4 storage3)

    (agent-at-facility drone1 storage0)
    (agent-at-facility drone2 storage1)
    (agent-at-facility drone3 storage2)
    (agent-at-facility drone4 storage3)
)

(:goal (and
        (agent-carrying-item truck1 item9)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
