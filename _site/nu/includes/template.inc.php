<?php
	require_once("menu.inc.php");
	require_once("news.inc.php");


	// draws a non-spam email link
	function formatEmail($email, $txt = null)
	{
		preg_match('/(.*)@(.*)\.([^.]+)/', $email, $matches);

		if ($txt === null)
			$txt = "' + (['$matches[1]', '$matches[2].$matches[3]'].join('@')) + '";

		return <<<EOHTML
<script type="text/javascript"><!--
document.write('<a href="mailto:' + (['$matches[1]', '$matches[2].$matches[3]'].join('@'))
+ '">$txt<\/a>');
// --></script><ins><noscript><div><code>$matches[1] (at) $matches[2] (dot) $matches[3]</code></div></noscript></ins>
EOHTML;
	}


	// draws the template header
	function drawHeader($title, $img = null)
	{
		if ($img !== null)
			$img = "<div class=\"imagearea\"><img src=\"/~nu/images/$img\" alt=\"\"/></div>";

		echo <<<EOHTML
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="description" content="The Nu Intermediate Language Model and Virtual Machine"/>
<meta name="keywords" content="nu, design, modularity, virtual machine, java, research, 
           robert dyer, hridesh rajan, laboratory for software design, iowa state university,
		   aspect-oriented virtual machine, aspect-oriented intermediate language, separation
		   of concerns, structure preserving compilation"/>		
<title>Nu Project - Department of Computer Science - Iowa State University</title>
<style type="text/css" media="screen">@import url(/~nu/css/base.css);</style>
<link href="/~nu/css/print.css" media="print" rel="stylesheet" type="text/css"/>
<!--[if lt IE 7]>
			<style type="text/css" media="screen">
				@import url(/~nu/css/ie/base.css);
			</style>

			<link href="/~nu/css/ie/print.css" media="print" rel="stylesheet" type="text/css"/>
<![endif]-->
<link href="/~nu/css/style.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="/~nu/css/print-local.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="/~nu/sifr.js" type="text/javascript"></script><script type="text/javascript">
	// replaces the site tag with a sifr flash version of it
	function sIFR_replace()
	{
		if (sIFR != null)
			if (sIFR.replaceElement != null)
				sIFR.replaceElement("h6", "/~nu/univers_bold.swf", null, "#ffffff", null, "#cc0000", 1, 0, 0, 0);
	}
</script><link rel="shortcut icon" href="/favicon.ico"/>
</head>

<body onload="sIFR_replace()"><div id="container">

<div id="masthead">
<div id="logo">
<a href="http://www.iastate.edu/"><img alt="Iowa State University" src="/~nu/images/iowa-state-university.gif"/></a><br/><div class="skip"> | </div>
<h6><a href="/~nu/">Nu Project</a></h6>
</div>

<div class="skip">Skip to: <a href="#main">Main Body Text</a> | <a href="#menu">Site Navigation</a> | <a href="#searcharea">Search</a> | <a href="#isuindex">Iowa State University Index</a><br/><br/></div>

<div id="index_empty"></div>
<a name="searcharea"></a>
<div id="search"><form method="get" action="http://google.iastate.edu/search"><div>
<a href="http://ph.iastate.edu/">Phonebook</a> | <label for="isusearch">Search ISU </label><input type="hidden" name="output" value="xml_no_dtd"/><input type="hidden" name="client" value="default_frontend"/><input type="hidden" name="proxystylesheet" value="default_frontend"/><input type="text" name="q" id="isusearch" size="18"/><input type="submit" name="btnG" value="Go"/>
</div></form></div>
</div>
<div id="printheader"><img src="/~nu/images/printheader.gif" width="1" height="1" alt="Iowa State University IT"/></div>
<div id="goldbar">
						<!-- Fix for IE giving empty DIVs a default height -->
					</div>
<div id="nav_container"></div>

<a name="main"></a><div id="content">
$img
<div class="title"><h1>$title</h1></div>

EOHTML;
	}


	// draws the template footer
	function drawFooter()
	{
		global $menu, $news, $settings;

		$email = formatEmail("nu@cs.iastate.edu");

		$year = date("Y");

		echo <<<EOHTML
</div>
<div id="footer">
<img alt="Iowa State University. Becoming the best" src="/~nu/images/isubecoming.gif"/><p><script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
	var pageTracker = _gat._getTracker("UA-1547227-1");
	pageTracker._trackPageview();
} catch(err) {}</script>
Department of Computer Science, $email<br/>
Copyright &copy; 1995-$year, Iowa State University of Science and Technology. All rights reserved.
</p>
</div>
<a name="menu"></a><div id="nav_empty"><div id="nav">

<div id="navheader"></div>
<ul>
EOHTML;

		$thisPage = $_SERVER['SCRIPT_URL'];
		if (substr($thisPage, -9) == "index.php")
			$thisPage = substr($thisPage, 0, -9);

		foreach ($menu as $url => $title)
		{
			$selected = ($url == $thisPage) ? " class=\"selected\"" : null;
			echo "<li><a$selected href=\"$url\">$title</a></li>\n";
		}

		echo <<<EOHTML
