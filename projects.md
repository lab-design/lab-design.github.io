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



{% include projects_page.html name="Modular Deep Learning" link="papers/ESEC-FSE-20b/" %}

[Modular Deep Learning](http://boa.cs.iastate.edu) project is studying a class of 
machine learning algorithms known as deep learning that has received much attention 
in academia and industry. 
Deep learning has a large number of important societal applications, from self-driving 
cars to question-answering systems such as Siri and Alexa. 
A deep learning algorithm uses multiple layers of transformation functions to convert 
inputs to outputs, each layer learning higher-level of abstractions in the data 
successively. 
The availability of large datasets has made it feasible to train deep learning models. 
Since the layers are organized in the form of a network, such models are also referred 
to as deep neural networks (DNN). 
While the jury is still out on the impact of deep learning on the overall understanding 
of software's behavior, a significant uptick in its usage and applications in wide-ranging 
areas and safety-critical systems, e.g., autonomous driving, aviation system, 
medical analysis, etc., combine to warrant research on software engineering practices 
in the presence of deep learning. 
One challenge is to enable the reuse and replacement of the parts of a DNN that has 
the potential to make DNN development more reliable. 
This project is investigating a comprehensive approach to systematically investigate the 
decomposition of deep neural networks into modules to enable reuse, replacement, 
and independent evolution of those modules. 
A module is an independent part of a software system that can be tested, validated, 
or utilized without a major change to the rest of the system. 
Allowing the reuse of DNN modules is expected to reduce energy- and data-intensive 
training efforts to construct DNN models. Allowing replacement is expected to help 
replace faulty functionality in DNN models without needing costly retraining steps.

Our preliminary work has shown that it is possible to decompose fully connected neural 
networks and CNN models into modules and conceptualize the notion of modules. 
The main goals of this project are to further expand this decomposition approach 
along three dimensions: (1) extension to different classes of DNN models, 
(2) gaining a better understanding of the decomposition criteria, and 
(3) understanding the impact of decomposition on behavior of the DNN. 

The project is expected to broadly impact society by informing the science and practice 
of deep learning. 
A serious problem facing the current software development workforce is that deep 
learning is widely utilized in our software systems, but scientists and practitioners 
do not yet have a clear handle on critical problems such as explainability of DNN models, 
DNN reuse, replacement, independent testing, and independent development. 
There was no apparent need to investigate the notions of modularity as neural network 
models trained before the deep learning era were mostly small, trained on small datasets, 
and were mostly used as experimental features. 
The notion of DNN modules developed by this project, if successful, could help make 
significant advances on a number of open challenges in this area. 
DNN modules could enable the reuse of already trained DNN modules in another context. 
Viewing a DNN as a composition of DNN modules instead of a black box could enhance the 
explainability of a DNN's behavior. 
This project, if successful, will thus have a large positive impact on the productivity 
of these programmers, the understandability and maintainability of the DNN models that 
they deploy, and the scalability and correctness of software systems that they produce. 
Following research papers document progress on this project:

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'mdl' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

Modular Deep Learning project has been supported in part by the following grants.

- US National Science Foundation, SHF:Small: More Modular Deep Learning. PI: Hridesh Rajan
  (2022-2025), Total award amount: $580,000,
  Links: [ISU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2223812).

[More information about the Modular Deep Learning project.](papers/ESEC-FSE-20b/)

{% include projects_page.html name="D4 (Dependable Data-Driven Discovery)" link="https://www.nsf.gov/awardsearch/showAward?AWD_ID=1934884&HistoricalAwards=false" %}

[D4](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1934884&HistoricalAwards=false) project will advance the theoretical foundations of data science by fostering foundational research to enable understanding of the risks to the dependability of data-science lifecycles, to formalize the rigorous mathematical basis of the measures of dependability for data-science lifecycles, and to identify mechanisms to create dependable data-science lifecycles. The project defines a risk to be a cause that can lead to failures in data-driven discovery and the processes that plan for, acquire, manage, analyze, and infer from data collectively as the data-science lifecycle. For instance, an inference procedure that is significantly expensive can deliver late information to a human operator facing a deadline (complexity as a risk); if the data-science lifecycle provides a recommendation without an uncertainty measure for the recommendation, a human operator has no means to determine whether to trust the recommendation (uncertainty as a risk). Compared to recent works that have focused on fairness, accountability, and trustworthiness issues for machine learning algorithms, this project will take a holistic perspective and consider the entire data science lifecycle. In phase I of the project, the investigators will focus on four measures: complexity, resource constraints, uncertainty, and data freshness. In developing a framework to study these measures, this work will prepare the investigators to scale up their activities to other measures in phase II as well as to address larger portions of the data-science lifecycle. The study of each measure brings about foundational challenges that will require expertise from multiple TRIPODS disciplines to address. Following research papers document progress on this project:

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'd4' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

D4 project has been supported in part by the following grants.
- US National Science Foundation, HDR TRIPODS: D4 (Dependable Data-Driven Discovery) Institute. PI: Hridesh Rajan and
  Co-I: Pavan Aduri, Eric Weber, Daniel Nettleton, and Chinmay Hegde. Total award amount: $1,531,995.00
  Links: [ISU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1934884&HistoricalAwards=false),

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

- US National Science Foundation, CCRI: ENS: Boa 2.0: Enhancing Infrastructure for
  Studying Software and its Evolution at a Large Scale. PI: Hridesh Rajan and
  Co-I: Tien Nguyen, Brian Nosek (2021-2024), Total award amount: $1,559,806,
  Links: [ISU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2120448), 
  [UT Dallas](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2120386), and
  [COS](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2120345).

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



## Past Research Projects
{: .research-header}


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
