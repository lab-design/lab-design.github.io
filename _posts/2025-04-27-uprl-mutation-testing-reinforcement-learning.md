---
title: "Would your tests catch a real bug in a reinforcement-learning agent?"
---

Reinforcement learning trains agents for tasks such as driving a vehicle or controlling a robot, and before such an agent reaches production its tests need to be good enough to catch real problems. Mutation testing offers a way to measure that, by injecting faults and checking whether the tests notice, but it only works if the injected faults resemble the ones that actually occur.

µPRL, presented at ICSE 2025 by Deepak-George Thomas, Matteo Biagiola, Nargiz Humbatova, Mohammad Wardat, Gunel Jahangirova, Hridesh Rajan, and Paolo Tonella, builds that realism in. We first mined real faults in reinforcement-learning code and arranged them into a taxonomy, then derived mutation operators from those faults and implemented them in a tool. A test suite can then be measured against mutations that stand in for genuine bugs.

The result lets a team judge how well its tests would detect the faults that matter in reinforcement learning, rather than artificial ones. It is part of our lab's work on making AI-enabled systems dependable.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai). The full paper is available [here](https://lab-design.github.io/papers/ICSE-25a/).
