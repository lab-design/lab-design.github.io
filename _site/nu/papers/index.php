<?php
	require_once("../includes/template.inc.php");
	require_once("../includes/pubs.inc.php");

	drawHeader("Nu Publications/Presentations");

	drawPubsGrouped($papers);

	drawFooter();
?>
