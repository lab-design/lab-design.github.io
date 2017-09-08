---
key: LongMSThesis
permalink: /papers/thesis/LongMSThesis.html
short_name: Long MS Thesis
title: Implicit Invocation Meets Safe, Implicit Concurrency
bib:  |
  @mastersthesis{long2010implicit-a,
    title = {Implicit invocation meets safe, implicit concurrency},
    author = {Long, Yuheng},
    year = {2010},
    school = {Iowa State University},
    abstract = {
      Writing correct and efficient concurrent programs still remains a challenge.
      Explicit concurrency is difficult, error prone, and creates code which is hard
      to maintain and debug. This type of concurrency also treats modular program
      design and concurrency as separate goals, where modularity often suffers. To
      solve these problems, we are designing a new language that we call Panini. In
      this work, we focus on Panini's asynchronous, typed events which reconcile the
      modularity goal promoted by the implicit invocation design style with the
      concurrency goal of exposing potential concurrency between the execution of
      subjects and observers. Since modularity is improved and concurrency is
      implicit in Panini, programs are easier to reason about and maintain. The
      language incorporates a static analysis to determine potential conflicts
      between handlers and a dynamic analysis which uses the conflict information to
      determine a safe order for handler invocation. This mechanism avoids races and
      deadlocks entirely, yielding programs with a guaranteed deterministic
      semantics. To evaluate our language design and implementation we show several
      examples of its usage as well as an empirical study of program performance. We
      found that not only is developing and understanding programs significantly
      easier compared to standard concurrent object-oriented programs, but also
      performance of Panini programs is comparable to their equivalent hand-tuned
      versions written using Java's fork-join framework.
    }
  }
kind: thesis
download_link: http://lib.dr.iastate.edu/etd/11853/
publication_year: 2010
tags:
  - panini
---
