---
layout: page
title: Papers
permalink: /papers/
---

<script language="javascript">
function toggle(contentClicked, otherContent){
  var stuff1 = document.getElementById(contentClicked);
  var stuff2 = document.getElementById(otherContent);
  stuff1.style.display = "block";
  stuff2.style.display = "none";
}
</script>

<h4>Sort By:</h4>

<div class="btn-group paper-btns" data-toggle="buttons" aria-label="Sorting">
  <label id="project-btn" class="btn btn-primary paper-btn active project-btn" onclick="toggle('by-project', 'by-date')">
    <input type="radio" name="options" id="option1" autocomplete="off" checked>Project
  </label>
  <label id="date-btn" class="btn btn-primary paper-btn date-btn" onclick="toggle('by-date', 'by-project')">
    <input type="radio" name="options" id="option1" autocomplete="off">Publication Date
  </label>
</div>

{% assign projects = "panini boa ptolemy eos frances nu sapha slede tisa osiris other" | split: ' ' %}
{% assign paper_types = "conference journal workshop thesis technical_report other" | split: ' ' %}

<div id="by-project" class="by-project">

  {% for project in projects %}
    <h2 class="space-above">{{ project | capitalize }}</h2>
    {% if project == 'other' %}
      {% assign project_papers = site.papers | where_exp: 'item', "item.tags == blank" %}
    {% else %}
      {% assign project_papers = site.papers | where: 'tags', project %}
    {% endif %}

    {% for paper_type in paper_types %}
      {% assign papers = (project_papers | where: 'kind', paper_type) %}
      {% assign papersSorted = papers | sort: 'publication_year' %}
      {% assign size = papers | size %}
      {% if size > 0 %}
        <h3 class="space-above">
        {% if paper_type == 'thesis' %}
          PhD and MS Theses
        {% elsif paper_type == 'technical_report' %}
          Technical Reports
        {% else %}
          {{ paper_type | capitalize }}
        {% endif %}
        </h3>
        <div id="{{paper_type}}-papers-list" role="tablist" aria-multiselectable="true">
            {% for paper in papersSorted reversed %}
              {% include papers_page/paper_card.html paper=paper accordionKey='-papers-list' %}
            {% endfor %}
        </div>
      {% endif %}
    {% endfor %}
  {% endfor %}

</div>

{% assign paper_types = "general thesis technical_report" | split: ' ' %}
{% assign general_papers = "conference journal workshop other" | split: ' ' %}
<div id="by-date" class="by-date">

  {% for paper_type in paper_types %}
    {% if paper_type == 'general' %}
      {% assign papers = site.papers | where_exp: 'paper', "general_papers contains paper.kind" %}
    {% else %}
      {% assign papers = site.papers | where: 'kind', paper_type %}
    {% endif %}
    {% assign papersSorted = papers | sort: "publication_year" %}
    <h3 class="space-above">
    {% if paper_type == 'thesis' %}
      PhD and MS Theses
    {% elsif paper_type == 'technical_report' %}
      Technical Reports
    {% elsif paper_type == 'general' %}
      General Papers
    {% endif %}
    </h3>
    <div id="{{paper_type}}-papers-list" role="tablist" aria-multiselectable="true">
        {% for paper in papersSorted reversed %}
          {% include papers_page/paper_card.html paper=paper accordionKey='-papers-list' %}
        {% endfor %}
    </div>
  {% endfor %}

</div>
