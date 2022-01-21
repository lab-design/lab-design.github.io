---
key: ESEC-FSE-09
permalink: /papers/ESEC-FSE-09/
short_name: ESEC/FSE '09
title: Behavioral Automata Composition for Automatic Topology Independent Verification of Parameterized Systems
bib: |
  @inproceedings{hanna2009behavioral-b,
    author = {Youssef Hanna and Samik Basu and Hridesh Rajan},
    title = {Behavioral Automata Composition for Automatic Topology Independent Verification of Parameterized Systems},
    booktitle = {The 7th joint meeting of the European Software Engineering Conference and the ACM SIGSOFT Symposium on the Foundations of Software Engineering (ESEC/FSE 09)},
    year = {2009},
    month = {August},
    address = {Amsterdam, The Netherlands},
    entrysubtype = {conference},
    abstract = {
      Verifying correctness properties of parameterized systems is a long-standing
      problem. The challenge lies in the lack of guarantee that the property is
      satisfied for all instances of the parameterized system. Existing work on
      addressing this challenge aims to reduce this problem to checking the
      properties on smaller systems with a bound on the parameter referred to as the
      cut-off. A property satisfied on the system with the cut-off ensures that it
      is satisfied for systems with any larger parameter. The major problem with
      these techniques is that they only work for certain classes of systems with
      specific communication topology such as ring topology, thus leaving other
      interesting classes of systems unverified. We contribute an automated
      technique for finding the cut-off of the parameterized system that works for
      systems defined with any topology. Given the specification and the topology of
      the system, our technique is able to automatically generate the cut-off
      specific to this system. We prove the soundness of our technique and
      demonstrate its effectiveness and practicality by applying it to several
      canonical examples where in some cases, our technique obtains smaller cut-off
      values than those presented in the existing literature.
    }
  }
kind: conference
download_link: esec-fse-09.pdf
publication_year: 2009
tags:
  - slede
---

See also the ISU tech report, [TR09-17](/papers/TR-09-17/).
