---
key: ICLR-22
permalink: /papers/ICLR-22/
short_name: ICLR '22
title: "A Global Convergence Theory for Deep ReLU Implicit Networks via Over-Parameterization"
bib: |
  @inproceedings{gao22global,
    author = {Tianxiang Gao and Hailiang Liu and Jia Liu and Hridesh Rajan and Hongyang Gao},
    title = {A Global Convergence Theory for Deep ReLU Implicit Networks via Over-Parameterization},
    booktitle = {ICLR'22: The 10th International Conference on Learning Representations},
    location = {Virtual},
    month = {April 25-April 29},
    year = {2022},
    entrysubtype = {conference},
    abstract = {
      Implicit deep learning has received increasing attention recently, since
      it generalizes the recursive prediction rules of many commonly used
      neural network architectures. Its prediction rule is provided implicitly
      based on the solution of an equilibrium equation. Although many recent
      studies have experimentally demonstrates its superior performances, the
      theoretical understanding of implicit neural networks is limited. In
      general, the equilibrium equation may not be well-posed during the training.
      As a result, there is no guarantee that a vanilla (stochastic) gradient
      descent (SGD) training nonlinear implicit neural networks can converge.
      This paper fills the gap by analyzing the gradient flow of Rectified Linear
      Unit (ReLU) activated implicit neural networks. For an m-width implicit
      neural network with ReLU activation and n training samples, we show that
      a randomly initialized gradient descent converges to a global minimum at a
      linear rate for the square loss function if the implicit neural network is
      over-parameterized. It is worth noting that, unlike existing works on the
      convergence of (S)GD on finite layer over-parameterized neural networks,
      our convergence results hold for implicit neural networks, where the
      number of layers is infinite.
    }
  }
kind: conference
download_link: implicit_nn.pdf
publication_year: 2022
---
