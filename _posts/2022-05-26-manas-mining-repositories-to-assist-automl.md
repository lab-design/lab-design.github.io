---
title: "Where should an automated model search begin? Our ICSE 2022 paper mines a head start."
---

Choosing a good neural network for a task is hard, and AutoML tools that search for an architecture can take a long time because they often start from a generic point and explore outward.

In this paper (ICSE 2022), Giang Nguyen, Johir Islam, Rangeet Pan, and Hridesh Rajan present Manas, which gives that search a better starting point by mining models from existing software repositories. Instead of beginning from scratch, the search begins near a model that already worked for a similar problem, which reaches a good architecture faster.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); see our related study of [data-science pipelines](/news/2022/05/23/art-and-practice-of-data-science-pipelines/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-22d/).
