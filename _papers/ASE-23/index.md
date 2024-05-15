---
key: ASE-23
permalink: /papers/ASE-23/
short_name: ASE '23
title: Mutation-based Fault Localization of Deep Neural Networks
bib: |
  @inproceedings{ghanbari2023deepmufl,
    author = {Ghanbari, Ali and Thomas, Deepak-George and Arshad, Muhammad Arbab and Rajan, Hridesh},
    title = {Mutation-based Fault Localization of Deep Neural Networks},
    booktitle = {ASE'2023: 38th IEEE/ACM International Conference on Automated Software Engineering},
    location = {Kirchberg, Luxembourg},
    month = {September 11--15},
    year = {2023},
    entrysubtype = {conference},
    abstract = {
      Deep neural networks (DNNs) are susceptible to bugs, just like other types of software systems. A significant uptick in using DNN, and its applications in wide-ranging areas, including safety-critical systems, warrant extensive research on software engineering tools for improving the reliability of DNN-based systems. One such tool that has gained significant attention in the recent years is DNN fault localization. This paper revisits mutation-based fault localization in the context of DNN models and proposes a novel technique, named deepmufl, applicable to a wide range of DNN models. We have implemented deepmufl and have evaluated its effectiveness using 109 bugs obtained from StackOverflow. Our results show that deepmufl detects 53/109 of the bugs by ranking the buggy layer in top-1 position, outperforming state-of-the-art static and dynamic DNN fault localization systems that are also designed to target the class of bugs supported by deepmufl. Moreover, we observed that we can halve the fault localization time for a pre-trained model using mutation selection, yet losing only 7.55% of the bugs localized in top-1 position.
    }
  }
kind: conference
download_link: ase23.pdf
publication_year: 2023
tags:
  - boa
---
