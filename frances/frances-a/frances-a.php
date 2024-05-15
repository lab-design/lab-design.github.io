<?PHP
virtual("../includes/topbar-compact.html");
?>

    <script language="javascript" type="text/javascript">
<!-- 
//Browser Support Code
var lang = "c";
var step = -1;
var nextIsLast = false;
var currDate = new Date;
var uniqId = currDate.getTime();
var ajaxRequest = false;
var writeDir = "/var/www/html/code_gen/pictures";

function stepFunction(id){
  
  try{
    // Opera 8.0+, Firefox, Safari
    ajaxRequest = new XMLHttpRequest();
  } catch (e){
    // Internet Explorer Browsers
    try{
      ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
      try{
        ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (e){
        // Something went wrong
        alert("Your browser broke!");
        return false;
      }
    }
  }

  var submitElement = document.getElementById(id);
  if(submitElement.id == 'bButton' || submitElement.id == 'fButton' || submitElement.id == 'cButton')
  {

    ajaxRequest.onreadystatechange = alertContentsFrancesA;
    if(submitElement.id == 'bButton')
    {
      nextIsLast = false;
      document.getElementById("fButton").value = "Loading...";
      document.getElementById("bButton").value = "Loading...";
      step -= 1;
    }
    else if(submitElement.id == 'fButton')
    {
      document.getElementById("fButton").value = "Loading...";
      document.getElementById("bButton").value = "Loading...";
      step += 1;
    }

    var requestURL = "http://jhelum.cs.iastate.edu/cgi-bin/archit/run_frances_a.cgi";
    var requestParams = "uniqID=" + uniqId;
    requestParams = requestParams + "&step=" + step;
    requestParams = requestParams + "&writeDir=" + writeDir;
  
    if(submitElement.id == 'cButton')
    {


      ajaxRequest.onreadystatechange = alertContentsCompile;
      lang = document.getElementById("lang").value;
      step = 0;
      
      requestURL = "http://jhelum.cs.iastate.edu/cgi-bin/archit/run_frances.cgi";
     
      var codeElem = document.getElementById("code");
      var codeText = codeElem.value;
      codeText = codeText.replace(/\;/g, "@semi@");
      codeText = codeText.replace(/\&/g, "@amp@");
      codeText = codeText.replace(/\?/g, "@quest@");
      codeText = codeText.replace(/\+/g, "@plus@");
      codeText = codeText.replace(/\|/g, "@pipe@");
      requestParams = requestParams + "&code=" + codeText;

      codeElem.setAttribute('readonly', 'readonly');
      
      var buttonElem = document.getElementById("directionButtons");
      buttonElem.innerHTML = 
        "<input id=\"rButton\" type=\"button\" name=\"submit\" value=\"Reset\" onClick=\"javascript:stepFunction(this.id);\"><br>" + 
        "<input id=\"bButton\" type=\"button\" name=\"submit\" value=\"Previous instruction\" onClick=\"javascript:stepFunction(this.id);\"><br>" + 
        "<input id=\"fButton\" type=\"button\" name=\"submit\" value=\"Execute next instruction\" onClick=\"javascript:stepFunction(this.id);\">";     
    }
 
    requestParams = requestParams + "&lang=" + lang;
    //Standard ajax request stuff
    ajaxRequest.open('POST', requestURL, true);
    ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    ajaxRequest.setRequestHeader("Content-length", requestParams.length);
    ajaxRequest.setRequestHeader("Connection", "close");
    ajaxRequest.send(requestParams);
    
  }
  else if(submitElement.id == 'rButton')
  {
    var currDate = new Date;
    uniqId = currDate.getTime();
    step = -1;
    nextIsLast = false;
    var buttonElem = document.getElementById("directionButtons");
    buttonElem.innerHTML = 
      "<input id=\"rButton\" type=\"button\" name=\"submit\" value=\"Reset\" onClick=\"javascript:stepFunction(this.id);\">&nbsp;&nbsp;" + 
      "<input id=\"cButton\" type=\"button\" name=\"submit\" value=\"Compile\" onClick=\"javascript:stepFunction(this.id);\">"; 
      
    var codeElem = document.getElementById("code");
    codeElem.removeAttribute('readonly');
    
  }
  else if(submitElement.id == 'captButton'){
    var captchaURL = "verify.php";
    var captchaParams = "recaptcha_challenge_field=" + document.getElementById("recaptcha_challenge_field").value +
                         "&recaptcha_response_field="  + document.getElementById("recaptcha_response_field").value;
    ajaxRequest.onreadystatechange = captchaCompile;
    ajaxRequest.open('POST', captchaURL, true);
    ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    ajaxRequest.setRequestHeader("Content-length", captchaParams.length);
    ajaxRequest.setRequestHeader("Connection", "close");
    ajaxRequest.send(captchaParams);
  }
}

function checkSubmit(e)
{
   if(e && e.keyCode == 13)
   {
        stepFunction("captButton");
   }
}
 
   function captchaCompile() {
      if (ajaxRequest.readyState == 4) {
         if (ajaxRequest.status == 200) {
            result = ajaxRequest.responseText;
            if(result.substring(1, 8) == "success"){
              var buttonElem = document.getElementById("directionButtons");
              buttonElem.innerHTML = 
                "<input id=\"rButton\" type=\"button\" name=\"submit\" value=\"Reset\" onClick=\"javascript:stepFunction(this.id);\">&nbsp;&nbsp;" + 
                "<input id=\"cButton\" type=\"button\" name=\"submit\" value=\"Compile\" onClick=\"javascript:stepFunction(this.id);\">"; 
              document.getElementById("captchaDiv").innerHTML = "";
            }
         } else {
            alert('There was a problem with the request -- probably wrong captcha input.');
         }
      }
   }
   
   function alertContentsCompile() {
      if (ajaxRequest.readyState == 4) {
         if (ajaxRequest.status == 200) {
            result = ajaxRequest.responseText;
            document.getElementById('errors').innerHTML = result;
            if(result.length > 1){
              var buttonElem = document.getElementById("directionButtons");
              buttonElem.innerHTML = 
                "<input id=\"rButton\" type=\"button\" name=\"submit\" value=\"Reset\" onClick=\"javascript:stepFunction(this.id);\">&nbsp;&nbsp;" + 
                "<input id=\"cButton\" type=\"button\" name=\"submit\" value=\"Compile\" onClick=\"javascript:stepFunction(this.id);\">"; 
              var codeElem = document.getElementById("code");
              codeElem.removeAttribute('readonly');
            } else {
              var picElem = document.getElementById("francesImg");
              picElem.src = "http://jhelum.cs.iastate.edu/code_gen/pictures/CFG" + uniqId + "_small.dot.png";
              var picElem = document.getElementById("francesAImg");
              picElem.src = "http://jhelum.cs.iastate.edu/code_gen/pictures/dbgFile" + uniqId + ".out_" + step + ".dot.color.dot.png";
           }
           document.getElementById("captchaDiv").innerHTML = "";
         } else {
            alert('There was a problem with the request.');
         }
      }
   }
   
   function alertContentsFrancesA() {
      if (ajaxRequest.readyState == 4) {
         if (ajaxRequest.status == 200) {
            result = ajaxRequest.responseText;
            if(result.substring(0,3) != "EOF"){
              document.getElementById('errors').innerHTML = result;
            }
            var picElem = document.getElementById("francesAImg");
            
            if(result.substring(0,3) != "EOF" && !nextIsLast){
              picElem.src = "http://jhelum.cs.iastate.edu/code_gen/pictures/dbgFile" + uniqId + ".out_" + step + ".dot.color.dot.png";
            } else if(nextIsLast) {
              picElem.src = "http://jhelum.cs.iastate.edu/code_gen/pictures/eof.png";
            } else {
              nextIsLast = true;
              picElem.src = "http://jhelum.cs.iastate.edu/code_gen/pictures/dbgFile" + uniqId + ".out_" + step + ".dot.color.dot.png";
            }

            document.getElementById("fButton").value = "Execute next instruction";
            document.getElementById("bButton").value = "Last instruction";
         } else {
            alert('There was a problem with the request.');
         }
      }
   }


//-->
    </script>

<tr>
<td id="b2" rowspan="2">
<div class="maintext">
<!--#set var="tool_name" value="Frances" -->
<center>
    <table>
      <tr>
        <td>
<form name="codeForm" id="codeForm">
  <div id="errors"></div>
    <style type="text/css">
      .legLoopBody { text-align: center; vertical-align: middle; border: 1px solid #000000; background-color: #fa8072; color: #FFFFFF; font-weight: bold; }
      .legLoopCond { text-align: center; vertical-align: middle; border: 1px solid #000000; background-color: #98fb98; color: #FFFFFF; font-weight: bold; }
      .legIfBody   { text-align: center; vertical-align: middle; border: 1px solid #000000; background-color: #add8e6; color: #FFFFFF; font-weight: bold; }
      .legIfCond   { text-align: center; vertical-align: middle; border: 1px solid #000000; background-color: #d15fee; color: #FFFFFF; font-weight: bold; }
      .legElseBody { text-align: center; vertical-align: middle; border: 1px solid #000000; background-color: #eeb422; color: #FFFFFF; font-weight: bold; }
      .legSelfLoop { text-align: center; vertical-align: middle; border: 1px solid #000000; background-color: #c0c0c0; color: #FFFFFF; font-weight: bold; }
      .legText     { text-align: left;   font-size: 100%; }
@media screen and (-webkit-min-device-pixel-ratio:0) { 
      .legText     { text-align: left;   font-size: 130%; }
}
    </style>
  <TABLE BORDER=0 CELLSPACING="0">
  <TR><TD COLSPAN=2>&nbsp;</TD></TR>
  <TR><TD COLSPAN=2  ALIGN=RIGHT VALIGN=TOP>Code:</TD></TR>
  <TR><TD COLSPAN=2><textarea cols="30" rows="20" id="code" name="code" class="legText">int main(){
}</textarea></TD></TR>
  <TR><TD ALIGN=RIGHT>Language:</TD><TD><select id="lang" name="lang">
                      <option value="c">C</option>
                      <option value="cpp">C++</option>
                      <option value="f77">Fortran 77</option>
                      <option value="f90">Fortran 90</option>
                      </select></TD></TR>
  <!-- <TR><TD ALIGN=RIGHT>File:</TD><TD><input name="codeFile" type="file"></TD></TR> -->
  </TD></TR>
  <TR><TD COLSPAN=2 ALIGN=CENTER><div id="captcha"></div></TD></TR>
  <TR><TD COLSPAN=2 ALIGN=CENTER>
    <div id="directionButtons">
                <input id="rButton" type="button" name="submit" value="Reset" onClick="javascript:stepFunction(this.id);">&nbsp;&nbsp;
                <input id="cButton" type="button" name="submit" value="Compile" onClick="javascript:stepFunction(this.id);"> 
    </div>
  </TD></TR>
  <!-- <TR><TD COLSPAN=2 ALIGN=CENTER>
    <div id="captchaDiv">
    </div>
  </TD></TR>
  <TR><TD COLSPAN=2>&nbsp;</TD></TR>-->
  <TR><TD COLSPAN=2>
    <CENTER>
    <TABLE BORDER=0 CELLSPACING="0">
      <TR><TD COLSPAN=2>&nbsp;</TD></TR>
      <TR><TD COLSPAN=2><B><CENTER><H2>Legend</H2></CENTER></B></TD></TR>
      <TR><TD COLSPAN=2><B>Block Types</B></TD></TR>
      <TR>
        <TD CLASS="legLoopBody">&nbsp;&nbsp;&nbsp;&nbsp;</TD><TD CLASS="legText">Loop Body</TD>
      </TR>
      <TR>
        <TD CLASS="legLoopCond">&nbsp;&nbsp;&nbsp;&nbsp;</TD><TD CLASS="legText">Loop Condition</TD>
      </TR>
      <TR>
        <TD CLASS="legSelfLoop">&nbsp;&nbsp;&nbsp;&nbsp;</TD><TD CLASS="legText">Self Loop(do-while)</TD>
      </TR>
      <TR>
        <TD CLASS="legIfBody">&nbsp;&nbsp;&nbsp;&nbsp;</TD><TD CLASS="legText">If Body</TD>
      </TR>
      <TR>
        <TD CLASS="legIfCond">&nbsp;&nbsp;&nbsp;&nbsp;</TD><TD CLASS="legText">If Condition</TD>
      </TR>
      <TR>
        <TD CLASS="legElseBody">&nbsp;&nbsp;&nbsp;&nbsp;</TD><TD CLASS="legText">Else Body</TD>
      </TR>
      <TR><TD COLSPAN=2>&nbsp;</TD></TR>
      <TR><TD COLSPAN=2><B>Edge Types</B></TD></TR>
      <TR>
        <TD><img width=50px src="http://jhelum.cs.iastate.edu/code_gen/solid-wide.png"></TD><TD CLASS="legText">Conditional Jump</TD>
      </TR>
      <TR>
        <TD><img width=50px src="http://jhelum.cs.iastate.edu/code_gen/dash-wide.png"></TD><TD CLASS="legText">Unconditional Jump</TD>
      </TR>
      <TR>
        <TD><img width=50px src="http://jhelum.cs.iastate.edu/code_gen/narrow.png"></TD><TD CLASS="legText">No Jump</TD>
      </TR>
    </TABLE>
    </CENTER>
  </TD></TR>
  </TABLE>
</form>
        </td>
        <td><!-- FRANCES -->
          <div id="frances" style="height:800px;width:470px;overflow:scroll;"><img id="francesImg" src="http://jhelum.cs.iastate.edu/code_gen/pictures/default_narrow.png"></div>
        </td>
        <td><!-- FRANCES A -->
          <div id="frances-a"><img id="francesAImg" src="http://jhelum.cs.iastate.edu/code_gen/pictures/default_archit.png"></div>
        </td>
      </tr>
    </table>

</div></td></tr>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-9137471-2");
pageTracker._trackPageview();
} catch(err) {}</script>

<?PHP
virtual("../includes/bottombar.html");
?>
