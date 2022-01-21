---
key: TR-10-09
permalink: /papers/TR-10-09/
short_name: TR-10-09
title: A Type-and-Effect System for Shared Memory, Concurrent Implicit Invocation Systems
bib: |
  @techreport{long2011type,
    author = {Yuheng Long, Tyler Sondag, and Hridesh Rajan},
    title = {A Type-and-Effect System for Shared Memory, Concurrent Implicit Invocation Systems},
    institution = {Iowa State University, Department of Computer Science},
    year = {2011},
    number = {10-09},
    institution = {Iowa State University, Dept. of Computer Science},
    month = {June},
    abstract = {
      The notion of events in distributed publish-subscribe systems implies safe
      concurrency. However, that implication does not hold in object-oriented (OO)
      programs that utilize events for modularity. This is because unlike the
      distributed setting, where publisher and subscriber do not share state and
      only communicate via messages, additional communication between publisher and
      subscriber, e.g. via call-back or shared state, is common in OO programs that
      use events.

      Static type-and-effect systems can help expose potential concurrency, however,
      they are too conservative to handle an event-based idiom that involves zero or
      more dynamic dispatches on receiver objects in a dynamically changing list. To
      solve these problems, we present a hybrid (static/dynamic) type-and-effect
      system for exposing concurrency in event-based OO programs. This
      type-and-effect system provides deadlock and data race freedom in such usage
      of the event idiom. We have implemented this type-and-effect system as an
      extension of Java's type system and it shows considerable speedup over the
      sequential version of several applications (up to 15.7x) at a negligible
      overhead.
    }
  }
kind: technical_report
download_link: TR.pdf
publication_year: 2010
tags:
  - panini
---
