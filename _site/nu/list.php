<?php
	require_once("includes/template.inc.php");

	drawHeader("Mailing Lists Related to Nu");

	$email = formatEmail("nu-discuss@mailman.cs.iastate.edu");
?>

<p>To post to the Nu discussion list, send an email to:</p>

<p> 
	<?php echo formatEmail("nu-discuss@mailman.cs.iastate.edu"); ?>
</p>

<p>General information about the mailing list is at:</p>
<p>
	<a href="http://support.cs.iastate.edu/mailman/listinfo/nu-discuss/">http://mailman.cs.iastate.edu/mailman/listinfo/nu-discuss</a>
</p>

<p>The archived discussion about Nu is at:</p>
<p>
	<a href="http://support.cs.iastate.edu/pipermail/nu-discuss/">http://mailman.cs.iastate.edu/pipermail/nu-discuss/</a>
</p>

<?php
	drawFooter();
?>
