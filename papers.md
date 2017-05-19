---
layout: page
title: Papers
permalink: /papers/
---

{% assign conference_papers = (site.papers | where: 'kind', 'conference'       | sort: 'publication_year') %}
{% assign journal_papers =    (site.papers | where: 'kind', 'journal'          | sort: 'publication_year') %}
{% assign workshop_papers =   (site.papers | where: 'kind', 'workshop'         | sort: 'publication_year') %}
{% assign theses =            (site.papers | where: 'kind', 'thesis'           | sort: 'publication_year') %}
{% assign technical_reports = (site.papers | where: 'kind', 'technical_report' | sort: 'publication_year') %}

1. TOC
{: toc}

### Conference Papers
{: .space-above}
<div id="conference-papers-list" role="tablist" aria-multiselectable="true">
    {% for paper in conference_papers reversed %}
      {%include papers_page/paper_card.html paper=paper accordionKey="conference-papers-list" %}
    {% endfor %}
</div>

### Journal Papers
{: .space-above}
<div id="journal-papers-list" role="tablist" aria-multiselectable="true">
  {% for paper in journal_papers reversed %}
    {%include papers_page/paper_card.html paper=paper accordionKey="journal-papers-list" %}
  {% endfor %}
</div>

### Workshop Papers
{: .space-above}
<div id="workshop-papers-list" role="tablist" aria-multiselectable="true">
  {% for paper in workshop_papers reversed %}
    {%include papers_page/paper_card.html paper=paper accordionKey="workshop-papers-list" %}
  {% endfor %}
</div>

### PhD and MS Theses
{: .space-above}
<div id="theses-list" role="tablist" aria-multiselectable="true">
  {% for paper in theses reversed %}
    {%include papers_page/paper_card.html paper=paper accordionKey="theses-list" %}
  {% endfor %}
</div>

### Technical Reports
{: .space-above}
<div id="technical-reports-list" role="tablist" aria-multiselectable="true">
  {% for paper in technical_reports reversed %}
    {%include papers_page/paper_card.html paper=paper accordionKey="technical-reports-list" %}
  {% endfor %}
</div>
