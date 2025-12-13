<cfmail to="rex@ibsys.com" from="#Form.from#" subject="#Form.subject#" type="HTML">
#Form.message#
</cfmail>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Fimoculous Email Sent</title>
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
Thanks for writing to Fimoculous.com. Now go consume your excrement like a good fimoculus.
<p align="right">[<a href="javascript:self.close()">Close.</a>]</p>
</div>
</body>
</html>
