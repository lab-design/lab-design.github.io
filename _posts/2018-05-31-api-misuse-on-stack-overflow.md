---
title: "Can you trust the code examples on Stack Overflow? Our ICSE 2018 paper checks them at scale."
---

Programmers routinely learn a new API by copying an example from a question-and-answer site such as Stack Overflow. Those examples are convenient, but they are written quickly and are not always correct, and a subtle misuse can carry a real bug into production code.

In this paper (ICSE 2018), Tianyi Zhang, Ganesha Upadhyaya, Anastasia Reinhardt, Hridesh Rajan, and Miryung Kim measured how common and how serious API misuse is on Stack Overflow. To do it at scale without hand-checking everything, they built Maple, which mines correct API usage patterns from more than 380,000 Java repositories on GitHub and then flags examples that depart from those patterns. The study found that a meaningful share of popular examples misuse their APIs in ways that could lead to crashes or incorrect results.

This work is part of [Analyzing Software at Scale, with Boa](/research/#software-at-scale); it relies on the same large-scale mining behind [Collective Program Analysis](/news/2018/05/30/collective-program-analysis/), and the [wider story is here](/news/2025/12/10/analyzing-software-at-scale-with-boa/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-18b/).
