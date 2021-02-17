<?php
  $hostName =  "dbm1.itc.virginia.edu"; 
  $userName =  "hr2j"; 
  $password =  "lalooland"; 
  $dbName =  "hr2j_weblog"; 
  $db = mysql_connect($hostName, $userName, $password) or exit("Unable to connect to host"); 
  mysql_select_db($dbName, $db) or exit("Database does not exist on host.");
  $querystring = "INSERT INTO EosIndexAccess (IPADDR, ACCESSDATE, ACCESSTIME, HOSTNAME) VALUES ('"; 
  $querystring .= $_SERVER['REMOTE_ADDR'];
  $querystring .= "',";
  $querystring .= date("Ymd"); 
  $querystring .= ",'";  $querystring .= date("H:i:s");
  $querystring .= "','";
  $querystring .= gethostbyaddr($_SERVER['REMOTE_ADDR']);
  $querystring .= "')";
  $result = mysql_query($querystring, $db) or die(mysql_error());
?>