---
key: ICSE-24b
permalink: /papers/ICSE-24b/
short_name: ICSE '24
title: "Are Prompt Engineering and TODO Comments Friends or Foes? An Evaluation on GitHub Copilot"
bib: |
  @inproceedings{OBrienETAL2024,
    author = {David O'Brien and Sumon Biswas and Sayem Mohammad Imtiaz and Rabe Abdalkareem and Emad Shihab and Hridesh Rajan},
    title = {Are Prompt Engineering and TODO Comments Friends or Foes? An Evaluation on GitHub Copilot},
    booktitle = {Proceedings of the 46th {IEEE/ACM} International Conference on Software Engineering, {ICSE} 2024, Lisbon, Portugal, April 14-20, 2024},
    pages = {219:1--219:13},
    year = {2024},
    publisher = {{ACM}},
    doi = {10.1145/3597503.3639176},
    abstract = {
    Code intelligence tools such as GitHub Copilot have begun to bridge the gap between natural language and programming language. A frequent software development task is the management of technical debts, which are suboptimal solutions or unaddressed issues which hinder future software development. Developers have been found to ``self-admit'' technical debts (SATD) in software artifacts such as source code comments. Thus, is it possible that the information present in these comments can enhance code generative prompts to repay the described SATD? Or, does the inclusion of such comments instead cause code generative tools to reproduce the harmful symptoms of described technical debt? Does the modification of SATD impact this reaction? Despite the heavy maintenance costs caused by technical debt and the recent improvements of code intelligence tools, no prior works have sought to incorporate SATD towards prompt engineering. Inspired by this, this paper contributes and analyzes a dataset consisting of 36,381 TODO comments in the latest available revisions of their respective 102,424 repositories, from which we sample and manually generate 1,140 code bodies using GitHub Copilot. Our experiments show that GitHub Copilot can generate code with the symptoms of SATD, both prompted and unprompted. Moreover, we demonstrate the tool's ability to automatically repay SATD under different circumstances and qualitatively investigate the characteristics of successful and unsuccessful comments. Finally, we discuss gaps in which GitHub Copilot's successors and future researchers can improve upon code intelligence tasks to facilitate AI-assisted software maintenance.},
  }
kind: conference
download_link: 2024010849.pdf
publication_year: 2024
tags:
  - boa
---
