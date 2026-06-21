---
title: "How do you test the data and the model in a deep learning system separately? Our ICSE 2025 paper mocks the gap."
---

In ordinary software, components can be tested in isolation, often by mocking the parts they depend on. Deep learning resists this, because the data and the model are tightly coupled: the model is defined by the data it was trained on, so testing one without the other is difficult, and software-engineering research had not really addressed it.

In this paper (ICSE 2025), Ruchira Manke, Mohammad Wardat, Foutse Khomh, and Hridesh Rajan introduce mock deep testing, which lets the data side and the model side of a deep learning system be developed and tested separately. By standing in for one component while the other is exercised, the approach brings the long-standing discipline of isolated testing to deep learning.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); for related work see our overview of [debugging deep learning](/news/2025/10/15/why-deep-learning-needs-debugging-tools/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-25c/).
