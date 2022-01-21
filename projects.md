---
layout: page
---

{% assign papers = site.papers | sort: 'publication_year' %}

<div id="projects-markdown-toc" markdown="1">
1. TOC
{:toc}
</div>

## Active Research Projects
{: .research-header}

{% comment %}
### [Panini](panini/)
{:.no_toc}

### Panini {#panini}
{:.no-display}

This is crazy. ToC currently doesn't strip out the formatting on the header, so the regular header would link to the website rather than the location on the page. What you see above is a workaround for that.
{% endcomment %}

{% include projects_page.html name="Panini" link="panini/" %}

The Panini project is developing the capsule-oriented programming model.
This model is aimed at making concurrent software
development easier by providing two properties: (1) given a module it ought to
be possible to statically, and modularly identify all points in its code where
other modules might interfere (interference points), and (2) given a module and
the interfaces of other modules, that the subject module interacts with, it
ought to be possible to statically and modularly construct an upper bound on the
behavior of all potentially interferring tasks at each interference point. We
show that if a programming model has these two properties, then it is possible
to modularly reason about concurrent programs in that model. By the first
property, humans and tools can identify points where interference from other
concurrent tasks must be considered. By the second property, the computed upper
bound can be used for reasoning instead of needing the implementation of
interferring modules. Compared to alternatives, where reasoning either becomes a
global process or entails a global step, modular reasoning afforded by this
programming model makes both manual and automated reasoning about concurrent
software more scalable.

Following research papers document progress on this project:

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'panini' and paper.kind != 'technical_report' %}
  <li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

We have created two software systems that support this programming model so far:

