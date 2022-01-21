---
key: TR-06-30
permalink: /papers/TR-06-30/
short_name: TR-06-30
title: Modular Compilation Strategies for Aspect-Oriented Constructs
bib:  |
  @techreport{dyer2006modular,
    title = {Modular compilation strategies for aspect-oriented constructs},
    author = {Dyer, Robert and Rajan, Hridesh},
    year = {2006},
    month = {September},
    intitution = {Iowa State University, Dept. of Computer Science},
    number = {06-30},
    abstract = {
      In our previous work, we presented an aspect-oriented intermediate language,
      named Nu, to preserve design modularity in object code. Nu is based on two
      primitives: bind and remove. We showed that maintaining modularity in object
      code significantly improved the incremental compilation time of
      aspect-oriented programs. The key contribution of this work is a set of
      compilation strategies to Nu for a number of AspectJ constructs such as
      control flow (cflow and cflowbelow), instantiation (perthis, pertarget,
      percflow, percflowbelow) and dynamic checks (if, this, target, args), as well
      as composition operators (&& and ||). The motivation was to determine if these
      high-level language constructs need to be supported in the intermediate
      language. Our compilation strategies are modular and textually local. To
      compile a construct in a module, only the information about that module's
      implementation and the specification of other modules referenced in that
      module are needed. The generated intermediate code for a construct in a source
      module is confined to a single module in the object code. We show that our
      compilation strategies improve incremental compilation time of aspect-oriented
      programs. We also analyze our intermediate language with respect to constructs
      that are not directly supported.
    }
  }
kind: technical_report
download_link: http://lib.dr.iastate.edu/cs_techreports/251/
publication_year: 2006
tags:
  - nu
---
