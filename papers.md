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
var projects = ["panini", "boa", "ptolemy", "eos", "nu", "sapha", "slede", "tisa", "osiris", "no_project"];
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
      for(i = 0; i < paper_types_project.length; i++){
        var paper_type = paper_types_project[i];
        var paperTypeList;
        if(paper_type == "other"){
          paperTypeList = $(getTypes(other_types));
        } else {
          paperTypeList = $("."+paper_type);
        }
        var paperTypeHeader = $("#"+paper_type+"-project-title");
        paperTypeHeader.css("display", "block");
        $("#"+paper_type+"-project-toc").css("display", "list-item");

        parent.appendChild(paperTypeHeader[0]);
        for(j = 0; j < projects.length; j++){
          var project = projects[j];
          var projectList;
          if(project == "no_project"){
            projectList = paperTypeList.not(getTypes(projects));
          } else if(project == "sapha"){
            projectList = paperTypeList.filter(".sapha,.frances");//Dr. Rajan wants frances merged with sapha
          } else {
            projectList = paperTypeList.filter("."+project);
          }
          if(projectList.length > 0){
            projectList.sort(sort_by_year);
            for(k = 0; k < projectList.length; k++){
              parent.appendChild(projectList[k]);
            }
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
  for(i = 0; i < paper_types_project.length; i++){
    $("#"+paper_types_project[i]+"-project-title").css("display", "none");
    $("#"+paper_types_project[i]+"-project-toc").css("display", "none");
  }
}

function hideDateSort(){
  for(i = 0; i < paper_types_date.length; i++){
    $("#"+paper_types_date[i]+"-title").css("display", "none");
    $("#"+paper_types_date[i]+"-toc").css("display", "none");
  }
}
</script>

{% assign paper_types = "conference journal workshop thesis technical_report other" | split: ' ' %}
{% assign paper_types_date = "general thesis technical_report" | split: ' ' %}

<div class="sorted-papers" style="display: none" id="sorted-papers">
  <ol id="papers-toc">
    {% for paper_type in paper_types %}
      <li id="{{paper_type}}-project-toc">
        <a href="#{{paper_type}}-project-title">
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
    {% for paper_type in paper_types_date %}
      <li id="{{paper_type}}-toc">
        <a href="#{{paper_type}}-title">
        {% cycle "General","PhD and MS Theses","Technical Reports" %}
        </a>
      </li>
    {% endfor %}
  </ol>
  {% for paper_type in paper_types %}
    <h2 id="{{paper_type}}-project-title" class="space-above">
    {% if paper_type == "technical_report" %}
      Technical Reports
    {% elsif paper_type == "thesis" %}
      PhD and MS Theses
    {% else %}
      {{ paper_type | capitalize }}
    {% endif %}
    </h2>
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
