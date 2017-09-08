---
key: BagherzadehPhDThesis
permalink: /papers/thesis/BagherzadehPhDThesis.html
short_name: Bagherzadeh PhD Thesis
title: Toward a Concurrent Programming Model with Modular Reasoning
bib:  |
  @phdthesis{bagherzadeh2016toward,
    title = {Toward a Concurrent Programming Model with Modular Reasoning},
    author = {Bagherzadeh, Mehdi},
    year = {2016},
    school = {Iowa State University},
    abstract = {
      Modular reasoning and concurrent programming are both necessary for scalable
      development of performant software. Modular reasoning improves scalability by
      allowing a program to be understood one module at a time. Concurrent
      programming improves the performance by allowing simultaneous executions of
      multiple computations in a single program. However, modular reasoning about a
      con- current program is difficult because of its thread interference, module
      inheritance and nondeterministic message orders. The statement of this thesis
      is that there exists a concurrent programming model that enables modular
      reasoning about behaviors of its programs in the presence of interference,
      inheritance and nondeterministic message orders using the following three
      ideas.

      The first idea is an interference control framework that enables modular
      reasoning in the presence of interference. The technical innovations of the
      interference control framework are its sparse interference and cognizant
      interference properties that allow for standard Hoare-style modular reasoning
      about a concurrent program. Sparse and cognizant interference guarantee that
      interference happens only at explicitly specified program points and the
      interference behavior is statically known, respectively.

      The second idea is concurrent behavioral subtyping that enables modular
      reasoning in the presence of inheritance. The technical innovations of
      concurrent behavioral subtyping are a new definition of behavioral subtyping
      for a concurrent program in terms of standard interface subtyping and a novel
      interference subtyping and show that in the presence of encapsulated
      inheritance the interface subtyping is sufficient to guarantee concurrent
      behavioral subtyping.

      The third and last idea is order types that enables modular reasoning in the
      presence of nondeter- ministic message orders. The technical innovations of
      order types are to disallow message races using existential types that capture
      unknown module dependencies, abstraction that hides local messaging behavior
      of the module in its order type and a blame assignment that properly blames
      the module with bad expression composition or bad module composition and not
      the module in which the race happens.

      These three ideas have the potential to ease software engineering of
      concurrent systems by improv- ing a developer’s ability to design, implement,
      test and evolve their software one module at a time.
    }
  }
kind: thesis
download_link: /papers/thesis/BagherzadehPhDThesis.pdf
publication_year: 2016
tags:
  - panini
---
