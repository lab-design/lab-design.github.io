---
key: TOSEM-24
permalink: /papers/TOSEM-24/
short_name: TOSEM '24
title: "Leveraging Data Characteristics for Bug Localization in Deep Learning Programs"
bib: |
  @article{manke2024buglocalization,
    author = {Manke, Ruchira and Wardat, Mohammad and Khomh, Foutse and Rajan, Hridesh},
    title = {Leveraging Data Characteristics for Bug Localization in Deep Learning Programs},
    journal = {ACM Trans. Softw. Eng. Methodol.},
    month = dec,
    year = {2024},
    issn = {1049-331X},
    url = {https://doi.org/10.1145/3708473},
    doi = {10.1145/3708473},
    acmid = {2803171},
    publisher = {ACM},
    address = {New York, NY, USA},
    keywords = {deep learning bugs, bug localization, debugging, program analysis},
    abstract = {
      Deep Learning (DL) is a class of machine learning algorithms that are used in a wide variety of applications. Like any software system, DL programs can have bugs. To support bug localization in DL programs, several tools have been proposed in the past. As most of the bugs that occur due to improper model structure known as structural bugs lead to inadequate performance during training, it is challenging for developers to identify the root cause and address these bugs. To support bug detection and localization in DL programs, in this paper, we propose Theia, which detects and localizes structural bugs in DL programs. Unlike the previous works, Theia considers the training dataset characteristics to automatically detect bugs in DL programs developed using two deep learning libraries, Keras and PyTorch. Since training the DL models is a time-consuming process, Theia detects these bugs at the beginning of the training process and alerts the developer with informative messages containing the bug’s location and actionable fixes which will help them to improve the structure of the model. We evaluated Theia on a benchmark of 40 real-world buggy DL programs obtained from Stack Overflow. Our results show that Theia successfully localizes 57/75 structural bugs in 40 buggy programs, whereas NeuraLint, a state-of-the-art approach capable of localizing structural bugs before training localizes 17/75 bugs.
    }
  }
kind: journal
download_link: https://dl.acm.org/doi/abs/10.1145/3708473
publication_year: 2024
tags:
  - boa
---
