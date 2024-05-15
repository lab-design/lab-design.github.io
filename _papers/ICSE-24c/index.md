---
key: ICSE-24c
permalink: /papers/ICSE-24c/
short_name: ICSE '24
title: "Data-Driven Evidence-Based Syntactic Sugar Design"
bib: |
  @inproceedings{obrien2024sugar,
    author = {David OBrien and Robert Dyer and Tien Nguyen and Hridesh Rajan},
    title = {Data-Driven Evidence-Based Syntactic Sugar Design},
    booktitle = {ICSE'2024: The 46th International Conference on Software Engineering},
    location = {Lisbon, Portugal},
    month = {April 14-April 20},
    year = {2024},
    entrysubtype = {conference},
    abstract = {
      Programming languages are essential tools for developers, and their evolution plays a crucial role in supporting the activities of developers. One instance of programming language evolution is the introduction of syntactic sugars, which are additional syntax elements that provide alternative, more readable code constructs. However, the process of designing and evolving a programming language has traditionally been guided by anecdotal experiences and intuition. Recent advances in tools and methodologies for mining open-source repositories have enabled developers to make data-driven software engineering decisions. In light of this, this paper proposes an approach for motivating data-driven programming evolution by applying frequent subgraph mining techniques to a large dataset of 166,827,154 open-source Java methods. The dataset is mined by generalizing Java control-flow graphs to capture broad programming language usages and instances of duplication. Frequent subgraphs are then extracted to identify potentially impactful opportunities for new syntactic sugars. Our diverse results demonstrate the benefits of the proposed technique by identifying new syntactic sugars involving a variety of programming constructs that could be implemented in Java, thus simplifying frequent code idioms. This approach can potentially provide valuable insights for Java language designers, and serve as a proof-of-concept for data-driven programming language design and evolution.
    },
    doi = {10.1145/3597503.3639580}
  }
kind: conference
download_link: 2024010833.pdf
publication_year: 2024
tags:
  - boa
---
