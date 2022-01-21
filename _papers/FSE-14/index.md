---
key: FSE-14
permalink: /papers/FSE-14/
short_name: FSE '14
title: Mining Preconditions of APIs in Large-scale Code Corpus
bib: |
  @inproceedings{nguyen2014mining,
    author = {Nguyen, Hoan Anh and Dyer, Robert and Nguyen, Tien N. and Rajan, Hridesh},
    title = {Mining Preconditions of {API}s in Large-scale Code Corpus},
    booktitle = {FSE`14: 22nd International Symposium on Foundations of Software Engineering},
    series = {FSE'14},
    month = {November},
    year = {2014},
    pages = {to appear},
    location = {Hong Kong},
    entrysubtype = {conference},
    abstract = {
      Modern software relies on existing application programming in- terfaces (APIs)
      from libraries. Formal specifications for the APIs enable many software
      engineering tasks as well as help developers correctly use them. In this work,
      we mine large-scale repositories of existing open-source software to derive
      potential preconditions for API methods. Our key idea is that APIs’
      preconditions would appear frequently in an ultra-large code corpus with a large
      num- ber of API usages, while project-specific conditions will occur less
      frequently. First, we find all client methods invoking APIs. We then compute a
      control dependence relation from each call site and mine the potential
      conditions used to reach those call sites. We use these guard conditions as a
      starting point to automatically infer the preconditions for each API. We
      analyzed almost 120 million lines of code from SourceForge and Apache projects
      to infer precondi- tions for the standard Java Development Kit (JDK) library.
      The results show that our technique can achieve high accuracy with recall from
      75–80% and precision from 82–84%. We also found 5 preconditions missing from
      human written specifications. They were all confirmed by a specification expert.
      In a user study, par- ticipants found 82% of the mined preconditions as a good
      starting point for writing specifications. Using our mining result, we also
      built a benchmark of more than 4,000 precondition-related bugs.
    }
  }
kind: conference
download_link: fse14.pdf
publication_year: 2014
tags:
  - boa
---
