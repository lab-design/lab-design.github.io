---
title: "When a model will not learn, where is the bug? Our ICSE 2021 paper tracks it down."
---

A deep neural network that will not train, or that stalls at poor accuracy, is one of the harder things to debug in modern software. Deep learning now sits inside many software systems, and like any other software these models contain bugs. A deep neural network (DNN) resists the usual tools, though: its structure as a sequence of layers is visible, but the model behaves as a single monolithic component, so when training goes wrong there is no line of code and no stack trace to blame. The symptoms, a loss that will not fall or an accuracy that stays low, tell you that something is wrong without telling you where.

DeepLocalize, presented at the 43rd International Conference on Software Engineering (ICSE 2021) by Mohammad Wardat, Wei Le, and Hridesh Rajan, asks whether the training process itself can be analyzed to find the fault. Our observation is that the values passed between layers during training carry a history, and that the way this history develops reveals both that a model is faulty and which layer or hyperparameter is responsible. To act on this, we make a deep learning program amenable to dynamic analysis, watch the values that flow through the network as it trains, and report the symptom together with the location of the fault behind it. In effect, DeepLocalize brings dynamic program analysis, a long-standing software engineering technique, to the inside of a learning model.

On benchmark models seeded with known bugs, DeepLocalize located faults earlier techniques had missed, and it did so with an explanation a developer can act on. By treating a learning model as something a software engineer can inspect, the work opened a line of research in our lab on making deep learning dependable.

This work is part of our research on [Modular and Dependable AI](/research/#modular-and-dependable-ai). The full paper is available [here](https://lab-design.github.io/papers/ICSE-21/).
