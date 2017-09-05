---
key: TR-15-06
permalink: /papers/TR-15-06/
short_name: TR-15-06
title: "Staged Tuning: A Hybrid (Compile/Install-time) Technique for Improving Utilization of Performance-asymmetric Multicores"
bib:  |
  @techreport{sondag2015staged,
    title = {Staged Tuning: A Hybrid (Compile/Install-time) Technique for Improving Utilization of Performance-asymmetric Multicores},
    author = {Sondag, Tyler and Rajan, Hridesh},
    year = {2015},
    month = {June},
    institution = {Iowa State University, Dept. of Computer Science},
    number = {15-06},
    abstract = {
      Emerging trends towards performance-asymmetric multicore processors (AMPs) are
      posing new challenges, because for effective utilization of AMPs, code sections
      of a program must be assigned to cores such that the resource needs of the code
      sections closely match the resources available at the assigned core. Computing
      this assignment can be difficult especially in the presence of unknown or many
      target AMPs. We observe that finding a mapping between the code segment
      characteristics and the core characteristics is inexpensive enough, compared to
      finding a mapping between the code segments and the cores, that it can be
      deferred until installation-time for more precise decision. We present staged
      tuning which combines extensive compile time analysis with intelligent binary
      customization at install-time. Staged tuning is like staged compilation, just
      for core assignment. Our evaluation shows that staged tuning is effective in
      improving the utilization of AMPs. We see a 23% speedup over untuned workloads.
    }
  }
kind: technical_report
download_link: http://lib.dr.iastate.edu/cs_techreports/372/
publication_year: 2015
tags:
  - ptolemy
---
