---
layout: page
title: About
permalink: /about/
---

The Laboratory for Software Design at Tulane University conducts research in programming languages, compilers, and software engineering. We are part of the [Department of Computer Science](https://sse.tulane.edu/cs) in the [School of Science and Engineering](https://sse.tulane.edu), and led by Dr. Hridesh Rajan, Dean of the School and Professor of Computer Science.

Our aim is to make software, including AI-enabled systems, easier to build and more reliable. Much of the work comes back to modular reasoning: being able to understand and change one part of a system without having to understand all of it.

<h2 class="research-header">What we work on</h2>
<ul class="flagship">
<li><a href="/research/#modularity-and-modular-reasoning">Modularity and Modular Reasoning</a>: languages and interfaces that let developers reason about one part of a program at a time.</li>
<li><a href="/research/#software-at-scale">Analyzing Software at Scale, with Boa</a>: writing a software analysis once and running it across very large collections of open-source code.</li>
<li><a href="/research/#modular-and-dependable-ai">Modular and Dependable AI</a>: decomposing trained models into modules, and using software engineering to make AI-enabled systems more reliable.</li>
</ul>
<p>See our <a href="/research/">research</a> for the thrusts in depth and our <a href="/papers/">papers</a> for the full record.</p>

{%- assign pubs = site.papers | where_exp:"p","p.kind != 'thesis' and p.kind != 'technical_report'" -%}
{%- assign flag = 0 -%}{%- for p in pubs -%}{%- if p.key contains "ICSE-" or p.key contains "FSE-" or p.key contains "ASE-" or p.key contains "ISSTA-" -%}{%- assign flag = flag | plus: 1 -%}{%- endif -%}{%- endfor -%}
{%- assign awardpapers = site.papers | where_exp:"p","p.award" -%}
{%- assign gt = 0 -%}{%- assign gc = 0 -%}{%- for g in site.data.grants -%}{%- if g.primary -%}{%- assign gc = gc | plus: 1 -%}{%- assign a = g.amount | remove:"$" | remove:"," | plus: 0 -%}{%- assign gt = gt | plus: a -%}{%- endif -%}{%- endfor -%}
{%- assign ct = 0 -%}{%- for g in site.data.grants -%}{%- if g.copi -%}{%- assign ca = g.amount | remove:"$" | remove:"," | plus: 0 -%}{%- assign ct = ct | plus: ca -%}{%- endif -%}{%- endfor -%}
<div class="stats">
<div class="stat"><div class="num">{{ pubs | size }}</div><div class="lbl">papers and articles, {{ flag }} at ICSE, FSE, ASE, and ISSTA</div></div>
<div class="stat"><div class="num">${{ gt | divided_by: 1000000.0 | round: 1 }}M</div><div class="lbl">research grants as PI across {{ gc }}, plus ${{ ct | divided_by: 1000000.0 | round: 1 }}M as co-PI</div></div>
<div class="stat"><div class="num">8</div><div class="lbl">software systems, used by researchers worldwide</div></div>
<div class="stat"><div class="num">{{ awardpapers | size }}</div><div class="lbl">paper and poster awards, two ACM SIGSOFT Distinguished</div></div>
</div>
<a class="scholar-btn" href="https://scholar.google.com/citations?user=aiFvpucAAAAJ&hl=en">View our work on Google Scholar &rarr;</a>

<h2 class="research-header">Recognition</h2>
<p class="pub-label">Honors and fellowships</p>
<ul class="rec">
{%- for h in site.data.honors %}
<li>{% if h.url %}<a href="{{ h.url }}">{{ h.name }} ({{ h.year }})</a>{% else %}{{ h.name }} ({{ h.year }}){% endif %}</li>
{%- endfor %}
</ul>
<p class="pub-label" style="margin-top:1.4rem">Paper and poster awards</p>
{%- assign aw = site.papers | where_exp:"p","p.award" | sort: "award_year" | reverse -%}
<ul class="rec">
{%- for p in aw %}
<li><a href="{{ p.url }}">{{ p.award }}</a></li>
{%- endfor %}
</ul>

<h2 class="research-header">Students and scholars</h2>
<p>The lab has helped train twenty-eight doctoral and postdoctoral scholars and more than forty-five undergraduates. Eight former students and postdocs are now faculty, at institutions including Bowling Green State University and Oakland University, and ten are industrial researchers, including at Google. Our current team is on the <a href="/people/">people page</a>.</p>

<h2 class="research-header">Service and leadership</h2>
<p>Founder of the VMIL workshop (2007–2017) and General Chair of SPLASH 2020 and 2021, the first ACM hybrid conference, with more than 800 participants. Principal investigator of the NSF TRIPODS D4 (Dependable Data-Driven Discovery) Institute, and founder of the Midwest Big Data Summer School, which has helped train more than 600 early-career researchers.</p>
<p class="pub-label">Editorial roles</p>
<ul class="svc">
<li><a href="https://dl.acm.org/journal/pacmpl">Advisory Board, Proceedings of the ACM on Programming Languages (2023–present)</a></li>
<li><a href="https://link.springer.com/journal/10515">Editorial Board, Automated Software Engineering Journal (2024–present)</a></li>
<li><a href="https://www.computer.org/csdl/journal/ts">Editorial Board, IEEE Transactions on Software Engineering (2017–2022)</a></li>
</ul>

<h2 class="research-header">Join us</h2>
<p>Our research meetings are held in person and virtually on Fridays from 3:00 pm to 5:30 pm. Prospective students who are excited about software, languages, and trustworthy AI are encouraged to <a href="mailto:hrajan@tulane.edu">reach out</a>.</p>
