---
layout: page
title: Papers
permalink: /papers/
---
<style>

  @media screen and (max-width: 543px){
    .btn {
      width: 33%;
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
</style>

<script language="javascript">
//Frances is merged with Sapha
var projects = ["panini", "boa", "ptolemy", "eos", "nu", "sapha", "slede", "tisa", "osiris", "no_project"];
var paper_types_venue = ["conference", "journal", "workshop", "thesis", "technical_report", "other"];
var paper_types_date = ["general", "thesis", "technical_report"];
var general_types = ["conference", "journal", "workshop", "other", "poster"];
var other_types = ["other", "poster"];
var sortedBy = "none";
var masterDiv = "sorted-papers";
var defaultSort = 'date';
var tocID = 'papers-toc';
var btnsID = 'sort-btns';

window.onload = function(){
  sort(window.location.href);
  $("#"+masterDiv).css("display", "block");
  $("#"+tocID).css("display", "table");
  $('#'+defaultSort+'-btn').removeClass('active');
  $('#'+sortedBy+'-btn').addClass('active');
  $('#'+btnsID).css("display", "block");
}

var toType = function(obj) {//for debugging purposes
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
    if(sortBy.includes("project")){
      hideVenueSort();
      hideDateSort();
      for(i = 0; i < projects.length; i++){
        var project = projects[i];
        var projectList;
        if(project=="no_project"){
          projectList = $(".paper_card").not(getTypes(projects));
        } else {
          projectList = $("."+project);
        }
        var projectHeader = $("#"+project+"-project-title");
        projectHeader.css("display", "block");
        $("#"+project+"-project-toc").css("display", "list-item");
        parent.appendChild(projectHeader[0]);

        projectList.sort(sort_by_year);
        for(j = 0; j < projectList.length; j++){
          parent.appendChild(projectList[j]);
        }
      }
      sortedBy = "project";
    } else if(sortBy.includes("venue")){
      hideDateSort();
      hideProjectSort();
      for(i = 0; i < paper_types_venue.length; i++){
        var paper_type = paper_types_venue[i];
        var paperTypeList;
        if(paper_type == "other"){
          paperTypeList = $(getTypes(other_types));
        } else {
          paperTypeList = $("."+paper_type);
        }
        var paperTypeHeader = $("#"+paper_type+"-venue-title");
        paperTypeHeader.css("display", "block");
        $("#"+paper_type+"-venue-toc").css("display", "list-item");

        parent.appendChild(paperTypeHeader[0]);
        paperTypeList.sort(sort_by_year);
        for(j = 0; j < paperTypeList.length; j++){
          parent.appendChild(paperTypeList[j]);
        }
      }
      sortedBy = "venue";
    } else {//This should correspond to the default checkbox
      hideProjectSort();
      hideVenueSort();
      for(i = 0; i < paper_types_date.length; i++){
        var paper_type = paper_types_date[i];
        var paperHeader = $("#"+paper_type+"-date-title");
        paperHeader.css("display", "block");
        $("#"+paper_type+"-date-toc").css("display", "list-item");
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
      sortedBy = "date";
    }
    if(!location.hash.includes(sortedBy)){
      location.hash = "#"+sortedBy;
    }
  }
}

function hideProjectSort(){
  for(i = 0; i < projects.length; i++){
    $("#"+projects[i]+"-project-title").css("display", "none");
    $("#"+projects[i]+"-project-toc").css("display", "none");
  }
}

function hideVenueSort(){
  for(i = 0; i < paper_types_venue.length; i++){
    $("#"+paper_types_venue[i]+"-venue-title").css("display", "none");
    $("#"+paper_types_venue[i]+"-venue-toc").css("display", "none");
  }
}

function hideDateSort(){
  for(i = 0; i < paper_types_date.length; i++){
    $("#"+paper_types_date[i]+"-date-title").css("display", "none");
    $("#"+paper_types_date[i]+"-date-toc").css("display", "none");
  }
}
</script>

{% assign paper_types_project = "panini boa ptolemy eos nu sapha slede tisa osiris no_project" | split: ' ' %}
{% assign paper_types_venue = "conference journal workshop thesis technical_report other" | split: ' ' %}
{% assign paper_types_date = "general thesis technical_report" | split: ' ' %}

<div class="row">

  <div class="col-xs-12 col-sm-6">
    <ol id="papers-toc" style="display: none">
      {% for paper_type in paper_types_venue %}
        <li id="{{paper_type}}-venue-toc">
          <a href="#{{paper_type}}-venue-title">
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
        <li id="{{paper_type}}-date-toc">
          <a href="#{{paper_type}}-date-title">
          {% cycle "Articles and Papers","PhD and MS Theses","Technical Reports" %}
          </a>
        </li>
      {% endfor %}
      {% for paper_type in paper_types_project %}
        <li id="{{paper_type}}-project-toc">
          <a href="#{{paper_type}}-project-title">
            {% if paper_type == "no_project" %}
              Other
            {% else %}
              {{ paper_type | capitalize }}
            {% endif %}
          </a>
        </li>
      {% endfor %}
    </ol>
  </div>

  <div id="sort-btns" class="col-xs-12 col-sm-6" style="display: none">
    <div class="btn-group paper-btns" data-toggle="buttons" aria-label="Sorting">
      <label id="date-btn" class="btn btn-primary paper-btn date-btn active" onclick="sort('date')">
        <input type="radio" name="options" id="option1" autocomplete="off">Date
      </label>
      <label id="venue-btn" class="btn btn-primary paper-btn venue-btn" onclick="sort('venue')">
        <input type="radio" name="options" id="option1" autocomplete="off" checked>Venue
      </label>
      <label id="project-btn" class="btn btn-primary paper-btn project-btn" onclick="sort('project')">
        <input type="radio" name="options" id="option1" autocomplete="off" checked>Project
      </label>
    </div>
  </div>

  <div class="sorted-papers col-xs-12" style="display: none" id="sorted-papers">

    {% for paper_type in paper_types_venue %}
      <h2 id="{{paper_type}}-venue-title" class="space-above">
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
      <h2 id="{{paper_type}}-date-title" class="space-above">
        {% cycle "Articles and Papers","PhD and MS Theses","Technical Reports" %}
      </h2>
    {% endfor %}

    {% for paper_type in paper_types_project %}
      <h2 id="{{paper_type}}-project-title" class="space-above">
        {% if paper_type == "no_project" %}
          Other
        {% else %}
          {{ paper_type | capitalize }}
        {% endif %}
      </h2>
    {% endfor %}

    {% for paper in site.papers %}
      {% if paper.supplement != true %}
        {% include papers_page/paper_card.html paper=paper accordionKey='-papers-list' %}
      {% endif %}
    {% endfor %}
  </div>
</div>
