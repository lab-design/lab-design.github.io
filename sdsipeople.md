---
layout: sdsi
title: People with SDSI
permalink: /sdsi/people/
---
{% assign persons = site.data.sdsipeople %}

<div class = "row">
    {% for person in persons offset:0 limit:3%}
      {%include sdsi/people.html person=person %}
    {% endfor %}
</div>

<div class = "row">
    {% for person in persons offset:3 limit:3%}
      {%include sdsi/people.html person=person %}
    {% endfor %}
</div>

<div class = "row">
    {% for person in persons offset:6 limit:3%}
      {%include sdsi/people.html person=person %}
    {% endfor %}
</div>

<div class = "row">
    {% for person in persons offset:9 limit:3%}
      {%include sdsi/people.html person=person %}
    {% endfor %}
</div>

<div class = "row">
    {% for person in persons offset:12 limit:3%}
      {%include sdsi/people.html person=person %}
    {% endfor %}
</div>

<div class = "row">
    {% for person in persons offset:15 limit:3%}
      {%include sdsi/people.html person=person %}
    {% endfor %}
</div>

<div class = "row">
    {% for person in persons offset:18 limit:2%}
      {%include sdsi/people.html person=person %}
    {% endfor %}
</div>