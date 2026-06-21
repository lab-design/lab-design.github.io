---
title: "When should you trust a model's prediction on new data? Our ICSE 2024 paper infers the preconditions."
---

A deep learning model is trained under certain assumptions about its data and then deployed on inputs it has never seen. When an input drifts away from what the model was built for, its prediction can be confidently wrong, and a team has no easy way to tell a trustworthy prediction from a risky one.

In this paper (ICSE 2024), Shibbir Ahmed, Hongyang Gao, and Hridesh Rajan infer data preconditions directly from a trained model: the conditions an input should meet for the model's prediction to be relied on. Because ordinary specification and verification methods do not handle the complexity of deep networks, the approach derives these preconditions from the model itself, so that risky inputs can be flagged at deployment time.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); it complements our work on [design by contract for deep learning APIs](/news/2023/12/06/design-by-contract-for-deep-learning-apis/) and our overview of [debugging deep learning](/news/2025/10/15/why-deep-learning-needs-debugging-tools/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-24a/).
