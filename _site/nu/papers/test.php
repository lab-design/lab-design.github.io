<?php
	require_once("../includes/template.inc.php");
	require_once("../includes/pubs.inc.php");

	drawHeader("Nu Publications/Presentations by Robert Dyer");

	$pubs = filterPubsByAuthor($papers, $rdyer);
	drawPubsGrouped($pubs);

	drawFooter();
?>
