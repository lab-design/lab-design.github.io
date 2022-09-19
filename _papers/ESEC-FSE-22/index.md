---
key: ESEC-FSE-22
permalink: /papers/ESEC-FSE-22/
short_name: ESEC-FSE '22
title: "23 Shades of Self-Admitted Technical Debt: An Empirical Study on Machine Learning Software"
bib: |
    @inproceedings{obrien23shades,
        author = {David OBrien and Sumon Biswas and Sayem Mohammad Imtiaz and Rabe Abdalkareem and Emad Shihab and Hridesh Rajan},
        title = {23 Shades of Self-Admitted Technical Debt: An Empirical Study on Machine Learning Software},
        booktitle = {Proceedings of the 30th ACM Joint European Software Engineering Conference and Symposium on the Foundations of Software Engineering},
        location = {Singapore, Singapore},
        month = {November 14--18},
        year = {2022},
        entrysubtype = {conference},
        abstract = {
            In software development, the term “technical debt” (TD) is used to characterize short-term solutions and workarounds implemented in source code which may incur a long-term cost. Technical debt has a variety of forms and can thus affect multiple qualities of software including but not limited to its legibility, performance, and structure. In this paper, we have conducted a comprehensive study on the technical debt in machine learning (ML) based software. TD can appear differently in ML software by infecting the data that ML models are trained on, thus affecting the functional performance of ML systems. The growing inclusion of ML components in modern software systems have introduced a new set of TDs. Does ML software have similar TDs to traditional software? If not, what are the new types of machine learning specific technical debts? Which ML pipeline stages do these debts appear? Do these debts differ in ML tools and applications and when they get removed? Currently, we do not know the state of the ML TDs in the wild. To address these questions, we mined 68,820 self admitted technical debts (SATD) from all the revisions of a curated dataset consisting of 2,641 popular ML repositories from GitHub, along with their introduction and removal. By applying an open-coding scheme and following upon prior works, we provided a comprehensive taxonomy of ML SATDs. Our study analyzes ML SATD type organizations, their frequencies within stages of ML software, the differences between ML SATDs in applications and tools, and quantifies the removal of ML SATDs. The findings discovered suggest implications for ML developers and researchers to create maintainable ML systems.
        }
    }
kind: conference
download_link: 23Shades-fse22.pdf
publication_year: 2022
tags:
  - boa
---
