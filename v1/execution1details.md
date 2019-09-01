# Execution details

## SIW Plus plan output for Problem 1

```
Plan found with cost: 14
1. (GOTO DRONE1 STORAGE0 NODE3)
2. (GOTO DRONE4 STORAGE3 WORKSHOP3)
3. (GOTO CAR4 STORAGE3 NODE10)
4. (GATHER CAR4 ITEM4 NODE10)
5. (GOTO CAR4 NODE10 NODE8)
6. (GATHER CAR4 ITEM1 NODE8)
7. (GOTO CAR4 NODE8 WORKSHOP3)
8. (ASSEMBLE_I5_CAR CAR4 DRONE4 CAR4 CAR4 WORKSHOP3)
9. (GOTO CAR4 WORKSHOP3 WORKSHOP2)
10. (GATHER DRONE1 ITEM4 NODE3)
11. (GOTO DRONE1 NODE3 WORKSHOP2)
12. (ASSEMBLE_I8_DRONE CAR4 DRONE1 CAR4 DRONE1 WORKSHOP2)
13. (GOTO DRONE1 WORKSHOP2 STORAGE0)
14. (STORE DRONE1 STORAGE0 ITEM8)
Time: 8.56
Generated: 0
Expanded: 0
Total time: 8.56
Nodes generated during search: 10108
Nodes expanded during search: 9402

Match tree built with 152608 nodes.

PDDL problem description loaded:
    Domain: AGENTS-IN-THE-CITY
    Problem: COMPLETE-JOBS
    #Actions: 152608
    #Fluents: 867
Landmarks found: 1
Starting search with IW (time budget is 60 secs)...
rel_plan size: 11
#RP_fluents 15
Caption
{#goals, #UNnachieved,  #Achieved} -> IW(max_w)

{1/1/0}:IW(1) -> [2][3][4][5][6][7][8][9][10][11][12][13][14][15]rel_plan size: 0
#RP_fluents 0Plan found with cost: 14
Total time: 8.29
Nodes generated during search: 10108
Nodes expanded during search: 9402
IW search completed in 8.29 secs
```

## SIW Plus planner for Problem 2

```
No Plan generated
```
