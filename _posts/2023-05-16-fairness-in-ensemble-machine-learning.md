---
title: "When you combine several models, what happens to fairness? Our ICSE 2023 paper works it out."
---

Most methods for measuring and reducing bias in machine learning assume a single classifier. Real systems are often more involved: they combine several learners into an ensemble, where the final decision depends on how the parts are composed, and the fairness of the whole is not simply the fairness of each part.

In this paper (ICSE 2023), Usman Gohar, Sumon Biswas, and Hridesh Rajan study fairness and its composition in ensemble machine learning. They examine how the fairness of individual learners carries through to the ensemble, which lets developers reason about, and control, the fairness of the system they actually ship rather than of one model in isolation.

This work is part of our research on fairness in machine learning, within [Modular and Dependable AI](/research/#modular-and-dependable-ai); for the wider story see [our fairness overview](/news/2026/02/11/fairness-in-machine-learning/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-23c/).
