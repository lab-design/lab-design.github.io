<?php
	require_once("includes/template.inc.php");

	drawHeader("People Involved in the Nu Project");

	$hridesh = formatEmail("hridesh@cs.iastate.edu");
	$rdyer = formatEmail("rdyer@cs.iastate.edu");
	$rsetty = formatEmail("rsetty@cs.iastate.edu");
	$ysuvorov = formatEmail("ysuvorov@cs.iastate.edu");

	echo <<<EOHTML
<h2 class="bar">Faculty</h2>

<p><b><a href="http://www.cs.iastate.edu/~hridesh">Hridesh Rajan</a></b> is
the principal investigator of the <a href="http://www.cs.iastate.edu/~nu">Nu</a> 
project. He is an Assistant Professor in the  <a href="http://www.cs.iastate.edu">
Department of Computer Science</a> at the <a href="http://www.iastate.edu">
Iowa State University</a>. His research interests are in software
engineering, programming language design and implementation, and
mobile ad hoc and sensor networks. He can be reached at $hridesh.</p>

<h2 class="bar">Students</h2>

<p><b><a href="http://www.cs.iastate.edu/~rdyer/">Robert Dyer</a></b> is
a Ph.D. student in the <a href="http://www.cs.iastate.edu">
Department of Computer Science</a> at the <a href="http://www.iastate.edu">
Iowa State University</a>,
where he works with <a href="http://www.cs.iastate.edu/~hridesh">Hridesh Rajan</a>.
 His research interests are in software engineering 
and programming languages. He is interested in developing new programming 
models and improving upon existing models in order to maintain the benefits 
of software engineering practices such as separation of concerns, agile 
software development, etc. He can be reached at $rdyer.</p>

<br/>
<h1>Past Members of the Nu Project</h1>

<ul>
	<li>Steven Beckert (Aug 2005 - May 2006, <a href="http://www.honors.iastate.edu/">Freshman Honors Program</a>)</li>
	<li><a href="http://www.cs.iastate.edu/~ywhanna/">Youssef Hanna</a> (Jan 2006 - May 2006): 
		Youssef is now leading the <a href="http://www.cs.iastate.edu/~slede/">Slede project</a></li>
	<li><a href="http://www.cs.iastate.edu/~harish/">Harish Narayanappa</a> (Jan 2006 - Aug 2006):
		Harish is now working with Yahoo</li>
	<li>Brian Peck (Sep 2006 - May 2007, <a href="http://www.honors.iastate.edu/">Freshman Honors Program</a>)</li>
	<li>Ivan Rook (Aug 2005 - May 2006, <a href="http://www.honors.iastate.edu/">Freshman Honors Program</a>)</li>
	<li><a href="">Rakesh Setty</a> (Aug 2006 - Aug 2008):
		Rakesh is now working with Yahoo</li>
	<li><a href="http://www.cs.iastate.edu/~design/">Yuly Suvorov</a> (Jan 2007 - Jan 2008, <a href="http://www.honors.iastate.edu">Honors Program</a>)</li>
</ul>

EOHTML;

	drawFooter();
?>
