<html>
<head>
<title>Eos: download page </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content = " Eos: aspect oriented extension of C#">
<meta name="keywords" content="Eos, ilac#, ilacsc, .net, .NET, framework,AOP , aop, aspect, oriented, programming, instance, level, aspects, C#, hridesh,rajan, kevin, sullivan, aspect oriented programming,instance-level">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width = 100% >
  <tr > 
    <td border="0" cellpadding="0" cellspacing="0" width="10%" bgcolor="##0066CC" text="#FFFFFF" link="#FFFFFF"> 
      <div align="center"> 
        <p>&nbsp;</p>
        <p><b><font size="+3"><i><font face="Times New Roman, Times, serif">Eos 
          </font></i></font></b></p>
        <hr>
        <p><b><a href="http://www.cs.virginia.edu/~eos" >Home</a></b></p>
        <p><b><a href="People.htm" >People</a></b></p>
        <p><b><a href="Publications.htm" >Publications</a></b></p>
        <p><b><a href="download.htm" >Download</a></b></p>
        <p><b>Links</b></p>
        <p></p>
      </div>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </td>
    <td border="0" cellpadding="0" cellspacing="0" width="90%" VALIGN = top> 
	<div align="center">
  <p>&nbsp;</p>
        <p><b><font face="Times New Roman, Times, serif" size="+2">Thank you very 
          much for your interest in Eos. </font></b></p>
  <p>&nbsp;</p>
  <table width="100%" border="0">
    <tr>
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




            <td ALIGN=left VALIGN=top COLSPAN="2" BGCOLOR="##0066CC"><b><font color="#ffffff" face="Arial,Helvetica">|</font></b></td>
    </tr>
    <tr> 
            <td>
		<blockquote> 
		<p><a href="http://www.cs.virginia.edu/~eos/eos.zip" >Download Eos</a></p>
		<p>We are very interested in your feedback, and bug reports. Please 
                  feel free to send us an e-mail if you are encountering any problems. 
                  Language manual will be significantly improved and many features 
                  will be added so if you want to keep your copy updated please 
                  send an e-mail to eos@nospam.cs.virginia.edu (remove nospam), 
                  so that we can keep you updated. Please also consider joining the <a href= "http://www.cs.virginia.edu/mailman/listinfo/eos-discuss">Eos discussion e-mail list.</a> </p>
                 <blockquote>
      </td>
    </tr>
    <tr>
      <td ALIGN=left VALIGN=top COLSPAN="2" BGCOLOR="##0066CC"><b><font color="#ffffff" face="Arial,Helvetica">Warning.</font></b></td>
    </tr>
    <tr> 
      <td>
        <blockquote>
                <p>The current version of Eos is preliminary, almost in the stone 
                  age. We are putting together a version significantly better 
                  than the primitive version soon. </p>
        </blockquote>
      </td>
    </tr>
    <tr>
      <td ALIGN=left VALIGN=top COLSPAN="2" BGCOLOR="##0066CC"><b><font color="#ffffff" face="Arial,Helvetica">|</font></b></td>
    </tr>
  </table>
  <p align="center"><font size="3">Copyright &copy; 2003, <a href="http://www.cs.virginia.edu/%7Ehr2j">Hridesh 
    Rajan</a> and <a href="http://www.cs.virginia.edu/%7Esullivan">Kevin Sullivan</a>, 
    All rights reserved.</font></p>
  <p align="left">&nbsp;</p>
  <p>&nbsp;</p>
</div>
</td>
  </tr>
</table>
</body>
</html>
