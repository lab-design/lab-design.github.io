---
layout: page
title: Research & Projects
---

{% assign papers = site.papers | sort: 'publication_year' %}

<p class="lead">We design tools and techniques that make software-intensive systems, including modern AI, easier to build, verify, and sustain. Much of our work advances dependable and trustworthy AI, organized into focused thrusts, alongside our work using AI and data science for software engineering.</p>

<div class="area-grid">
  <a class="area-card" href="#modular-deep-learning" style="--accent: var(--tulane-green);">
    <h3>Modular Deep Learning</h3>
    <p>Decomposing deep neural networks into modules that can be tested, reused, replaced, and evolved on their own.</p>
    <span class="area-card__projects">Dependable &amp; Trustworthy AI</span>
  </a>
  <a class="area-card" href="#fault-localization-for-deep-learning" style="--accent: var(--tulane-green-700);">
    <h3>Fault Localization for Deep Learning</h3>
    <p>Finding where deep learning models go wrong, and making them faster and cheaper to debug.</p>
    <span class="area-card__projects">Dependable &amp; Trustworthy AI</span>
  </a>
  <a class="area-card" href="#dependable-data-science" style="--accent: var(--kelly);">
    <h3>Dependable Data Science</h3>
    <p>Understanding and reducing risk across the entire data-science lifecycle through the D4 project.</p>
    <span class="area-card__projects">Dependable &amp; Trustworthy AI</span>
  </a>
  <a class="area-card" href="#ai-data-science-for-software-engineering" style="--accent: var(--tulane-blue);">
    <h3>AI/Data Science for Software Engineering</h3>
    <p>Large language models, program analysis, and data science to localize, repair, and improve software at scale.</p>
    <span class="area-card__projects">LLM-based analysis &amp; repair &middot; Boa</span>
  </a>
</div>

