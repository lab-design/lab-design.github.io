---
title: "When is it safe to swap one piece of code for another? Our ESEC/FSE 2018 paper studies the effects."
---

Most software is built from parts that do more than compute a value. They read and write files, throw exceptions, acquire locks, and otherwise produce side-effects. To understand a class, or to replace it with another, a developer has to understand those effects, because two classes that return the same results can still behave very differently in how they touch the rest of the system.

In this paper (ESEC/FSE 2018), Jackson Maddox, Yuheng Long, and Hridesh Rajan studied substitutability in the presence of effects across a large body of code. By taking effects into account rather than looking only at types or return values, the study gives a more honest picture of when one component can actually stand in for another.

This work is part of [Analyzing Software at Scale, with Boa](/research/#software-at-scale); for the wider story, see [our overview](/news/2025/12/10/analyzing-software-at-scale-with-boa/). The full paper is available [here](https://lab-design.github.io/papers/FSE-18/).
