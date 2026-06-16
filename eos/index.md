---
layout: page
title: Eos
---

Eos is a unified aspect-oriented extension for C# on the Microsoft .NET Framework. Eos unifies aspects and objects as classpects, which improves the conceptual integrity of the language and the compositionality of aspect modules to better support hierarchical advising structures.

This project concluded during the lab's time at Iowa State University.

{% assign papers = site.papers | sort: 'publication_year' %}{% assign has = false %}{% for paper in papers %}{% if paper.tags contains 'eos' %}{% assign has = true %}{% endif %}{% endfor %}{% if has %}
## Publications
{: .research-header}

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'eos' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }} &middot; {{ paper.title }}</a></li>
{% endif %}{% endfor %}
</ul>
{% endif %}
[&larr; Back to all projects](/projects.html)
