---
key: TR-07-06
permalink: /papers/TR-07-06/
short_name: TR-07-06
title: "Nu: Towards a Flexible and Dynamic Aspect-Oriented Intermediate Language Model"
bib:  |
  @techreport{dyer2007nu,
    title = {Nu: Towards a Flexible and Dynamic Aspect-Oriented Intermediate Language Model},
    author = {Dyer, Robert and Setty, Rakesh Bangalore Shivarudra and Rajan, Hridesh},
    year = {2007},
    month = {June},
    institution = {Iowa State University, Dept. of Computer Science},
    number = {07-06},
    abstract = {
      The contribution of this work is the design, implementation and evaluation of
      a new aspect-oriented intermediate language model that we call Nu. The primary
      motivation behind the design of the Nu model is to maintain the
      aspect-oriented design modularity in the intermediate code for the
      responsiveness of incremental compilers and source-level debuggers. Nu extends
      the object-oriented intermediate language model with two primitives: bind and
      remove. We demonstrate that these primitives are capable of expressing
      statically deployed constructs such as AspectJ’s aspect, dynamic deployment
      construct such as CaeserJ’s deploy as well as dynamic control ﬂow constructs
      such as AspectJ’s cﬂow by presenting compilation techniques from high-level
      languages to Nu for these constructs. Moreover, these compilation techniques
      also serve to show that aspect-oriented design modularity is indeed preserved
      in the Nu intermediate code.

      We also present the design and implementation of a prototype extension of the
      Sun Hotspot virtual machine that supports the Nu model, which serves to show
      that it is feasible to implement Nu in a production level virtual machine. A
      key concern for dynamic language models is the performance overhead of their
      implementation. Our performance analysis results show that method dispatch
      time is not degraded in our prototype implementation. Also, advice dispatch
      time remains fairly close to the manually inlined version.
    }
  }
kind: technical_report
download_link: TR-07-06.pdf
publication_year: 2007
tags:
  - nu
---
