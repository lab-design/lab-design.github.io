---
key: BMC-19
permalink: /papers/BMC-19/
short_name: BMC Bioinformatics '19
title: Shared Data Science Infrastructure for Genomics Data
bib: |
  @article{Bagheri2019,
    author = {Hamid Bagheri and Usha Muppirala and Rick E. Masonbrink and Andrew J. Severin and Hridesh Rajan },
    title = {Shared data science infrastructure for genomics data},
    journal = {BMC Bioinformatics},
    volume = {20},
    number = {436},
    article = {},
    month = {August},
    year = {2019},
    publisher = {Springer},
    address = {},
    abstract = {Background: Creating a scalable computational infrastructure to analyze the wealth of information contained in data repositories is difficult due to significant barriers in organizing, extracting and analyzing relevant data. Shared data science infrastructures like Boag is needed to efficiently process and parse data contained in large data repositories. The main features of Boag are inspired from existing languages for data intensive computing and can easily integrate data from biological data repositories. Results: As a proof of concept, Boa for genomics, Boag, has been implemented to analyze RefSeq’s 153,848 annotation (GFF) and assembly (FASTA) file metadata. Boag provides a massive improvement from existing solutions like Python and MongoDB, by utilizing a domain-specific language that uses Hadoop infrastructure for a smaller storage footprint that scales well and requires fewer lines of code. We execute scripts through Boag to answer questions about the genomes in RefSeq. We identify the largest and smallest genomes deposited, explore exon frequencies for assemblies after 2016, identify the most commonly used bacterial genome assembly program, and address how animal genome assemblies have improved since 2016. Boag databases provide a significant reduction in required storage of the raw data and a significant speed up in its ability to query large datasets due to automated parallelization and distribution of Hadoop infrastructure during computations. Conclusions: In order to keep pace with our ability to produce biological data, innovative methods are required. The Shared Data Science Infrastructure, Boag, provides researchers a greater access to researchers to efficiently explore data in new ways. We demonstrate the potential of a the domain specific language Boag using the RefSeq database to explore how deposited genome assemblies and annotations are changing over time. This is a small example of how Boag could be used with large biological datasets.},
    doi={10.1186/s12859-019-2967-2}, 
  }
kind: journal
download_link: BMC19.pdf
publication_year: 2019
tags:
  - boa
---
