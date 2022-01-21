---
layout: sdsi
title: Events
permalink: /sdsi/events/
---
{% assign events = site.data.sdsievents %}

<div class = "row">
    {% for event in events %}
      {%include sdsi/event.html event=event %}
    {% endfor %}
</div>