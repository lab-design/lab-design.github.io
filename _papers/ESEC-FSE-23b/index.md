---
key: ESEC-FSE-23b
permalink: /papers/ESEC-FSE-23b/
short_name: ESEC-FSE '23
title: "Fix Fairness, Don’t Ruin Accuracy: Performance Aware Fairness Repair using AutoML"
bib: |
  @inproceedings{nguyen23fix,
    author = {Giang Nguyen and Sumon Biswas and Hridesh Rajan},
    title = {Fix Fairness, Don’t Ruin Accuracy: Performance Aware Fairness Repair using AutoML},
    booktitle = {ESEC/FSE'2023: The 31st ACM Joint European Software Engineering Conference and Symposium on the Foundations of Software Engineering},
    location = {San Francisco, California},
    month = {December 03-December 09},
    year = {2023},
    entrysubtype = {conference},
    abstract = {
      Machine learning (ML) is increasingly being used in critical decision making software, but incidents have raised questions about the fairness of ML predictions. To address this issue, new tools and methods are needed to mitigate bias in ML-based software. Previous studies have proposed bias mitigation algorithms that only work in specific situations and often result in a loss of accuracy. Our proposed solution is a novel approach that utilizes automated machine learning (AutoML) techniques to mitigate bias. Our approach includes two key innovations: a novel optimization function and a fairness-aware search space. By improving the default optimization function of AutoML and incorporating fairness objectives, we are able to mitigate bias with little to no loss of accuracy. Additionally, we propose a fairness-aware search space pruning method for AutoML to reduce computational cost and repair time. Our approach, built on the state-of-the-art Auto-Sklearn tool, is designed to reduce bias in real-world scenarios. In order to demonstrate the effective- ness of our approach, we evaluated our approach on four fairness problems and 16 different ML models, and our results show a significant improvement over the baseline and existing bias mitigation techniques. Our approach, Fair-AutoML, successfully repaired 60 out of 64 buggy cases, while existing bias mitigation techniques only repaired up to 44 out of 64 cases.
    }
  }
kind: conference
download_link: fairAutoML.pdf
publication_year: 2023
tags:
  - d4
---
