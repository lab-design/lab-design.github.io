---
key: TR-10-28b
permalink: /papers/TR-10-28b/
short_name: TR-10-28b
title: "Panini: Reconciling Concurrency and Modularity in Design"
bib: |
  @techreport{long2010panini,
    author = {Yuheng Long and Sean Mooney and Tyler Sondag and Hridesh Rajan},
    title = {Panini: Reconciling Concurrency and Modularity in Design},
    institution = {Iowa State University, Dept. of Computer Science},
    year = {2010},
    number = {10-28b},
    month = {March},
    abstract = {
      Writing correct and efficient concurrent programs still remains a challenge.
      Explicit concurrency is difficult, error prone, and creates code which is hard
      to maintain and debug. This type of concurrency also treats modular program
      design and concurrency as separate goals, where modularity often suffers. To
      solve these problems, we are designing a new language that we call panini. In
      this paper, we focus on panini's asynchronous, typed events which reconcile
      the modularity goal promoted by the implicit invocation design style with the
      concurrency goal of exposing potential concurrency between the execution of
      subjects and observers. Since modularity is improved and concurrency is
      implicit in panini, programs are easy to reason about and maintain.
      Furthermore, races and deadlocks are avoided entirely yielding programs with a
      guaranteed sequential semantics. To evaluate our language design and
      implementation we show several examples of its usage as well as an empirical
      study of program performance. We found that not only is developing and
      understanding panini programs significantly easier compared to standard
      concurrent object-oriented programs, but performance of panini programs is
      comparable to the equivalent programs written using Java's fork-join
      framework.
    }
  }
kind: technical_report
download_link: http://lib.dr.iastate.edu/cs_techreports/316/
extra_download_links:
  - { link: TR-10-28b.pdf, title: Direct PDF }
publication_year: 2010
tags:
  - panini
---

This technical report is superceded by the following research paper:
[GPCE '10](/papers/GPCE-10)
