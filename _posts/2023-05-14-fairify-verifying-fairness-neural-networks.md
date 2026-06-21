---
title: "Can you guarantee a neural network treats similar people the same? Our ICSE 2023 paper proves it."
---

Testing a model for fairness can reveal problems, but it cannot promise their absence. For high-stakes uses, developers want a guarantee that a model treats similar individuals alike regardless of protected attributes such as race, sex, or age. Proving this is hard, because a neural network reaches its decisions through many non-linear computations.

Fairify, presented at ICSE 2023 by Sumon Biswas and Hridesh Rajan, verifies individual fairness in neural networks using an SMT solver. The key idea is that, for a given query, many neurons in the network always stay in the same state, which lets Fairify prune the network and make verification tractable enough for a developer to run. The approach is sound, so a result it certifies can be relied on.

Fairify moves fairness from something teams test for to something they can verify, which matters most where the cost of a biased decision is high. It is part of our lab's work on the fairness and dependability of machine learning.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai). The full paper is available [here](https://lab-design.github.io/papers/ICSE-23a/).
