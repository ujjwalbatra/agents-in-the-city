(define (problem testing) (:domain test)
(:objects 
    facility1 facility2 facility3 - facility
    agent1 - agent
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (agent-at-facility agent1 facility1)
    (not (mission-successful agent1))
    (= (distance facility1 facility2) 57)
    (= (distance facility2 facility1) 57)
    (= (distance facility1 facility3) 100)
    (= (distance facility3 facility1) 100)
    (= (distance facility2 facility3) 35)
    (= (distance facility3 facility2) 35)
    (= (total-cost) 0)
)

(:goal (and (mission-successful agent1))
)

;un-comment the following line if metric is needed
(:metric minimize (total-cost)
)
)
