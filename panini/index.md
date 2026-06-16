---
layout: page
title: Panini
---

The Panini project developed the capsule-oriented programming model, aimed at making concurrent software development easier through modular reasoning about concurrency. Given a module, it is possible to statically and modularly identify all points where other modules might interfere, and to bound the behavior of all potentially interfering tasks at each such point. We built two systems that support this model: PaniniJ, an extension of Java and its reference compiler, and @PaniniJ, an annotation-based framework.

This project concluded during the lab's time at Iowa State University.

**Software:** [@PaniniJ](https://paninij.github.io)

{% assign papers = site.papers | sort: 'publication_year' %}{% assign has = false %}{% for paper in papers %}{% if paper.tags contains 'panini' %}{% assign has = true %}{% endif %}{% endfor %}{% if has %}
## Publications
{: .research-header}

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'panini' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }} &middot; {{ paper.title }}</a></li>
{% endif %}{% endfor %}
</ul>
{% endif %}
[&larr; Back to research](/research/)
