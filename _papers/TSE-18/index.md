---
key: TSE-18
permalink: /papers/TSE-18/
short_name: TSE '18
title: On Accelerating Source Code Analysis At Massive Scale
bib: |
  @article{upadhyaya2018acceleration,
    author = {Ganesha Upadhyaya and Hridesh Rajan},
    title = {On Accelerating Source Code Analysis At Massive Scale},
    journal = {IEEE Transactions on Software Engineering},
    volume = {44},
    number = {7},
    pages = {669-688},
    month = {July},
    year = {2018},
    publisher = {IEEE},
    address = {New York, NY, USA},
    abstract = {
      Encouraged by the success of data-driven software engineering (SE) techniques that have found numerous applications e.g. in defect prediction, specification inference, the demand for mining and analyzing source code repositories at scale has significantly increased. However, analyzing source code at scale remains expensive to the extent that data-driven solutions to certain SE problems are beyond our reach today. Extant techniques have focused on leveraging distributed computing to solve this problem, but with a concomitant increase in computational resource needs. This work proposes a technique that reduces the amount of computation performed by the ultra-large-scale source code mining task, especially those that make use of control and data flow analyses. Our key idea is to analyze the mining task to identify and remove the irrelevant portions of the source code, prior to running the mining task. We show a realization of our insight for mining and analyzing massive collections of control flow graphs of source codes. Our evaluation using 16 classical control-/data-flow analyses that are typical components of mining tasks and 7 Million CFGs shows that our technique can achieve on average a 40% reduction in the task computation time. Our case studies demonstrates the applicability of our technique to massive scale source code mining tasks.
    },
    doi={10.1109/TSE.2018.2828848}, 
    ISSN={0098-5589}, 
  }
kind: journal
download_link: AccelerationTSE18.pdf
publication_year: 2018
tags:
  - boa
---
