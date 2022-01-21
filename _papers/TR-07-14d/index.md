---
key: TR-07-14d
permalink: /papers/TR-07-14d/
short_name: TR-07-14d
title: Quantified, Typed Events for Improved Separation of Concerns
bib:  |
  @techreport{rajan2008quantified,
    title = {Quantified, typed events for improved separation of concerns},
    author = {Rajan, Hridesh and Leavens, Gary T},
    month = {May},
    year = {2008},
    institution = {Iowa State University, Dept. of Computer Science},
    number = {07-14d},
    abstract = {
      Implicit invocation and aspect-oriented languages provide related but distinct
      mechanisms for separation of concerns. Implicit invocation languages have
      explicitly announced events, which runs registered observer methods.
      Aspect-oriented languages have implicitly announced events, called ``join
      points,'' which run method-like but more powerful advice. A limitation of
      implicit invocation languages is their inability to refer to a large set of
      events succinctly. They also lack the expressive power of aspect-oriented
      advice, and require code to manage event registration and announcement.
      Aspect-oriented languages also have several limitations, including the potential
      for fragile dependence on syntactic structure that may hurt maintainability,
      limits in the set of join points and the reflective contextual information that
      they make available. Quantified, typed events solve all these problems. They
      extend implicit invocation languages with a key idea from aspect-oriented
      languages: the ability to quantify over events (join points). Programmers
      declare named event types that contain information about the names and types of
      event arguments (exposed context). An event type declaratively identifies an
      expression as an event. This event type can then be used to quantify over all
      such events. Event types reduce the coupling between the observers and the set
      of events, and similarly between the advising and advised code.
    }
  }
kind: technical_report
download_link: http://lib.dr.iastate.edu/cs_techreports/249/
publication_year: 2007
tags:
  - ptolemy
---
