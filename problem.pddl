(define (problem complete-jobs) (:domain agents-in-the-city)
(:objects 
    t1 t2 - truck  ; there are two trucks
    mc1 mc2 - motorcycle  ; there are two motorcycles
    i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 - item  ; there are 11 items
    w1 w2 w3 - workshop
    storage1
    job12 - job
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (= (massium) 5000)
    (= (motorcycle-available-capacity) 70)
    (= (truck-available-capacity) 300)
    (= (storage1-available-capacity) 11049)
    (= (storage1-item6-volume) 0)

    (truck-free t1)
    (truck-free t2)
    (motorcycle-free mc1)
    (motorcycle-free mc2)
)

(:goal (and
    ;todo: put the goal condition here
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
