---
title: "What kinds of shortcuts pile up in machine-learning code? Our ESEC/FSE 2022 paper sorts them out."
---

Technical debt is the term for the short-term shortcuts that make software easier to ship now and harder to maintain later. Developers often admit these in comments, leaving a trail of self-admitted technical debt. Machine-learning software, with its mix of data, models, and glue code, has its own kinds of debt that had not been mapped.

In this paper (ESEC/FSE 2022), David OBrien, Sumon Biswas, Sayem Mohammad Imtiaz, Rabe Abdalkareem, Emad Shihab, and Hridesh Rajan study self-admitted technical debt in machine-learning software and organize what they find into a set of distinct categories spanning the ML pipeline. The result shows where debt concentrates in ML systems, which is the first step toward managing it.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); it leads into our study of [prompt engineering and TODO comments with GitHub Copilot](/news/2024/04/18/prompt-engineering-todo-comments-and-copilot/). The full paper is available [here](https://lab-design.github.io/papers/ESEC-FSE-22/).
