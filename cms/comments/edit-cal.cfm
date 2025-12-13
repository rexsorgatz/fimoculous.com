<cfif cgi.http_host contains "mnspeak.com">
	<cfset ds="mspot">
<cfelse>
	<cfset ds="fimothree">
</cfif> 

<cfquery name="myComments" datasource="#ds#" maxrows=1 dbtype="ODBC">
	SELECT comID, comCalID, comName, comURL, comComment
	FROM tblCalComments
	WHERE comID = #URL.comID#
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="../header.cfm">
<form action="edited-cal.cfm" method="post" enctype="multipart/form-data" name="myform" id="myform">
<input type="hidden" name="comID" value="<cfoutput query="myComments">#comID#</cfoutput>">
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td align="left"><strong>Name:</strong></td>
		<td align="left"><input type="text" name="comName" size="20" value="<cfoutput query="myComments">#comName#</cfoutput>"></td>
	<tr>
	<tr>
		<td align="left"><strong>Comment:</strong></td>
		<td align="left"><textarea cols="33" rows="10" name="comComment"><cfoutput query="myComments">#comComment#</cfoutput></textarea></td>
	<tr>
	<tr>
		<td colspan="2" align="right">
		<input type="submit" value="Save">
		</form>
		</td>
	</tr>
</table>

</body>
</html>
