---
key: TOSEM-09-NU
permalink: /papers/TOSEM-09-NU/
short_name: TOSEM '09
title: Supporting Dynamic Aspect-oriented Features
bib: |
  @article{dyer2010supporting,
    author = {Robert Dyer and Hridesh Rajan},
    title = {Supporting Dynamic Aspect-oriented Features},
    journal = {ACM Transactions on Software Engineering and Methodology (TOSEM)},
    volume = {20},
    number = {2},
    article = {7},
    year = {2010},
    publisher = {ACM},
    address = {New York, NY, USA},
    abstract = {
      Dynamic aspect-oriented (AO) features have important software engineering
      benefits such as allowing unanticipated software evolution and maintenance. It
      is thus important to efficiently support these features in language
      implementations. Current implementations incur unnecessary design-time and
      runtime overhead due to the lack of support in underlying intermediate
      language (IL) models. To address this problem, we present a flexible and
      dynamic IL model that we call Nu. The Nu model provides a higher level of
      abstraction compared to traditional object-oriented ILs, making it easier to
      efficiently support dynamic AO features. We demonstrate these benefits by
      providing an industrial strength VM implementation for Nu, by showing
      translation strategies from dynamic source-level constructs to Nu, and by
      analyzing the performance of the resulting IL code.

      Nu's VM extends Sun's Hotspot VM and uses a novel caching mechanism to
      significantly reduce the amortized costs of join point dispatch. Our
      evaluation using standard benchmarks shows that the overhead of supporting a
      dynamic deployment model can be reduced to as little as ~1.5%. Nu provides an
      improved compilation target for dynamic deployment features, which makes it
      easier to support such features with corresponding software engineering
      benefits in software evolution and maintenance and in runtime verification.
    }
  }
kind: journal
download_link: nu-journal.pdf
publication_year: 2010
tags:
  - nu
---
