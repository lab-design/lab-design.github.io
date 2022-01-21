---
key: PLOS-2007
permalink: /papers/PLOS-2007/
short_name: PLOS '07
title: Predictive Thread-to-Core Assignment on a Heterogeneous Multi-core Processor
bib: |
  @inproceedings{sondag2007predictive,
    author = {Tyler Sondag, Viswanath Krishnamurthy, Hridesh Rajan},
    title = {Predictive Thread-to-Core Assignment on a Heterogeneous Multi-core Processor},
    booktitle = {PLOS '07: ACM SIGOPS 4th Workshop on Programming Languages and Operating Systems},
    location = {Skamania Lodge, Stevenson, Washington, USA},
    month = {October},
    year = {2007},
    entrysubtype = {workshop},
    abstract = {
      As multi-core processors are becoming common, vendors are starting to explore
      trade offs between the die size and the number of cores on a die, leading to
      heterogeneity among cores on a single chip. For efficient utilization of these
      processors, application threads must be assigned to cores such that the
      resource needs of a thread closely matches resource availability at the
      assigned core. Current methods of thread-to-core assignment often require
      application's execution trace to determine it's runtime properties. These
      traces are obtained by running the application on some representative input. A
      problem is that developing these representative input set is time consuming,
      and requires expertise that the user of a general-purpose processor may not
      have. In this position paper, we propose an approach for automatic
      thread-to-core assignment for heterogeneous multi-core processors to address
      this problem. The key insight behind our approach is simple -- if two phases
      of a program are similar, then the data obtained by dynamic monitoring of one
      phase can be used to make scheduling decisions about other similar phases. The
      technical underpinnings of our approach include: a preliminary static
      analysis-based approach for determining similarity among program sections, and
      a thread-to-core assignment algorithm that utilizes the statically generated
      information as well as execution information obtained from monitoring a small
      fraction of the program to make scheduling decisions.
    }
  }
kind: workshop
download_link: plos07.pdf
publication_year: 2007
tags:
  - sapha
---
