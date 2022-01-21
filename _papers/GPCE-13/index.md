---
key: GPCE-13
permalink: /papers/GPCE-13/
short_name: GPCE '13
title: Declarative Visitors to Ease Fine-grained Source Code Mining with Full History on Billions of AST Nodes
bib: |
  @inproceedings{dyer2013declarative,
    author = {Dyer, Robert and Rajan, Hridesh and Nguyen, Tien N.},
    title = {Declarative Visitors to Ease Fine-grained Source Code Mining with Full History on Billions of {AST} Nodes},
    booktitle = {Proceedings of the 12th International Conference on Generative Programming: Concepts & Experiences},
    series = {GPCE},
    year = {2013},
    pages = {23--32},
    location = {Indianapolis, IN},
    entrysubtype = {conference},
    abstract = {
      Software repositories contain a vast wealth of information about software
      development. Mining these repositories has proven useful for detecting
      patterns in software development, testing hypotheses for new software
      engineering approaches, etc. Specifically, mining source code has yielded
      significant insights into software development artifacts and processes.
      Unfortunately, mining source code at a large-scale remains a difficult task.
      Previous approaches had to either limit the scope of the projects studied,
      limit the scope of the mining task to be more coarse-grained, or sacrifice
      studying the history of the code due to both human and computational
      scalability issues. In this paper we address the substantial challenges of
      mining source code: a) at a very large scale; b) at a fine-grained level of
      detail; and c) with full history information.

      To address these challenges, we present domain-specific language features for
      source code mining. Our language features are inspired by object-oriented
      visitors and provide a default depth-first traversal strategy along with two
      expressions for defining custom traversals. We provide an implementation of
      these features in the Boa infrastructure for software repository mining and
      describe a code generation strategy into Java code. To show the usability of
      our domain-specific language features, we reproduced over 40 source code
      mining tasks from two large-scale previous studies in just 2 person-weeks. The
      resulting code for these tasks show between 2.0x-4.8x reduction in code size.
      Finally we perform a small controlled experiment to gain insights into how
      easily mining tasks written using our language features can be understood,
      with no prior training. We show a substantial number of tasks (75%) were
      understood by study participants, in about 3 minutes per task.
    }
  }
kind: conference
download_link: gpce13.pdf
publication_year: 2013
tags:
  - boa
---
