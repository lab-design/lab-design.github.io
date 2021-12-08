---
key: ICSE-22a
permalink: /papers/ICSE-22a/
short_name: ICSE '22
title: Decomposing Convolutional Neural Networks into Reusable and Replaceable Modules
bib: |
  @inproceedings{pan22decomposing,
    author = {Rangeet Pan and Hridesh Rajan},
    title = {Decomposing Convolutional Neural Networks into Reusable and Replaceable Modules},
    booktitle = {ICSE'22: The 44th International Conference on Software Engineering},
    location = {Pittsburgh, PA, USA},
    month = {May 21-May 29, 2022},
    year = {2022},
    entrysubtype = {conference},
    abstract = {
      Training from scratch is the most common way to build a Convolutional Neural Network (CNN) based model. What if we can build new CNN models by reusing parts from previously build CNN models? What if we can improve a CNN model by replacing (possibly faulty) parts with other parts? In both cases, instead of training, can we identify the part responsible for each output class (module) in the model(s) and reuse or replace only the desired output classes to build a model? Prior work has proposed decomposing dense-based networks into modules (one for each output class) to enable reusability and replaceability in various scenarios. However, this work is limited to the dense layers and based on the one-to-one relationship between the nodes in consecutive layers. Due to the shared architecture in the CNN model, prior work cannot be adapted directly. In this paper, we propose to decompose a CNN model used for image classification problems into modules for each output class. These modules can further be reused or replaced to build a new model. We have evaluated our approach with CIFAR-10, CIFAR-100, and ImageNet tiny datasets with three variations of ResNet models and found that enabling decomposition comes with a small cost (2.38% and 0.81% for top-1 and top-5 accuracy, respectively). Also, building a model by reusing or replacing modules can be done with a 2.3% and 0.5% average loss of accuracy. Furthermore, reusing and replacing these modules reduces 𝐶𝑂2𝑒 emission by ∼37 times compared to training the model from scratch.
    }
  }
kind: conference
download_link: cnnmodularity.pdf
publication_year: 2022
tags:
  - boa
---
