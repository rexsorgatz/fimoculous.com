<cfif cgi.http_host contains "mnspeak.com">
	<cfset ds="mspot">
<cfelse>
	<cfset ds="fimothree">
</cfif> 
<cfquery name="makeemaillist" datasource=#ds# dbtype="ODBC">
	SELECT emailaddress
	FROM tblEmaillist
</cfquery>

<!---

<cfmail query="makeemaillist" to="#emailaddress#" from="rex@fimoculous.com" subject="#Form.subject#" type="HTML">
#Form.message#
</cfmail>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="../header.cfm">
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td><br><strong>This email was sent.</strong><br><br></td>
	</tr>
</table>
</body>
</html>
--->
