---
key: DyerMSThesis
permalink: /papers/thesis/DyerMSThesis.html
short_name: Dyer MS Thesis
title: Supporting dynamic aspect-oriented features
bib:  |
  @mastersthesis{dyer2008supporting,
    title = {Supporting dynamic aspect-oriented features},
    author = {Dyer, Robert},
    year = {2008},
    school = {Iowa State University},
    abstract = {
      Aspect-oriented programming techniques extend object-oriented programming with
      new methods to modularize concerns that otherwise would be non-modular. For
      example, logging concerns are typically scattered across a system but using
      aspect-oriented techniques they can be localized into a single high-level
      module. These techniques typically take modular high-level code and statically
      transform it into non-modular intermediate code.

      The contribution of this work is the design and implementation of a flexible and
      dynamic intermediate-language (IL) model. The main motivation for the design of
      this IL model is to support a variety of dynamic aspect-oriented language
      constructs that are proposed in recent literature such as CaeserJ's deploy,
      history-based pointcuts, and control flow constructs. Our IL model provides a
      higher level of abstraction compared to traditional object-oriented ILs as a
      compilation target for such constructs, which makes it easier to provide
      efficient implementations of these constructs. We demonstrate these benefits by
      providing an industrial strength implementation for our IL model, by showing
      translation strategies from dynamic source-level constructs to our improved IL,
      and by analyzing the performance of the resulting IL code. Our evaluation using
      the SPEC JVM98 and Java Grande benchmarks shows that the overhead of supporting
      a dynamic deployment model can be reduced to as little as ~1.5%, when compared
      to the unmodified VM.
    }
  }
kind: thesis
download_link: http://lib.dr.iastate.edu/etd/11702/
publication_year: 2008
tags:
  - nu
---
