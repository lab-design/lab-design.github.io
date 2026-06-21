---
title: "How do you speed up mining across ultra-large code repositories? Our ICSE 2017 paper clusters the work."
---

Mining very large collections of repositories supports many software-engineering tasks, such as inferring specifications or predicting defects, but the sheer volume makes it slow. Adding more machines helps only up to a point, and other ways to accelerate the work have been less explored.

In this new-ideas paper (ICSE 2017), Ganesha Upadhyaya and Hridesh Rajan propose a direction that goes beyond parallelization. The idea is to look at how a mining task interacts with each artifact and to cluster artifacts so that work shared across them is computed once rather than repeated for each artifact.

This work is part of [Analyzing Software at Scale, with Boa](/research/#software-at-scale); the idea is developed further in [Collective Program Analysis](/news/2018/05/30/collective-program-analysis/), and the [wider story is here](/news/2025/12/10/analyzing-software-at-scale-with-boa/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-NIER-17a/).
