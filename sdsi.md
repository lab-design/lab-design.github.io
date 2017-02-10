---
layout: sdsi
title:
permalink: /sdsi/
---
<div class="row">
<h5>Shared Data Science Infrastructure (SDSI)</h5>
<h6>A Presidential Initiative for Interdisciplinary Research (PIIR) in Data Driven Science</h6>
<!--<p><i>Project Title:</i> Bridging the Digital Divide in Data Science: Invention and Refinement of Shared Data Science Infrastructures</p>-->
</div>

<div class="row">
  <div>
  <hr>
  <p>
  Open data promise to enable more efficient and effective decision making, 
  foster innovation that society can benefit from, and drive organizational 
  and sector change through transparency.
  </p>
  <p>
  Availability of big open data, e.g. on the web in a downloadable form, is a
  positive step toward these goals, but access alone is not sufficient because of
  significant barriers that exist in obtaining and using big data.  Data-driven
  scientists around the world are effectively facing a new digital divide: the
  barrier to enter data-driven science is prohibitive.  Only a few places with
  well-established infrastructure and deep expertise can attempt large-scale data
  analyses. Necessary expertise includes: programmatically accessing data sources
  for data acquisition and cleaning, data storage and retrieval, data mining,
  scalable data infrastructure design, and visualization.  
  </p>
  <p>
  The need for expertise in these five different areas significantly increases the
  entrance costs. As a result, data-driven experiments are often not replicated,
  reusability of experimental data is low, and data associated and produced by
  such experiments is often inaccessible, obsolete, or worse. Moreover, building
  analysis infrastructure to process ultra-large-scale data efficiently can be
  costly and very hard to accomplish. There are efforts to simplify large-scale
  data analysis; however, we do not yet have user-centric solutions that
  democratize innovation in data-driven science. There have also been efforts that
  provide users access to a set of web-based exploratory analysis tools and report
  descriptive statistics over datasets, but any new idea, typically not
  anticipated by data providers, is met with the same barriers. Many scientists
  aren't able to innovate for themselves. The problem is particularly acute for
  small colleges and HBCUs that lack both expertise and resources and are
  essentially disenfranchised from data-driven science. 
  </p>
  <p>
  This project brings together a transdisciplinary team to decrease the barrier to
  entry for data-driven science for ISU researchers and other data-driven
  scientists around the world by enabling them to harness open data for
  21st-century science and engineering. By doing so, we aim to prepare data-driven
  scientists for grand challenges of the next decade, create unique data science
  capabilities for research and education, and leverage federal, state, local and
  private investments to facilitate shared and collaborative data-driven science.
  </p>
  <hr>
  </div>
</div>

{% assign newss = site.data.sdsinews %}
<div class = "row">
    {% for news in newss %}
      {%include sdsi/news.html news=news %}
    {% endfor %}
</div>

