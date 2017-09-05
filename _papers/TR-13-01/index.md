---
key: TR-13-01
permalink: /papers/TR-13-01/
short_name: TR-13-01
title: Capsule-oriented Programming
bib: |
  @techreport{rajan2013capsule,
    author = {Hridesh Rajan and Steven M. Kautz and Eric Lin and Sarah Kabala and Ganesha Upadhyaya and Yuheng Long and Rex Fernando, and Lor\'{a}nd Szak\'{a}cs},
    title = {Capsule-oriented Programming},
    institution = {Iowa State University, Dept. of Computer Science},
    year = {2013},
    number = {13-01},
    abstract = {
      Many programmers find writing and reasoning about concurrent programs
      difficult and can benefit from better abstractions for concurrency. A
      promising class of such concurrency abstractions combines state and control
      within a single linguistic mechanism and uses asynchronous messages for
      communications, e.g. active objects or actors. One hurdle is the need to adapt
      to an asychronous style of programming. We believe that most benefits of
      actor-like abstractions can be brought to sequentially-trained programmers via
      a more familiar synchronous model. We call this model capsule-oriented
      programming, where programmers describe a system in terms of its modular
      structure and write sequential code to implement the operations of those
      modules using a new abstraction that we call capsule. Capsule-oriented
      programs look like familiar sequential programs but they are implicitly
      concurrent. We present Panini, a capsule-oriented programming language, and
      its compiler, which help programmers avoid two classes of concurrency errors:
      sequential inconsistency and data races due to sharing. We have refactored the
      Java Grande and NPB benchmarks (>134,000 LOC) using Panini, leading to simpler
      and shorter programs that perform as well as the parallel versions provided
      with the benchmarks.
    }
  }
kind: technical_report
download_link: capsule-oriented.pdf
publication_year: 2013
tags:
  - panini
---
