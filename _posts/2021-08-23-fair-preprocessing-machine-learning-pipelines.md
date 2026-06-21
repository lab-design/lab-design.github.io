---
title: "Where does unfairness enter a machine-learning pipeline? Our ESEC/FSE 2021 paper pinpoints the stage."
---

A machine-learning system is usually a pipeline: data passes through a sequence of preprocessing steps before a classifier ever sees it. Most fairness research has focused on the classifier, yet the root of unfairness often lies earlier, in how the data was transformed. Until this work there was no way to measure the unfairness introduced by a specific preprocessing step.

Fair Preprocessing, presented at ESEC/FSE 2021 by Sumon Biswas and Hridesh Rajan, considers fairness across the whole pipeline rather than the model alone. We introduced a causal method that attributes changes in fairness to individual data transformations, which makes it possible to see which preprocessing stage helps or harms, and by how much.

By locating where unfairness enters, the approach lets developers address it at the source instead of only adjusting the final model. It is part of our lab's work on the fairness and dependability of machine learning.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); for the wider story see [our fairness overview](/news/2026/02/11/fairness-in-machine-learning/). The full paper is available [here](https://lab-design.github.io/papers/ESEC-FSE-21/).
