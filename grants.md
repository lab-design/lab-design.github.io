---
layout: page
title: Grants
permalink: /grants/
---

{% assign grants_list = site.data.grants | where: "primary", "true" | sort: 'start_date' | reverse %}

<h2 class="research-header">As Principal Investigator</h2>
<div id="grants-list" role="tablist" aria-multiselectable="true">
  {% for grant in grants_list %}
    {% include grants_page/grant_card.html grant=grant %}
  {% endfor %}
</div>

{% assign copi_list = site.data.grants | where: "copi", "true" | sort: 'start_date' | reverse %}
{% if copi_list.size > 0 %}
<h2 class="research-header">As Co-Principal Investigator</h2>
<div id="copi-grants-list" role="tablist" aria-multiselectable="true">
  {% for grant in copi_list %}
    {% include grants_page/grant_card.html grant=grant %}
  {% endfor %}
</div>
{% endif %}
