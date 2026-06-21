---
title: "How do you run a deep code analysis across hundreds of thousands of projects? Our ICSE 2018 paper shares the work."
---

Mining large collections of source code has become a standard way to study how software is written, but the deeper the analysis, the harder it is to run at scale. Spreading the work across many machines helps, yet it leaves a great deal of redundant computation in place, because many projects share similar code and the analysis repeats similar steps on each one.

Collective Program Analysis, presented at ICSE 2018 by Ganesha Upadhyaya and Hridesh Rajan, takes a different angle. Instead of treating every artifact as independent, it looks at how the analysis task interacts with the code it runs on and groups artifacts that the task would process in similar ways. The shared work is then computed once for a group rather than repeated for each member, which lets a deep analysis reach very large corpora.

This work is part of [Analyzing Software at Scale, with Boa](/research/#software-at-scale); for the wider story, see [our overview of reading the world's code at once](/news/2025/12/10/analyzing-software-at-scale-with-boa/). The full paper is available [here](https://lab-design.github.io/papers/ICSE-18a/).
