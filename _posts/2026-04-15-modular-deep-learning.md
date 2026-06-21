---
title: "What if a neural network were built from parts you could reuse and replace?"
---

Software engineering learned long ago that large systems are easier to build, understand, and maintain when they are made of modules: parts with clear roles that can be reused, replaced, and reasoned about on their own. A trained neural network has none of that. It is one dense block of weights, and changing any piece of its behavior usually means retraining the whole thing on new data. Over the past several years our lab has asked what it would take to bring modularity to deep learning, and this page collects that work.

The first result was that decomposition is possible at all. [On Decomposing a Deep Neural Network into Modules](/news/2020/11/11/decomposing-a-deep-neural-network-into-modules/) (ESEC/FSE 2020), which received an ACM SIGSOFT Distinguished Paper Award, splits a trained network for a multi-class problem into one module per class, and shows those modules can be reused and swapped without retraining while matching the original's accuracy. [Decomposing Convolutional Neural Networks into Modules](/news/2022/05/24/decomposing-convolutional-neural-networks-into-modules/) (ICSE 2022) carried the idea to the convolutional networks used in vision, and [Decomposing a Recurrent Neural Network into Modules](/news/2023/05/17/decomposing-a-recurrent-neural-network-into-modules/) (ICSE 2023) extended it to the recurrent networks used for language, where a translation model can gain a new language by adding a module instead of retraining.

Modularity pays off in two ways that matter for dependable AI. It lowers the cost and energy of building and updating models, because parts can be reused rather than retrained, and it makes repair possible, because a faulty behavior can be traced to a module and that module replaced. This direction is supported by our NSF project on [More Modular Deep Learning](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2223812).

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai). For the complete record, see our [list of papers](https://lab-design.github.io/papers/).
