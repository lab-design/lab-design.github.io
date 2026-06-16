---
layout: page
title: Ptolemy
---

Ptolemy designed an event-based language whose goal is to enable more modular reasoning about advanced separation of concerns mechanisms such as implicit invocation and aspects. Ptolemy provides quantified, typed events that act as an interface between modules, and translucid contracts that enable modular reasoning about modules that announce events and those that listen to them.

This project concluded during the lab's time at Iowa State University.

{% assign papers = site.papers | sort: 'publication_year' %}{% assign has = false %}{% for paper in papers %}{% if paper.tags contains 'ptolemy' %}{% assign has = true %}{% endif %}{% endfor %}{% if has %}
## Publications
{: .research-header}

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'ptolemy' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }} &middot; {{ paper.title }}</a></li>
{% endif %}{% endfor %}
</ul>
{% endif %}
[&larr; Back to all projects](/projects.html)