- an extension of Java (and the reference compiler `javac`) that we call
  [PaniniJ](http://web.cs.iastate.edu/~panini/), and
- an annotation-based framework that uses annotation processing facilities,
  instead of syntax extensions, that we call [@PaniniJ](https://paninij.github.io).

PI Rajan and students on the Panini project thank the US National Science
Foundation for supporting our work under following grants:

- US National Science Foundation, [SHF:Small: Capsule-oriented Programming](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1423370).
  PI: Hridesh Rajan (2014-2017), Award amount: $450,098.

- US National Science Foundation, [CAREER:On Mutualism of Modularity and Concurrency Goals](https://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0846059).
  PI: Hridesh Rajan (2009-2016), Award amount: $565,935.

- US National Science Foundation, [SHF:Small:Phase-Based Tuning for Better Utilization of Performance-Asymmetric Multicores](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1117937). PI: Hridesh Rajan
  (2011-2016), Award amount: $416,000.

[More information about the Panini project](http://www.paninij.org)


{% include projects_page.html name="Boa" link="http://boa.cs.iastate.edu" %}

[Boa](http://boa.cs.iastate.edu) project is applying big data analytics toward
improving software engineering. It is developing a domain-specific language and
its infrastructure whose goal is to significantly ease the experimental cost of
mining ultra-large-scale open source repositories. Boa is a research
infrastructure that consists of a domain-specific language, its compiler and
data updating tools, terabytes (and growing) of raw data from open source
repositories that contains hundreds of thousands of open source projects, a
backend based on map-reduce to effectively analyze this dataset, a compute
cluster, and a web-based frontend for writing analysis programs. Following
research papers document progress on this project:

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'boa' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

Boa project has been supported in part by the following grants.

- US National Science Foundation, CI-EN: Boa: Enhancing Infrastructure for
  Studying Software and its Evolution at a Large Scale. PI: Hridesh Rajan and
  Co-I: Tien Nguyen, Robert Dyer (2015-2018), Total award amount: $1,559,806,
  Links: [ISU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1513263) and
  [BGSU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1512947).

- US National Science Foundation, SHF: Large:Collaborative Research: Inferring
  Software Specifications from Open Source Repositories by Leveraging Data and
  Collective Community Expertise. PI: Hridesh Rajan and Co-I: Robert Dyer, Tien
  Nguyen, Gary T. Leavens, and Vasant Honavar (2015-2018), Total award amount:
  $1,604,843, Links: [ISU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1518897),
  [BGSU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1518776),
  [UCF](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1518789), and
  [PSU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1518732).

- US National Science Foundation, [EAGER: Boa: A Community Research Infrastructure for Mining Software Repositories](https://www.nsf.gov/awardsearch/showAward.do?AwardNumber=1349153).
  PI: Hridesh Rajan and Co-I: Tien Nguyen (2013-2015).

[More information about the Boa project.](http://boa.cs.iastate.edu)


{% include projects_page.html name="Ptolemy" link="ptolemy/" %}

A software is created to satisfy user needs (also called concerns). These
concerns may change often and unanticipatedly. On a concern change, the parts of
the software called modules, responsible for that concern must also be revised.
A module revision incurs costs and may introduce new errors. It is thus
desirable to minimize module revisions. Some concerns, called crosscutting
concerns e.g. security, fault tolerance, accountability, etc; have systemic
effect. If many modules are responsible for such a concern, a change in it could
trigger costly and error-prone systemic module revisions. Advanced separation of
concerns mechanisms help avert these systemic revisions.

[Ptolemy](ptolemy/) project is designing an event-based
language whose goal is to enable more modular reasoning about advanced
separation of concerns mechanisms such as implicit invocation and aspects.
Ptolemy provides quantified-typed events that act as an interface between
modules. A key benefit of quantified-typed events is that they allow programmers
to write new kinds of contracts that we call translucid contracts, which enables
modular reasoning about modules that announce events and those that listen to
events.

Following research papers document progress on this project:

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'ptolemy' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

Ptolemy project has been supported in part by the following grant.

US National Science Foundation, [SHF:Small:Balancing Expressiveness and Modular Reasoning for Aspect-oriented Programming](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1017334).
PI: Hridesh Rajan (2010 - 2013).

[More information about the Ptolemy project](http://ptolemy.cs.iastate.edu).



## Past Research Projects
{: .research-header}

{% include projects_page.html name="Eos" link="eos/" %}

Eos is a unified aspect-oriented extension for C# on Microsoft® .NET Framework™.
Eos unifies aspects and objects as classpects. The unified language model
improves the conceptual integrity of the language design and the
compositionality of aspect modules to better support hierarchical advising
structures.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'eos' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>


{% include projects_page.html name="Frances" link="frances/" %}

The Frances project produces tools for teaching topics related to code
generation and mapping high-level languages to low-level langages. First,
Frances is designed to help teach code generation and assembly language. Second,
Frances-A is designed to help teach computer architecture, assembly language,
and how high-level code actually executes on a system.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'frances' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>


{% include projects_page.html name="Nu" link="nu/" %}

The Nu (pronounced new) project is exploring intermediate language design and
corresponding virtual machine extensions to better support new features of
aspect-oriented languages. The potential impacts of this project include better
compatibility with the existing tool chain, better run-time performance, cross
AO language compatibility, improved pointcut expressivity, efficient run-time
weaving support, etc.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'nu' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>


{% include projects_page.html name="Sapha" link="sapha/" %}

As multi-core processors are becoming common, vendors are starting to explore
trade offs between the die size and the number of cores on a die, leading to
heterogeneity among cores on a single chip. For efficient utilization of these
processors, application threads must be assigned to cores such that the resource
needs of a thread closely matches resource availability at the assigned core.
Current methods of thread-to-core assignment often require an application's
execution trace to determine it's runtime properties. These traces are obtained
by running the application on some representative input. A problem is that
developing these representative input sets is time consuming, and requires
expertise that the user of a general-purpose processor may not have. In this
project, we are designing, implementing and evaluating automatic thread-to-core
assignment techniques for heterogeneous multi-core processors that will enhance
the utilization of these processors.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'sapha' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>


{% include projects_page.html name="Slede" link="slede/" %}

The Slede project is looking at specification language design and supporting
verification mechanisms for specifying and verifying cryptographic protocols for
sensor networks. Applications of sensor networks are numerous from military to
environmental research. By providing mechanisms to find cryptographic errors in
the security protocols for sensor networks this research program is improving
the reliability of these networks, making a direct impact on all areas where
these networks are utilized.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'slede' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>


{% include projects_page.html name="Tisa" link="tisa/" %}

The key notion in service-oriented architecture is decoupling clients and
providers of a service based on an abstract service description, which is used
by the service broker to point clients to a suitable service implementation. A
client then sends service requests directly to the service implementation. A
problem with the current architecture is that it does not provide trustworthy
means for clients to specify, service brokers to verify, and service
implementations to prove that certain desired non-functional properties are
satisfied during service request processing. An example of such non-functional
property is access and persistence restrictions on the data received as part of
the service requests. In this project, we are developing an extension of the
service-oriented architecture that provides these facilities. We are also
developing a prototype implementation of this architecture that demonstrate the
potential practical value of the proposed architecture in real-world software
applications.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'tisa' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>


{% include projects_page.html name="Osiris" link="http://design.cs.iastate.edu/projects/osiris/" %}

Comprehending software is hard. As system complexity and size increases,
existing approaches for program comprehension become less usable. Ironically,
the need for these approaches increases with the size of the system. In the
Osiris project, we are looking at approaches and tools for
automatic/semi-automatic generation of concerns models from source code for
better comprehension of large software systems.
