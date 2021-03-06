<?php
	require_once("includes/template.inc.php");
	require_once("includes/pubs.inc.php");

	drawHeader("What is Nu?");
?>

<p>
	Nu (pronounced <i>new</i>) is a novel intermediate language design that
	aims to preserve in the object code the design modularity provided in
	source code by emerging modularization mechanisms, for improved scalability
	of software development processes.
</p>

<h1>Motivation</h1>

<img src="/~nu/images/tracingconcerns.jpg" alt="Example" width="584px"/>

<p>
	Emerging modularization mechanisms such as mix-ins, open classes, hyper-slices,
	composition filters, aspects, etc provide software engineers with new
	possibilities for keeping conceptual concerns separate at the source code
	level. For a number of reasons, for example to generate object code that is
	compliant with existing virtual machines (VM), to lower the barrier to
	entry, implementation techniques for these modularization mechanisms sacrifice
	this separation of concerns in transforming source to object code. To
	illustrate, let us consider the figure above. In the figure, C<sub>1</sub> to
	C<sub>n</sub> and C<sup>'</sup><sub>1</sub> to C<sup>'</sup><sub>n</sub> are
	the base and the crosscutting concerns respectively. The figure shows that the
	concerns are separate in the domain, requirement, design and implementation
	phases. During compilation, to realize the crosscutting behavior,
	C<sub>1</sub>-C<sub>n</sub> are now modified by inserting calls to and
	fragments from C<sup>'</sup><sub>1</sub>-C<sup>'</sup><sub>n</sub>. The
	implementations of the crosscutting concerns are scattered and tangled with the
	base code. 
</p>

<p>
	The aim of the Nu project is to show that, first, it is feasible to realize a
	programming model that preserves design modularity in object code, and second
	that preserving design modularity has the potential to improve the scalability of
	software development processes such as incremental compilation, debugging, etc.
</p>

<h2>Recent Publications/Presentations</h2>
<ul>
<?php
	$pubs = flattenPubs($papers);
	usort($pubs, 'pubSort');

	for ($i = 0; $i < 3; $i++)
		echo "\t<li>", $pubs[$i]->format(), "</li>\n";
?>
<li><a href="/~nu/papers/">See more...</a></li>
</ul>

<?php
	drawFooter();
?>