</ul>
<div id="navfooter">
<!--
	<h3 style="margin-top: 0;">News</h3>
-->

EOHTML;

		foreach (array_slice((array)$news, 0, $settings["news_headline_limit"]) as $date => $entry)
			echo "<p class=\"news\"><b>$date</b>:<br/>$entry</p>\n";

		echo <<<EOHTML

		<a href="/~nu/news.php">News Archive</a>
</div>
</div></div>

<script type="text/javascript">
	// 'move' the nav div to the nav_container div
	document.getElementById("nav_container").innerHTML = document.getElementById("nav_empty").innerHTML;
	// hide the nav_empty div
	document.getElementById("nav_empty").style.display = "none";
	document.getElementById("nav_empty").innerHTML = "";
</script>
<a name="isuindex"></a><div id="index"><ul>
<li><a href="http://www.iastate.edu/index/alpha/A.shtml" id="indexlabel">ISU INDEX</a></li>
<li><a href="http://www.iastate.edu/index/alpha/A.shtml" id="a">A</a></li>
<li><a href="http://www.iastate.edu/index/alpha/B.shtml" id="b">B</a></li>
<li><a href="http://www.iastate.edu/index/alpha/C.shtml" id="c">C</a></li>
<li><a href="http://www.iastate.edu/index/alpha/D.shtml" id="d">D</a></li>
<li><a href="http://www.iastate.edu/index/alpha/E.shtml" id="e">E</a></li>
<li><a href="http://www.iastate.edu/index/alpha/F.shtml" id="f">F</a></li>
<li><a href="http://www.iastate.edu/index/alpha/G.shtml" id="g">G</a></li>
<li><a href="http://www.iastate.edu/index/alpha/H.shtml" id="h">H</a></li>
<li><a href="http://www.iastate.edu/index/alpha/I.shtml" id="i">I</a></li>
<li><a href="http://www.iastate.edu/index/alpha/J.shtml" id="j">J</a></li>
<li><a href="http://www.iastate.edu/index/alpha/K.shtml" id="k">K</a></li>
<li><a href="http://www.iastate.edu/index/alpha/L.shtml" id="l">L</a></li>
<li><a href="http://www.iastate.edu/index/alpha/M.shtml" id="m">M</a></li>
<li><a href="http://www.iastate.edu/index/alpha/N.shtml" id="n">N</a></li>
<li><a href="http://www.iastate.edu/index/alpha/O.shtml" id="o">O</a></li>
<li><a href="http://www.iastate.edu/index/alpha/P.shtml" id="p">P</a></li>
<li><a href="http://www.iastate.edu/index/alpha/Q.shtml" id="q">Q</a></li>
<li><a href="http://www.iastate.edu/index/alpha/R.shtml" id="r">R</a></li>
<li><a href="http://www.iastate.edu/index/alpha/S.shtml" id="s">S</a></li>
<li><a href="http://www.iastate.edu/index/alpha/T.shtml" id="t">T</a></li>
<li><a href="http://www.iastate.edu/index/alpha/U.shtml" id="u">U</a></li>
<li><a href="http://www.iastate.edu/index/alpha/V.shtml" id="v">V</a></li>
<li><a href="http://www.iastate.edu/index/alpha/W.shtml" id="w">W</a></li>
<li><a href="http://www.iastate.edu/index/alpha/X.shtml" id="x">X</a></li>
<li><a href="http://www.iastate.edu/index/alpha/Y.shtml" id="y">Y</a></li>
<li><a href="http://www.iastate.edu/index/alpha/Z.shtml" id="z">Z</a></li>
</ul></div>
</div></body>
</html>

