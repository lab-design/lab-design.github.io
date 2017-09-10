---
key: SondagMSThesis
permalink: /papers/thesis/SondagMSThesis.html
short_name: Sondag MS Thesis
title: "Phase-based tuning for better utilized performance-asymmetric multicores"
bib:  |
  @mastersthesis{sondag2009phase,
    title = {Phase-based tuning for better utilized performance-asymmetric multicores},
    author = {Sondag, Tyler},
    year = {2009},
    school = {Iowa State University},
    abstract = {
      The latest trend towards performance asymmetry among cores on a single chip of a
      multicore processor is posing new software engineering challenges for
      developers. A key challenge is that for effective utilization of these
      performance-asymmetric multicore processors, application threads must be
      assigned to cores such that the resource needs of a thread closely matches
      resource availability at the assigned core. Determining this assignment manually
      is tedious, error prone, and it significantly complicates software development.
      We contribute a transparent and fully-automatic program analysis, which we call
      phase-guided tuning, to solve this problem. Phase-guided tuning adapts an
      application to effectively utilize performance-asymmetric cores of a processor.
      Our technique does not require any changes in the compiler or operating system,
      thus it is easy to deploy in existing tool chains. It does not require any input
      from the programmer except the application. Furthermore, it is independent of
      the characteristics (performance-asymmetry) of the target multicore processor,
      which has two benefits. First, it avoids the need to create multiple
      customizations of the binary for each target architecture, and second it
      relieves the programmer of the burden of anticipating the target architecture.
      Last but not least, our technique significantly improves performance. Compared
      to the stock Linux scheduler, our best technique shows 215% improvement in
      throughput and 36% average process speedup, while maintaining fairness and with
      negligible overheads.
    }
  }
kind: thesis
download_link: http://lib.dr.iastate.edu/etd/10954/
publication_year: 2009
tags:
  - sapha
---
