	<?php
	/* message to the web-master */
	$messageweb = '
	<html>
	<head>
	 <title>Eos download</title>
	</head>
	<body>
	<p>Eos was downloaded ';
	$messageweb .= ' from the IP address ';
	$messageweb .= $_SERVER['REMOTE_ADDR'];
        $messageweb .= ' or host ';
        $messageweb .= gethostbyaddr($_SERVER['REMOTE_ADDR']);
	$messageweb .= '
	</p> 
	</body>
	</html>
	';

	/* To send HTML mail, you can set the Content-type header. */
	$headers  = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
	
	/* additional headers */
	$headers .= "From: Eos <eos@cs.virginia.edu>\r\n";
	
	/* and now mail it */
	mail("eos@cs.virginia.edu", "Eos Download", $messageweb ,$headers);
	?> 