---
key: RTSS-10
permalink: /papers/RTSS-10/
short_name: RTSS '10
title: A More Precise Abstract Domain for Multi-level Caches for Tighter WCET Analysis
bib: |
  @inproceedings{sondag2010precise,
    author = {Tyler Sondag and Hridesh Rajan},
    title = {A More Precise Abstract Domain For Multi-level Caches for Tighter {WCET} Analysis},
    booktitle = {RTSS '10: The 31st IEEE Real Time Systems Symposium},
    location = {San Diego, CA},
    month = {November},
    year = {2010},
    entrysubtype = {conference},
    abstract = {
      Many program analyses and optimizations rely on knowledge of cache behavior.
      The precision of the underlying cache model is increasingly important with the
      recent uptake of multi-core and many-core architectures for two reasons.
      First, per-core cache sizes generally decrease as the number of cores becomes
      large resulting in more cache misses. Second, large scale sharing of the
      communication bandwidth to memory increases contention resulting in greater
      cost of cache misses. We present a sound technique for cache behavior analysis
      that handles instruction and data caches as well as a variety of multi-level
      cache policies. The resulting analysis is applicable to current
      general-purpose processors. Our technique relies on a new abstraction, live
      caches which model relationships between cache levels to improve accuracy of
      multi-level cache analysis. In an existing many-core cache configuration, live
      caches improve L2 hit accuracy by an average of 5.7%. Among others, this
      reduces the upper bound on memory accesses for worst case execution time
      (WCET) by an average 6.4%.
    }
  }
kind: conference
download_link: rtss10.pdf
publication_year: 2010
tags:
  - sapha
---
