<cfif cgi.http_host contains "mnspeak.com">
<cfset ds="mspot">
<cfelse>
<cfset ds="fimothree">
</cfif> 
<cfquery name="myCats" datasource="#ds#" dbtype="ODBC">
	SELECT cat_short, cat_long
	FROM tblCategories
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
		<td colspan="6" align="center"><a href="edit.cfm"><b>Add A New Category</b></a></td>
	</tr>
	<tr>
		<td><b>Short Name</b></td>
		<td><b>Full Name</b></td>
		<td align="center"><b>Action</b></td>
	</tr>
<cfoutput query="myCats">
	<tr>
		<td>#cat_short#</td>
		<td>#cat_long#</td>
		<td align="center" nowrap><a href="edit.cfm?cat=#cat_short#">edit</a> | <a href="delete.cfm?cat=#cat_short#">del</a></td>
	</tr>
</cfoutput>
</table>
<br />
</body>
</html>
