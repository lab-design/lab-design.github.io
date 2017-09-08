---
key: TR-08-02
permalink: /papers/TR-08-02/
short_name: TR-08-02
title: "Weave Now or Weave Later: A Test Driven Development Perspective on Aspect-oriented Deployment Models"
bib:  |
  @techreport{setty2008weave,
    title = {Weave Now or Weave Later: A Test Driven Development Perspective on Aspect-oriented Deployment Models},
    author = {Setty, Rakesh Bangalore Shivarudra and Dyer, Robert and Rajan, Hridesh},
    year = {2008},
    month = {February},
    institution = {Iowa State University, Dept. of Computer Science},
    number = {08-02},
    abstract = {
      The choice to use static or load-time weaving techniques in the development
      cycle of large AspectJ programs is not clear. It is a common practice to
      iteratively remove errors from programs by making small changes, recompiling,
      and testing the change. Previous research has shown that incremental
      compilation of aspect-oriented programs using static weavers can take longer
      compared to object-oriented programs, which in turn increases the time spent
      in each iteration. It has been suggested that utilizing load-time weavers can
      potentially alleviate the problem. However, there is a trade-off involved
      which is the increased execution time due to the overhead involved in weaving
      while loading classes. In this paper, we report on a case study in which we
      examine the parameters that differentiate the two techniques during the
      edit-compile-test cycle and determine which technique is more favorable as
      these parameters vary. Our results show that the parameters that differentiate
      the techniques are the number of classes loaded, the size of the project and
      the number of join points executed including repetitions. We also find that
      load-time weaving does solve the problem of incremental compilation in
      aspect-oriented programming to some extent under some favorable values of the
      parameters mentioned. We find that the performance of static weaving with
      respect to load-time weaving is directly proportional to the number of classes
      loaded during test, and the performance of load-time weaving with respect to
      static weaving is directly proportional to the size of the project and the
      number of join points executed. Our results also show that the percentage of
      join points affected by aspects do not differentiate between the two
      techniques.
    }
  }
kind: technical_report
download_link: http://lib.dr.iastate.edu/cs_techreports/313/
publication_year: 2008
tags:
  - nu
---
