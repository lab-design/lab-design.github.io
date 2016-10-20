---
permalink: /papers/thesis/dyer/
title: Bringing ultra-large-scale software repository mining to the masses with Boa
abstract: >
  Mining software repositories provides developers and researchers a chance to
  learn from previous development activities and apply that knowledge to the
  future. Ultra-large-scale open source repositories (e.g., SourceForge with
  350,000+ projects, GitHub with 250,000+ projects, and Google Code with
  250,000+ projects) provide an extremely large corpus to perform such mining
  tasks on. This large corpus allows researchers the opportunity to test new
  mining techniques and empirically validate new approaches on real-world data.
  However, the barrier to entry is often extremely high. Researchers interested
  in mining must know a large number of techniques, languages, tools, etc, each
  of which is often complex. Additionally, performing mining at the scale
  proposed above adds additional complexity and often is difficult to achieve.

  The Boa language and infrastructure was developed to solve these problems. We
  provide users a domain-specific language tailored for software repository
  mining and allow them to submit queries via our web-based interface. These
  queries are then automatically parallelized and executed on a cluster,
  analyzing a dataset containing almost 700,000 projects, history information
  from millions of revisions, millions of Java source files, and billions of AST
  nodes. The language also provides an easy to comprehend visitor syntax to ease
  writing source code mining queries. The underlying infrastructure contains
  several optimizations, including query optimizations to make single queries
  faster as well as a fusion optimization to group queries from multiple users
  into a single query. The latter optimization is important as Boa is intended
  to be a shared, community resource. Finally, we show the potential benefit of
  Boa to the community by reproducing a previously published case study and
  performing a new case study on the adoption of Java language features.
bib: |
kind: thesis
download_link: http://lib.dr.iastate.edu/etd/13553/
publication_date: 2013
---
