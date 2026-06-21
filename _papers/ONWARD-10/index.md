---
key: ONWARD-10
permalink: /papers/ONWARD-10/
short_name: Onward! '10
title: "Concurrency by Modularity: Design Patterns, a Case in Point"
bib: |
  @inproceedings{RajanKautzRowcliffe2010,
    author = {Hridesh Rajan and Steven M. Kautz and Wayne Rowcliffe},
    title = {Concurrency by Modularity: Design Patterns, a Case in Point},
    booktitle = {Proceedings of the 25th Annual ACM SIGPLAN Conference on Object-Oriented Programming, Systems, Languages, and Applications, OOPSLA, Reno/Tahoe, Nevada, USA},
    pages = {790--805},
    year = {2010},
    publisher = {{ACM}},
    editor = {William R. Cook and Siobh{\'{a}}n Clarke and Martin C. Rinard},
    doi = {10.1145/1869459.1869523},
    abstract = {
    General purpose object-oriented programs typically aren't embarrassingly
    parallel. For these applications, finding enough concurrency remains a
    challenge in program design. To address this challenge, in the Panini project
    we are looking at reconciling concurrent program design goals with modular
    program design goals. The main idea is that if programmers improve the
    modularity of their programs they should get concurrency for free. In this
    work we describe one of our directions to reconcile these two goals by
    enhancing Gang-of-Four (GOF) object-oriented design patterns. GOF patterns are
    commonly used to improve the modularity of object-oriented software. These
    patterns describe strategies to decouple components in design space and
    specify how these components should interact. Our hypothesis is that if these
    patterns are enhanced to also decouple components in execution space applying
    them will concomitantly improve the design and potentially available
    concurrency in software systems. To evaluate our hypothesis we have studied
    all 23 GOF patterns. For 18 patterns out of 23, our hypothesis has held true.
    Another interesting preliminary result reported here is that for 17 out of
    these 18 studied patterns, concurrency and synchronization concerns were
    completely encapsulated in our concurrent design pattern framework.},
  }
kind: conference
download_link: paper.pdf
publication_year: 2010
tags:
  - panini
---
