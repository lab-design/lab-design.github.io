---
key: SOC-08
permalink: /papers/SOC-08/
short_name: IEEE SOC '08
title: "Tisa: Toward Trustworthy Services in a Service-Oriented Architecture"
bib: |
  @article{RajanHosamani2008,
    author = {Hridesh Rajan and Mahantesh Hosamani},
    title = {Tisa: Toward Trustworthy Services in a Service-Oriented Architecture},
    journal = {{IEEE} Trans. Serv. Comput.},
    volume = {1},
    number = {4},
    pages = {201--213},
    year = {2008},
    doi = {10.1109/TSC.2008.18},
    abstract = {
    Verifying whether a service implementation is conforming to its service-level
    agreements is important to inspire confidence in services in a
    service-oriented architecture. A part of these agreements, in particular those
    that are functional in nature, can be checked by observing the published
    interface of the service, but other agreements that are more non-functional in
    nature, are often verified by deploying a monitor that observes the execution
    of the service implementation.

    A key problem is that such a monitor must execute in an untrusted environment
    (at the service provider's site). Thus, integrity of the results reported by
    such a monitor crucially depends on its integrity.

    The key technical contribution of this article is an extension of the
    traditional notion of a service-oriented architecture that allows clients,
    brokers and providers to negotiate and validate the integrity of a
    requirements monitor. We describe an approach, based on hardware-based root of
    trust, for verifying the integrity of a requirements monitor executing in an
    untrusted environment. We make two basic claims: first, that it is feasible to
    realize our approach using existing hardware and software solutions, and
    second, that integrity verification can be done at a relatively small
    overhead. To evaluate our feasibility claim, we present a realization of our
    approach using a commercial requirements monitor. To measure overhead, we have
    conducted a case study using a collection of web service implementations
    available with Apache Axis implementation.},
  }
kind: journal
download_link: Rajan-Hosamani-2008.pdf
publication_year: 2008
tags:
  - tisa
---
