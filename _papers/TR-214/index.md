---
key: TR-214
permalink: /papers/TR-214/
short_name: TR-214
title: Preserving Separation of Concerns Through Compilation
bib:  |
  @techreport{rajan2006preserving-a,
    title = {Preserving separation of concerns through compilation},
    author = {Rajan, Hridesh and Dyer, Robert and Hanna, Youssef Wasfy and Narayanappa, Harish},
    year = {2006},
    institution = {Iowa State University, Dept. of Computer Science},
    number = {214},
    abstract = {
      Current aspect-oriented (AO) compilation techniques fail to preserve the
      separation of concerns for post-compilation phases. At the minimum, it makes
      efficient incremental compilation and unit testing of AO programs challenging.
      The contribution of this work is an improved approach for aspect-oriented
      compilation. Our approach rests on a new interface between the AO high-level
      language (HLL) compiler implementation and the runtime environment. Our
      interface abstracts the realization of the crosscutting behavior at run-time
      from the HLL compiler implementations. The interface governs the intermediate
      code that the HLL compiler can generate and the semantics of the crosscutting
      primitives that it can expect. We present a preliminary evaluation using a
      simple but representative AO program showing the benefits of our approach.
    }
  }
kind: technical_report
download_link: http://lib.dr.iastate.edu/cs_techreports/214/
extra_download_links:
  - { link: preserveSoC.pdf, title: Direct PDF }
publication_year: 2006
tags:
  - nu
---
