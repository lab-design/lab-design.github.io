---
key: MODULARITY-15
permalink: /papers/MODULARITY-15/
short_name: Modularity '15
title: "Panini: A Concurrent Programming Model for Solving Pervasive and Oblivious Interference"
bib: |
  @inproceedings{bagherzadeh2015panini,
    author = {Mehdi Bagherzadeh and Hridesh Rajan},
    title = {Panini: A Concurrent Programming Model for Solving Pervasive and Oblivious Interference},
    booktitle = {Modularity'15: 14th International Conference on Modularity},
    location = {Fort Collins, Colarado, USA},
    month = {March},
    year = {2015},
    entrysubtype = {conference},
    abstract = {
      Modular reasoning about concurrent programs is complicated by the possibility
      of interferences happening between any two instructions of a task (pervasive
      interference), and these interferences not giving out any information about
      the behaviors of potentially interfering concurrent tasks (oblivious
      interference). Reasoning about a concurrent program would be easier if a
      programmer, modularly and statically (1) knows precisely the program points at
      which interferences may happen (sparse interference), and (2) has some
      insights into behaviors of potentially interfering tasks at these points
      (cognizant interference). In this work we present Panini, a core concurrent
      calculus which guarantees sparse interference, by controlling sharing among
      concurrent tasks, and cognizant interference, by controlling dynamic name
      bindings and accessibility of states of tasks. Panini promotes
      capsule-oriented programming whose concurrently running capsules own their
      states, communicate by asynchronous invocations of their procedures and
      dynamically transfer ownership. Panini limits sharing among two capsules to
      other capsules and futures, limits accessibility of a capsule states to only
      through its procedures and dispatches a procedure invocation on the static
      type of its receiver capsule. We formalize Panini, present its semantics and
      illustrate how its interference model, using behavioral contracts, enables
      Hoare-style modular reasoning about concurrent programs with interference.
    }
  }
kind: conference
download_link: panini-reasoning.pdf
publication_year: 2015
tags:
  - panini
---
