---
key: IW-MSE-09
permalink: /papers/IW-MSE-09/
short_name: IW-MSE '09
title: Phase-guided Thread-to-core Assignment for Improved Utilization of Performance-Asymmetric Multi-Core Processors
bib: |
  @inproceedings{sondag2009phase,
    author = {Tyler Sondag and Hridesh Rajan},
    title = {Phase-guided Thread-to-core Assignment for Improved Utilization of Performance-Asymmetric Multi-Core Processors},
    booktitle = {IWMSE '09: Proceedings of the 2nd International Workshop on Multicore Software Engineering},
    location = {Vancouver, Canada},
    month = {May},
    year = {2009},
    entrysubtype = {workshop},
    abstract = {
      CPU vendors are starting to explore trade offs between die size, number of
      cores on a die, and power consump- tion leading to performance asymmetry among
      cores on a single chip. For efficient utilization of these performance-
      asymmetric multi-core processors, application threads must be assigned to
      cores such that the resource needs of a thread closely matches resource
      availability at the assigned core. This significantly complicates the task of
      an average pro- grammer. The contribution of this work is a technique for
      automatically determining the mapping between threads and
      performance-asymmetric cores of a processor. Our ap- proach, which we call
      phase-guided thread-to-core assign- ment, builds on a well-known insight that
      programs exhibit phase behavior. We first take code sections and group them
      into clusters such that each section in a cluster is likely to exhibit similar
      runtime characteristics. The key idea is that with this clustering,
      characteristics of a small number of representative sections in a cluster give
      insight into the be- havior of the entire cluster. Thus the exhibited
      characteris- tics of the representative sections on different types of cores
      can be used for automating thread-to-core assignment at a lower runtime cost.
      Variations of our technique show up to an average 150% improvement in
      throughput over the stock Linux scheduler for systems with a constant feed of
      jobs, while maintaining comparable fairness and efficiency.
    }
  }
kind: workshop
download_link: iwmse09.pdf
publication_year: 2009
tags:
  - sapha
---
