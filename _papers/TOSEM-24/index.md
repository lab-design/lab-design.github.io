---
key: TOSEM-24
permalink: /papers/TOSEM-24/
short_name: TOSEM '24
title: "Leveraging Data Characteristics for Bug Localization in Deep Learning Programs"
bib: |
  @article{MankeWardatKhomhRajan2024,
    author = {Ruchira Manke and Mohammad Wardat and Foutse Khomh and Hridesh Rajan},
    title = {Leveraging Data Characteristics for Bug Localization in Deep Learning Programs},
    journal = {{ACM} Trans. Softw. Eng. Methodol.},
    volume = {34},
    number = {6},
    pages = {157:1--157:29},
    year = {2025},
    doi = {10.1145/3708473},
    abstract = {
    Deep Learning (DL) is a class of machine learning algorithms that are used in a wide variety of applications. Like any software system, DL programs can have bugs. To support bug localization in DL programs, several tools have been proposed in the past. As most of the bugs that occur due to improper model structure known as structural bugs lead to inadequate performance during training, it is challenging for developers to identify the root cause and address these bugs. To support bug detection and localization in DL programs, in this paper, we propose Theia, which detects and localizes structural bugs in DL programs. Unlike the previous works, Theia considers the training dataset characteristics to automatically detect bugs in DL programs developed using two deep learning libraries, Keras and PyTorch. Since training the DL models is a time-consuming process, Theia detects these bugs at the beginning of the training process and alerts the developer with informative messages containing the bug’s location and actionable fixes which will help them to improve the structure of the model. We evaluated Theia on a benchmark of 40 real-world buggy DL programs obtained from Stack Overflow. Our results show that Theia successfully localizes 57/75 structural bugs in 40 buggy programs, whereas NeuraLint, a state-of-the-art approach capable of localizing structural bugs before training localizes 17/75 bugs.},
  }
kind: journal
download_link: 3708473.pdf
publication_year: 2025
tags:
  - boa
---
