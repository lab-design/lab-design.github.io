---
title: "Can you break a trained neural network into reusable parts? Our ESEC/FSE 2020 paper splits it into modules."
---

Deep learning is now part of many software systems. A model is trained on examples and then used to make predictions, and although its structure as a sequence of layers is visible, the model is treated as a single monolithic component. To change what it does, say to add or remove a class it recognizes, the usual recourse is to gather new data and retrain the whole network.

In this paper (ESEC/FSE 2020), Rangeet Pan and Hridesh Rajan ask whether a trained deep neural network can be decomposed into modules, much as a monolithic program can be broken into parts. For multi-class problems they develop a method that splits a network into one module per class, and they show on standard benchmarks that these modules can be reused to build new networks and swapped for one another without retraining, while matching the accuracy of the original monolithic model. The paper received an ACM SIGSOFT Distinguished Paper Award at ESEC/FSE 2020.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); for the wider story see [our modular deep learning overview](/news/2026/04/15/modular-deep-learning/). The full paper is available [here](https://lab-design.github.io/papers/ESEC-FSE-20b/).
