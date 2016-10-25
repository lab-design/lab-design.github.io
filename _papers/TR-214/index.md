---
key: TR-214
permalink: /papers/TR-214/
short_name: TR-214
title: Preserving Separation of Concerns Through Compilation
abstract: >
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
bib:
kind: technical_report
download_links:
  - http://lib.dr.iastate.edu/cs_techreports/214/
  - preserveSoC.pdf
publication_year: 2006
---
