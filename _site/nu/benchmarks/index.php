<?php
	require_once("../includes/template.inc.php");

	drawHeader("Nu JVM Benchmarks");
?>
<script type="text/javascript"><!--
	function openBenchmark(id)
	{
		width = 800 + 32;
		height = 600 + 96;
		left = (screen.width - width) / 2;
		top = (screen.height - height) / 2;

		var win = window.open('http://www.cs.iastate.edu/~nu/benchmarks/details.php?id=' + id,
			'benchmarks',
			'width=' + width + ',height=' + height + ',' + 'left=' + left + ',top=' + top + ',' + 'location=no,menubar=no,status=no,toolbar=no,resizable=yes,scrollbars=yes');

		win.resizeTo(width, height);
		win.moveTo(left, top);
		win.focus();
}
// --></script>

<p>
	This area contains all information regarding the evaluation of our current
	implementation of the Nu JVM.  Please check back often, as these results
	will be updated frequently as we make various improvements.
</p>

<p>
	Three types of overhead have been identified regarding the implementation
	of Nu JVM.  These are: dispatch, delegate invocation, and pattern matching.
	We will actively track the performance of our implementation with regard to
	these specific overheads.
</p>


<h2>Dispatch Overhead</h2>
<p>
	This overhead appears due to the addition of code to perform dispatching.
	The dispatch code needs to call the matching code (if appropriate) and call
	the delegate invoke code (if appropriate).  This code must run every time a
	join point executes, regardless of number of bound patterns.
</p>
<h4>Performance Goals</h4>
<ul>
	<li>
		This overhead should be constant &mdash; independent of the number of patterns already bound.<br/>
		<b>Status</b>: <span class="success">Success</span>
	</li>
	<li>
		This overhead should be minimal &mdash; ideally zero.<br/>
		<b>Status</b>: <span class="inprogress">In-progress</span>
	</li>
</ul>
<p>
	Early implementations suffered from having to call the matcher every time a
	join point executed.  The addition of caching improved this performance
	through remembering the previous match(es) and only performing matching as
	needed.  Delegates associated with matched patterns are cached at each join
	point so the dispatch knows if it should call the delegate invocation code.
</p>
<h4>Benchmarks</h4>
<ul>
	<li><a href="javascript:return false;" onclick="openBenchmark(0);">Java Grande Results</a></li>
	<li><a href="javascript:return false;" onclick="openBenchmark(1);">SPEC JVM98 Results</a></li>
</ul>


<h2>Delegate Invocation Overhead</h2>
<p>
	This overhead appears due to the need to invoke delegates at the execution
	of matched join points.  At each executing join point, for each (currently)
	bound pattern that matches it, the associated delegate must be invoked.
</p>
<h4>Performance Goals</h4>
<ul>
	<li>
		This overhead should be linear in the number of delegates needing invoked.<br/>
		<b>Status</b>: <span class="success">Success</span>
	</li>
	<li>
		This overhead should be comparable to the overhead of calling the delegate directly in the high-level language.<br/>
		<b>Status</b>: <span class="success">Success</span>
	</li>
</ul>
<p>
	When a pattern is matched against a join point, if it matched then the
	associated delegate is cached at that join point.  This allows the creation
	of a chain of delegates that can be efficiently iterated over and invoked.
</p>
<p>
	Invocation is performed from inside the virtual machine.  Information about
	the delegate needing invoked is already available (due to the previously
	mentioned caching) and the virtual machine simply has to invoke the
	delegate.
</p>
<h4>Benchmarks</h4>
<ul>
	<li><a href="javascript:return false;" onclick="openBenchmark(2);">Synthetic Benchmark Results</a></li>
</ul>


<h2>Pattern Matching Overhead</h2>
<p>
	This overhead appears due to the need to match bound patterns against join
	points.  When each join point is executed, it must know which of the
	(currently) bound patterns matches it.
</p>
<h4>Performance Goals</h4>
<ul>
	<li>
		This overhead should be minimal with zero bound patterns &mdash; ideally zero.<br/>
		<b>Status</b>: <span class="success">Success</span>
	</li>
	<li>
		This overhead should reasonably scale with the number of bound patterns.<br/>
		<b>Status</b>: <span class="success">Success</span>
	</li>
</ul>
<p>
	To address the first goal, the matcher checks if the number of bound
	patterns is zero and if it is, stops.
</p>
<h4>Benchmarks</h4>
<ul>
	<li><a href="javascript:return false;" onclick="openBenchmark(5);">Synthetic Benchmark Results</a></li>
</ul>


<h2>Bind/Remove Benchmarks</h2>
<p>
	In addition to the overheads already mentioned, we measure the performance
	of the actual <i>bind</i> and <i>remove</i> calls.  For static binding,
	this performance affects the start-up time of an application.  For dynamic
	binding, this performance affects the execution of the program.
</p>
<h4>Performance Goals</h4>
<ul>
	<li>
		This overhead should be constant &mdash; independent of the number of patterns already bound.<br/>
		<b>Status</b>: <span class="success">Success</span>
	</li>
	<li>
		This overhead should be minimal.<br/>
		<b>Status</b>: <span class="inprogress">In-progress</span>
	</li>
</ul>
<h4>Benchmarks</h4>
<ul>
	<li><a href="javascript:return false;" onclick="openBenchmark(3);">Bind - Synthetic Benchmark Results</a></li>
	<li><a href="javascript:return false;" onclick="openBenchmark(4);">Remove - Synthetic Benchmark Results</a></li>
</ul>

<?php
	drawFooter();
?>
