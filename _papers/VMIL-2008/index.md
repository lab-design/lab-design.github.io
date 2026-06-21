---
key: VMIL-2008
permalink: /papers/VMIL-2008/
short_name: VMIL '08
title: "A Decision Tree-based Approach to Dynamic Pointcut Evaluation"
bib: |
  @inproceedings{DyerRajan2008b,
    author = {Robert Dyer and Hridesh Rajan},
    title = {A Decision Tree-based Approach to Dynamic Pointcut Evaluation},
    booktitle = {VMIL@OOPSLA: Proceedings of the 2nd Workshop on Virtual Machines and Intermediate Languages for emerging modularization mechanisms, Nashville, Tennessee, USA},
    pages = {4:1--4:10},
    year = {2008},
    publisher = {{ACM}},
    editor = {Hridesh Rajan},
    doi = {10.1145/1507504.1507508},
    abstract = {
    Constructs of dynamic nature, e.g., history-based pointcuts and control-flow
    based pointcuts, have received significant attention in recent aspect-oriented
    literature. A variety of compelling use cases are presented that motivate the
    need for efficiently supporting such constructs in language implementations.
    The key challenge in implementing dynamic constructs is to efficiently support
    runtime adaptation of the set of intercepted join points at a fine-grained
    level. This translates to two high-level requirements. First, since the set of
    intercepted join points may change, such implementations must provide an
    efficient method to determine this set membership, i.e., whether the currently
    executing join point needs to be intercepted. Second, the frequency with which
    such set membership needs to be determined must be minimized. In previous
    work, Dyer and Rajan proposed a dedicated caching mechanism to address the
    second requirement. In this work, we propose a mechanism to address the first
    requirement. This requirement translates to efficiently evaluating whether a
    join point is intercepted by a set of pointcut expressions. In the worst case,
    at every join point there may be the need to determine whether it is
    intercepted. Therefore, even modest savings in such mechanisms is likely to
    translate to significant savings in the long run.},
  }
kind: workshop
download_link: dyer-rajan-vmil08.pdf
publication_year: 2008
tags:
  - nu
---
