<cfif cgi.http_host contains "mnspeak.com">
	<cfset ds="mspot">
<cfelse>
	<cfset ds="fimothree">
</cfif> 

<cfif cgi.http_host contains "mnspeak.com">
<cfquery name="myComments" datasource="#ds#" maxrows=155 dbtype="ODBC">
	SELECT comName, comURL, comComment, comID, comDate, comEntryID, regUser
	FROM tblComments
	<cfif isDefined("url.id")>WHERE comEntryID = #url.id#</cfif>
	ORDER BY comID DESC
</cfquery>
<cfelse>
<cfquery name="myComments" datasource="#ds#" maxrows=150 dbtype="ODBC">
	SELECT comName, comURL, comComment, comID, comDate, comEntryID, regUser, ipaddy
	FROM tblComments
	<cfif isDefined("url.id")>WHERE comEntryID = #url.id#</cfif>
	ORDER BY comID DESC
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
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td colspan="4"><strong><a href="http://www.mnspeak.com/cms/comments/">Post Comments</a></strong></td>
	</tr>
	<tr>
		<td colspan="4"><strong><a href="http://www.mnspeak.com/cms/comments/index-cal.cfm">Calendar Comments</a></strong></td>
	</tr>
</table>
<br />
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td align="center"><strong>Date</strong></td>
		<td align="center"><strong>Reg</td>
		<td align="center"><strong>Comment</td>
		<td align="center"><strong>Author</strong></td>
		<td align="center"><strong>Action</strong></td>
	</tr>
<!---
<cfoutput query="myComments">
	<cfquery name="updatethatcommentcolumn" datasource="#ds#">
	UPDATE tblContent
	SET commentnum = commentnum - 1
	WHERE entrynumber = #comEntryID#
	</cfquery>
	<cfquery username="fimoculous" password="fmcr5473" datasource="#ds#">
	DELETE FROM tblComments
	WHERE comID = #comID#
	</cfquery>
</cfoutput>
--->

<cfoutput query="myComments">
	<tr>
		<td>#DateFormat(comDate, "m/d")#</td>
		<td align="left"><input type="checkbox" name="regUser" value="#regUser#"<cfif regUser IS 1> checked</cfif>></td>
		<td><strong>#comID#/<a href="http://www.fimoculous.com/archive/post-#comEntryID#.cfm" target="_blank">#comEntryID#</a> </strong>#comComment#</td>
		<td><cfif cgi.http_host contains "fimoculous.com">#ipaddy#<br/></cfif><cfif Len(comURL) GT 1><a href="#comURL#" target="_blank"></cfif>#comName#<cfif Len(comURL) GT 1></a></cfif></td>
		<td nowrap><a href="/cms/comments/edit.cfm?comID=#comID#">edit</a> | <a href="/cms/comments/delete.cfm?comID=#comID#&comEntryID=#comEntryID#">del</a></td>
	</tr>
</cfoutput>
</table>

</body>
</html>
