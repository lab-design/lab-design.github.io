---
title: "When a model fails, what is the error and how do you fix it?"
venue: "ICSE 2022"
---

Knowing that a deep neural network is faulty is only half the problem. A developer still has to work out what went wrong and what to change, and a failed training run offers little guidance on either. Two models that fail for very different reasons can look the same from the outside, and there are usually many possible fixes with no clear way to choose among them, from adjusting the learning rate to rescaling the data.

DeepDiagnosis, presented at the 44th International Conference on Software Engineering (ICSE 2022) by Mohammad Wardat, Breno Dantas Cruz, Wei Le, and Hridesh Rajan, goes a step beyond locating the fault. As a model trains, DeepDiagnosis watches for eight kinds of error condition, and when one appears it reports the symptom together with a message that tells the developer what to repair. The aim is not only to point at the faulty layer or setting but to recommend an action the developer can take.

We evaluated DeepDiagnosis on 444 models, 53 drawn from GitHub and Stack Overflow and 391 from the AUTOTRAINER benchmark. It diagnosed faults more accurately than earlier tools such as UMLAUT and our own DeepLocalize, and it did so for kinds of model those tools could not handle. It also localized faults faster than AUTOTRAINER. DeepDiagnosis is part of a longer effort in our lab to give deep learning the actionable debugging support that ordinary software already has.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai). The full paper is available [here](https://lab-design.github.io/papers/ICSE-22c/).
