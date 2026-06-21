---
title: "What actually goes wrong in deep learning code? Our ESEC/FSE 2019 study catalogs the bugs."
---

Before you can locate or repair a bug in a deep learning system, it helps to know what kinds of bugs occur, where they come from, and what they break. When this study began, the community lacked that picture.

In this paper (ESEC/FSE 2019), Md Johirul Islam, Giang Nguyen, Rangeet Pan, and Hridesh Rajan carried out a comprehensive study of deep learning bug characteristics. Drawing on real bug reports from Stack Overflow and GitHub across widely used deep learning libraries, they categorized the types of bugs, their root causes, and their effects, and surfaced common antipatterns that lead to them. The result is a map of how deep learning software actually fails.

That map shaped much of our later work on dependable AI, which moved from understanding bugs to locating and repairing them.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); for the wider story see [our overview of debugging deep learning](/news/2025/10/15/why-deep-learning-needs-debugging-tools/). The full paper is available [here](https://lab-design.github.io/papers/ESEC-FSE-19/).
