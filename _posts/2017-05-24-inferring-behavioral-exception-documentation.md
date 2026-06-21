---
title: "Can a tool write the documentation an API forgot to include? Our ICSE 2017 paper infers it."
---

Good documentation helps developers use a library correctly, but many libraries document their behavior poorly, especially the exceptions a call can throw. Earlier approaches tried to fill the gap with program analysis or by mining how the API is used elsewhere.

In this new-ideas paper (ICSE 2017), Hung Phan, Hoan Anh Nguyen, Tien N. Nguyen, and Hridesh Rajan take a different route. Rather than mining usage, they use statistical learning to relate a library's implementation to its documentation, with the goal of generating the behavioral exception documentation that is missing.

This work is part of [Analyzing Software at Scale, with Boa](/research/#software-at-scale); for the wider story, see [our overview](/news/2025/12/10/analyzing-software-at-scale-with-boa/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-NIER-17b/).
