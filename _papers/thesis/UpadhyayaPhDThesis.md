---
key: UpadhayayaPhDThesis
permalink: /papers/thesis/UpadhayayaPhDThesis.html
short_name: Upadhayaya PhD Thesis
title: Collective Program Analysis
bib:  |
  @phdthesis{upadhyaya2018collective,
    title = {Collective Program Analysis},
    author = {Upadhyaya, Ganesha},
    year = {2018},
    school = {Iowa State University},
    abstract = {
    Encouraged by the success of data-driven software engineering (SE) 
    techniques that have found numerous applications e.g. in defect 
    prediction, specification inference, etc, the demand for mining and 
    analyzing source code repositories at scale has significantly increased. 
    However, analyzing source code at scale remains expensive to the 
    extent that data-driven solutions to certain SE problems are beyond 
    our reach today. Extant techniques have focused on leveraging 
    distributed computing to solve this problem, but with a concomitant 
    increase in computational resource needs. In this thesis, we propose 
    collective program analysis (CPA), a technique to accelerate ultra-large-scale 
    source code mining without demanding more computational resources and 
    by utilizing the similarity between millions of source code artifacts.

    First, we describe the general concept of collective program analysis. 
    Given a mining task that is required to be run on thousands of artifacts, 
    the artifacts with similar interactions are clustered together, such 
    that the mining task is required to be run on only one candidate from 
    each cluster to produce the mining result and the results for other 
    candidates in the same cluster can be produced using extrapolation. 
    The two technical innovations of collective program analysis are: 
    mining task specific similarity and interaction pattern graph. 
    Mining task specific similarity is about whether two or more artifacts 
    can be considered similar for a given mining task. An interaction pattern 
    graph represents the interaction between the mining task and the artifact 
    when the mining task is run on the artifact. An interaction pattern graph 
    is used to determine mining task specific similarity between artifacts.

    Given a mining task and an artifact producing an interaction pattern 
    graph soundly and efficiently can be very challenging. We propose a 
    pre-analysis and program compaction technique to achieve this. 
    Given a source code mining task and thousands of input programs on 
    which the mining task needs to be run, our technique first extracts 
    the information about what parts of an input program are relevant 
    for the mining task and then removes the irrelevant parts from input programs, 
    prior to running the mining task on them. Our key technical contributions are a 
    static analysis to extract information about the parts of program that are relevant 
    for a mining task and a sound program compaction technique that produces a 
    reduced program on which the mining task has similar output as original program.
    Upon producing interaction pattern graphs of thousands of artifacts, they have to 
    be clustered and the mining task results have to be reused between similar artifacts 
    to achieve acceleration. In the final part of this thesis, we fully describes collective 
    program analysis and illustrate mining millions of control flow graphs (CFGs) by 
    clustering similar CFGs.
    }
  }
kind: thesis
download_link: /papers/thesis/UpadhyayaPhDThesis.pdf
publication_year: 2018
tags:
  - boa
---
