<cfif cgi.http_host contains "mnspeak.com">
<cfset ds="mspot">
<cfelse>
<cfset ds="fimothree">
</cfif> 

<cfif IsDefined("entrynumber") IS "No">
Error! No Entrynumber Supplied!
<cfabort>
</cfif>

<cfquery username="fimoculous" password="fmcr5473" datasource="#ds#">
	DELETE FROM tblContent
	WHERE entrynumber = #entrynumber#
</cfquery>
<cfif cgi.http_host contains "mnspeak.com">
<cfquery name="clearCats" datasource="#ds#" dbtype="ODBC">
	DELETE FROM tblCategoriesContent
	WHERE coid = #entrynumber#
</cfquery>
</cfif>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>
<cfinclude template="header.cfm">

<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
 <tr>
 	<td>
		<b>Deleted.</b><br><br>
		</td>
	</tr>
</table>
</body>
</html>
