---
layout: page
title: Papers
permalink: /papers/
---

<div class="col-xs-12 col-sm-6 title">
  <h2>{{ page.title }}</h2>
</div>
<div class="col-xs-12 col-sm-6 title">
  <div class="btn-group paper-btns" data-toggle="buttons" aria-label="Sorting">
    <label id="project-btn" class="btn btn-primary paper-btn active project-btn" onclick="sort('project')">
      <input type="radio" name="options" id="option1" autocomplete="off" checked>Project
    </label>
    <label id="date-btn" class="btn btn-primary paper-btn date-btn" onclick="sort('date')">
      <input type="radio" name="options" id="option1" autocomplete="off">Publication Date
    </label>
  </div>
</div>

<style>

  @media screen and (max-width: 543px){
    .btn {
      width: 50%;
    }
    .paper-btns {
      float: none;
      width: 100%;
    }
  }
  .paper-btns {
    float: right;
  }

  .page-title {
    display: none;
  }
  .title {
    padding: 0;
  }
</style>

<script language="javascript">
var projects = ["panini", "boa", "ptolemy", "eos", "frances", "nu", "sapha", "slede", "tisa", "osiris", "no_project"];
var paper_types_project = ["conference", "journal", "workshop", "thesis", "technical_report", "other"];
var paper_types_date = ["general", "thesis", "technical_report"];
var general_types = ["conference", "journal", "workshop", "other", "poster"];
var other_types = ["other", "poster"];
var sortedBy = "none";
var masterDiv = "sorted-papers";

window.onload = function(){
  $("#"+masterDiv).css("display", "block");
  sort('project');
}

var toType = function(obj) {
  return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase()
}
var sort_by_year = function(a, b){
  return parseInt(b.getAttribute("data-year")) - parseInt(a.getAttribute("data-year"));
}

var getTypes = function(types){
  var answer = "";
  for(z = 0; z < types.length; z++){
    answer += "." + types[z] + ",";
  }
  return answer.substring(0, answer.length-1);
}


function sort(sortBy){
  if(sortBy != sortedBy){
    var parent = $("#"+masterDiv)[0];
    if(sortBy=="project"){
      hideDateSort();
      for(i = 0; i < projects.length; i++){
        var project = projects[i];
        var projectList;
        if(project == "no_project"){
          projectList = $(".paper_card").not(getTypes(projects));
        } else {
          projectList = $("."+project);
        }
        var projectHeader = $("#"+project+"-title");
        projectHeader.css("display", "block");
        $("#"+project+"-toc").css("display", "list-item");

        parent.appendChild(projectHeader[0]);
        for(j = 0; j < paper_types_project.length; j++){
          var paper_type = paper_types_project[j];
          var papersByType = [];
          if(paper_type == "other"){
            papersByType = projectList.filter(getTypes(other_types));
          } else {
            papersByType = projectList.filter("."+paper_type);
          }
          var typeHeader = $("#"+project+"-"+paper_type+"-title");
          //var typeTOC = $("#"+project+"-"+paper_type+"-toc");
          if(papersByType.length > 0){
            typeHeader.css("display", "block");
            //typeTOC.css("display", "list-item");
            parent.appendChild(typeHeader[0]);
            papersByType.sort(sort_by_year);
            for(k = 0; k < papersByType.length; k++){
              parent.appendChild(papersByType[k]);
            }
          } else {
            typeHeader.css("display", "none");
            //typeTOC.css("display", "none");
          }
        }
      }
    } else if(sortBy=="date"){
      hideProjectSort();
      for(i = 0; i < paper_types_date.length; i++){
        var paper_type = paper_types_date[i];
        var paperHeader = $("#"+paper_type+"-title");
        paperHeader.css("display", "block");
        $("#"+paper_type+"-toc").css("display", "list-item");
        parent.appendChild(paperHeader[0]);
        var papers = [];
        if(paper_type == "general"){
          papers = $(getTypes(general_types)).get();
        } else {
          papers = $("."+paper_type).get();
        }
        papers.sort(sort_by_year);
        for(j = 0; j < papers.length; j++){
          parent.appendChild(papers[j]);
        }
      }
    }
    sortedBy=sortBy;
  }
}

function hideProjectSort(){
  for(i = 0; i < projects.length; i++){
    $("#"+projects[i]+"-title").css("display", "none");
    $("#"+projects[i]+"-toc").css("display", "none");
    for(j = 0; j < paper_types_project.length; j++){
      $("#"+projects[i]+"-"+paper_types_project[j]+"-title").css("display", "none");
      //$("#"+projects[i]+"-"+paper_types_project[i]+"toc").css("display", "none");
    }
  }
}

function hideDateSort(){
  for(i = 0; i < paper_types_date.length; i++){
    $("#"+paper_types_date[i]+"-title").css("display", "none");
    $("#"+paper_types_date[i]+"-toc").css("display", "none");
  }
}
</script>

{% assign projects = "panini boa ptolemy eos frances nu sapha slede tisa osiris no_project" | split: ' ' %}
{% assign paper_types = "conference journal workshop thesis technical_report other" | split: ' ' %}
{% assign paper_types_date = "general thesis technical_report" | split: ' ' %}

<div class="sorted-papers" style="display: none" id="sorted-papers">
  <ol id="papers-toc">
    {% for project in projects %}
      <li id="{{project}}-toc">
        <a href="#{{project}}-title">
        {% if project == "no_project" %}
          Other
        {% else %}
          {{ project | capitalize }}
        {% endif %}
        </a>
        {% comment %}
        This makes the ToC incredibly big
        <ol>
          {% for paper_type in paper_types %}
            <li id="{{project}}-{{paper_type}}-toc">
              <a href="{{project}}-{{paper_type}}-title">
                {% if paper_type == "technical_report" %}
                  Technical Reports
                {% elsif paper_type == "thesis" %}
                  PhD and MS Theses
                {% else %}
                  {{ paper_type | capitalize }}
                {% endif %}
              </a>
            </li>
          {% endfor %}
        </ol>
        {% endcomment %}
      </li>
    {% endfor %}
    {% for paper_type in paper_types_date %}
      <li id="{{paper_type}}-toc">
        <a href="#{{paper_type}}-title">
        {% cycle "General","PhD and MS Theses","Technical Reports" %}
        </a>
      </li>
    {% endfor %}
  </ol>
  {% for project in projects %}
    <h2 id="{{project}}-title" class="space-above">
    {% if project == "no_project" %}
      Other
    {% else %}
      {{ project | capitalize }}
    {% endif %}
    </h2>
    {% for paper_type in paper_types %}
      <h4 id="{{project}}-{{paper_type}}-title">
        {% if paper_type == "technical_report" %}
          Technical Reports
        {% elsif paper_type == "thesis" %}
          PhD and MS Theses
        {% else %}
          {{ paper_type | capitalize }}
        {% endif %}
      </h4>
    {% endfor %}
  {% endfor %}
  {% for paper_type in paper_types_date %}
    <h4 id="{{paper_type}}-title">
      {% cycle "General","PhD and MS Theses","Technical Reports" %}
    </h4>
  {% endfor %}

  {% for paper in site.papers %}
    {% include papers_page/paper_card.html paper=paper accordionKey='-papers-list' %}
  {% endfor %}
</div>
