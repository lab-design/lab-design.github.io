---
key: ECOOP-2008
permalink: /papers/ECOOP-2008/
short_name: ECOOP '08
title: "Ptolemy: A Language with Quantified, Typed Events"
bib: |
  @inproceedings{RajanLeavens2008a,
    author = {Hridesh Rajan and Gary T. Leavens},
    title = {Ptolemy: A Language with Quantified, Typed Events},
    booktitle = {{ECOOP} 2008 - Object-Oriented Programming, 22nd European Conference, Paphos, Cyprus, July 7-11, 2008, Proceedings},
    volume = {5142},
    series = {Lecture Notes in Computer Science},
    pages = {155--179},
    year = {2008},
    publisher = {Springer},
    editor = {Jan Vitek},
    doi = {10.1007/978-3-540-70592-5\_8},
    abstract = {
    Implicit invocation and aspect-oriented languages provide related but distinct
    mechanisms for separation of concerns. Implicit invocation languages have
    explicitly announced events, which runs registered observer methods.
    Aspect-oriented languages have implicitly announced events, called "join
    points," which run method-like but more powerful advice. A limitation of
    implicit invocation languages is their inability to refer to a large set of
    events succinctly. They also lack the expressive power of advice, and require
    code to manage event registration and announcement. Aspect-oriented languages
    also have several limitations, including the potential for fragile dependence
    on syntactic structure that may hurt maintain ability, limits in the set of
    join points and the reflective contextual information that they make
    available.

    Quantified, typed events solve all these problems. They extend implicit
    invocation languages with a key idea from aspect- oriented languages: the
    ability to quantify over events (join points). Programmers declare named event
    types that contain information about the names and types of event arguments
    (exposed context). An event type declaratively identifies an expression as an
    event. This event type can then be used to quantify over all such events.
    Event types reduce the coupling between the observers and the set of events,
    and similarly between the advising and advised code.},
  }
kind: conference
download_link: ptolemy.pdf
publication_year: 2008
tags:
  - ptolemy
---
