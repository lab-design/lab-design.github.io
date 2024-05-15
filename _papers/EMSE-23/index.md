---
key: EMSE-23
permalink: /papers/EMSE-23/
short_name: EMSE '23
title: "What Kinds of Contracts Do ML APIs Need?"
bib: |
  @article{Khairunnesa2023,
    author = {Samantha Syeda Khairunnesa and Shibbir Ahmed and Sayem Mohammad Imtiaz and Hridesh Rajan and Gary T. Leavens},
    title = {What Kinds of Contracts Do ML APIs Need?},
    journal = {Empirical Software Engineering},
    volume = {1},
    number = {1},
    article = {1},
    month = {March},
    year = {2023},
    publisher = {Springer},
    address = {Hanover, Pennsylvania, USA},
    abstract = {Recent work has shown that Machine Learning (ML) programs are error-prone and called for contracts for ML code. Contracts, as in the design by contract methodology, help document APIs and aid API users in writing correct code. The question is: what kinds of contracts would provide the most help to API users? We are especially interested in what kinds of contracts help API users catch errors at earlier stages in the ML pipeline. We describe an empirical study of posts on Stack Overflow of the four most often-discussed ML libraries: TensorFlow , Scikit-learn, Keras, and PyTorch. For these libraries, our study extracted 413 informal (English) API specifications. We used these specifications to understand the following questions. What are the root causes and effects behind ML contract violations? Are there common patterns of ML contract violations? When does understanding ML contracts require an advanced level of ML software expertise? Could checking contracts at the API level help detect the violations in early ML pipeline stages? Our key findings are that the most commonly needed contracts for ML APIs are either checking constraints on single arguments of an API or on the order of API calls. The software engineering community could employ existing contract mining approaches to mine these contracts to promote an increased understanding of ML APIs. We also noted a need to combine behavioral and temporal contract mining approaches. We report on categories of required ML contracts, which may help designers of contract languages.},
    doi={10.1145/nnnnnn},
  }
kind: journal
download_link: emseMLContract.pdf
publication_year: 2023
tags:
  - mdl
---
