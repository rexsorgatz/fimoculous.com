<cfif cgi.http_host contains "mnspeak.com">
<cfset ds="mspot">
<cfelse>
<cfset ds="fimothree">
</cfif> 
<cfif URL.NewEntry IS "No">
	<cfset operation = "Updated">
	<cfupdate username="fimoculous" password="fmcr5473" datasource="#ds#" tablename="tblCategories">
<cfelse>
	<cfset operation = "Inserted">
	<cfinsert username="fimoculous" password="fmcr5473" datasource="#ds#" tablename="tblCategories">
</cfif>

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
			<br><br>
			<cfoutput>
			<strong>Done:</strong> <br><br>
			</cfoutput>
			<a href="/cms/categories/"><b>&raquo;Back To Category Admin</b></a><br><br>
			<a href="/cms/"><b>&raquo;Back To Main Admin</b></a><br><br>
		</td>
	</tr>
</table>
</body>
</html>
