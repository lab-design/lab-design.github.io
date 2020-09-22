---
key: ESEC-FSE-20a
permalink: /papers/ESEC-FSE-20a/
short_name: ESEC-FSE '20
title: Do the Machine Learning Models on a Crowd Sourced Platform Exhibit Bias? An Empirical Study on Model Fairness
bib: |
  @inproceedings{biswas20machine,
    author = {Sumon Biswas and Hridesh Rajan},
    title = {Do the Machine Learning Models on a Crowd Sourced Platform Exhibit Bias? An Empirical Study on Model Fairness},
    booktitle = {ESEC/FSE'2020: The 28th ACM Joint European Software Engineering Conference and Symposium on the Foundations of Software Engineering},
    location = {Sacramento, California, United States},
    month = {November 8-November 13, 2020},
    year = {2020},
    entrysubtype = {conference},
    abstract = {
      Machine learning models are increasingly being used in important
      decision-making software such as approving bank loans, recommending
      criminal sentencing, hiring employees, and so on. It is important to
      ensure the fairness of these models so that no discrimination is made
      based on protected attribute (e.g., race, sex, age) while decision making.
      Algorithms have been developed to measure unfairness and mitigate them to
      a certain extent. In this paper, we have focused on the empirical
      evaluation of fairness and mitigations on real-world machine learning
      models. We have created a benchmark of 40 top-rated models from Kaggle
      used for 5 different tasks, and then using a comprehensive set of fairness
      metrics, evaluated their fairness. Then, we have applied 7 mitigation
      techniques on these models and analyzed the fairness, mitigation results,
      and impacts on performance. We have found that some model optimization
      techniques result in inducing unfairness in the models. On the other hand,
      although there are some fairness control mechanisms in machine learning
      libraries, they are not documented. The mitigation algorithm also exhibit
      common patterns such as mitigation in the post-processing is often costly
      (in terms of performance) and mitigation in the pre-processing stage is
      preferred in most cases. We have also presented different trade-off
      choices of fairness mitigation decisions. Our study suggests future
      research directions to reduce the gap between theoretical fairness aware
      algorithms and the software engineering methods to leverage them in practice.
    }
  }
kind: conference
download_link: ml-fairness.pdf
publication_year: 2020
tags:
  - boa
---
