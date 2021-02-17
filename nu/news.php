<?php
	require_once("includes/template.inc.php");

	drawHeader("News Archive");

	foreach ((array)$news as $date => $entry)
		echo <<<EOHTML
			<p class="news">
				<b>$date</b><br/>
				$entry
			</p>
EOHTML;

	drawFooter();
?>
