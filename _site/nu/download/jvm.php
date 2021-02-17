<?php
	require_once("../includes/template.inc.php");

	drawHeader("Nu JVM Download");

	$name = $_POST["name"];
	$email = $_POST["email"];
	$org = $_POST["org"];
	$country = $_POST["country"];

	if (!$_GET["bypass"] && (!$org || !$country))
	{
?>
<p>
	We would like to know a little about who is downloading and using Nu.
	We will not use this information for any commercial or non-commercial
	purposes, except to record the demography of Nu users.
</p>

<br/>

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
			$file = fopen("../../stats/download-info-jvm.csv", "a");
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
	Please note that the Nu JVM is an early release of a highly experimental
	virtual machine!  While we strive to release working versions of the VM,
	things may (and most likely will) be broken.  Users are advised to run this
	at their own risk.
</p>
<p>
	At this time, the Nu JVM is only supported on i486 processors running on a
	Linux operating system.  Support for other processors/operating systems may
	be added in the future.
</p>
<h2>OpenJDK 7 Sources</h2>
<p>
	Please visit the <a href="http://download.java.net/openjdk/jdk7/">OpenJDK
	download page</a> to obtain a copy of the OpenJDK 7 source code.  The JDK
	is notoriously difficult to build.  If you are not able to build this
	(before applying our patches) you will <b>not</b> be able to obtain a
	running copy of Nu JVM at this time.  If, however, you are able to build
	the OpenJDK sources (Hotspot <b>and</b> the JDK) but fail to build after
	applying our patches, please contact us as this is most likely a bug.
</p>
<h2>Nu JVM Sources</h2>
<p>
	Once you have downloaded and compiled a working copy of OpenJDK 7, download
	the Nu JVM source and apply the patches.  Then recompile the system and you
	should have a working copy of the Nu JVM.  <b>Make sure to grab the runtime
	support files as well!</b>
</p>
<ul class="download">
	<li>Nu JVM version 0.1
		<ul>
			<li>OpenJDK 7 build 24 (jdk7-b24)
				<ul>
					<li><a href="nujvm/nujvm-0.1-src.zip">Nu JVM source</a></li>
					<li><a href="nujvm/nujvm-0.1-rt.zip">Nu JVM runtime support</a></li>
				</ul>
			</li>
		</ul>
	</li>
</ul>
<?php
	}

	drawFooter();
?>
