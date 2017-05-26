---
key: GPCE-10
permalink: /papers/GPCE-10/
short_name: GPCE '13
title: Implicit Invocation Meets Safe, Implicit Concurrency
bib: |
  @inproceedings{long2010implicit-b,
    author = {Yuheng Long and Sean L. Mooney and Tyler Sondag and Hridesh Rajan},
    title = {Implicit Invocation Meets Safe, Implicit Concurrency},
    booktitle = {GPCE '10: Ninth International Conference on Generative Programming and Component Engineering},
    location = {Eindhoven, Netherlands},
    month = {October},
    year = {2010},
    entrysubtype = {conference},
    abstract = {
      Writing correct and efficient concurrent programs still remains a challenge.
      Explicit concurrency is difficult, error prone, and creates code which is hard
      to maintain and debug. This type of concurrency also treats modular program
      design and concurrency as separate goals, where modularity often suffers. To
      solve these problems, we are designing a new language that we call Panini. In
      this paper, we focus on Panini's asynchronous, typed events which reconcile
      the modularity goal promoted by the implicit invocation design style with the
      concurrency goal of exposing potential concurrency between the execution of
      subjects and observers. Since modularity is improved and concurrency is
      implicit in Panini, programs are easier to reason about and maintain.
      Furthermore, races and deadlocks are avoided entirely, yielding programs with
      a guaranteed sequential semantics. To evaluate our language design and
      implementation we show several examples of its usage as well as an empirical
      study of program performance. We found that not only is developing and
      understanding Panini programs significantly easier compared to standard
      concurrent object-oriented programs, but performance of Panini programs is
      comparable to their equivalent hand-tuned versions written using Java's
      fork-join framework.
    }
  }
kind: conference
download_link: main.pdf
publication_year: 2010
tags:
  - panini
---

This paper supercedes a previous ISU technical report:
[Technical Report 10-28b](/papers/TR-10-28b/)
