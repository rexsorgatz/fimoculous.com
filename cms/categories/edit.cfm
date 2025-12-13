<cfif cgi.http_host contains "mnspeak.com">
<cfset ds="mspot">
<cfelse>
<cfset ds="fimothree">
</cfif> 
<cfif IsDefined("URL.cat")>
	<cfset NewEntry = "No">
	<cfelse>
	<cfset NewEntry = "Yes">
</cfif>

<cfif NewEntry IS "No">
<cfquery name="myCats" datasource="#ds#" dbtype="ODBC">
	SELECT cat_short, cat_long
	FROM tblCategories
	WHERE cat_short = '#URL.cat#'
</cfquery>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="../header.cfm">
<form action="edited.cfm?NewEntry=<cfoutput>#NewEntry#</cfoutput>" method="post" enctype="multipart/form-data">
	<cfif NewEntry IS "No">
		<cfoutput query="myCats">
			<input type="hidden" name="cat_short" value="#URL.cat#">
		</cfoutput>
	</cfif>
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
<cfif NewEntry IS "No">
	<tr>
		<td align="left"><strong>Short Name:</strong></td>
		<td align="left"><cfoutput query="myCats">#cat_short#</cfoutput></td>
	<tr>
<cfelse>
	<tr>
		<td align="left"><strong>Short Name:</strong></td>
		<td align="left"><input type="text" name="cat_short" size="40"></td>
	<tr>
</cfif>
	<tr>
		<td align="left"><strong>Long Name:</strong></td>
		<td align="left"><input type="text" name="cat_long" size="40" <cfif NewEntry IS "No"><cfoutput query="myCats"> value="#Trim(cat_long)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td colspan="2" align="center"><br>
		<cfif NewEntry IS "Yes">
		<input type="submit" value="Add Category">
		<cfelse>
		<input type="submit" value="Update Category">
		</cfif>
		</form>
		</td>
	</tr>
</table>

</body>
</html>
