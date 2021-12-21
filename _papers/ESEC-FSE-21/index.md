---
key: ESEC-FSE-21
permalink: /papers/ESEC-FSE-21/
short_name: ESEC-FSE '21
title: "Fair Preprocessing: Towards Understanding Compositional Fairness of Data Transformers in Machine Learning Pipeline"
bib: |
  @inproceedings{biswas21fair,
    author = {Sumon Biswas and Hridesh Rajan},
    title = {Fair Preprocessing: Towards Understanding Compositional Fairness of Data Transformers in Machine Learning Pipeline},
    booktitle = {ESEC/FSE'2021: The 29th ACM Joint European Software Engineering Conference and Symposium on the Foundations of Software Engineering},
    location = {Athens, Greece},
    month = {August 23-August 28, 2021},
    year = {2021},
    entrysubtype = {conference},
    abstract = {
      In recent years, many incidents have been reported where machine learning
      models exhibited discrimination among people based on race, sex, age, etc.
      Research has been conducted to measure and mitigate unfairness in machine
      learning models. For a machine learning task, it is a common practice to
      build a pipeline that includes an ordered set of data preprocessing stages
      followed by a classifier. However, most of the research on fairness has
      considered a single classifier based prediction task. What are the fairness
      impacts of the preprocessing stages in machine learning pipeline? Furthermore,
      studies showed that often the root cause of unfairness is ingrained in the
      data itself, rather than the model. But no research has been conducted to
      measure the unfairness caused by a specific transformation made in the data
      preprocessing stage. In this paper, we introduced the causal method of fairness
      to reason about the fairness impact of data preprocessing stages in ML pipeline.
      We leveraged existing metrics to define the fairness measures of the stages.
      Then we conducted a detailed fairness evaluation of the preprocessing stages
      in 37 pipelines collected from three different sources. Our results show
      that certain data transformers are causing the model to exhibit unfairness.
      We identified a number of fairness patterns in several categories of data
      transformers. Finally, we showed how the local fairness of a preprocessing
      stage composes in the global fairness of the pipeline. We used the fairness
      composition to choose appropriate downstream transformer that mitigates
      unfairness in the machine learning pipeline.
    }
  }
kind: conference
download_link: fair-preprocessing-fse21.pdf
publication_year: 2021
tags:
  - boa
---
