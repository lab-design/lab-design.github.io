---
key: ESEC-FSE-20b
permalink: /papers/ESEC-FSE-20b/
short_name: ESEC-FSE '20
title: On Decomposing a Deep Neural Network into Modules
bib: |
  @inproceedings{pan20decomposing,
    author = {Rangeet Pan and Hridesh Rajan},
    title = {On Decomposing a Deep Neural Network into Modules},
    booktitle = {ESEC/FSE'2020: The 28th ACM Joint European Software Engineering Conference and Symposium on the Foundations of Software Engineering},
    location = {Sacramento, California, United States},
    month = {November 8-November 13, 2020},
    year = {2020},
    entrysubtype = {conference},
    abstract = {
      Deep learning is being incorporated in many modern software systems.
      Deep learning approaches train a deep neural network (DNN) model using
      training examples, and then use the DNN model for prediction. While the
      structure of a DNN model as layers is observable, the model is treated in
      its entirety as a monolithic component. To change the logic implemented
      by the model, e.g. to add/remove logic that recognizes inputs belonging
      to a certain class, or to replace the logic with an alternative, the
      training examples need to be changed and the DNN needs to be retrained
      using the new set of examples. We argue that decomposing a DNN into DNN
      modules-akin to decomposing a monolithic software code into modules-can
      bring the benefits of modularity to deep learning. In this work, we
      develop a methodology for decomposing DNNs for multi-class problems into
      DNN modules. For four canonical problems, namely MNIST, EMNIST, FMNIST,
      and KMNIST, we demonstrate that such decomposition enables reuse of DNN 
      modules to create different DNNs, enables replacement of one DNN module
      in a DNN with another without needing to retrain. The DNN models formed
      by composing DNN modules are at least as good as traditional monolithic
      DNNs in terms of test accuracy for our problems.

    }
  }
kind: conference
download_link: modularity.pdf
publication_year: 2020
tags:
  - boa
---
