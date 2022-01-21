---
key: ICSE-20a
permalink: /papers/ICSE-20a/
short_name: ICSE '20
title: Repairing Deep Neural Networks Fix Patterns and Challenges
bib: |
  @inproceedings{islam20repairing,
    author = {Md Johirul Islam and Rangeet Pan and Giang Nguyen and Hridesh Rajan},
    title = {Repairing Deep Neural Networks: Fix Patterns and Challenges},
    booktitle = {ICSE'20: The 42nd International Conference on Software Engineering},
    location = {Seoul, South Korea},
    month = {May 23-May 29, 2020},
    year = {2020},
    entrysubtype = {conference},
    abstract = {
      Significant interest in applying Deep Neural Network (DNN)
      has fueled the need to support engineering of software that
      uses DNNs.
      Repairing software that uses DNNs is one such unmistakable SE
      need where automated tools could be very helpful; however,
      we do not fully understand challenges to repairing and
      patterns that are utilized when manually repairing them.
      What challenges should automated repair tools address?
      What are the repair patterns whose automation could help
      developers? Which repair patterns should be assigned a
      higher priority for automation?
      This work presents a comprehensive study of bug fix patterns
      to address these questions.
      We have studied 415 repairs from Stack Overflow and 555 repairs from
      GitHub for five popular deep learning libraries Caffe, Keras,
      Tensorflow, Theano, and Torch to understand challenges in
      repairs and bug repair patterns.
      Our key findings reveal that
      DNN bug fix patterns are distinctive compared to traditional bug fix patterns;  
      the most common bug fix patterns are fixing data dimension and neural network connectivity;
      DNN bug fixes have the potential to introduce adversarial vulnerabilities;
      DNN bug fixes frequently introduce new bugs; and
      DNN bug localization, reuse of trained model, and coping with frequent releases
      are major challenges faced by developers when fixing bugs.
      We also contribute a benchmark of 667 DNN (bug, repair) instances.

    }
  }
kind: conference
download_link: bugrepair.pdf
publication_year: 2020
tags:
  - boa
---
