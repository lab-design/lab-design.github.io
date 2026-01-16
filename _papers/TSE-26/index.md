---
key: TSE-26
permalink: /papers/TSE-26/
short_name: TSE '26
title: Typestate-based Fault Localization of API Usage Violations in a Deep Learning Program
bib: |
  @article{batole2026neuralstate,
    author = {Fraol Batole and Ruchira Manke and Robert Dyer and Tien N. Nguyen and Hridesh Rajan},
    title = {Typestate-based Fault Localization of API Usage Violations in a Deep Learning Program},
    journal = {IEEE Transactions on Software Engineering},
    month = {January},
    year = {2026},
    publisher = {IEEE},
    address = {New York, NY, USA},
    abstract = {
      Deep Learning (DL) applications have become essential in numerous domains, yet they remain plagued by subtle bugs that cause 66% of crashes in production systems. These failures primarily stem from API usage violations in complex frameworks like TensorFlow, Keras, and PyTorch, where APIs lack formal specifications and interdependencies between operations remain undocumented. Traditional static analysis tools fail to address DL-specific constraints, such as data dependency between layers. To bridge this critical gap, we propose NEURALSTATE, an approach to detect performance and program crash bugs in a DL program. NEURALSTATE follows a four-step process: (i) gather specifications for Deep Learning operations from different sources; (ii) introduce abstract states to represent these Deep Learning operations; (iii) design formal rules for transitioning between states based on the specifications; (iv) utilize a combination of standard analysis techniques (i.e., typestate and value propagation) to identify bugs in a DL program. Our evaluation on real-world benchmarks demonstrates NEURALSTATE’s effectiveness, achieving a 25% improvement in precision and 63% improvement in recall compared to state-of-the-art tools. Most importantly, NEURALSTATE successfully detects 18 subtle bugs in 45 real-world programs that existing techniques miss entirely. 
    },
  }
kind: journal
download_link: NeuralState.pdf
publication_year: 2026
tags:
  - boa
---
