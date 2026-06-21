---
title: "Can you reuse part of one CNN to build or fix another? Our ICSE 2022 paper makes CNNs modular."
---

Building a convolutional neural network almost always starts from scratch, with training that costs time and energy. Yet much of what one network learns, such as the ability to recognize a particular class, overlaps with what other networks need.

In this paper (ICSE 2022), Rangeet Pan and Hridesh Rajan show how to decompose a trained CNN into modules, each responsible for one output class, so that a module can be reused in a new model or used to replace a faulty part of an existing one. Building a network by composing modules avoids retraining, and it makes a model repairable, because the part responsible for a problem can simply be swapped out.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); it extends [On Decomposing a Deep Neural Network into Modules](/news/2020/11/11/decomposing-a-deep-neural-network-into-modules/), and the [wider story is here](/news/2026/04/15/modular-deep-learning/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-22b/).
