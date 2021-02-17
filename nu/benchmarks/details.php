<?php
	require_once("../includes/template.inc.php");
	require_once("funcs.inc.php");


	$id = (int)$_GET['id'];

	$vmParams = <<<EOHTML
<ul>
	<li><b>-Xint</b> - runs the JVM in interpreted-only mode</li>
	<li><b>-ms512m</b> - sets the JVM minimum heap size to 512MB</li>
	<li><b>-mx512m</b> - sets the JVM maximum heap size to 512MB</li>
</ul>
EOHTML;

	$synthParams = <<<EOHTML
<ul>
	<li><b>-Xint</b> - runs the JVM in interpreted-only mode</li>
</ul>
EOHTML;


	/*********************************************
	 * Dispatch Overhead - Java Grande Benchmark *
	 *********************************************/
	$bm["homepage"] = "http://www2.epcc.ed.ac.uk/computing/research_activities/java_grande/index_1.html";
	$bm["homepage_name"] = "Java Grande Benchmark homepage";
	$bm["metric"] = "calls per second";
	$bm["better"] = "Higher";
	$bm["data"] = "jgf-dispatch";
	$bm["date"] = date("d F Y H:i:s", filemtime("$bm[data].data"));
	$bm["title"] = "Dispatch Overhead &ndash; Java Grande";
	$bm["precision"] = 2;
	$bm["reverse"] = true;
	$bm["original"] = null;
	$bm["details"] = <<<EOHTML
<h3>
	Java Grande Forum Benchmark Suite - Version 2.0
</h3>
<p>
	Only the method benchmark (JGFMethodBench) was performed.  These are the
	JVM parameters used:
</p>
$vmParams
EOHTML;
	$benchmarks[] = $bm;



	/**********************************
	 * Dispatch Overhead - SPEC JVM98 *
	 **********************************/
	$bm["homepage"] = "http://www.spec.org/osg/jvm98/";
	$bm["homepage_name"] = "SPEC JVM98 homepage";
	$bm["metric"] = "seconds";
	$bm["better"] = "Lower";
	$bm["data"] = "spec-dispatch";
	$bm["date"] = date("d F Y H:i:s", filemtime("$bm[data].data"));
	$bm["title"] = "Dispatch Overhead &ndash; SPEC JVM98";
	$bm["precision"] = 3;
	$bm["reverse"] = false;
	$bm["original"] = null;
	$bm["details"] = <<<EOHTML
<h3>
	SPEC JVM98 - 1.03_05 19981203
</h3>
<p>
	These are the JVM parameters used:
</p>
$vmParams
<p>
	These are the SPEC JVM98 benchmark parameters used:
</p>
<ul>
	<li><b>-s100</b> - use the maximum problem size</li>
	<li><b>-a</b> - sets autorun</li>
	<li><b>-m2</b> - minimum number of executions for autorun</li>
	<li><b>-M4</b> - maximum number of executions for autorun</li>
	<li><b>-g</b> - garbage collect between autorun executions</li>
	<li><b>-d3000</b> - delay 3 seconds between autorun executions</li>
</ul>
EOHTML;
	$benchmarks[] = $bm;



	/******************************************************
	 * Delegate Invocation Overhead - Synthetic Benchmark *
	 ******************************************************/
	$bm["homepage"] = "";
	$bm["homepage_name"] = "";
	$bm["metric"] = "average invocation time in nano-seconds";
	$bm["better"] = "Lower";
	$bm["data"] = "invoke";
	$bm["date"] = date("d F Y H:i:s", filemtime("$bm[data].data"));
	$bm["title"] = "Delegate Invocation Overhead &ndash; Synthetic Benchmark";
	$bm["precision"] = 3;
	$bm["reverse"] = false;
	$bm["original"] = "Manual Inline";
	$bm["details"] = <<<EOHTML
<p>
	For a more accurate comparison, the Nu JVM was used when running all
	benchmarks.  These are the Nu JVM parameters used:
</p>
$synthParams
EOHTML;
	$benchmarks[] = $bm;



	/***************************************
	 * Bind Overhead - Synthetic Benchmark *
	 ***************************************/
	$bm["homepage"] = "";
	$bm["homepage_name"] = "";
	$bm["metric"] = "average time in micro-seconds";
	$bm["better"] = "Lower";
	$bm["data"] = "bind";
	$bm["date"] = date("d F Y H:i:s", filemtime("$bm[data].data"));
	$bm["title"] = "Bind Overhead &ndash; Synthetic Benchmark";
	$bm["precision"] = 3;
	$bm["reverse"] = false;
	$bm["original"] = "Original JDK";
	$bm["details"] = <<<EOHTML
<p>
	These are the Nu JVM parameters used:
</p>
$synthParams
EOHTML;
	$benchmarks[] = $bm;



	/*****************************************
	 * Remove Overhead - Synthetic Benchmark *
	 *****************************************/
	$bm["homepage"] = "";
	$bm["homepage_name"] = "";
	$bm["metric"] = "average time in micro-seconds";
	$bm["better"] = "Lower";
	$bm["data"] = "remove";
	$bm["date"] = date("d F Y H:i:s", filemtime("$bm[data].data"));
	$bm["title"] = "Remove Overhead &ndash; Synthetic Benchmark";
	$bm["precision"] = 3;
	$bm["reverse"] = false;
	$bm["original"] = "Original JDK";
	$bm["details"] = <<<EOHTML
<p>
	These are the Nu JVM parameters used:
</p>
$synthParams
EOHTML;
	$benchmarks[] = $bm;



	/********************************************
	 * Cache Invalidation - Synthetic Benchmark *
	 ********************************************/
	$bm["homepage"] = "";
	$bm["homepage_name"] = "";
	$bm["metric"] = "average time in micro-seconds";
	$bm["better"] = "Lower";
	$bm["data"] = "cache";
	$bm["date"] = date("d F Y H:i:s", filemtime("$bm[data].data"));
	$bm["title"] = "Cache Invalidation &ndash; Synthetic Benchmark";
	$bm["precision"] = 3;
	$bm["reverse"] = false;
	$bm["original"] = "Original JDK";
	$bm["details"] = <<<EOHTML
<p>
	These are the Nu JVM parameters used:
</p>
$synthParams
EOHTML;
	$benchmarks[] = $bm;







	//
	// the template for benchmark results
	//
	$bm = $benchmarks[$id];

	drawWideHeader($bm['title']);

	if ($bm !== null)
	{
		echo <<<EOHTML
<p>
	<i>Last updated: $bm[date]</i><br/><br/>
	<center>
	<img src="http://tapti.cs.iastate.edu/rdyer/benchmark.php?id=$id" alt="$bm[title]"/><br/>
	</center>
</p>
EOHTML;

		drawTable($bm['data'], $bm['reverse'], $bm['precision'], $bm['original']);

		echo <<<EOHTML
<p>
	<b>Note:</b> All values given are in <i>$bm[metric]</i>.  $bm[better] values are better.
</p>
<p>
	The benchmark was performed on a dual 2.2GHz Intel Xeon computer with 2GB
	memory.
</p>
$bm[details]
EOHTML;
		if ($bm['homepage'])
			echo <<<EOHTML
<p>
	For more information, please visit the <a href="$bm[homepage]">$bm[homepage_name]</a>.<br/>
</p>
EOHTML;
	} else
	{
		echo "<b>Invalid benchmark id given.</b>";
	}

	drawWideFooter();
?>
