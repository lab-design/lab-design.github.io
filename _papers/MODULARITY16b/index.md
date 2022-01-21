---
key: MODULARITY16b
permalink: /papers/MODULARITY16b/
short_name: Modularity '16
title: A Type-and-Effect System for Asynchronous, Typed Events
authors: Yuheng Long and Hridesh Rajan
bib: |
  @inproceedings{long2016type,
    author = {Yuheng Long and Hridesh Rajan},
    title = {A Type-and-Effect System for Asynchronous, Typed Events},
    booktitle = {Modularity'16: 15th International Conference on Modularity},
    series = {Modularity'16},
    location = {Malaga, Spain},
    month = {March},
    year = {2016},
    entrysubtype = {conference},
    abstract = {
      Implicit concurrency between handlers is important for event driven systems
      because it helps simultaneously promote modularity and scalability. Knowing
      the side-effect of the handlers is critical in these systems to avoid
      concurrency hazards such as data races. As event systems are dynamic, because
      statically known and unknown handlers can register almost at anytime during
      program execution, static effect analyses have to reconcile over competing
      goals such as precision, soundness and modularity. We recently developed
      asynchronous, typed events, a system that can analyze the effects of the
      handlers at runtime. This mechanism utilizes runtime information to enable
      precise effect computation and greatly improves concurrency between handlers.

      In this paper, we present the formal underpinnings of asynchronous, typed
      events, and examine the concurrency safety properties it provides. The
      technical innovations of our system include a novel effect system to soundly
      approximate the dynamism introduced by runtime handlers registration, a static
      analysis to precompute the effects and a dynamic analysis that uses the
      precomputed effects to improve concurrency. Our design simplifies modular
      concurrency reasoning and avoids concurrency hazards.
    }
  }
kind: conference
download_link: paper.pdf
publication_year: 2016
tags:
  - panini
---
