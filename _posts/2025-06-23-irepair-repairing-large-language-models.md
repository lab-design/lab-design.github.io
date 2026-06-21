---
title: "Can you fix a large language model without breaking everything else it does?"
venue: "FSE 2025"
---

Large language models absorb the biases in their training data, which surfaces as toxic or inaccurate output. The usual remedy, further training, adjusts the whole model at once. That tends to repair poorly and can degrade abilities that were working fine.

IRepair, presented at FSE 2025 by Sayem Mohammad Imtiaz, Astha Singh, Fraol Batole, and Hridesh Rajan, takes a more targeted approach. Borrowing the idea of program slicing from software analysis, IRepair dynamically identifies the parts of a model most responsible for an error and concentrates the repair there, leaving the rest of the model's behavior alone. In a toxicity-reduction setting across GPT-2 and GPT-Neo models, it repaired errors 43.6% more effectively than the closest baseline while causing 46% less disruption to general performance.

The work also found that errors concentrate in a small portion of a model, which is why a focused repair does better than adjusting everything at once. It is part of our lab's work on making AI-enabled systems dependable.

This work is part of [Modular and Dependable AI](/research/#modular-and-dependable-ai). The full paper is available [here](https://lab-design.github.io/papers/FSE-25a/).
