# Execution details

## FD execution details for `problem.pddl`

```
Plan length: 116 step(s).
Plan cost: 116
Expanded 7225 state(s).
Reopened 0 state(s).
Evaluated 7233 state(s).
Evaluations: 14459
Generated 1737475 state(s).
Dead ends: 7 state(s).
Number of registered states: 7233
Int hash set load factor: 7233/16384 = 0.441467
Int hash set resizes: 14
Search time: 52.9887s
Total time: 56.1933s
Solution found.
Peak memory: 4412888 KB
Remove intermediate file output.sas
search exit code: 0
```

## FD output for `problem.pddl`

```
prep_assemble_item8_finalise_workshop workshop0 (1)
prep_assemble_item9_finalise_workshop workshop1 (1)
prep_assemble_item6_finalise_workshop workshop2 (1)
prep_assemble_item7_finalise_workshop workshop3 (1)
goto car1 storage0 node0 (1)
gather car1 item0 node0 (1)
goto car1 node0 node10 (1)
gather car1 item4 node10 (1)
goto car1 node10 node4 (1)
gather car1 item3 node4 (1)
goto car1 node4 node5 (1)
gather car1 item1 node5 (1)
goto car1 node5 node9 (1)
gather car1 item2 node9 (1)
goto car1 node9 workshop2 (1)
goto car1 workshop2 workshop3 (1)
goto motorcycle1 storage0 workshop1 (1)
goto motorcycle1 workshop1 workshop2 (1)
goto truck1 storage0 workshop1 (1)
goto truck1 workshop1 workshop2 (1)
goto motorcycle2 storage1 workshop1 (1)
goto truck3 storage2 workshop1 (1)
goto motorcycle4 storage3 workshop3 (1)
goto truck1 workshop2 workshop1 (1)
prep_assemble_item9_arrange_roles truck1 motorcycle2 workshop1 (1)
goto truck3 workshop1 workshop2 (1)
goto car1 workshop3 workshop2 (1)
goto car3 storage2 workshop3 (1)
goto car1 workshop2 workshop3 (1)
goto motorcycle1 workshop2 workshop1 (1)
goto motorcycle4 workshop3 workshop2 (1)
goto motorcycle1 workshop1 workshop3 (1)
goto car1 workshop3 workshop2 (1)
goto motorcycle4 workshop2 workshop1 (1)
give car1 truck3 item3 workshop2 (1)
prep_assemble_item6_arrange_item3 truck3 workshop2 (1)
goto motorcycle4 workshop1 workshop2 (1)
goto car1 workshop2 workshop3 (1)
goto motorcycle1 workshop3 node4 (1)
gather motorcycle1 item3 node4 (1)
goto motorcycle1 node4 workshop3 (1)
prep_assemble_item7_arrange_item3 motorcycle1 workshop3 (1)
goto motorcycle4 workshop2 workshop1 (1)
goto motorcycle3 storage2 workshop2 (1)
goto car1 workshop3 workshop2 (1)
prep_assemble_item6_arrange_roles truck3 motorcycle3 workshop2 (1)
goto motorcycle4 workshop1 workshop2 (1)
give car1 motorcycle4 item0 workshop2 (1)
prep_assemble_item6_arrange_item0 motorcycle4 workshop2 (1)
goto drone4 storage3 node0 (1)
gather drone4 item0 node0 (1)
goto drone4 node0 workshop1 (1)
goto drone4 workshop1 workshop3 (1)
prep_assemble_item7_arrange_item0 drone4 workshop3 (1)
goto drone2 storage1 node0 (1)
gather drone2 item0 node0 (1)
goto drone2 node0 workshop1 (1)
prep_assemble_item9_arrange_item0 drone2 workshop1 (1)
goto truck4 storage3 node2 (1)
gather truck4 item1 node2 (1)
goto truck4 node2 workshop1 (1)
goto truck4 workshop1 workshop3 (1)
prep_assemble_item7_arrange_item1 truck4 workshop3 (1)
goto truck2 storage1 node3 (1)
gather truck2 item4 node3 (1)
prep_assemble_item6_arrange_item1 car1 workshop2 (1)
prep_assemble_item6_arrange_item2 car1 workshop2 (1)
prep_assemble_item6_arrange_item4 car1 workshop2 (1)
assemble_i6_resources_aquired  (1)
assemble_i6_motorcycle motorcycle3 (1)
consume_item1_assemble_i6 car1 (1)
consume_item4_assemble_i6 car1 (1)
consume_item0_assemble_i6 motorcycle4 (1)
consume_item3_assemble_i6 truck3 (1)
goto car1 workshop2 node7 (1)
gather car1 item1 node7 (1)
goto car1 node7 workshop1 (1)
goto car1 workshop1 workshop3 (1)
prep_assemble_item7_arrange_item2 car1 workshop3 (1)
consume_item2_assemble_i6 car1 (1)
post_assemble_i6_freeup_everything truck3 motorcycle3 workshop0 (1)
release_assembled_item6 motorcycle3 (1)
goto car1 workshop3 workshop1 (1)
goto truck2 node3 workshop1 (1)
goto truck2 workshop1 workshop3 (1)
prep_assemble_item7_arrange_item4 truck2 workshop3 (1)
goto motorcycle3 workshop2 workshop1 (1)
prep_assemble_item9_arrange_item6 motorcycle3 workshop1 (1)
goto car1 workshop1 node10 (1)
gather car1 item4 node10 (1)
goto car1 node10 node9 (1)
gather car1 item2 node9 (1)
goto car1 node9 workshop1 (1)
prep_assemble_item7_arrange_roles car3 motorcycle1 workshop3 (1)
assemble_i7_resources_aquired  (1)
assemble_i7_motorcycle motorcycle1 (1)
prep_assemble_item9_arrange_item1 car1 workshop1 (1)
prep_assemble_item9_arrange_item4 car1 workshop1 (1)
consume_item2_assemble_i7 car1 (1)
consume_item0_assemble_i7 drone4 (1)
consume_item3_assemble_i7 motorcycle1 (1)
consume_item4_assemble_i7 truck2 (1)
consume_item1_assemble_i7 truck4 (1)
post_assemble_i7_freeup_everything car3 motorcycle1 workshop0 (1)
release_assembled_item7 motorcycle1 (1)
goto motorcycle1 workshop3 workshop1 (1)
prep_assemble_item9_arrange_item7 motorcycle1 workshop1 (1)
assemble_i9_resources_aquired  (1)
assemble_i9_truck truck1 (1)
consume_item1_assemble_i9 car1 (1)
consume_item4_assemble_i9 car1 (1)
consume_item0_assemble_i9 drone2 (1)
consume_item7_assemble_i9 motorcycle1 (1)
consume_item6_assemble_i9 motorcycle3 (1)
post_assemble_i9_freeup_everything truck1 motorcycle2 workshop0 (1)
release_assembled_item9 truck1 (1)
```
