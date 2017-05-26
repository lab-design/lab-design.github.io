---
key: FoSER-10
permalink: /papers/FoSER-10/
short_name: FoSER '10
title: Building Scalable Software Systems in the Multicore Era
bib: |
  @inproceedings{rajan2010building,
    author = {Hridesh Rajan},
    title = {Building Scalable Software Systems in the Multicore Era},
    booktitle = {2010 FSE/SDP Workshop on the Future of Software Engineering},
    location = {Santa Fe, NM},
    month = {November},
    year = {2010},
    entrysubtype = {workshop},
    abstract = {
      Software systems must face two challenges today: growing complexity and
      increasing parallelism in the underlying computational models. The problem of
      increased complexity is often solved by dividing systems into modules in a way
      that permits analysis of these modules in isolation.

      The problem of lack of concurrency is often tackled by dividing system
      execution into tasks that permits execution of these tasks in isolation. The
      key challenge in software design is to manage the explicit and implicit
      dependence between modules that decreases modularity. The key challenge for
      concurrency is to manage the explicit and implicit dependence between tasks
      that decreases parallelism. Even though these challenges appear to be
      strikingly similar, current software design practices and languages do not
      take advantage of this similarity. The net effect is that the modularity and
      concurrency goals are often tackled mutually exclusively. Making progress
      towards one goal does not naturally contribute towards the other.

      My position is that for programmers that are not formally and rigorously
      trained in the concurrency discipline the safest and most productive way to
      get scalability in their software is by improving modularity of their software
      using programming language features and design practices that reconcile
      modularity and concurrency goals. I briefly discuss preliminary efforts of my
      group, but we have only touched the tip of the iceberg.
    }
  }
kind: workshop
download_link: Rajan-FoSER10.pdf
publication_year: 2010
tags:
  - panini
---
