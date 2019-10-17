# Execution details

## Metric-ff Plus execution details for `problem1.pddl`

```
ff: parsing domain file
domain 'AGENTS-IN-THE-CITY' defined
 ... done.
ff: parsing problem file
problem 'COMPLETE-JOBS' defined
 ... done.


no metric specified. plan length assumed.

checking for cyclic := effects --- OK.

ff: search configuration is EHC, if that fails then  best-first on 1*g(s) + 5*h(s) where
    metric is  plan length

Cueing down from goal distance:    9 into depth [1]
                                   8            [1][2]
                                   7            [1]
                                   6            [1]
                                   5            [1]
                                   4            [1][2][3][4]
                                   3            [1]
                                   2            [1]
                                   1            [1]
                                   0
\
time spent:    0.09 seconds instantiating 359046 easy, 0 hard action templates
               0.11 seconds reachability analysis, yielding 764 facts and 108192 actions
               0.14 seconds creating final representation with 579 relevant facts, 0 relevant fluents
               1.24 seconds computing LNF
               0.30 seconds building connectivity graph
               0.56 seconds searching, evaluating 33 states, to a max depth of 4
               2.44 seconds total time
```

## Metric-ff plan output for `problem1.pddl`

```
step    0: GOTO DRONE4 STORAGE3 WORKSHOP3
        1: GOTO CAR1 STORAGE0 NODE3
        2: GATHER CAR1 ITEM4 NODE3
        3: GOTO CAR1 NODE3 NODE2
        4: GATHER CAR1 ITEM1 NODE2
        5: GOTO CAR1 NODE2 WORKSHOP3
        6: ASSEMBLE_I5_CAR CAR1 DRONE4 CAR1 CAR1 WORKSHOP3
        7: GOTO CAR1 WORKSHOP3 NODE3
        8: GATHER CAR1 ITEM4 NODE3
        9: GOTO CAR1 NODE3 WORKSHOP3
       10: ASSEMBLE_I8_CAR CAR1 DRONE4 CAR1 CAR1 WORKSHOP3
       11: GOTO CAR1 WORKSHOP3 STORAGE0
       12: STORE CAR1 STORAGE0 ITEM8
```
