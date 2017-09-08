---
key: PASTE-10
permalink: /papers/PASTE-10/
short_name: PASTE '10
title: Property-Aware Program Sampling
bib: |
  @inproceedings{narayanappa2010property,
    author = {Harish Narayanappa and Mukul S. Bansal and Hridesh Rajan},
    title = {Property-Aware Program Sampling},
    booktitle = {PASTE '10: 9th ACM SIGPLAN-SIGSOFT Workshop on Program Analysis for Software Tools and Engineering},
    location = {Toronto, Canada},
    month = {June},
    year = {2010},
    entrysubtype = {workshop},
    abstract = {
      Monitoring or profiling programs provides us with an understanding for its
      further improvement and analysis. Typically, for monitoring or profiling, the
      program is instrumented to execute additional code that collects necessary
      data. A problem is that program instrumentation is often reported to cause
      between 10% and 390% time and space overhead. A number of techniques based on
      statistical sampling have been proposed to reduce the instrumentation
      overhead. Statistical sampling based instrumentation techniques, although
      effective in reducing the overall overhead, often lead to poor coverage or
      less accurate results. In this work, we present a profiling technique based on
      property-aware program sampling. The key ideas are (i) to use program slicing
      to narrow down the scope of instrumentation to the sections of program
      relevant to the property of interest, (ii) to decompose large program slices
      into logically related slice fragments, and (iii) to apply statistical
      sampling on the set of slice fragments. Our experimental results show that our
      technique can collect profiles at high assurance levels, at a significantly
      lower overhead.
    }
  }
kind: workshop
download_link: main.pdf
publication_year: 2010
tags:
  - tisa
---
