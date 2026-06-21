---
title: "How do you make control-flow analysis fast enough for millions of programs? Our ICSE 2020 paper tailors the traversal."
---

Many software-engineering tasks, from mining API specifications to discovering programming patterns, rely on analyzing control flow graphs, and doing this across millions of programs can be slow. Much of the cost comes from how the analysis walks each graph, and most frameworks apply a single fixed traversal strategy to every analysis.

BCFA, presented at ICSE 2020 by Ramanathan Ramu, Ganesha Upadhyaya, Hoan Nguyen, and Hridesh Rajan, makes that strategy bespoke. It chooses a traversal tailored to the particular analysis and graph rather than using one default everywhere, which speeds up control-flow analysis at scale without changing the result the analysis produces.

This work is part of [Analyzing Software at Scale, with Boa](/research/#software-at-scale); it is one of the scaling techniques described in [our overview](/news/2025/12/10/analyzing-software-at-scale-with-boa/), alongside [Collective Program Analysis](/news/2018/05/30/collective-program-analysis/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-20b/).
