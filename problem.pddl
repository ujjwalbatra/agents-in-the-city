(define (problem complete-jobs) (:domain agents-in-the-city)

(:objects 
    t1 - truck  ; there are two trucks
    ; mc1 mc2 - motorcycle  ; there are two motorcycles
    i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 - item  ; there are 11 items
    w0 w1 w2 w3 - workshop
    s0 s1 s2 s3 - storage
    n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - resourceNode
)

(:init
    ;todo: put the initial state's facts and numeric values here

    ; resourcenodes containing item
   ; (item-in-resourceNode i2 n1)
    (item-in-resourceNode i1 n2)
    (item-in-resourceNode i3 n3)
    (item-in-resourceNode i4 n4)
    (item-in-resourceNode i1 n5)
    (item-in-resourceNode i3 n6)
    (item-in-resourceNode i1 n7)
    (item-in-resourceNode i1 n8)
    (item-in-resourceNode i2 n9)
    (item-in-resourceNode i4 n10)
    
    (= (agent-used-capacity t1) 0) ; agent hasnt used it's capacity initially

    (agent-at-location t1 s0)
)

(:goal (and
    (capacity-increased)
    ;todo: put the goal condition here
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
