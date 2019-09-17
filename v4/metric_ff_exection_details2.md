## Execution Details on Metric-FF

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

Cueing down from goal distance:   71 into depth [1]
                                  70            [1]
                                  69            [1]
                                  68            [1]
                                  67            [1]
                                  66            [1]
                                  65            [1]
                                  64            [1]
                                  63            [1]
                                  62            [1]
                                  61            [1]
                                  60            [1]
                                  59            [1][2][3]
                                  57            [1]
                                  56            [1]
                                  54            [1]
                                  53            [1]
                                  52            [1]
                                  51            [1]
                                  50            [1]
                                  49            [1][2][3][4]
                                  48            [1][2][3]
                                  47            [1]
                                  46            [1][2][3][4][5][6][7][8]
                                  43            [1]
                                  40            [1]
                                  39            [1]
                                  38            [1]
                                  37            [1][2]
                                  36            [1]
                                  35            [1]
                                  34            [1]
                                  33            [1]
                                  32            [1][2][3][4]
                                  31            [1][2][3][4]
                                  30            [1][2][3][4]
                                  29            [1][2][3]
                                  28            [1]
                                  27            [1]
                                  26            [1][2]
                                  25            [1]
                                  24            [1][2]
                                  23            [1]
                                  22            [1]
                                  21            [1][2]
                                  20            [1]
                                  19            [1]
                                  18            [1]
                                  17            [1]
                                  16            [1][2][3]
                                  15            [1][2][3]
                                  14            [1][2][3]
                                  13            [1]
                                  12            [1]
                                  11            [1]
                                  10            [1]
                                   9            [1]
                                   8            [1]
                                   7            [1]
                                   6            [1]
                                   5            [1]
                                   4            [1]
                                   3            [1]
                                   2            [1]
                                   1            [1]
                                   0



time spent:    0.03 seconds instantiating 173455 easy, 5384 hard action templates
               0.04 seconds reachability analysis, yielding 1449 facts and 67897 actions
               0.05 seconds creating final representation with 1030 relevant facts, 248 relevant fluents
               0.17 seconds computing LNF
               0.23 seconds building connectivity graph
            6430.35 seconds searching, evaluating 72871 states, to a max depth of 8
            6430.87 seconds total time
```

## Plan found on Metric-FF

```
ff: found legal plan as follows

