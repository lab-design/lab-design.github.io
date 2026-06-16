---
layout: page
title: Slede
---

Slede studied specification language design and verification mechanisms for specifying and verifying cryptographic protocols for sensor networks. By helping find cryptographic errors in security protocols for sensor networks, the project improved the reliability of these networks across the many areas where they are used.

This project concluded during the lab's time at Iowa State University.

{% assign papers = site.papers | sort: 'publication_year' %}{% assign has = false %}{% for paper in papers %}{% if paper.tags contains 'slede' %}{% assign has = true %}{% endif %}{% endfor %}{% if has %}
## Publications
{: .research-header}

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'slede' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }} &middot; {{ paper.title }}</a></li>
{% endif %}{% endfor %}
</ul>
{% endif %}
[&larr; Back to research](/research/)
