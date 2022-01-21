---
key: ECOOP-15
permalink: /papers/ECOOP-15/
short_name: ECOOP '15
title: Intensional Effect Polymorphism
bib: |
  @inproceedings{long2015intensional,
    author = {Yuheng Long and Yu David Liu and Hridesh Rajan},
    title = {Intensional Effect Polymorphism},
    booktitle = {Proceedings of the 29th European Conference on Object-oriented Programming},
    series = {ECOOP'15},
    location = {Prague, Czech Republic},
    month = {July},
    year = {2015},
    entrysubtype = {conference},
    abstract = {
      Type-and-effect systems are a powerful tool for program construction and
      verification. We describe intensional effect polymorphism, a new foundation
      for effect systems that integrates static and dynamic effect checking. Our
      system allows the effect of polymorphic code to be intensionally inspected
      through a lightweight notion of dynamic typing. When coupled with parametric
      polymorphism, the powerful system utilizes runtime information to enable
      precise effect reasoning, while at the same time retains strong type safety
      guarantees. We build our ideas on top of an imperative core calculus with
      regions. The technical innovations of our design include a relational notion
      of effect checking, the use of bounded existential types to capture the subtle
      interactions between static typing and dynamic typing, and a differential
      alignment strategy to achieve efficiency in dynamic typing. We demonstrate the
      applications of intensional effect polymorphism in concurrent programming,
      memoization, security and UI access.
    }
  }
kind: conference
download_link: main.pdf
publication_year: 2015
tags:
  - panini
---
