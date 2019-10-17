# Execution details

## FD execution details for `problem1.pddl`

```
Plan length: 13 step(s).
Plan cost: 13
Expanded 26 state(s).
Reopened 0 state(s).
Evaluated 27 state(s).
Evaluations: 54
Generated 7949 state(s).
Dead ends: 0 state(s).
Number of registered states: 27
Int hash set load factor: 27/32 = 0.84375
Int hash set resizes: 5
Search time: 0.287707s
Total time: 5.14723s
Solution found.
Peak memory: 4394160 KB
Remove intermediate file output.sas
search exit code: 0
```

## FD output for `problem1.pddl`

```
goto drone4 storage3 workshop0 (1)
goto car1 storage0 node3 (1)
gather car1 item4 node3 (1)
goto car1 node3 node8 (1)
gather car1 item1 node8 (1)
goto car1 node8 workshop0 (1)
assemble_i5_drone car1 drone4 car1 car1 workshop0 (1)
goto car1 workshop0 node3 (1)
gather car1 item4 node3 (1)
goto car1 node3 workshop0 (1)
assemble_i8_drone car1 drone4 drone4 car1 workshop0 (1)
goto drone4 workshop0 storage0 (1)
store drone4 storage0 item8 (1)
```
