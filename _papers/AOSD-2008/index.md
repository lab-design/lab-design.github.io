---
key: AOSD-2008
permalink: /papers/AOSD-2008/
short_name: AOSD '08
title: "Nu: a Dynamic Aspect-Oriented Intermediate Language Model and Virtual Machine for Flexible Runtime Adaptation"
bib: |
  @inproceedings{dyer2008nu,
    author = {Robert Dyer and Hridesh Rajan},
    title = {Nu: a Dynamic Aspect-Oriented Intermediate Language Model and Virtual Machine for Flexible Runtime Adaptation},
    booktitle = {AOSD '08: Proceedings of the 7th International Conference on Aspect-oriented Software Development},
    year = {2008},
    location = {Brussels, Belgium},
    publisher = {ACM},
    address = {New York, NY, USA},
    entrysubtype = {conference},
    abstract = {
      A variety of dynamic aspect-oriented language constructs are proposed in
      recent literature with corresponding, compelling use cases. Such constructs,
      as well as other existing constructs such as cflow, demonstrate the need to
      dynamically adapt the set of join points intercepted at a fine-grained level.
      The notion of morphing aspects and continuous weaving is motivated by this
      need. In this work, we propose an intermediate language model called Nu, that
      extends object-oriented intermediate language models with two finegrained
      deployment primitives: bind and remove. These primitives offer a higher level
      of abstraction as a compilation target for dynamic aspect-oriented language
      constructs, compared to object-oriented intermediate language models, thereby
      making it easier to support such constructs.

      We also present the design and implementation of a prototype virtual machine
      that supports the Nu model, which serves to show that it is feasible to
      support such a flexible and dynamic intermediate language model in
      a production level virtual machine. We demonstrate the potential utility of
      the intermediate language design by expressing a variety of aspect-oriented
      source language constructs of dynamic flavor such as CaeserJ's deploy,
      history-based pointcuts, and control flow constructs such as cflow in terms
      of the Nu model.
    }
  }
kind: conference
download_link: nu.pdf
publication_year: 2008
tags:
  - nu
---

Previous version appeared as [Technical Report 07-06](/papers/TR-07-06/),
Computer Science, Iowa State University, June 03, 2007.

See also this preliminary poster paper on this topic: [FSE-2006](/papers/FSE-2006/)
