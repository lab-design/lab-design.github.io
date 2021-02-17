<?php
	require_once("../includes/template.inc.php");

	drawHeader("Nu.NET Download");

	$name = $_POST["name"];
	$email = $_POST["email"];
	$org = $_POST["org"];
	$country = $_POST["country"];

	if (!$_GET["bypass"] && (!$org || !$country))
	{
?>
<p>
	Nu.NET is available for free subject to the following licensing agreement.
</p>

<div style="margin-left: 40px;">
	<p>
		Copyright (C) 2006-2007, Iowa State University of Science and
		Technology. All rights reserved.
	</p>

	<p>
	   The Nu virtual machine, compilers, and associated tools, collectively
	   referred to as "the Nu infrastructure", 
	   are available for free under MOZILLA PUBLIC LICENSE
	   (MPL) Version 1.1 hereafter referred to as "the License". You may not
	   use any part of the Nu infrastructure ("Software"), including but not
	   limited to the Nu compiler, tools, libraries and sources except in
	   compliance with the License. You may obtain a copy of the License
	   at <a href="http://www.mozilla.org/MPL">http://www.mozilla.org/MPL/</a>.
	   <br/><br/>
	   Software distributed under the License is distributed on an "AS IS"
	   basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
	   the License for the specific language governing rights and limitations
	   under the License.
	   <br/>
	</p>
</div>

We would like to know a little about who is downloading and using Nu.
We will not use this information for any commercial or non-commercial
purposes, except to record the demography of Nu users.

<br/><br/>

<?php
   echo <<<HTML
<form action="$_SERVER[PHP_SELF]" method="post">
<div style="margin-left: 40px;">
	<input type="hidden" name="submit" value="1"/>
	<p>
		Name (optional): <input type="text" name="name" value="$name" size="40"/>
		<br/><br/>
		Email (optional): <input type="text" name="email" value="$email" size="40"/>
		<br/><br/>
		Organization: <input type="text" name="org" value="$org" size="40"/>
		<br/><br/>
		Country: <input type="text" name="country" value="$country" size="40"/>
		<br/><br/>
		<input type="submit" value="I Agree to the Download Terms Above."/>
HTML;
	if ($_POST["submit"])
		echo "<br/><br/>Please fill in all required fields.<br/>";
?>
	</p>
</div>
</form>
<br/>
<?php
	}
	else
	{
		if (!$_GET["bypass"])
		{
			$file = fopen("../../stats/download-info-net.csv", "a");
			fwrite($file, "\"" . date("m/d/Y H:i:s") . "\",");
			fwrite($file, "\"$name\",");
			fwrite($file, "\"$email\",");
			fwrite($file, "\"$org\",");
			fwrite($file, "\"$country\"");
			fwrite($file, "\n");
			fclose($file);
		}
?>
<p>
	<a href="nunet/Nu-0.2.zip">Nu.NET 0.2 Archive</a> [Released: May 18, 2006]<br/>
	<a href="nunet/Nu-0.1.zip">Nu.NET 0.1 Archive</a> [Released: Mar 27, 2006]<br/><br/>
	<a href="nunet/ChangeLog">View the ChangeLog</a><br/><br/>
<!--
	<a href="../cgi-bin/cvsweb.cgi/Nu/">View the CVS online</a><br/><br/>
-->
</p>

<p>
	We are very interested in your feedback and bug reports.
	Please feel free to send us an e-mail if you
	encounter any problems. The documentaiton will be
	significantly improved and many features will be added,
	so if you want to keep your copy updated please send
	an e-mail to <?php echo formatEmail('nu@cs.iastate.edu'); ?>,
	so that we can keep you updated. Please also consider
	joining the <a href="http://www.cs.iastate.edu/~nu/list.php">
	Nu discussion e-mail list</a>.
</p>

<br/><br/>
<h2>Warning</h2>
<br/>

<p>
	The current versions of Nu.NET are preliminary and only
	tested with Microsoft .NET Framework Version 1.0 and
	1.1. We would be happy to hear about your experiences
	on Mono and other .NET platforms.
</p>
<?php
	}

	drawFooter();
?>