## Modular Deep Learning
{: #modular-deep-learning .research-header}

[Modular Deep Learning](papers/ESEC-FSE-20b/) studies a class of machine learning algorithms known as deep learning. A deep learning algorithm uses multiple layers of transformation functions to convert inputs to outputs, each layer learning higher-level abstractions in the data. Because the layers are organized as a network, such models are also called deep neural networks (DNN). Deep learning now appears in wide-ranging and safety-critical systems, from autonomous driving to medical analysis, which makes software engineering practices for deep learning an urgent need.

One challenge is to enable the reuse and replacement of the parts of a DNN, which has the potential to make DNN development more reliable. This project investigates a comprehensive approach to decompose deep neural networks into modules so those modules can be reused, replaced, and evolved independently. Reusing DNN modules is expected to cut the energy- and data-intensive cost of training, and replacing them is expected to fix faulty functionality without costly retraining. Viewing a DNN as a composition of modules rather than a black box can also improve the explainability of its behavior. The following papers document progress on this project:

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'mdl' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

Modular Deep Learning has been supported in part by the following grant.

- US National Science Foundation, SHF:Small: More Modular Deep Learning. PI: Hridesh Rajan
  (2022-2025), Total award amount: $580,000,
  Links: [NSF](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2223812).

[More information about the Modular Deep Learning project.](papers/ESEC-FSE-20b/)

## Fault Localization for Deep Learning
{: #fault-localization-for-deep-learning .research-header}

Deep neural networks now sit behind decisions in healthcare, transportation, and many other areas, yet they can carry faults that undermine their safety and reliability. The fault localization techniques that software engineers have refined over decades do not transfer cleanly to neural networks, because traditional software and deep learning rest on very different computational models, and a bug means something different in each. This project takes on that gap. We watch how a model behaves while it trains, design compact abstractions of that behavior to pinpoint where things go wrong, and cut the cost of retraining so that debugging deep learning becomes faster and more accessible. The work builds on DeepLocalize, our first approach for bug localization in deep neural networks.

This is a collaborative award led at Tulane with Mohammad Wardat at Oakland University, who earned his PhD with our group.

- US National Science Foundation, Collaborative Research: SHF: Small: Fault Localization for Deep Learning.
  PI: Hridesh Rajan (Tulane) with Mohammad Wardat (Oakland), total award amount approximately $600,000,
  Links: [NSF Tulane](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2419882) and
  [NSF Oakland](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2419883).

## Dependable Data Science
{: #dependable-data-science .research-header}

[D4](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1934884&HistoricalAwards=false) advances the theoretical foundations of data science by enabling an understanding of the risks to the dependability of data-science lifecycles, formalizing the rigorous mathematical basis of the measures of dependability, and identifying mechanisms to create dependable data-science lifecycles. The project defines a risk as a cause that can lead to failures in the processes that plan for, acquire, manage, analyze, and infer from data. For instance, an inference procedure that is significantly expensive can deliver late information to a human operator facing a deadline (complexity as a risk); a recommendation without an uncertainty measure leaves an operator no means to decide whether to trust it (uncertainty as a risk). Compared with work that focuses narrowly on fairness or accountability for machine learning algorithms, this project takes a holistic perspective across the entire data-science lifecycle. The following papers document progress on this project:

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'd4' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

Dependable Data Science (D4) has been supported in part by the following grant.

- US National Science Foundation, HDR TRIPODS: D4 (Dependable Data-Driven Discovery) Institute. PI: Hridesh Rajan and
  Co-I: Pavan Aduri, Eric Weber, Daniel Nettleton, and Chinmay Hegde. Total award amount: $1,531,995.00,
  Links: [NSF](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1934884&HistoricalAwards=false).

## AI/Data Science for Software Engineering
{: #ai-data-science-for-software-engineering .research-header}

We use large language models, program analysis, and large-scale data science to understand, localize, repair, and improve software. This work ranges from agent-oriented and analysis-driven techniques built on modern language models to the Boa infrastructure for mining millions of software projects at once.

{% include projects_page.html name="LLM-based Program Analysis and Repair" link="/papers/" %}

Large language models and program analysis are changing how developers understand and improve code. We design agent-oriented and analysis-driven techniques that localize design issues, repair data-driven errors, and test modern AI systems, so that the benefits of large models reach real engineering tasks without sacrificing reliability. Recent results include an intent-aware approach to repairing data-driven errors in large language models, an LLM-based agent for automated code design issue localization, and mock deep testing for separating the development of data and models in deep learning.

Selected papers from this thread:

<ul>
<li><a href="/papers/FSE-25a/">IRepair: An Intent-Aware Approach to Repair Data-Driven Errors in Large Language Models (FSE 2025)</a></li>
<li><a href="/papers/ICSE-25b/">An LLM-Based Agent-Oriented Approach for Automated Code Design Issue Localization (ICSE 2025)</a></li>
<li><a href="/papers/ICSE-25c/">Mock Deep Testing: Toward Separate Development of Data and Models for Deep Learning (ICSE 2025)</a></li>
</ul>

[See all of our papers.](/papers/)

{% include projects_page.html name="Boa" link="http://boa.cs.iastate.edu" %}

[Boa](http://boa.cs.iastate.edu) applies big data analytics and data science to software engineering. It is a domain-specific language and infrastructure whose goal is to significantly lower the experimental cost of mining ultra-large-scale open source repositories. Boa consists of a language, its compiler and data updating tools, terabytes of raw data drawn from hundreds of thousands of open source projects, a map-reduce backend to analyze that data, a compute cluster, and a web-based frontend for writing analyses. By turning millions of projects into data we can query, Boa lets researchers ask and answer empirical questions about software at a scale that would otherwise be out of reach. The following papers document progress on this project:

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'boa' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

Boa has been supported in part by the following grants.

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

- US National Science Foundation, SHF: Large: Collaborative Research: Inferring
  Software Specifications from Open Source Repositories by Leveraging Data and
  Collective Community Expertise. PI: Hridesh Rajan and Co-I: Robert Dyer, Tien
  Nguyen, Gary T. Leavens, and Vasant Honavar (2015-2018), Total award amount:
  $1,604,843, Links: [ISU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1518897),
  [BGSU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1518776),
  [UCF](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1518789), and
  [PSU](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1518732).

[More information about the Boa project.](http://boa.cs.iastate.edu)

## Past Projects
{: #past-projects .research-header}

{% include projects_page.html name="Panini" link="/panini/" %}

The Panini project developed the capsule-oriented programming model, aimed at making concurrent software development easier through two properties: given a module, it should be possible to statically and modularly identify all points where other modules might interfere; and given a module and the interfaces of the modules it interacts with, it should be possible to statically and modularly construct an upper bound on the behavior of all potentially interfering tasks. Together these properties enable modular reasoning about concurrent programs. We created two systems that support this model: [PaniniJ](http://web.cs.iastate.edu/~panini/), an extension of Java and its reference compiler, and [@PaniniJ](https://paninij.github.io), an annotation-based framework.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'panini' and paper.kind != 'technical_report' %}
  <li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

{% include projects_page.html name="Ptolemy" link="/ptolemy/" %}

[Ptolemy](/ptolemy/) designed an event-based language whose goal is to enable more modular reasoning about advanced separation of concerns mechanisms such as implicit invocation and aspects. Ptolemy provides quantified, typed events that act as an interface between modules, and translucid contracts that enable modular reasoning about modules that announce events and those that listen to them.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'ptolemy' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

{% include projects_page.html name="Eos" link="eos/" %}

Eos is a unified aspect-oriented extension for C# on the Microsoft .NET Framework. Eos unifies aspects and objects as classpects, which improves the conceptual integrity of the language and the compositionality of aspect modules.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'eos' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

{% include projects_page.html name="Nu" link="nu/" %}

The Nu project explored intermediate language design and corresponding virtual machine extensions to better support features of aspect-oriented languages, with goals including better tool-chain compatibility, better runtime performance, cross-language compatibility, and efficient runtime weaving.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'nu' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

{% include projects_page.html name="Sapha" link="/sapha/" %}

Sapha designed, implemented, and evaluated automatic thread-to-core assignment techniques for heterogeneous multi-core processors, improving their utilization without requiring hand-built representative input sets.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'sapha' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

{% include projects_page.html name="Slede" link="/slede/" %}

Slede looked at specification language design and verification mechanisms for cryptographic protocols in sensor networks, helping find cryptographic errors and improving the reliability of these networks.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'slede' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

{% include projects_page.html name="Tisa" link="/tisa/" %}

Tisa extended service-oriented architecture with trustworthy means for clients to specify, brokers to verify, and implementations to prove that desired non-functional properties are satisfied during request processing, with a prototype implementation demonstrating its practical value.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'tisa' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

{% include projects_page.html name="Frances" link="/frances/" %}

The Frances project produced tools for teaching code generation and the mapping of high-level languages to low-level languages, including Frances-A for teaching computer architecture and how high-level code executes on a system.

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'frances' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }}</a></li>
{% endif %}{% endfor %}
</ul>

{% include projects_page.html name="Osiris" link="/papers/" %}

In the Osiris project we looked at approaches and tools for automatic and semi-automatic generation of concern models from source code, to support comprehension of large software systems.
