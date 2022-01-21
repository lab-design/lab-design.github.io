---
key: TR-13-04
permalink: /papers/TR-13-04/
short_name: TR-13-04
title: "Open Effects: Programmer-guided Effects for Open World Concurrent Programs"
bib: |
  @techreport{long2013open,
    author = {Yuheng Long and Mehdi Bagherzadeh and Hridesh Rajan},
    title = {Open Effects: Programmer-guided Effects for Open World Concurrent Programs},
    institution = {Iowa State University, Dept. of Computer Science},
    year = {2013},
    month = {October},
    number = {13-04},
    abstract = {
      The open world assumption makes the design of a type-and-effect system
      challenging, especially in concurrent object-oriented languages. The main
      problem is in the computation of the effects of a dynamically dispatched
      method invocation, because all possible dynamic types of its receiver are not
      known statically. Previous work proposes effect annotations that provide a
      static upper bound on the effects of a dynamically dispatched method,
      conservative enough to cover the effects of all methods which could possibly
      be executed upon its invocation. For two dynamically dispatched methods, a
      typical type-and-effect system may disallow concurrent execution of their
      invocations because their conservatively specified static effects conflict.
      However, such a conflict may not actually happen at runtime, depending on the
      dynamic types of their receivers. This work proposes open effects, a sound
      trust-but-verify type-and-effect system, to better enable concurrent execution
      of dynamically dispatched method invocations. If a programmer annotates the
      receiver of a certain method invocation as open, then the type system trusts
      the programmer and assigns an open effect to the method. The open effect is
      supposed, optimistically, not to conflict with other effects. Such optimistic
      assumptions are verified statically, if possible, or at runtime otherwise.
      Open effects is complementary to previously proposed static and dynamic effect
      analyses and combines them such that the accuracy of static analysis could
      help decrease the overhead of the dynamic analysis. Performance evaluations of
      an implementation of open effects, on various benchmarks, show that: open
      effects incurs negligible annotation and runtime overheads such that code with
      open effects does almost as well as its manually tuned concurrent version.
    }
  }
kind: technical_report
download_link: TR-13-04.pdf
publication_year: 2013
tags:
  - panini
---
