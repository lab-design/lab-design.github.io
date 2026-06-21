---
title: "Can an AI agent find the design problems hiding in a growing codebase? Our ICSE 2025 paper builds one."
---

As a codebase grows, design problems such as poor modularity and creeping complexity tend to accumulate, and they are harder to spot than ordinary bugs because they live in the structure of the code rather than in a single line. Developers usually rely on specialized program-analysis tools to find them.

In this paper (ICSE 2025), Fraol Batole, David OBrien, Tien N. Nguyen, Robert Dyer, and Hridesh Rajan develop an agent-oriented approach that uses large language models to analyze a codebase and localize design issues automatically. The agent pairs the reasoning of a language model with program analysis, pointing developers to the parts of a system where the design has drifted.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); it shares the localization theme of our overview of [debugging deep learning](/news/2025/10/15/why-deep-learning-needs-debugging-tools/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-25b/).
