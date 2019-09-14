## Execution Details on Madagascar Mp (SAT Planner)

```
Madagascar 0.99999 25/02/2015 09:46:27 amd64 1-core (no VSIDS)
Options: file:../agents-in-the-city/v3/domain.pddl file:../agents-in-the-city/v3/problem.pddl
Domain: agents-in-the-city
Problem: complete-jobs
Parser: 176367 ground actions and 1962 state variables
Invariants: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17  1.22 secs
Goal: conjunctive
Simplified: 57321 ground actions and 1097 state variables
Actions: general
Disabling graph %: 10 20 30 40 50 60 70 80 90 100 0.49 secs (max SCC size 42256)
Plan type: E-step
    Allocated 32 MB permanent (total 680 MB)
Horizon 0: 1097 variables
0 UNSAT (0 decisions 0 conflicts)
Horizon 5: 807607 variables
5 UNSAT (0 decisions 0 conflicts)
Horizon 10: 1614117 variables
10 UNSAT (0 decisions 0 conflicts)
Horizon 15: 2420627 variables
    Allocated 32 MB (total 1364 MB)
SAT (1945 decisions 18 conflicts)
PLAN FOUND: 15 steps

112 actions in the plan.
Cost of the plan is 190.
total time 41.85 preprocess 2.48 
total size 1.934 GB
max. learned clause length 303
t val conflicts decisions
0 0 0 0
5 0 0 0
10 0 0 0
15 1 18 1945
```

## Plan ouput on Madagascar Mp (SAT Planner)

```
STEP 0:
    goto(car1,storage0,node9)
    goto(car2,storage1,node10)
    goto(car3,storage2,workshop0)
    goto(car4,storage3,node7)
    goto(drone1,storage0,node4)
    goto(drone2,storage1,node3)
    goto(drone3,storage2,node0)
    goto(drone4,storage3,node0)
    goto(motorcycle1,storage0,node9)
    goto(motorcycle2,storage1,workshop2)
    goto(motorcycle3,storage2,workshop0)
    goto(motorcycle4,storage3,node7)
    goto(truck1,storage0,node8)
    goto(truck2,storage1,node4)
    goto(truck3,storage2,workshop2)
    goto(truck4,storage3,workshop2)
    prep_assemble_item6_finalise_workshop(workshop2)
    prep_assemble_item7_finalise_workshop(workshop0)


STEP 1.0:
    gather(car1,item2,node9)
    gather(car2,item4,node10)
    gather(car4,item1,node7)
    gather(drone1,item3,node4)
    gather(drone2,item4,node3)
    gather(drone3,item0,node0)
    gather(drone4,item0,node0)
    gather(motorcycle1,item2,node9)
    gather(motorcycle4,item1,node7)
    gather(truck1,item1,node8)
    gather(truck2,item3,node4)
    goto(truck3,workshop2,node0)
    prep_assemble_item6_arrange_roles(truck4,motorcycle2,workshop2)
    prep_assemble_item7_arrange_roles(car3,motorcycle3,workshop0)


STEP 1.1:
    goto(car1,node9,workshop0)
    goto(car2,node10,workshop0)
    goto(car4,node7,workshop0)
    goto(drone1,node4,workshop2)
    goto(drone2,node3,workshop2)
    goto(drone3,node0,workshop0)
    goto(drone4,node0,workshop2)
    goto(motorcycle1,node9,workshop2)
    goto(motorcycle4,node7,workshop2)
    goto(truck1,node8,workshop2)
    goto(truck2,node4,workshop0)


STEP 2.0:

    give(motorcycle4,drone2,item1,workshop2)
    goto(truck3,node0,workshop2)
    prep_assemble_item6_arrange_item0(drone4,workshop2)
    prep_assemble_item6_arrange_item1(truck1,workshop2)
    prep_assemble_item6_arrange_item2(motorcycle1,workshop2)
    prep_assemble_item6_arrange_item3(drone1,workshop2)
    prep_assemble_item7_arrange_item0(drone3,workshop0)
    prep_assemble_item7_arrange_item1(car4,workshop0)
    prep_assemble_item7_arrange_item2(car1,workshop0)
    prep_assemble_item7_arrange_item3(truck2,workshop0)
    prep_assemble_item7_arrange_item4(car2,workshop0)

STEP 2.1:


    goto(motorcycle4,workshop2,node8)
    prep_assemble_item6_arrange_item4(drone2,workshop2)


STEP 3:

    assemble_i6_resources_aquired() assemble_i7_resources_aquired()
    goto(motorcycle4,node8,workshop2)
    goto(truck3,workshop2,node8)


STEP 4:

    assemble_i6_truck(truck4) assemble_i7_motorcycle(motorcycle3)
    goto(motorcycle4,workshop2,node0)
    goto(truck3,node8,workshop2)


STEP 5.0:


    consume_item0_assemble_i6(drone4)
    consume_item0_assemble_i7(drone3)
    consume_item1_assemble_i6(truck1)
    consume_item1_assemble_i7(car4)
    consume_item2_assemble_i6(motorcycle1)
    consume_item2_assemble_i7(car1)
    consume_item3_assemble_i6(drone1)
    consume_item3_assemble_i7(truck2)
    consume_item4_assemble_i6(drone2)
    consume_item4_assemble_i7(car2)
    gather(motorcycle4,item0,node0)
    goto(truck3,workshop2,node10)


STEP 5.1:


    goto(motorcycle4,node0,workshop2)

STEP 6.0:


    gather(truck3,item4,node10) 
    give(drone2,truck1,item1,workshop2) 
    give(motorcycle4,drone2,item0,workshop2)
    goto(drone1,workshop2,node4) 
    post_assemble_i6_freeup_everything(truck4,motorcycle2,workshop0) 
    post_assemble_i7_freeup_everything(car3,motorcycle3,workshop2)


STEP 6.1:


    goto(truck1,workshop2,workshop0)
    goto(truck3,node10,node4)


STEP 7.0:

    give(truck1,car3,item1,workshop0) 
    give(truck3,drone1,item4,node4)
    goto(motorcycle3,workshop0,workshop2)
    prep_assemble_item9_finalise_workshop(workshop2) 
    release_assembled_item6(truck4) 
    release_assembled_item7(motorcycle3)


STEP 7.1:

    goto(car3,workshop0,workshop2)
    goto(drone1,node4,workshop2)
    goto(truck1,workshop0,node4)
    goto(truck3,node4,workshop2)


STEP 8:

    prep_assemble_item9_arrange_item0(drone2,workshop2)
    prep_assemble_item9_arrange_item1(car3,workshop2)
    prep_assemble_item9_arrange_item4(drone1,workshop2)
    prep_assemble_item9_arrange_item6(truck4,workshop2)
    prep_assemble_item9_arrange_item7(motorcycle3,workshop2)
    prep_assemble_item9_arrange_roles(truck3,motorcycle2,workshop2)


STEP 9:

    assemble_i9_resources_aquired()


STEP 10:

    assemble_i9_motorcycle(motorcycle2)


STEP 11:


    consume_item0_assemble_i9(drone2)
    consume_item1_assemble_i9(car3)
    consume_item4_assemble_i9(drone1)
    consume_item6_assemble_i9(truck4)
    consume_item7_assemble_i9(motorcycle3)


STEP 12:
    post_assemble_i9_freeup_everything(truck3,motorcycle2,workshop0)


STEP 13:

    goto(motorcycle2,workshop2,node4) 
    release_assembled_item9(motorcycle2)


STEP 14:

    give(motorcycle2,truck1,item9,node4)
                                             
```