step    0: GOTO TRUCK4 STORAGE3 WORKSHOP3
        1: GOTO TRUCK1 STORAGE0 WORKSHOP3
        2: GOTO CAR4 STORAGE3 NODE0
        3: GOTO MOTORCYCLE4 STORAGE3 WORKSHOP3
        4: GATHER CAR4 ITEM0 NODE0
        5: GOTO CAR4 NODE0 NODE2
        6: GATHER CAR4 ITEM1 NODE2
        7: GOTO CAR4 NODE2 NODE1
        8: GATHER CAR4 ITEM2 NODE1
        9: GOTO CAR4 NODE1 NODE4
       10: GATHER CAR4 ITEM3 NODE4
       11: GOTO CAR4 NODE4 WORKSHOP3
       12: GOTO CAR3 STORAGE2 NODE3
       13: GOTO CAR4 WORKSHOP3 NODE10
       14: GATHER CAR4 ITEM4 NODE10
       15: GOTO CAR3 NODE3 NODE10
       16: GATHER CAR4 ITEM4 NODE10
       17: GATHER CAR4 ITEM4 NODE10
       18: GOTO CAR4 NODE10 NODE3
       19: GATHER CAR4 ITEM4 NODE3
       20: GATHER CAR4 ITEM4 NODE3
       21: GOTO CAR4 NODE3 WORKSHOP3
       22: PREP_ASSEMBLE_ITEM9_FINALISE_WORKSHOP WORKSHOP3
       23: GOTO TRUCK4 WORKSHOP3 WORKSHOP2
       24: PREP_ASSEMBLE_ITEM9_ARRANGE_ROLES TRUCK1 MOTORCYCLE4 WORKSHOP3
       25: GOTO MOTORCYCLE3 STORAGE2 WORKSHOP2
       26: PREP_ASSEMBLE_ITEM6_FINALISE_WORKSHOP WORKSHOP2
       27: PREP_ASSEMBLE_ITEM7_FINALISE_WORKSHOP WORKSHOP1
       28: PREP_ASSEMBLE_ITEM6_ARRANGE_ROLES TRUCK4 MOTORCYCLE3 WORKSHOP2
       29: GOTO MOTORCYCLE2 STORAGE1 WORKSHOP1
       30: GOTO CAR4 WORKSHOP3 WORKSHOP2
       31: PREP_ASSEMBLE_ITEM6_ARRANGE_ITEM0 CAR4 WORKSHOP2
       32: PREP_ASSEMBLE_ITEM6_ARRANGE_ITEM1 CAR4 WORKSHOP2
       33: PREP_ASSEMBLE_ITEM6_ARRANGE_ITEM2 CAR4 WORKSHOP2
       34: PREP_ASSEMBLE_ITEM6_ARRANGE_ITEM3 CAR4 WORKSHOP2
       35: PREP_ASSEMBLE_ITEM6_ARRANGE_ITEM4 CAR4 WORKSHOP2
       36: ASSEMBLE_I6_RESOURCES_AQUIRED
       37: ASSEMBLE_I6_MOTORCYCLE MOTORCYCLE3
       38: CONSUME_ITEM0_ASSEMBLE_I6 CAR4
       39: GOTO CAR4 WORKSHOP2 NODE0
       40: GATHER CAR4 ITEM0 NODE0
       41: GOTO CAR4 NODE0 WORKSHOP1
       42: PREP_ASSEMBLE_ITEM7_ARRANGE_ITEM0 CAR4 WORKSHOP1
       43: GOTO CAR3 NODE10 WORKSHOP3
       44: PREP_ASSEMBLE_ITEM7_ARRANGE_ITEM1 CAR4 WORKSHOP1
       45: PREP_ASSEMBLE_ITEM7_ARRANGE_ITEM2 CAR4 WORKSHOP1
       46: PREP_ASSEMBLE_ITEM7_ARRANGE_ITEM3 CAR4 WORKSHOP1
       47: PREP_ASSEMBLE_ITEM7_ARRANGE_ITEM4 CAR4 WORKSHOP1
       48: CONSUME_ITEM1_ASSEMBLE_I6 CAR4
       49: GOTO CAR4 WORKSHOP1 NODE2
       50: GATHER CAR4 ITEM1 NODE2
       51: GOTO CAR4 NODE2 WORKSHOP1
       52: CONSUME_ITEM2_ASSEMBLE_I6 CAR4
       53: GOTO CAR4 WORKSHOP1 NODE1
       54: GATHER CAR4 ITEM2 NODE1
       55: GOTO CAR4 NODE1 WORKSHOP1
       56: CONSUME_ITEM3_ASSEMBLE_I6 CAR4
       57: GOTO CAR4 WORKSHOP1 NODE4
       58: GATHER CAR4 ITEM3 NODE4
       59: GOTO CAR4 NODE4 WORKSHOP1
       60: CONSUME_ITEM4_ASSEMBLE_I6 CAR4
       61: POST_ASSEMBLE_I6_FREEUP_EVERYTHING TRUCK4 MOTORCYCLE3 WORKSHOP3
       62: GOTO MOTORCYCLE3 WORKSHOP2 WORKSHOP3
       63: RELEASE_ASSEMBLED_ITEM6 MOTORCYCLE3
       64: PREP_ASSEMBLE_ITEM9_ARRANGE_ITEM6 MOTORCYCLE3 WORKSHOP3
       65: GOTO CAR4 WORKSHOP1 NODE3
       66: GATHER CAR4 ITEM4 NODE3
       67: GOTO CAR4 NODE3 WORKSHOP1
       68: GOTO CAR4 WORKSHOP1 WORKSHOP3
       69: PREP_ASSEMBLE_ITEM9_ARRANGE_ITEM0 CAR4 WORKSHOP3
       70: PREP_ASSEMBLE_ITEM9_ARRANGE_ITEM1 CAR4 WORKSHOP3
       71: PREP_ASSEMBLE_ITEM9_ARRANGE_ITEM4 CAR4 WORKSHOP3
       72: GOTO CAR3 WORKSHOP3 WORKSHOP1
       73: PREP_ASSEMBLE_ITEM7_ARRANGE_ROLES CAR3 MOTORCYCLE2 WORKSHOP1
       74: ASSEMBLE_I7_RESOURCES_AQUIRED
       75: ASSEMBLE_I7_MOTORCYCLE MOTORCYCLE2
       76: CONSUME_ITEM2_ASSEMBLE_I7 CAR4
       77: CONSUME_ITEM3_ASSEMBLE_I7 CAR4
       78: CONSUME_ITEM0_ASSEMBLE_I7 CAR4
       79: GOTO CAR4 WORKSHOP3 NODE0
       80: GATHER CAR4 ITEM0 NODE0
       81: CONSUME_ITEM1_ASSEMBLE_I7 CAR4
       82: GOTO CAR4 NODE0 NODE2
       83: GATHER CAR4 ITEM1 NODE2
       84: CONSUME_ITEM4_ASSEMBLE_I7 CAR4
       85: POST_ASSEMBLE_I7_FREEUP_EVERYTHING CAR3 MOTORCYCLE2 WORKSHOP3
       86: GOTO MOTORCYCLE2 WORKSHOP1 WORKSHOP3
       87: GOTO CAR4 NODE2 NODE3
       88: GATHER CAR4 ITEM4 NODE3
       89: RELEASE_ASSEMBLED_ITEM7 MOTORCYCLE2
       90: PREP_ASSEMBLE_ITEM9_ARRANGE_ITEM7 MOTORCYCLE2 WORKSHOP3
       91: ASSEMBLE_I9_RESOURCES_AQUIRED
       92: ASSEMBLE_I9_TRUCK TRUCK1
       93: CONSUME_ITEM0_ASSEMBLE_I9 CAR4
       94: CONSUME_ITEM1_ASSEMBLE_I9 CAR4
       95: CONSUME_ITEM6_ASSEMBLE_I9 MOTORCYCLE3
       96: CONSUME_ITEM7_ASSEMBLE_I9 MOTORCYCLE2
       97: CONSUME_ITEM4_ASSEMBLE_I9 CAR4
       98: POST_ASSEMBLE_I9_FREEUP_EVERYTHING TRUCK1 MOTORCYCLE4 WORKSHOP3
       99: RELEASE_ASSEMBLED_ITEM9 TRUCK1
```
