---
key: ICSME-25
permalink: /papers/ICSME-25/
short_name: ICSME '25
title: "Together We Are Better: LLM, IDE and Semantic Embedding to Assist Move Method Refactoring"
bib: |
  @inproceedings{BellurETAL2025,
    author = {Abhiram Bellur and Fraol Batole and Mohammed Raihan Ullah and Malinda Dilhara and Yaroslav Zharov and Timofey Bryksin and Kai Ishikawa and Haifeng Chen and Masaharu Morimoto and Takeo Hosomi and Tien N. Nguyen and Hridesh Rajan and Nikolaos Tsantalis and Danny Dig},
    title = {Together We Are Better: LLM, IDE and Semantic Embedding to Assist Move Method Refactoring},
    booktitle = {IEEE International Conference on Software Maintenance and Evolution, ICSME, Auckland, New Zealand},
    pages = {1--13},
    year = {2025},
    publisher = {{IEEE}},
    doi = {10.1109/ICSME64153.2025.00046},
    abstract = {MoveMethod is a hallmark refactoring. Despite a plethora of research tools that recommend which methods to move and where, these recommendations do not align with how expert developers perform MoveMethod. Given the extensive training of Large Language Models and their reliance upon naturalness of code, they should expertly recommend which methods are misplaced in a given class and which classes are better hosts. Our formative study of 2016 LLM recommendations revealed that LLMs give expert suggestions, yet they are unreliable: up to 80% of the suggestions are hallucinations. We introduce the first LLM fully powered assistant for MoveMethod refactoring that automates its whole end-to-end lifecycle, from recommendation to execution. We designed novel solutions that automatically filter LLM hallucinations using static analysis from IDEs and a novel workflow that requires LLMs to be self-consistent, critique, and rank refactoring suggestions. As MoveMethod refactoring requires global, project-level reasoning, we solved the limited context size of LLMs by employing refactoring-aware retrieval augment generation (RAG). Our approach, MMpro, synergistically combines the strengths of the LLM, IDE, static analysis, and semantic relevance. In our thorough, multi-methodology empirical evaluation, we compare MMpro with the previous state-of-the-art approaches. MMpro significantly outperforms them: (i) on a benchmark widely used by other researchers, our Recall@1 and Recall@3 show a 1.7x improvement; (ii) on a corpus of 210 recent refactorings from Open-source software, our Recall rates improve by at least 2.4x. Lastly, we conducted a user study with 30 experienced participants who used MMpro to refactor their own code for one week. They rated 82.8% of MMpro recommendations positively. This shows that MMpro is both effective and useful.},
  }
kind: conference
download_link: https://doi.org/10.1109/ICSME64153.2025.00046
publication_year: 2025
tags:
  - llm
---
