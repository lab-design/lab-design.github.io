---
layout: page
title: Nu
---

The Nu project explored intermediate language design and corresponding virtual machine extensions to better support features of aspect-oriented languages, with goals including better tool-chain compatibility, better runtime performance, cross-language compatibility, and efficient runtime weaving.

This project concluded during the lab's time at Iowa State University.

{% assign papers = site.papers | sort: 'publication_year' %}{% assign has = false %}{% for paper in papers %}{% if paper.tags contains 'nu' %}{% assign has = true %}{% endif %}{% endfor %}{% if has %}
## Publications
{: .research-header}

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'nu' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }} &middot; {{ paper.title }}</a></li>
{% endif %}{% endfor %}
</ul>
{% endif %}
[&larr; Back to research](/research/)
