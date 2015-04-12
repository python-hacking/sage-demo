# sage-demo
Набор [Sage](http://sagemath.org)-примеров для курса [«Разработка прикладных программ на языке программирования Python» (UNИX, 2015)] (https://uneex.ru/LecturesCMC/PythonDevelopment2015)

**1.1, 2.1**: [here](https://cloud.sagemath.com/projects/9ed34fc6-7526-4c0d-9d0d-67a3d7e0d27e/files/2015-04-12-001451.sagews).

Illustrates breadth-first search algorightm (searching for the shortest path between 2 vertices). Vertices are highlighted with
* white -- not visited
* pink -- current
* gray -- already visited (won't look again)

Source code in graph.sage.


**1.2, 2.2**: [here](https://cloud.sagemath.com/projects/9ed34fc6-7526-4c0d-9d0d-67a3d7e0d27e/files/2015-04-11-215021.sagews). Note: big maze animation may take several seconds to compute on the server.

Illustrates path search from upper-left to bottom-right corner of the maze (using DFS algorithm).

Source code in animation-maze.sage.


**3.1**: [here](https://cloud.sagemath.com/projects/9ed34fc6-7526-4c0d-9d0d-67a3d7e0d27e/files/random-graph-bfs.sagews).

BFS. Same as 2.1 but runs on interactively generated random graphs with specified densities.
Source code in interact_graph.sage.
