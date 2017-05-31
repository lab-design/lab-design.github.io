---
key: FASE-11
permalink: /papers/FASE-11/
short_name: FASE '11
title: "Analyzing Software Updates: Should You Build a Dynamic Updating Infrastructure?"
bib: |
  @inproceedings{gharaibeh2011analyzing,
    author = {Bashar Gharaibeh and Hridesh Rajan and J. Morris Chang},
    title = {Analyzing Software Updates: Should You Build a Dynamic Updating Infrastructure?},
    booktitle = {Fundamental Approaches to Software Engineering (FASE)},
    location = {Saarbrücken, Germany},
    month = {Mar-Apr},
    year = {2011},
    entrysubtype = {conference},
    abstract = {
      The ability to adapt software systems to fix bugs, add/change features without
      restarting it is becoming important for many domains including but not limited
      to finance, social networking, control systems, etc. Fortunately, many ideas
      have begun to emerge under the umbrella term “dyanamic updating" to solve this
      problem. Dynamic updating is critical to address certain software evolution
      needs. Dynamic updating literature evaluates such systems in terms of coverage
      (i.e. what type of code changes are supported) and performance. How- ever, we
      do not have a technique to analyze whether certain updating solution, based on
      its costs and benefits, is suitable for an application.

      In this paper, we present a quantitative analysis model to fill this gap. Our
      model is parameterized and it can be instantiated with application-specific
      valuation func- tions. Given the software evolution history of the application
      under considera- tion, our model allows rigorous comparisons of the value of
      different software updating schemes (e.g. online vs. offline). We illustrate
      our model using two case studies inspired from the the evolution history of
      Xerces XML parser library and Apache httpd web server (Other case studies and
      evaluation examples are pre- sented in our technical report [Gharaibeh, Rajan
      and Chang 09]). The proposed analysis scheme can serve system architects in
      evaluating their current updating scheme. For example, to audit the system’s
      value during previous development cycles and whether a different updating
      scheme will generate higher value.
    }
  }
kind: conference
download_link: Gharaibeh-Rajan-Chang.pdf
publication_year: 2011
tags:
  - nu
---

A Previous version of this paper appeared as [Technical Report 09-27](/papers/TR-09-27/),
Computer Science, Iowa State University, October 2009.
