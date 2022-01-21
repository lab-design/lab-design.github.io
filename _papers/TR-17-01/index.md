---
key: TR-17-01
permalink: /papers/TR-17-01/
short_name: TR-17-01
title: "Combining Event-driven and Capsule-oriented Programming to Improve Integrated System Design"
bib:  |
  @techreport{maddox2017-a,
     title = {Combining Event-driven and Capsule-oriented Programming to Improve Integrated System Design},
     author = {Maddox, Jackson},
     year = {2017},
     month = {July},
     institution = {Iowa State University, Dept. of Computer Science},
     number = {17-01},
     abstract = {
      As concurrent software becomes more pervasive, models that provide both safe
      concurrency and modular reasoning become more important.
      Panini is one such model, and provides both sparse and cognizant interference
      based around the concept of capsules.
      Additionally, web frameworks, Graphical User Interface (GUI) libraries, and
      other projects are event-driven in nature, making events a commonly used
      programming paradigm for certain tasks.
      However, it would be difficult to use Panini in an event-driven manner, where
      there may be multiple capsules interested in a given event.
      Therefore, by integrating capsules and events one would be able to apply
      Panini's modular reasoning to commonly event-driven tasks more easily.
      Several challenges must be addressed in the integration.
      These are defining the semantics of event messages, scheduling of handlers to
      maximize concurrency, and how to keep to Panini's current semantics which allow
      modular reasoning.
      To solve this problem, @Paninij, an implementation of Panini, is extended to add
      event mechanisms to capsules.
      As a result, this new combined model allows capsules to interact using both
      procedures and event announcements.
      This extension of Panini is helpful for writing concurrent, modular software
      that lends itself more naturally to event-driven programming.
     }
  }
kind: technical_report
download_link: http://lib.dr.iastate.edu/cs_techreports/382/
publication_year: 2017
tags:
  - panini
---
