---
key: CGO-11
permalink: /papers/CGO-11/
short_name: CGO '11
title: "Phase-based Tuning for Better Utilization of Performance-Asymmetric Multicore Processors"
bib: |
  @inproceedings{SondagRajan2011,
    author = {Tyler Sondag and Hridesh Rajan},
    title = {Phase-based Tuning for Better Utilization of Performance-Asymmetric Multicore Processors},
    booktitle = {Proceedings of the CGO, The 9th International Symposium on Code Generation and Optimization, Chamonix, France},
    pages = {11--20},
    year = {2011},
    publisher = {{IEEE} Computer Society},
    doi = {10.1109/CGO.2011.5764670},
    abstract = {
    The latest trend towards performance asymmetry among cores on a single chip of
    a multicore processor is posing new challenges. For effective utilization of
    these performance-asymmetric multicore processors, code sections of a program
    must be assigned to cores such that the resource needs of code sections
    closely matches resource availability at the assigned core. Determining this
    assignment manually is tedious, error prone, and significantly complicates
    software development. To solve this problem, we contribute a transparent and
    fully-automatic process that we call phase-based tuning which adapts an
    application to effectively utilize performance-asymmetric multicores. Compared
    to the stock Linux scheduler we see a 36% average process speedup, while
    maintaining fairness and with negligible overheads.},
  }
kind: conference
download_link: cgo11.pdf
publication_year: 2011
tags:
  - sapha
---
