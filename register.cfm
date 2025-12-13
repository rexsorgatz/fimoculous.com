<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Register</title>
<script language="JavaScript" src="/styles/fimoculous.js" type="text/javascript"></script>
<cfif cgi.HTTP_USER_AGENT contains "MSIE">
<link rel="stylesheet" type="text/css" href="/styles/fimostyles_ideal.css" media="screen">
<cfelseif cgi.HTTP_USER_AGENT contains "Mozilla/4">
<link rel="stylesheet" type="text/css" href="/styles/fimostyles_nn4.css" media="screen">
<cfelse>
<link rel="stylesheet" type="text/css" href="/styles/fimostyles_ideal.css" media="screen">
</cfif> 
</head>

<body marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" bgcolor="#333333" background="/images/background-right.gif">
<div align="center"><img src="/header/logo.jpg" width="380" height="72" alt="" border="0"></div>
<br>
<div class="navtext">
<br>
Want to be added to the fimoculous.com mailing list? Enter your email to receive weekly updates. (Warning: this is html-formatted email.)<br><br>
<form method="post" action="registercomplete.cfm">
<input type="text" value="enter email" onFocus="this.value='';" name="emailaddress" class="searchbox">&nbsp;&nbsp;
<input type="submit" value="Add me" class="searchbutton">
</form>
</div>
</body>
</html>
