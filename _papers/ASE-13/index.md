---
key: ASE-13
permalink: /papers/ASE-13/
short_name: ASE '13
title: A Study of Repetitiveness of Code Changes in Software Evolution
bib: |
  @inproceedings{nguyen2013study,
    author = {Hoan Anh Nguyen and Anh Tuan Nguyen and Tung Thanh Nguyen and Tien N. Nguyen and Hridesh Rajan},
    title = {A Study of Repetitiveness of Code Changes in Software Evolution},
    booktitle = {Proceedings of the 28th International Conference on Automated Software Engineering},
    series = {ASE},
    year = {2013},
    location = {Silicon Valley, CA},
    entrysubtype = {conference},
    abstract = {
      In this paper, we present a study of repetitiveness of code changes in
      software evolution. Repetitiveness is defined as the ratio of repeated changes
      over total changes. Focusing on fine-grained code changes, we model a change
      as a pair of old and new AST sub-trees within a method. A change is considered
      repeated within or cross-project if it matches another change having occurred
      in the history of the project or another project, respectively. We report the
      following important findings. First, repetitiveness of changes could be as
      high as 70-100% at small sizes and decreases exponentially as size increases.
      Second, repetitiveness is higher and more stable in cross-project setting than
      in within-project one. Third, fixing changes repeat similarly to general
      changes. Importantly, learning code changes and recommending them in software
      evolution is beneficial with accuracy for top-1 recommendation of over 30% and
      top-3 of nearly 35%. Repeated fixing changes could also be useful for
      automatic program repair.
    }
  }
kind: conference
download_link: ase13.pdf
publication_year: 2013
tags:
  - boa
---
