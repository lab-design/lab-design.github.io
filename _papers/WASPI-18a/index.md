---
key: WASPI-18a
permalink: /papers/WASPI-18a/
short_name: WASPI '18
title: "Towards Combining Usage Mining and Implementation Analysis to Infer API Preconditions"
bib: |
  @inproceedings{NguyenNguyenRajanDyer2018,
    author = {Hoan Anh Nguyen and Tien N. Nguyen and Hridesh Rajan and Robert Dyer},
    title = {Towards Combining Usage Mining and Implementation Analysis to Infer API Preconditions},
    booktitle = {Proceedings of the 1st ACM SIGSOFT International Workshop on Automated Specification Inference, WASPI@ESEC/SIGSOFT FSE, Lake Buena Vista, USA},
    pages = {15--16},
    year = {2018},
    publisher = {{ACM}},
    editor = {Robert Dyer and Vasant G. Honavar and Gary T. Leavens and Hoan Anh Nguyen and Tien N. Nguyen and Hridesh Rajan},
    doi = {10.1145/3278177.3278182},
    abstract = {The preconditions of an API method are constraints on the states of its receiver object and arguments intended by the library designer(s) to correctly invoke it in the client code. There have been two main kinds of approaches for automatically inferring API preconditions. The first kind of approaches mines the frequently checked conditions guarding the API usages in the client code and generalize them into preconditions. The second kind of approaches analyzes the implementation of the API to compute preconditions. In this paper, we report an observation that the usage-based approach often produces preconditions stronger than those intended while the implementation-based produces weaker ones. Our finding calls for a new direction of integrating those kinds of precondition inference approaches and refinement solutions to reduce the differences between sets of inferred preconditions.},
  }
kind: workshop
download_link: https://doi.org/10.1145/3278177.3278182
publication_year: 2018
tags:
  - specifications
---
