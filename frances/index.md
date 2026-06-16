---
layout: page
title: Frances
---

The Frances project produced tools for teaching code generation and the mapping of high-level languages to low-level languages. Frances helps teach code generation and assembly language, and Frances-A helps teach computer architecture, assembly language, and how high-level code actually executes on a system.

This project concluded during the lab's time at Iowa State University.

{% assign papers = site.papers | sort: 'publication_year' %}{% assign has = false %}{% for paper in papers %}{% if paper.tags contains 'frances' %}{% assign has = true %}{% endif %}{% endfor %}{% if has %}
## Publications
{: .research-header}

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'frances' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }} &middot; {{ paper.title }}</a></li>
{% endif %}{% endfor %}
</ul>
{% endif %}
[&larr; Back to all projects](/projects.html)
