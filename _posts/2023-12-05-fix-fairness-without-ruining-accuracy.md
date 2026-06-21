---
title: "Can you make a model fairer without making it worse? Our ESEC/FSE 2023 paper manages both."
---

A familiar objection to fixing bias in machine learning is that it costs accuracy. Many bias-mitigation methods work only in particular situations, and they often trade away predictive performance to gain fairness, which makes teams reluctant to use them.

In this paper (ESEC/FSE 2023), Giang Nguyen, Sumon Biswas, and Hridesh Rajan present a performance-aware way to repair fairness. Using automated machine learning to search for the right adjustment, the approach improves fairness while holding on to accuracy, so that making a model fairer no longer means accepting a worse model.

This work is part of our research on fairness in machine learning, within [Modular and Dependable AI](/research/#modular-and-dependable-ai); for the wider story see [our fairness overview](/news/2026/02/11/fairness-in-machine-learning/). The full paper is available [here](https://lab-design.github.io/papers/ESEC-FSE-23b/).
