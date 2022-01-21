---
key: ICSE-21
permalink: /papers/ICSE-21/
short_name: ICSE '21
title: "DeepLocalize: Fault Localization for Deep Neural Networks"
bib: |
  @inproceedings{wardat21deeplocalize,
    author = {Mohammad Wardat and Wei Le and Hridesh Rajan},
    title = {DeepLocalize: Fault Localization for Deep Neural Networks},
    booktitle = {ICSE'21: The 43nd International Conference on Software Engineering},
    location = {Virtual Conference},
    month = {May 23-May 29, 2021},
    year = {2021},
    entrysubtype = {conference},
    abstract = {
      Deep neural networks (DNNs) are becoming an integral part of most
      software systems. Previous work has shown that DNNs have bugs.
      Unfortunately, existing debugging techniques don’t support localizing
      DNN bugs because of the lack of understanding of model behaviors.
      The entire DNN model appears as a black box. To address these problems,
      we propose an approach and a tool that automatically determines whether
      the model is buggy or not, and identifies the root causes for DNN errors.
      Our key insight is that historic trends in values propagated between
      layers can be analyzed to identify faults, and also localize faults.
      To that end, we first enable dynamic analysis of deep learning
      applications: by converting it into an imperative representation and
      alternatively using a callback mechanism. Both mechanisms allows us
      to insert probes that enable dynamic analysis over the traces produced
      by the DNN while it is being trained on the training data.
      We then conduct dynamic analysis over the traces to identify the faulty
      layer or hyperparameter that causes the error. We propose an algorithm
      for identifying root causes by capturing any numerical error and
      monitoring the model during training and finding the relevance of every
      layer/parameter on the DNN outcome. We have collected a benchmark
      containing 40 buggy models and patches that contain real errors in
      deep learning applications from Stack Overflow and GitHub. Our benchmark
      can be used to evaluate automated debugging tools and repair techniques.
      We have evaluated our approach using this DNN bug-and-patch benchmark,
      and the results showed that our approach is much more effective than
      the existing debugging approach used in the state-of-the-practice
      Keras library. For 34/40 cases, our approach was able to detect faults
      whereas the best debugging approach provided by Keras detected 32/40
      faults. Our approach was able to localize 21/40 bugs whereas Keras
      did not localize any faults.
    }
  }
kind: conference
download_link: deeplocalize.pdf
publication_year: 2021
tags:
  - boa
---
