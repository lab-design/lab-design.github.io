---
layout: page
title: Tisa
---

Tisa extended service-oriented architecture with trustworthy means for clients to specify, brokers to verify, and implementations to prove that desired non-functional properties, such as access and persistence restrictions on the data in a service request, are satisfied during request processing. The project also built a prototype implementation to demonstrate the practical value of the approach.

This project concluded during the lab's time at Iowa State University.

{% assign papers = site.papers | sort: 'publication_year' %}{% assign has = false %}{% for paper in papers %}{% if paper.tags contains 'tisa' %}{% assign has = true %}{% endif %}{% endfor %}{% if has %}
## Publications
{: .research-header}

<ul>
{% for paper in papers reversed %}{% if paper.tags contains 'tisa' and paper.kind != 'technical_report' %}
<li><a href="{{ paper.url }}">{{ paper.short_name }} &middot; {{ paper.title }}</a></li>
{% endif %}{% endfor %}
</ul>
{% endif %}
[&larr; Back to research](/research/)
