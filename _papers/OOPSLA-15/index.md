---
key: OOPSLA-15
permalink: /papers/OOPSLA-15/
short_name: OOPSLA '15
title: Effectively Mapping Linguistic Abstractions for Message-passing Concurrency to Threads on the Java Virtual Machine
bib: |
  @inproceedings{upadhyaya2015effectively,
    author = {Ganesha Upadhyaya and Hridesh Rajan},
    title = {Effectively Mapping Linguistic Abstractions for Message-passing Concurrency to Threads on the Java Virtual Machine},
    booktitle = {OOPSLA'15: The ACM SIGPLAN conference on Systems, Programming, Languages and Applications: Software for Humanity (SPLASH)},
    location = {Pittsburgh, PA, USA},
    month = {October},
    year = {2015},
    entrysubtype = {conference},
    abstract = {
      Efficient mapping of message passing concurrency (MPC) abstractions to Java
      Virtual Machine (JVM) threads is critical for performance, scalability, and
      CPU utilization; but tedious and time consuming to perform manually. In
      general, this mapping cannot be found in polynomial time, but we show that by
      exploiting the local characteristics of MPC abstractions and their
      communication patterns this mapping can be determined effectively. We describe
      our MPC abstraction to thread mapping technique, its realization in two
      frameworks (Panini and Akka), and its rigorous evaluation using several
      benchmarks from representative MPC frameworks. We also compare our technique
      against four default mapping techniques: thread-all, round-robin-task-all,
      random-task-all and work-stealing. Our evaluation shows that our mapping
      technique can improve the performance by 30%-60% over default mapping
      techniques. These improvements are due to a number of challenges addressed by
      our technique namely: i) balancing the computations across JVM threads, ii)
      reducing the communication overheads, iii) utilizing information about cache
      locality, and iv) mapping MPC abstractions to threads in a way that reduces
      the contention between JVM threads.
    }
  }
kind: conference
download_link: http://lib.dr.iastate.edu/cs_techreports/377/
publication_year: 2015
tags:
  - panini
---
