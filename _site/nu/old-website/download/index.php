<?php require_once("../includes/topbar.html") ?>
<!-- 2ND COLUMN. INSERT COPY -->

<td id="b3" rowspan="2">
<div class="maintext">

<h2>Nu Download</h2><BR>

<?php
	$name = $_POST["name"];
	$email = $_POST["email"];
	$org = $_POST["org"];
	$country = $_POST["country"];

	if (!$org || !$country)
	{
?>
<p>
Nu is available for free subject to the following licensing agreement.

<blockquote>
<p>
Copyright (C) 2006, Iowa State University of Science and Technology. All rights reserved.
</p>

<p>
   The Nu compiler is available for free under MOZILLA PUBLIC LICENSE
   (MPL) Version 1.1 hereafter referred to as "the License". You may not
   use any part of the Nu infrastructure ("Software"), including but not
   limited to the Nu compiler, tools, libraries and sources except in
   compliance with the License. You may obtain a copy of the License
   at <a href="http://www.mozilla.org/MPL">http://www.mozilla.org/MPL/</a>. <BR><BR>

   Software distributed under the License is distributed on an "AS IS"
   basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
   the License for the specific language governing rights and limitations
   under the License. <br/>
</p>
</blockquote>
We would like to know a little about who is downloading and using "Nu".
We will not use this information for any commercial or non-commercial
purposes, except to record the demography of "Nu" users.
<br/><br/>
<form name="info" method="post">
	<input type="hidden" name="submit" value="1"/>
<?php
   echo <<<HTML
<blockquote>
   Name (optional): <input type="text" name="name" value="$name" size="40"/>
   <br/><br/>
   Email (optional): <input type="text" name="email" value="$email" size="40"/>
   <br/><br/>
   Organization: <input type="text" name="org" value="$org" size="40"/>
   <br/><br/>
   Country: <input type="text" name="country" value="$country" size="40"/>
   <br/><br/>
   <input type="submit" value="I Agree to the Download Terms Above."/>
<blockquote>
HTML;
	if ($_POST["submit"])
		echo "<br/><br/>Please fill in all required fields.<br/>";
?>
<br/>
</form>
<?php
	}
	else
	{
		$file = fopen("../../stats/download-info.csv", "a");
		fwrite($file, "\"" . date("m/d/Y H:i:s") . "\",");
		fwrite($file, "\"$name\",");
		fwrite($file, "\"$email\",");
		fwrite($file, "\"$org\",");
		fwrite($file, "\"$country\"");
		fwrite($file, "\n");
		fclose($file);
?>
<a href="Nu-0.2.zip">Nu 0.2 Archive</a> [Released: May 18, 2006]<br/>
<a href="Nu-0.1.zip">Nu 0.1 Archive</a> [Released: Mar 27, 2006]<br/><br/>
<a href="ChangeLog">View the ChangeLog</a><br/><br/>
<a href="../cgi-bin/cvsweb.cgi/Nu/">View the CVS online</a><br/><br/>

<p>
We are very interested in your feedback, and bug reports. 
Please feel free to send us an e-mail if you are 
encountering any problems. Language manual will be 
significantly improved and many features will be added 
so if you want to keep your copy updated please send 
an e-mail to nu@nospam.cs.iastate.edu (remove nospam), 
so that we can keep you updated. Please also consider 
joining the <a href="http://www.cs.iastate.edu/~nu/list.shtml">
Nu discussion e-mail list</a>.<br/><br/>
</p>

<h2>Warning</h2><BR>
<p>
The current versions of Nu are preliminary and only 
tested with Microsoft .NET Framework Version 1.0 and 
1.1. We will be happy to learn about your experiences
on Mono and other .NET platforms.
</p>
<?php
	}
?>

</div>
</td>

<?php require_once("../includes/bottombar.html") ?>
