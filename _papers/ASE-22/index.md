---
key: ASE-22
permalink: /papers/ASE-22/
short_name: ASE '22
title: "A Hybrid Approach for Inference Between Behavioral Exception API Documentation and Implementations, and Its Applications"
bib: |
  @inproceedings{NguyenETAL2022,
    author = {Hoan Anh Nguyen and Hung Dang Phan and Khairunnesa, Samantha Syeda and Son Nguyen and Aashish Yadavally and Shaohua Wang and Hridesh Rajan and Tien N. Nguyen},
    title = {A Hybrid Approach for Inference Between Behavioral Exception API Documentation and Implementations, and Its Applications},
    booktitle = {37th IEEE/ACM International Conference on Automated Software Engineering, ASE, Rochester, USA},
    pages = {2:1--2:13},
    year = {2022},
    publisher = {{ACM}},
    doi = {10.1145/3551349.3560434},
    abstract = {Automatically producing behavioral exception (BE) API documentation helps developers correctly use the libraries. The state-of-the-art approaches are either rule-based, which is too restrictive in its applicability, or deep learning (DL)-based, which requires large training dataset. To address that, we propose StatGen, a novel hybrid approach between statistical machine translation (SMT) and tree-structured translation to generate the BE documentation for any code and vice versa. We consider the documentation and source code of an API method as the two abstraction levels of the same intent. StatGen is specifically designed for this two-way inference, and takes advantage of their structures for higher accuracy. We conducted several experiments to evaluate StatGen. We show that it achieves high precision (75% and 75%), and recall (81% and 84%), in inferring BE documentation from source code and vice versa. StatGen achieves higher precision, recall, and BLEU score than the state-of-the-art, DL-based baseline models. We show StatGen's usefulness in two applications. First, we use it to generate the BE documentation for Apache APIs that lack of documentation by learning from the documentation of the equivalent APIs in JDK. 44% of the generated documentation were rated as useful and 42% as somewhat useful. In the second application, we use StatGen to detect the inconsistency between the BE documentation and corresponding implementations of several JDK8 packages.},
  }
kind: conference
download_link: https://doi.org/10.1145/3551349.3560434
publication_year: 2022
tags:
  - specifications
---
