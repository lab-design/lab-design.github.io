---
title: "Can a contract catch a deep learning bug before it happens? Our ESEC/FSE 2023 paper brings contracts to DL."
---

Deep learning libraries are powerful but easy to misuse, and a call that violates an unstated assumption can produce a model that is silently wrong. Conventional software guards against this with contracts: explicit statements of what a function expects and what it guarantees. Deep learning libraries have largely lacked them.

In this paper (ESEC/FSE 2023), Shibbir Ahmed, Sayem Mohammad Imtiaz, Samantha Syeda Khairunnesa, Breno Dantas Cruz, and Hridesh Rajan bring design by contract to deep learning. Their approach, DL Contract, lets library authors document the properties a model and its API calls must satisfy, and then checks those properties as a program runs, catching misuse during development rather than after a model has been trained on a faulty setup.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai); see our related work on [inferring data preconditions](/news/2024/04/17/inferring-data-preconditions-for-deep-learning/) and our overview of [debugging deep learning](/news/2025/10/15/why-deep-learning-needs-debugging-tools/). The full paper is available [here](https://lab-design.github.io/papers/ESEC-FSE-23a/).
