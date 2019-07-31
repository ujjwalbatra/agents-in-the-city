(define (problem complete-jobs) (:domain agents-in-the-city)

(:objects 
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 - truck  ; there are 12 trucks
    mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 - motorcycle  ; there are 8 motorcycles
    d1 d2 d3 d4 - drone  ; 4 drones
    c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 - car  ; there are 10 cars

    i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 - item  ; there are 11 items
    w0 w1 w2 w3 - workshop  ; 4 workshops to assemble items
    s0 s1 s2 s3 - storage  ; 4  storages to store the items
    n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - resourceNode  ; 10 resource nodes to acquire items

    sh0 sh1 sh2 sh3 sh4 sh5 sh6 - shop
)

(:init
    ;todo: put the initial state's facts and numeric values here

    ; resourcenodes containing item
    (item-in-resourceNode i1 n2)
    (item-in-resourceNode i3 n3)
    (item-in-resourceNode i4 n4)
    (item-in-resourceNode i1 n5)
    (item-in-resourceNode i3 n6)
    (item-in-resourceNode i1 n7)
    (item-in-resourceNode i1 n8)
    (item-in-resourceNode i2 n9)
    (item-in-resourceNode i4 n10)

    (item-require-part i9 i4)
    (item-require-part i9 i1)

    (= (agent-used-capacity t1 i0) 0)    
    (= (agent-used-capacity t1 i1) 0) ; agent hasnt used it's capacity initially
    (= (agent-used-capacity t1 i2) 0)
    (= (agent-used-capacity t1 i3) 0)
    (= (agent-used-capacity t1 i4) 0)
    (= (agent-used-capacity t1 i5) 0)
    (= (agent-used-capacity t1 i6) 0)
    (= (agent-used-capacity t1 i7) 0)
    (= (agent-used-capacity t1 i8) 0)
    (= (agent-used-capacity t1 i9) 0)

    (= (agent-used-capacity t2 i0) 0)    
    (= (agent-used-capacity t2 i1) 0) ; agent hasnt used it's capacity initially
    (= (agent-used-capacity t2 i2) 0)
    (= (agent-used-capacity t2 i3) 0)
    (= (agent-used-capacity t2 i4) 0)
    (= (agent-used-capacity t2 i5) 0)
    (= (agent-used-capacity t2 i6) 0)
    (= (agent-used-capacity t2 i7) 0)
    (= (agent-used-capacity t2 i8) 0)
    (= (agent-used-capacity t2 i9) 0)

    (= (agent-used-capacity mc1 i0) 0)
    (= (agent-used-capacity mc1 i1) 0)
    (= (agent-used-capacity mc1 i2) 0)
    (= (agent-used-capacity mc1 i3) 0)
    (= (agent-used-capacity mc1 i4) 0)
    (= (agent-used-capacity mc1 i5) 0)
    (= (agent-used-capacity mc1 i6) 0)
    (= (agent-used-capacity mc1 i7) 0)
    (= (agent-used-capacity mc1 i8) 0)
    (= (agent-used-capacity mc1 i9) 0)

    
    


    (agent-at-facility t1 s0)
    (agent-at-facility t2 s0)
    (agent-at-facility mc1 s2)

    
)

(:goal (and
    ;(job-complete s0 i9)
    (agent-carrying-item t1 i9)
    ;todo: put the goal condition here
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
