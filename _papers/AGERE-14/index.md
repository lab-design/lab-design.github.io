---
key: AGERE-14
permalink: /papers/AGERE-14/
short_name: AGERE '14
title: An Automatic Actors to Threads Mapping Technique for JVM-Based Actor Frameworks
bib: |
  @inproceedings{upadhyaya2014automatic,
    author = {Ganesha Upadhyaya and Hridesh Rajan},
    title = {An Automatic Actors to Threads Mapping Technique for JVM-Based Actor Frameworks},
    booktitle = {AGERE!'14: Proceedings of the 4th International Workshop on Programming based on Actors Agents & Decentralized Control},
    location = {Portland, Oregon, USA},
    month = {October},
    year = {2014},
    entrysubtype = {workshop},
    abstract = {
      Actor frameworks running on Java Virtual Machine (JVM) platform face two main
      challenges in utilizing multi-core architectures, i) efficiently mapping
      actors to JVM threads, and ii) scheduling JVM threads on multi-core. JVM-based
      actor frameworks allow fine tuning of actors to threads mapping, however
      scheduling of threads on multi-core is left to the OS scheduler. Hence,
      efficiently mapping actors to threads is critical for achieving good
      performance and scalability. In the existing JVM-based actor frameworks,
      programmers select default actors to threads mappings and iteratively fine
      tune the mappings until the desired performance is achieved. This process is
      tedious and time consuming when building large scale distributed applications.
      We propose a technique that automatically maps actors to JVM threads. Our
      technique is based on a set of heuristics with the goal of balancing actors
      computations across JVM threads and reducing communication overheads. We
      explain our technique in the context of the Panini programming language, which
      provides capsules as an actor-like abstraction for concurrency, but also
      explore its applicability to other approaches.
    }
  }
kind: workshop
download_link: agere2014.pdf
publication_year: 2014
tags:
  - panini
---
