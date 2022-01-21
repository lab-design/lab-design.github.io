---
# Note this conference went by both "AOSD" and "Modularity" in 2012 and 2013.
# See http://modularity.info/conference/
key: AOSD-13
permalink: /papers/AOSD-13/
short_name: Modularity '13
title: On Exceptions, Events and Observer Chains
bib: |
  @inproceedings{bagherzadeh2013exceptions,
    author = {Mehdi Bagherzadeh and Hridesh Rajan and Ali Darvish},
    title = {On Exceptions, Events and Observer Chains},
    booktitle = {AOSD '13: 12th International Conference on Aspect-Oriented Software Development},
    location = {Fukuoka, Japan},
    month = {March},
    year = {2013},
    entrysubtype = {conference},
    abstract = {
      Modular understanding of behaviors and flows of exceptions may help in their
      better use and handling. Such reasoning tasks about exceptions face unique
      challenges in event-based implicit invocation (II) languages that allow
      subjects to implicitly invoke observers, and run the observers in a chain. In
      this work, we illustrate these challenge in Ptolemy and propose Ptolemy-X that
      enables modular reasoning about behaviors and flows of exceptions for event
      announcement and handling. Ptolemy-X's exception-aware specification
      expressions and boundary exceptions limit the set of (un)checked exceptions of
      subjects and observers of an event. Exceptional postconditions specify the
      behaviors of these exceptions. Greybox specifications specify the flows of
      these exceptions among the observers in the chain. Ptolemy-X's type system and
      refinement rules enforce these specifications and thus enable its modular
      reasoning. We evaluate the utility of Ptolemy-X's exception flow reasoning by
      applying it to understand a set of aspect-oriented (AO) bug patterns. We also
      present Ptolemy-X's semantics including its sound static semantics.
    }
  }
kind: conference
download_link: aosd13.pdf
publication_year: 2013
tags:
  - ptolemy
---
