# PDDL Models for Agents in City 2018

These are a set of [PDDL models](http://users.cecs.anu.edu.au/~patrik/pddlman/writing.html) to handle the [2018 Agents in City](https://multiagentcontest.org/2018/) domain from the International [Multi-Agent Contest](https://multiagentcontest.org/).


## Directory Structure

There are various directories for the following purposes:

* v1: Basic modeling with full assembly, yet not scalable.
  * Include problems:
    * Problem 1 - Problem that works.
    * Problem 2 - Problems that do not scale and gets stuck while grounding.
  * Output files:
    * execution1.details - Exectution details of problem 1 on [siw plus planer](http://lapkt.org/index.php?title=Documentation#SIW_Plus)
    * output1.txt - Ouput of problem 1 on [siw plus planner](http://lapkt.org/index.php?title=Documentation#SIW_Plus)

* v2: New modeling with actions with less variables (fixes scalablity)


## Running some models

The above models have been tested with various planers from the [Lightweight Automated Planning Toolkit](https://github.com/aig-upf/LAPKT-public) (LAPKT), which contains a [collection of planners](http://lapkt.org/index.php?title=Documentation) that can be compiled and used almost on-the-spot (many planners with both FF and FD parsers).
