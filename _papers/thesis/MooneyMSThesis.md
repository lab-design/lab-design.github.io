---
key: MooneyMSThesis
permalink: /papers/thesis/MooneyMSThesis.html
short_name: Mooney MS Thesis
title: A Unified Design of Capsules
bib:  |
  @mastersthesis{mooney2015unified,
    title = {A Unified Design of Capsules},
    author = {Mooney, Sean Lawrence},
    year = {2015},
    school = {Iowa State University},
    abstract = {
      The process of reading, writing, and reasoning about concurrent programs
      benefits from better abstractions for concurrency than what many common
      languages, such as Java, offer. Capsule-oriented programming and the Panini
      language utilize the idea of combining state and control within a linguistic
      mechanism along with asynchronous message passing to provide sequentially
      trained programmers with an actor-like language that preserves the expected
      sequential semantics. The initial design of the Panini language splits the
      world into two distinct elements – capsules and systems. A capsule acts as the
      unit of both modularity and concurrency in the program. A system acts as the
      sole point of composition for capsule instances. The problem is that the
      dichotomy between systems and capsules leads to uncomposable and non-modular
      programs. The connections between capsule instances in a system declaration
      are fixed at exactly one point and all capsules instances in program must be
      declared and connected to each other at a single block of code. This thesis
      will explore the implications on modularity and reuse of systems when a basic
      design decision – separating capsules and systems – is relaxed to allow a
      capsule to declare an internal composition of other capsule instances.
    }
  }
kind: thesis
download_link: /papers/thesis/MooneyMSThesis.pdf
publication_year: 2015
tags:
  - panini
---
