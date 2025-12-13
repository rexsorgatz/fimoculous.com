<cfif cgi.http_host contains "mnspeak.com">
	<cfset ds="mspot">
<cfelse>
	<cfset ds="fimothree">
</cfif> 

<!---
<cfif IsDefined("comID") IS "No">
	Error! No ID Supplied!
	<cfabort>
</cfif>
--->

<cfquery name="updatethatcommentcolumn" datasource="#ds#">
	UPDATE tblContent
	SET commentnum = commentnum - 1
	WHERE entrynumber = #comEntryID#
</cfquery>
<cfquery username="fimoculous" password="fmcr5473" datasource="#ds#">
	DELETE FROM tblComments
	WHERE comID = #comID#
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
		<a href="/cms/comments/"><b>&raquo;Back To Comments Admin</b></a><br><br>
		</td>
	</tr>
</table>
</body>
</html>
