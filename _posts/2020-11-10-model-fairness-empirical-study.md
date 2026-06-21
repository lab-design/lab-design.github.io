---
title: "Do machine-learning models quietly discriminate, and how would you know? Our ESEC/FSE 2020 study measures it."
---

Machine-learning models increasingly make or shape consequential decisions, from approving a loan to screening a job applicant. When they do, it matters whether the model treats people differently based on a protected attribute such as race, sex, or age, and that kind of bias is easy to miss because it sits in learned parameters rather than in anything written down.

In this paper (ESEC/FSE 2020), Sumon Biswas and Hridesh Rajan carried out an empirical study of fairness in real models built on a popular crowd-sourced platform. By measuring bias across many models and examining how common mitigation techniques change it, the study gives a grounded picture of how often unfairness appears in practice and what actually helps.

This work is part of our research on fairness in machine learning, within [Modular and Dependable AI](/research/#modular-and-dependable-ai); for the wider story see [our fairness overview](/news/2026/02/11/fairness-in-machine-learning/). The full paper is available [here](https://lab-design.github.io/papers/ESEC-FSE-20a/).