EOHTML;
	}


	function drawWideHeader($title, $img = null)
	{
		if ($img !== null)
			$img = "<div class=\"imagearea\"><img src=\"/~nu/images/$img\" alt=\"\"/></div>";

		echo <<<EOHTML
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<title>Nu Project - Department of Computer Science - Iowa State University</title>
<style type="text/css" media="screen">@import url(/~nu/css/base.css);</style>
<link href="/~nu/css/print.css" media="print" rel="stylesheet" type="text/css"/>
<!--[if lt IE 7]>
			<style type="text/css" media="screen">
				@import url(/~nu/css/ie/base.css);
			</style>

			<link href="/~nu/css/ie/print.css" media="print" rel="stylesheet" type="text/css"/>
<![endif]-->
<link href="/~nu/css/style.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="/~nu/css/print-local.css" media="screen" rel="stylesheet" type="text/css"/>
<style type="text/css">
	#container
	{
		background: 0;
	}

	#content
	{
		width: 730px ! important;
	}
</style>
<script src="/~nu/sifr.js" type="text/javascript"></script><script type="text/javascript">
	// replaces the site tag with a sifr flash version of it
	function sIFR_replace()
	{
		if (sIFR != null)
			if (sIFR.replaceElement != null)
				sIFR.replaceElement("h6", "/~nu/univers_bold.swf", null, "#ffffff", null, "#cc0000", 1, 0, 0, 0);
	}
</script><link rel="shortcut icon" href="/favicon.ico"/>
</head>

<body onload="sIFR_replace()"><div id="container">

<div id="masthead">
<div id="logo">
<a href="http://www.iastate.edu/"><img alt="Iowa State University" src="/~nu/images/iowa-state-university.gif"/></a><br/><div class="skip"> | </div>
<h6><a href="/~nu/">Nu Project</a></h6>
</div>

<div class="skip">Skip to: <a href="#main">Main Body Text</a> | <a href="#searcharea">Search</a> | <a href="#isuindex">Iowa State University Index</a><br/><br/></div>

<div id="index_empty"></div>
<a name="searcharea"></a>
<div id="search"><form method="get" action="http://google.iastate.edu/search"><div>
<a href="http://ph.iastate.edu/">Phonebook</a> | <label for="isusearch">Search ISU </label><input type="hidden" name="output" value="xml_no_dtd"/><input type="hidden" name="client" value="default_frontend"/><input type="hidden" name="proxystylesheet" value="default_frontend"/><input type="text" name="q" id="isusearch" size="18"/><input type="submit" name="btnG" value="Go"/>
</div></form></div>
</div>
<div id="printheader"><img src="/~nu/images/printheader.gif" width="1" height="1" alt="Iowa State University IT"/></div>
<div id="goldbar">
						<!-- Fix for IE giving empty DIVs a default height -->
					</div>

<a name="main"></a><div id="content">
$img
<div class="title"><h1>$title</h1></div>

EOHTML;
	}


	function drawWideFooter()
	{
		global $menu, $news, $settings;

		$email = formatEmail("nu@cs.iastate.edu");

		$year = date("Y");

		echo <<<EOHTML
</div>
<div id="footer">
<img alt="Iowa State University. Becoming the best" src="/~nu/images/isubecoming.gif"/><p><script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script><script type="text/javascript">
	_uacct = "UA-1547227-1";
	urchinTracker();
</script>
Department of Computer Science, $email<br/>
Copyright &copy; 1995-$year, Iowa State University of Science and Technology. All rights reserved.
</p>
</div>

<a name="isuindex"></a><div id="index"><ul>
<li><a href="http://www.iastate.edu/index/alpha/A.shtml" id="indexlabel">ISU INDEX</a></li>
<li><a href="http://www.iastate.edu/index/alpha/A.shtml" id="a">A</a></li>
<li><a href="http://www.iastate.edu/index/alpha/B.shtml" id="b">B</a></li>
<li><a href="http://www.iastate.edu/index/alpha/C.shtml" id="c">C</a></li>
<li><a href="http://www.iastate.edu/index/alpha/D.shtml" id="d">D</a></li>
<li><a href="http://www.iastate.edu/index/alpha/E.shtml" id="e">E</a></li>
<li><a href="http://www.iastate.edu/index/alpha/F.shtml" id="f">F</a></li>
<li><a href="http://www.iastate.edu/index/alpha/G.shtml" id="g">G</a></li>
<li><a href="http://www.iastate.edu/index/alpha/H.shtml" id="h">H</a></li>
<li><a href="http://www.iastate.edu/index/alpha/I.shtml" id="i">I</a></li>
<li><a href="http://www.iastate.edu/index/alpha/J.shtml" id="j">J</a></li>
<li><a href="http://www.iastate.edu/index/alpha/K.shtml" id="k">K</a></li>
<li><a href="http://www.iastate.edu/index/alpha/L.shtml" id="l">L</a></li>
<li><a href="http://www.iastate.edu/index/alpha/M.shtml" id="m">M</a></li>
<li><a href="http://www.iastate.edu/index/alpha/N.shtml" id="n">N</a></li>
<li><a href="http://www.iastate.edu/index/alpha/O.shtml" id="o">O</a></li>
<li><a href="http://www.iastate.edu/index/alpha/P.shtml" id="p">P</a></li>
<li><a href="http://www.iastate.edu/index/alpha/Q.shtml" id="q">Q</a></li>
<li><a href="http://www.iastate.edu/index/alpha/R.shtml" id="r">R</a></li>
<li><a href="http://www.iastate.edu/index/alpha/S.shtml" id="s">S</a></li>
<li><a href="http://www.iastate.edu/index/alpha/T.shtml" id="t">T</a></li>
<li><a href="http://www.iastate.edu/index/alpha/U.shtml" id="u">U</a></li>
<li><a href="http://www.iastate.edu/index/alpha/V.shtml" id="v">V</a></li>
<li><a href="http://www.iastate.edu/index/alpha/W.shtml" id="w">W</a></li>
<li><a href="http://www.iastate.edu/index/alpha/X.shtml" id="x">X</a></li>
<li><a href="http://www.iastate.edu/index/alpha/Y.shtml" id="y">Y</a></li>
<li><a href="http://www.iastate.edu/index/alpha/Z.shtml" id="z">Z</a></li>
</ul></div>
</div></body>
</html>

EOHTML;
	}
?>
