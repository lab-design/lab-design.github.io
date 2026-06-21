---
title: "Making machine learning fair, from the data to the guarantee"
---

As machine learning moves into decisions about loans, hiring, and more, whether a model treats people fairly has become a software-engineering problem and not only an ethical one. A team needs to know where unfairness comes from, how to measure it, how to reduce it without wrecking accuracy, and in the highest-stakes cases how to guarantee it. Over the past several years our lab has worked on each of these, and this page collects that work.

Unfairness often enters before the model is even trained. [Fair Preprocessing](/news/2021/08/23/fair-preprocessing-machine-learning-pipelines/) (ESEC/FSE 2021) traces fairness through the data-preparation stages of a pipeline and pins down which transformation introduced a problem. Measuring bias in practice matters too: [a study of models on a crowd-sourced platform](/news/2020/11/10/model-fairness-empirical-study/) (ESEC/FSE 2020) showed how often real models discriminate and what mitigation actually helps, and [fairness in ensemble machine learning](/news/2023/05/16/fairness-in-ensemble-machine-learning/) (ICSE 2023) extended the question from a single classifier to the combined systems teams really deploy.

Reducing bias should not mean giving up accuracy. [Fix Fairness, Don't Ruin Accuracy](/news/2023/12/05/fix-fairness-without-ruining-accuracy/) (ESEC/FSE 2023) uses automated machine learning to repair fairness while preserving performance. And for cases where testing is not enough, [Fairify](/news/2023/05/14/fairify-verifying-fairness-neural-networks/) (ICSE 2023) verifies individual fairness in a neural network, turning fairness from something a team checks for into something it can prove.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai). For the complete record, see our [list of papers](https://lab-design.github.io/papers/).
