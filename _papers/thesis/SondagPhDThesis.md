---
key: SondagPhDThesis
permalink: /papers/thesis/SondagPhDThesis.html
short_name: Sondag PhD Thesis
title: "Phase-based tuning: better utilized performance asymmetric multicores"
bib:  |
  @phdthesis{sondag2011phase-a,
    title = {Phase-based tuning: better utilized performance asymmetric multicores},
    author = {Sondag, Tyler},
    year = {2011},
    school = {Iowa State University},
    abstract = {
      The latest trend towards performance asymmetry among cores on a single chip of
      a multicore processor is posing new challenges. For effective utilization of
      these performance-asymmetric multicore processors, code sections of a program
      must be assigned to cores such that the resource needs of code sections
      closely matches resource availability at the assigned core. Determining this
      assignment manually is tedious, error prone, and significantly complicates
      software development. To solve this problem, this thesis describes a
      transparent and fully-automatic process called phase-based tuning which adapts
      an application to effectively utilize performance-asymmetric multicores. The
      basic idea behind this technique is to statically compute groups of program
      segments which are expected to behave similarly at runtime. Then, at runtime,
      the behavior of a few code segments is used to infer the behavior and
      preferred core assignment of all similar code segments with low overhead.
      Compared to the stock Linux scheduler, for systems asymmetric with respect to
      clock frequency, a 36% average process speedup is observed, while maintaining
      fairness and with negligible overheads.

      A key component to phase-based tuning is grouping program segments with
      similar behavior. The importance of various similarity metrics are likely to
      differ for each target asymmetric multicore processor. Determining groups
      using too many metrics may result in a grouping that differentiates between
      program segments based on irrelevant properties for a target machine. Using
      too few metrics may cause relevant metrics to be ignored thereby considering
      segments with different behavior similar. Therefore, to solve this problem and
      enable phase-based tuning for a wide range of a performance-asymmetric
      multicores, this thesis also describes a new technique called lazy grouping.
      Lazy grouping statically (at compile and install times) groups program
      segments that are expected to have similar behavior. The basic idea is to use
      extensive compile time analysis with intelligent install time (when the target
      system is known) group assignment. The accuracy of lazy grouping for a wide
      range of machines is shown to be more than 90% for nearly all target machines
      and asymmetric multicores.
    }
  }
kind: thesis
download_link: http://lib.dr.iastate.edu/etd/10416/
publication_year: 2011
tags:
  - sapha
---
