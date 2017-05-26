---
key: VMIL-2008
permalink: /papers/VMIL-2008/
short_name: VMIL '08
title: A decision tree-based approach to dynamic pointcut evaluation
bib: |
  @inproceedings{dyer2008decision,
    author = {Dyer, Robert and Rajan, Hridesh},
    title = {A Decision Tree-based Approach to Dynamic Pointcut Evaluation},
    booktitle = {Proceedings of the 2nd Workshop on Virtual Machines and Intermediate Languages for Emerging Modularization Mechanisms},
    series = {VMIL '08},
    year = {2008},
    isbn = {978-1-60558-384-6},
    location = {Nashville, Tennessee},
    pages = {4:1--4:10},
    articleno = {4},
    numpages = {10},
    url = {http://doi.acm.org/10.1145/1507504.1507508},
    doi = {10.1145/1507504.1507508},
    acmid = {1507508},
    publisher = {ACM},
    address = {New York, NY, USA},
    keywords = {decision tree, optimization, pointcut evaluation},
    entrysubtype = {workshop},
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
      translate to significant savings in the long run.
    }
  }
kind: workshop
download_link: dyer-rajan-vmil08.pdf
publication_year: 2008
tags:
  - nu
---
