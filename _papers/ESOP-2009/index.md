---
key: ESOP-2009
permalink: /papers/ESOP-2009/
short_name: ESOP '09
title: "Tisa: A Language Design and Modular Verification Technique for Temporal Policies in Web Services"
bib: |
  @inproceedings{rajan2009tisa,
    author = {Hridesh Rajan and Jia Tao and Steve M. Shaner and Gary T. Leavens},
    title = {Tisa: A Language Design and Modular Verification Technique for Temporal Policies in Web Services},
    booktitle = {18th European Symposium on Programming ({ESOP '09})},
    year = {2009},
    month = {March},
    location = {York, UK},
    pages = {To appear},
    entrysubtype = {conference},
    abstract = {
      Web services are distributed software components, that are decoupled from each
      other using interfaces with specified functional behaviors. However, such
      behavioral specifications are insufficient to demonstrate compliance with
      certain temporal non-functional policies. An example is demonstrating that a
      patient's health-related query sent to a health care service is answered only
      by a doctor (and not by a secretary). Demonstrating compliance with such
      policies is important for satisfying governmental privacy regulations. It is
      often necessary to expose the internals of the web service implementation for
      demonstrating such compliance, which may compromise modularity.

      In this work, we provide a language design that enables such demonstrations,
      while hiding majority of the service's source code. The key idea is to use
      greybox specifications to allow service providers to selectively hide and
      expose parts of their implementation. The overall problem of showing
      compliance is then reduced to two subproblems: whether the desired properties
      are satisfied by the service's greybox specification, and whether this greybox
      specification is satisfied by the service's implementation. We specify
      policies using LTL and solve the first problem by model checking. We solve the
      second problem by refinement techniques.
    }
  }
kind: conference
download_link: Rajan-Tao-Shaner-Leavens-09.pdf
extra_download_links:
  - { link: Rajan-ETAL-ESOP-09-Talk.pdf, title: Slides }
publication_year: 2009
tags:
  - tisa
---
