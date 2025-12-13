<cfif cgi.http_host contains "mnspeak.com">
<cfset ds="mspot">
<cfelse>
<cfset ds="fimothree">
</cfif> 

<cfif cgi.http_host contains "mnspeak.com">
<cfquery name="DailyEntry" datasource="#ds#" maxrows=50 dbtype="ODBC">
	SELECT entrynumber, placement, title, thisdate, longpost, hascomments, author, commentnum, accepted, cats
	FROM tblContent
	ORDER BY entrynumber DESC
</cfquery>
<cfelse>
<cfquery name="DailyEntry" datasource="#ds#" maxrows=70 dbtype="ODBC">
	SELECT entrynumber, title, thisdate, longpost, hascomments, author, commentnum, cats
	FROM tblContent
	ORDER BY entrynumber DESC
</cfquery>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="header.cfm">
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td colspan="10" align="center"><a href="/cms/edit.cfm"><strong>Add A New Entry</strong></a></td>
	</tr>
	<tr>
		<td><strong>#</strong></td>
		<cfif cgi.http_host contains "mnspeak.com">
		<td><strong>&nbsp;</strong></td>
		</cfif>
		<td><strong>Title</strong></td>
		<td><strong>Date</strong></td>
		<td><strong>Author</strong></td>
		<td align="center"><strong>Long?</strong></td>
		<cfif cgi.http_host contains "mnspeak.com">
		<td align="center"><strong>Accepted?</strong></td>
		</cfif>
		<td align="center"><strong>Cats</strong></td>
		<td><strong>Action</strong></td>
	</tr>
<cfoutput query="DailyEntry">
	<tr>
		<td>#entrynumber#</td>
		<cfif cgi.http_host contains "mnspeak.com">
		<td><strong><cfif len(placement) GT 0>#int(placement)#<cfelse>0</cfif></strong></td>
		</cfif>
		<td nowrap><a href="/cms/edit.cfm?entrynumber=#entrynumber#"><b>#title#</b></a> (#commentnum#)</td>
		<td>#DateFormat(thisdate, "m/d/yy")#</td>
		<td>#author#</td>
		<td align="center"><input type="checkbox" name="longpost" value="" <cfif longpost IS "1">checked</cfif>></td>
		<cfif cgi.http_host contains "mnspeak.com">
		<td align="center"><input type="checkbox" name="accepted" value="" <cfif accepted IS "1">checked</cfif>></td>
		</cfif>
		<td align="center"><cfif len(cats) EQ 1>&nbsp;<cfelse>#REReplaceNoCase(cats,',',' ','ALL')#</cfif></td>
		<td align="center"><a href="/cms/delete.cfm?entrynumber=#entrynumber#">del</a></td>
	</tr>
</cfoutput>


</table>

</body>
</html>
