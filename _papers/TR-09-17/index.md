---
key: TR-09-17
permalink: /papers/TR-09-17/
short_name: TR-09-17
title: Behavioral Automata Composition for Automatic Topology Independent Verification of Parameterized Systems
bib:  |
  @techreport{hanna2009behavioral-a,
    author = {Hanna, Youssef and Basu, Samik and Rajan, Hridesh},
    title = {Behavioral Automata Composition for Automatic Topology Independent Verification of Parameterized Systems},
    booktitle = {Proceedings of the the 7th Joint Meeting of the European Software Engineering Conference and the ACM SIGSOFT Symposium on The Foundations of Software Engineering},
    series = {ESEC/FSE '09},
    year = {2009},
    isbn = {978-1-60558-001-2},
    location = {Amsterdam, The Netherlands},
    pages = {325--334},
    numpages = {10},
    url = {http://doi.acm.org/10.1145/1595696.1595758},
    doi = {10.1145/1595696.1595758},
    acmid = {1595758},
    publisher = {ACM},
    address = {New York, NY, USA},
    keywords = {parameterized model checking},
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
kind: technical_report
download_link: http://lib.dr.iastate.edu/cs_techreports/287/
publication_year: 2009
---

See also the conference paper from [ESEC/FSE '09](/papers/ESEC-FSE-09/).
