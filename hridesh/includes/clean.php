<html>
<body>

<h1>

Number of records cleaned: 
<?php
  $hostName =  "dbm1.itc.virginia.edu"; 
  $userName =  "hr2j"; 
  $password =  "lalooland"; 
  $dbName =  "hr2j_weblog"; 
  $db = mysql_connect($hostName, $userName, $password) or exit("Unable to connect to host"); 
  mysql_select_db($dbName, $db) or exit("Database does not exist on host.");
  $querystring = "DELETE FROM MainIndexAccess WHERE HOSTNAME = \"trigger.cs.virginia.edu\""; 
  $result = mysql_query($querystring, $db) or die(mysql_error());
  print $result;

  $querystring2 = "DELETE FROM MainIndexAccess WHERE HOSTNAME = \"www1.seas.Virginia.EDU\""; 
  $result2 = mysql_query($querystring2, $db) or die(mysql_error());
  print $result2;

  $querystring3 = "DELETE FROM MainIndexAccess WHERE HOSTNAME = '%googlebot.com'"; 
  $result3 = mysql_query($querystring3, $db) or die(mysql_error());
  print $result3;

?>
</h1>
</body>
</html>