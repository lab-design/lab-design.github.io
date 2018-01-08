---
key: ICSE-18a
permalink: /papers/ICSE-18a/
short_name: ICSE '18
title: Collective Program Analysis
bib: |
  @inproceedings{collective2018,
    author = {Ganesha Upadhyaya and Hridesh Rajan},
    title = {Collective Program Analysis},
    booktitle = {ICSE'18: The 40th International Conference on Software Engineering},
    location = {Gothenberg, Sweden},
    month = {May 27-June 3, 2018},
    year = {2018},
    entrysubtype = {conference},
    abstract = {
      Popularity of data-driven software engineering has led to an increasing demand
      on the infrastructures to support efficient execution of tasks that require
      deeper source code analysis. While task optimization and parallelization are the
      adopted solutions, other research directions are less explored.
      We present collective program analysis (CPA), a technique for
      scaling large scale source code analysis by leveraging analysis specific similarity.
      Analysis specific similarity is about, whether two or more programs can be
      considered similar for a given analysis.
      The key idea of collective program analysis is to cluster programs based on
      analysis specific similarity, such that running the analysis on one candidate
      in each cluster is sufficient to produce the result for others.
      For determining the analysis specific similarity and for clustering
      analysis-equivalent programs, we use a sparse representation and a
      canonical labeling scheme.
      A sparse representation contains only the parts that are relevant for the
      analysis and the canonical labeling helps with finding isomorphic sparse representations.
      In a nutshell, two or more programs with same sparse representation must behave
      similarly for the given analysis.
      Our evaluation shows that for a variety of source code analysis tasks when run
      on a large dataset of programs, our technique is able to achieve substantial
      reduction in the analysis times; on average 69% when compared to baseline and
      on average 36% when compared to a prior technique.
      We also show that there exists a large amount of analysis-equivalent programs in
      large datasets for variety of analysis.
    }
  }
kind: conference
download_link: CollectiveProgramAnalysis.pdf
publication_year: 2018
tags:
  - boa
---
