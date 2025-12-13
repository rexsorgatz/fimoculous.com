<cfif cgi.http_host contains "mnspeak.com">
<cfset ds="mspot">
<cfelse>
<cfset ds="fimothree">
</cfif> 
<cfif IsDefined("cat") IS "No">
	Error! No ID Supplied!
	<cfabort>
</cfif>

<cfquery username="fimoculous" password="fmcr5473" datasource="#ds#">
	DELETE FROM tblCategories
	WHERE cat_short = '#URL.cat#'
</cfquery>

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
 	<td>
		<b>Deleted.</b><br><br>
		<a href="/cms/categories/"><b>&raquo;Back To Category Admin</b></a><br><br>
		<a href="/cms/"><b>&raquo;Back To Main Admin</b></a><br><br>
		</td>
	</tr>
</table>
</body>
</html>
