---
title: "Can you teach a translation model a new language without retraining it? Our ICSE 2023 paper decomposes the RNN."
---

Recurrent neural networks power tasks like translating between languages, and changing what such a model does usually means retraining it from scratch. Our earlier work showed that [fully connected](/news/2020/11/11/decomposing-a-deep-neural-network-into-modules/) and [convolutional](/news/2022/05/24/decomposing-convolutional-neural-networks-into-modules/) networks can be decomposed into modules; recurrent networks, with their internal state and feedback, are harder.

In this paper (ICSE 2023), Sayem Mohammad Imtiaz, Fraol Batole, Astha Singh, Rangeet Pan, Breno Dantas Cruz, and Hridesh Rajan decompose a trained recurrent neural network into modules that can be reused and replaced. With it, a model trained to translate between some languages can be extended to a new one by adding a module rather than retraining, and faulty behavior can be corrected by replacing the part responsible for it.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); for the wider story see [our modular deep learning overview](/news/2026/04/15/modular-deep-learning/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-23b/).
