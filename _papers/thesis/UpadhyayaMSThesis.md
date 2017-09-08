---
key: UpadhayayaMSThesis
permalink: /papers/thesis/UpadhayayaMSThesis.html
short_name: Upadhayaya MS Thesis
title: Abstraction and performance, together at last; Auto-tuning message-passing concurrency on the Java Virtual Machine
bib:  |
  @mastersthesis{upadhyaya2015abstraction,
    title = {Abstraction and performance, together at last; Auto-tuning message-passing concurrency on the java virtual machine},
    author = {Upadhyaya, Ganesha},
    year = {2015},
    school = {Iowa State University},
    abstract = {
      Performance tuning is the leading justification for breaking abstraction
      boundaries. We target this problem for message passing concurrency (MPC)
      abstractions on the Java Virtual Machine (JVM). Efficient mapping of MPC
      abstractions to threads is critical for performance, scalability, and CPU uti-
      lization; but tedious and time consuming to perform manually. We solve this
      problem by putting forth a technique for automatically mapping MPC
      abstractions to JVM threads. In general, this mapping cannot be found in
      polynomial time. Our surprising observation is that characteristics of MPC
      abstrac- tions and their communication patterns can be very revealing, and can
      help determine the mapping. Our technique addresses a number of challenges
      that leads to improved performance: i) balancing the com- putations across JVM
      threads, ii) reducing the communication overheads, iii) utilizing the
      information about cache locality, and iv) mapping MPC abstractions to threads
      in a way that reduces the contention between JVM threads. We have realized our
      technique in the Panini language that has capsules as an MPC abstraction. We
      also compare our mapping technique against four default mapping techniques:
      thread-all, round-robin-task-all, random-task-all and work-stealing. Our
      evaluation on wide range of benchmark programs shows that our mapping
      technique can improve the performance by 30%-60% over default mapping
      techniques.
    }
  }
kind: thesis
download_link: /papers/thesis/UpadhyayaMSThesis.pdf
publication_year: 2015
tags:
  - panini
---
