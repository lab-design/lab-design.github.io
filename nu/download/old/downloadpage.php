<?php require_once("../includes/topbar.html") ?>
<!-- 2ND COLUMN. INSERT COPY -->

<td id="b3" rowspan="2">
<div class="maintext">

<h2>Nu Downloads</h2><BR>

<?php
	$name = $_POST["name"];
	$email = $_POST["email"];
	$org = $_POST["org"];
	$country = $_POST["country"];

	if (!$org || !$country)
	{
?>
Please provide some demographic information below:<br/><br/>
<form name="info" method="post">
	<input type="hidden" name="submit" value="1"/>
<?php
	echo <<<HTML
	Name (optional): <input type="text" name="name" value="$name" size="40"/><br/>
	Email (optional): <input type="text" name="email" value="$email" size="40"/><br/>
	Organization: <input type="text" name="org" value="$org" size="40"/><br/>
	Country: <input type="text" name="country" value="$country" size="40"/><br/>
	<input type="submit" value="Submit"/>
HTML;
	if ($_POST["submit"])
		echo "<br/><br/>Please fill in all required fields.<br/>";
?>
<br/>
</form>
We will not use this information for any commercial or non-commercial
purposes except to record the demography of the "Nu" users.
<?php
	}
	else
	{
		$file = fopen("download-info.txt", "a");
		fwrite($file, "Name: $name\n");
		fwrite($file, "Email: $email\n");
		fwrite($file, "Organization: $org\n");
		fwrite($file, "Country: $country\n");
		fwrite($file, "\n");
		fclose($file);
?>
<a href="Nu-0.1.zip">Download the latest version (0.1)</a>
<?php
	}
?>

</div>
</td>

<?php require_once("../includes/bottombar.html") ?>
