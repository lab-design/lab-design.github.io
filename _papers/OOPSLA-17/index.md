---
key: OOPSLA-17
permalink: /papers/OOPSLA-17/
short_name: OOPSLA '17
title: Exploiting Implicit Beliefs to Resolve Sparse Usage Problem in Usage-based Specification Mining
bib: |
  @inproceedings{khairunnesa2017exploiting,
    author = {Samantha Syeda Khairunnesa and Hoan Anh Nguyen and Tien N. Nguyen and Hridesh Rajan},
    title = {Exploiting Implicit Beliefs to Resolve Sparse Usage Problem in Usage-based Specification Mining},
    booktitle = {OOPSLA'17: The ACM SIGPLAN conference on Object-Oriented Programming, Systems, Languages, and Applications},
    series = {OOPSLA'17},
    location = {Vancouver, Canada},
    month = {October},
    year = {2017},
    entrysubtype = {conference},
    abstract = {
      Frameworks and libraries provide application programming interfaces (APIs) that
      serve as building blocks in modern software development. As APIs present the
      opportunity of increased productivity, it also calls for correct use to avoid
      buggy code. The usage-based specification mining technique has shown great
      promise in solving this problem through a data-driven approach. These techniques
      leverage the use of the API in large corpora to understand the recurring usages
      of the APIs and infer behavioral specifications (preconditions and
      postconditions) from such usages. A challenge for such technique is thus
      inference in the presence of insufficient usages, in terms of both frequency and
      richness. We refer to this as a "sparse usage problem." This paper presents the
      first technique to solve the sparse usage problem in usage-based precondition
      mining. Our key insight is to leverage implicit beliefs to overcome sparse
      usage. An implicit belief (IB) is the knowledge implicitly derived from the fact
      about the code. An IB about a program is known implicitly to a programmer via
      the language's constructs and semantics, and thus not explicitly written or
      specified in the code. The technical underpinnings of our new precondition
      mining approach include a technique to analyze the data and control flow in the
      program leading to API calls to infer preconditions that are implicitly present
      in the code corpus, a catalog of 35 code elements in total that can be used to
      derive implicit beliefs from a program, and empirical evaluation of all of these
      ideas. We have analyzed over 350 millions lines of code and 7 libraries that
      suffer from the sparse usage problem. Our approach realizes 6 implicit beliefs
      and we have observed that addition of single-level context sensitivity can
      further improve the result of usage based precondition mining. The result shows
      that we achieve overall 60% in precision and 69% in recall and the accuracy is
      relatively improved by 32% in precision and 78% in recall compared to base
      usage-based mining approach for these libraries.
    }
  }
kind: conference
download_link: implicit_belief.pdf
publication_year: 2017
tags:
  - boa
---
