---
key: TR-08-07
permalink: /papers/TR-08-07/
short_name: TR-08-07
title: Reconciling Trust and Modularity Goals in Web Services
bib:  |
  @techreport{rajan2009reconciling,
    title = {Reconciling Trust and Modularity Goals in Web Services},
    author = {Rajan, Hridesh and Tao, Jia and Shaner, Steve M and Leavens, Gary T},
    year = {2009},
    month = {March},
    institution = {Iowa State University, Dept. of Computer Science},
    number = {08-07},
    abstract = {
      Web services are distributed software components, that are decoupled from each
      other using interfaces with speciﬁed functional behaviors. However, such
      behavioral speciﬁcations are insufﬁcient to demonstrate compliance with
      certain temporal non-functional policies. We show an example demonstrating
      that a patient’s health-related query sent to a health care service is
      answered only by a doctor (and not by a secretary). Demonstrating compliance
      with such policies is important for satisfying governmental privacy
      regulations. It is often necessary to expose the internals of the web service
      implementation for demonstrating such compliance, which may compromise
      modularity. In this work, we provide a language design that enables such
      demonstrations, while hiding majority of the service’s source code. The key
      idea is to use greybox speciﬁcations to allow service providers to selectively
      hide and expose parts of their implementation. The overall problem of showing
      compliance is then reduced to two subproblems: whether the desired properties
      are satisﬁed by the service’s greybox speciﬁcation, and whether this greybox
      speciﬁcation is satisﬁed by the service’s implementation. We specify policies
      using LTL and solve the ﬁrst problem by model checking. We solve the second
      problem by reﬁnement techniques.
    }
  }
kind: technical_report
download_link: Rajan-Tao-Shaner-Leavens-TR-08-07.pdf
publication_year: 2008
tags:
  - tisa
---
