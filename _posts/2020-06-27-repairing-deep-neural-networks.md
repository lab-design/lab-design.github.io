---
title: "How do developers actually fix a broken neural network? We studied it for ICSE 2020."
---

When a deep learning model misbehaves, the fix is rarely obvious, and until recently there was little systematic knowledge of how developers repair these models in practice. Building an automated repair tool depends on that knowledge: which problems occur, which fixes work, and which are common enough to be worth automating.

In this paper (ICSE 2020), Md Johirul Islam, Rangeet Pan, Giang Nguyen, and Hridesh Rajan studied how developers repair deep neural networks by examining more than 400 real fixes posted on Stack Overflow. We organized the fixes into repair patterns, described the challenge each one poses for automation, and identified which patterns would help developers most if a tool could apply them.

The study gives automated repair tools a map of the territory, a catalog of the fixes that matter and a sense of where automation would pay off first. It is part of our lab's work on making deep learning dependable.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai). The full paper is available [here](https://lab-design.github.io/papers/ICSE-20a/).
