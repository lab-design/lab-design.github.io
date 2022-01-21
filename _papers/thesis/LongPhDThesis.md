---
key: LongPhDThesis
permalink: /papers/thesis/LongPhDThesis.html
short_name: Long PhD Thesis
title: Formal Foundations for Hybrid Effect Analysis
bib:  |
  @phdthesis{long2016formal,
    title={Formal foundations for hybrid effect analysis},
    author={Long, Yuheng},
    year={2016},
    school={Iowa State University},
    abstract = {
      Type-and-effect systems are a powerful tool for program construction and
      verification. Type-and- effect systems are useful because it help reduce bugs
      in computer programs, enable compiler optimiza- tions and provide program
      documentation. As software systems increasingly embrace dynamic features and
      complex modes of compilation, static effect systems have to reconcile over
      competing goals such as precision, soundness, modularity, and programmer
      productivity. In this thesis, we propose the idea of combining static and
      dynamic analysis for effect systems to improve precision and flexibility.

      We describe intensional effect polymorphism, a new foundation for effect
      systems that integrates static and dynamic effect checking. Our system allows
      the effect of polymorphic code to be intension- ally inspected. It supports a
      highly precise notion of effect polymorphism through a lightweight notion of
      dynamic typing. When coupled with parametric polymorphism, the powerful system
      utilizes runtime information to enable precise effect reasoning, while at the
      same time retains strong type safety guaran- tees. The technical innovations
      of our design include a relational notion of effect checking, the use of
      bounded existential types to capture the subtle interactions between static
      typing and dynamic typing, and a differential alignment strategy to achieve
      efficiency in dynamic typing.

      We introduce the idea of first-class effects, where the computational effect
      of an expression can be programmatically reflected, passed around as values,
      and analyzed at run time. A broad range of de- signs “hard-coded" in existing
      effect-guided analyses can be supported through intuitive programming
      abstractions. The core technical development is a type system with a couple of
      features. Our type sys- tem provides static guarantees to application-specific
      effect management properties through refinement types, promoting
      “correct-by-design" effect-guided programming. Also, our type system computes
      not only the over-approximation of effects, but also their
      under-approximation. The duality unifies the common theme of permission vs.
      obligation in effect reasoning.

      Finally, we show the potential benefit of intensional effects by applying it
      to an event-driven system to obtain safe concurrency. The technical
      innovations of our system include a novel effect system to soundly approximate
      the dynamism introduced by runtime handlers registration, a static analysis to
      pre- compute the effects and a dynamic analysis that uses the precomputed
      effects to improve concurrency. Our design simplifies modular concurrency
      reasoning and avoids concurrency hazards.
    }
  }
kind: thesis
download_link: /papers/thesis/LongPhDThesis.pdf
publication_year: 2016
tags:
  - panini
---
