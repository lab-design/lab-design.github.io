---
key: WiSec-2008
permalink: /papers/WiSec-2008/
short_name: WiSec '08
title: "Slede: A Domain-Specific Verification Framework for Sensor Network Security Protocol Implementations"
bib: |
  @inproceedings{hanna2008slede-b,
    author = {Youssef Hanna and Hridesh Rajan and Wensheng Zhang},
    title = {Slede: A Domain-Specific Verification Framework for Sensor Network Security Protocol Implementations},
    booktitle = {ACM Conference on Wireless Network Security (WiSec)},
    location = {Alexandria, Virginia, USA.},
    month = {March 31 -- April 2},
    year = {2008},
    entrysubtype = {conference},
    abstract = {
      Finding flaws in security protocol implementations is hard. Finding flaws in
      the implementations of sensor network security protocols is even harder
      because they are designed to protect against more system failures compared to
      traditional protocols. Formal verification techniques such as model checking,
      theorem proving, etc, have been very successful in the past in detecting
      faults in security protocol specifications; however, they generally require
      that a formal description of the protocol, often called model, is developed
      before the verification can start. There are three factors that make model
      construction, and as a result, formal verification is hard. First, knowledge
      of the specialized language used to construct the model is necessary. Second,
      upfront effort is required to produce an artifact that is only useful during
      verification, which might be considered wasteful by some, and third, manual
      model construction is error prone and may lead to inconsistencies between the
      implementation and the model. The key contribution of this work is Slede, an
      approach for automated formal verification of sensor network security
      protocols. Technical underpinnings of our approach includes a technique for
      automatically extracting a model from the nesC implementations of a security
      protocol, a technique for composing this extracted model with models of
      intrusion and network topologies, and a technique for translating the results
      of the verification process to domain terms. Our approach is sound and
      complete within bounds, i.e. if it reports a fault scenario for a protocol,
      there is indeed a fault and our framework terminates for a network topology of
      given size; otherwise no faults in the protocol are present that can be
      exploited in the network topology of that size or less using the given
      intrusion model. Our approach also does not require upfront model
      construction, which significantly decreases the cost of verification.
    }
  }
kind: conference
download_link: slede-wisec-08.pdf
publication_year: 2008
tags:
  - slede
---

A previous version of this paper appeared as [Technical Report 07-09](/papers/TR-07-09),
Iowa State University, June 11, 2007.

See also the following for a preliminary poster paper on this topic:
[](/papers/SIGSOFT-SEN-06/)
