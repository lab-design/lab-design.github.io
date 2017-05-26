---
key: ESEC-FSE-2005
permalink: /papers/ESEC-FSE-2005/
short_name: ESEC/FSE '05
title: Information Hiding Interfaces for Aspect-Oriented Design
bib: |
  @inproceedings{sullivan2005information,
    author = {Kevin Sullivan and William G. Griswold and Yuanyuan Song and
              Yuanfang Cai and Macneil Shonle and Nishit Tewari and
              Hridesh Rajan},
    title = {Information hiding interfaces for aspect-oriented design},
    booktitle = {ESEC/FSE-13: Proceedings of the 10th European software
      engineering conference held jointly with 13th ACM SIGSOFT
      international symposium on Foundations of software engineering},
    year = {2005},
    pages = {166--175},
    location = {Lisbon, Portugal},
    publisher = {ACM},
    address = {New York, NY, USA},
    entrysubtype = {conference},
    abstract = {
      The growing popularity of aspect-oriented languages, such as AspectJ, and of
      corresponding design approaches, makes it important to learn how best to
      modularize programs in which aspect-oriented composition mechanisms are used.
      We contribute an approach to information hiding modularity in programs that
      use quantified advising as a module composition mechanism. Our approach rests
      on a new kind of interface: one that abstracts a crosscutting behavior,
      decouples the design of code that advises such a behavior from the design of
      the code to be advised, and that can stipulate behavioral contracts. Our
      interfaces establish design rules that govern how specific points in program
      execution are exposed through a given join point model and how conforming code
      on either side should behave. In a case study of the HyperCast overlay network
      middleware system, including a real options analysis, we compare the widely
      cited oblivious design approach with our own, showing significant weaknesses
      in the former and benefits in the latter.
    }
  }
kind: conference
download_link: paper.pdf
publication_year: 2005
tags:
  - ptolemy
---
