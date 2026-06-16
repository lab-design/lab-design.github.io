---
layout: page
title: Sapha
---

As multi-core processors became common, heterogeneity among cores on a single chip created a need to assign application threads to cores so that a thread's resource needs match resource availability at its core. Sapha designed, implemented, and evaluated automatic thread-to-core assignment techniques for heterogeneous multi-core processors to improve their utilization without requiring hand-built representative input sets.

This project concluded during the lab's time at Iowa State University.

{% assign papers = site.papers | sort: 'publication_year' %}{% assign has = false %}{% for paper in papers %}{% if paper.tags contains 'sapha' %}{% assign has = true %}{% endif %}{% endfor %}{% if has %}
## Publications
{: .research-header}

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'sapha' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }} &middot; {{ paper.title }}</a></li>
{% endif %}{% endfor %}
</ul>
{% endif %}
[&larr; Back to all projects](/projects.html)
