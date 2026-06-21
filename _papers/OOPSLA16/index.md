---
key: OOPSLA16
permalink: /papers/OOPSLA16/
short_name: OOPSLA '16
title: "First-Class Effect Reflection for Effect-Guided Programming"
authors: Yuheng Long and Yu David Liu and Hridesh Rajan
bib: |
  @inproceedings{LongLiuRajan2016,
    author = {Yuheng Long and Yu David Liu and Hridesh Rajan},
    title = {First-Class Effect Reflection for Effect-Guided Programming},
    booktitle = {Proceedings of the ACM SIGPLAN International Conference on Object-Oriented Programming, Systems, Languages, and Applications, OOPSLA, part of SPLASH, Amsterdam, The Netherlands},
    pages = {820--837},
    year = {2016},
    publisher = {{ACM}},
    editor = {Eelco Visser and Yannis Smaragdakis},
    doi = {10.1145/2983990.2984037},
    abstract = {
    This paper introduces a novel type-and-effect calculus, first-class effects,
    where the computational effect of an expression can be programmatically
    reflected, passed around as values, and analyzed at run time. A broad range of
    designs "hard-coded" in existing effect-guided analyses — from thread
    scheduling, version-consistent software updating, to data zeroing — can be
    naturally supported through the programming abstractions. The core technical
    development is a type system with a number of features, including a hybrid
    type system that integrates static and dynamic effect analyses, a refinement
    type system to verify application-specific effect management properties, a
    double-bounded type system that computes both over-approximation of effects
    and their under-approximation. We introduce and establish a notion of
    soundness called trace consistency, defined in terms of how the effect and
    trace correspond. The property sheds foundational insight on "good"
    first-class effect programming.},
  }
kind: conference
download_link: TR.pdf
publication_year: 2016
tags:
  - panini
---
