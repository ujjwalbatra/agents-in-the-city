# PDDL Models for Agents in City 2018

These are a set of [PDDL models](http://users.cecs.anu.edu.au/~patrik/pddlman/writing.html) to handle the [2018 Agents in City](https://multiagentcontest.org/2018/) domain from the International [Multi-Agent Contest](https://multiagentcontest.org/).


## Directory Structure

There are various directories for the following purposes:

* v1: Basic modeling with full assembly, yet not scalable.
  * Include problems:
    * Problem 1 - Problem that works.
    * Problem 2 - Problems that do not scale and gets stuck while grounding.
  * Output files:
    * execution.details - Exectution details of problem 1 on [siw plus planer](http://lapkt.org/index.php?title=Documentation#SIW_Plus) and Ouput of problem 1 on [siw plus planner](http://lapkt.org/index.php?title=Documentation#SIW_Plus)

* v2: New modeling with actions with less variables (fixes scalablity)

## Editing the models

Models have been developed using [Visual Studio Code](https://code.visualstudio.com/) IDE with the [PDDL extension](https://marketplace.visualstudio.com/items?itemName=jan-dolejsi.pddl).

The planner used on it is, as of August 2019, [SIW Plus-then-BFS with FF parser](https://github.com/LAPKT-dev/LAPKT-public/tree/master/planners/siw_plus-then-bfs_f-ffparser) from LAPTK.

## Running some models

The above models have been tested with various planers from the [Lightweight Automated Planning Toolkit](https://github.com/aig-upf/LAPKT-public) (LAPKT), which contains a [collection of planners](http://lapkt.org/index.php?title=Documentation) that can be compiled and used almost on-the-spot (many planners with both FF and FD parsers).

Assuming LAPKT has been compiled, here is an example:

```shell
$ ./siw-then-bfsf --domain v1/domain.pddl --problem v1/problem1.pddl --output v1/plan-p1-1.plan
 --- OK.
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
Total time: 6.6792
Nodes generated during search: 10108
Nodes expanded during search: 9402
IW search completed
```
