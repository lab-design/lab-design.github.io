---
key: ESEC-FSE-23a
permalink: /papers/ESEC-FSE-23a/
short_name: ESEC-FSE '23
title: "Design by Contract for Deep Learning APIs"
bib: |
  @inproceedings{ahmed23dlcontract,
    author = {Shibbir Ahmed and Sayem Mohammad Imtiaz and Samantha Syeda Khairunnesa and Breno Dantas Cruz and Hridesh Rajan},
    title = {Design by Contract for Deep Learning APIs},
    booktitle = {ESEC/FSE'2023: The 31st ACM Joint European Software Engineering Conference and Symposium on the Foundations of Software Engineering},
    location = {San Francisco, California},
    month = {December 03-December 09},
    year = {2023},
    entrysubtype = {conference},
    abstract = {
      Deep Learning (DL) techniques are increasingly being incorporated in critical software systems today. DL software is buggy too. Recent work in SE has characterized these bugs, studied fix patterns, and proposed detection and localization strategies. In this work, we introduce a preventative measure. We propose design by contract for DL libraries, DL Contract for short, to document the properties of DL libraries and provide developers with a mechanism to identify bugs during development. While DL Contract builds on the traditional design by contract techniques, we need to address unique challenges. In particular, we need to document properties of the training process that are not visible at the functional interface of the DL libraries. To solve these problems, we have introduced mechanisms that allow developers to specify properties of the model architecture, data, and training process. We have designed and implemented DL Contract for Python-based DL libraries and used it to document the properties of Keras, a well-known DL library. We evaluate DL Contract in terms of effectiveness, runtime overhead, and usability. To evaluate the utility of DL Contract, we have developed 15 sample contracts specifically for training problems and structural bugs. We have adopted four well-vetted benchmarks from prior works on DL bug detection and repair. For the effectiveness, DL Contract correctly detects 259 bugs in 272 real-world buggy programs, from well-vetted benchmarks provided in prior work on DL bug detection and repair. We found that the DL Contract overhead is fairly minimal for the used benchmarks. Lastly, to evaluate the usability, we conducted a survey of twenty participants who have used DL Contract to find and fix bugs. The results reveal that DL Contract can be very helpful to DL application developers when debugging their code.
    }
  }
kind: conference
download_link: dlcontract.pdf
publication_year: 2023
tags:
  - mdl
---
