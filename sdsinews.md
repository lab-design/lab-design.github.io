---
layout: sdsi
title: News
permalink: /sdsi/news/
---
{% assign newss = site.data.sdsinews %}

<div class = "row">
    {% for news in newss %}
      {%include sdsi/news.html news=news %}
    {% endfor %}
</div>