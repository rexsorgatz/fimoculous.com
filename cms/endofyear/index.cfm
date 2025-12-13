
<cfquery name="endofyear" datasource="fimothree">
	SELECT id, source, listname, link, mydate, category
	FROM tblEndOfYear
		WHERE mydate > #createODBCdate("5/1/2019")#
		AND mydate < #createODBCdate("5/1/2020")#
	ORDER BY ID DESC
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
		<td colspan="4" align="center"><a href="edit.cfm"><b>Add A New Link</b></a></td>
	</tr>
	<tr>
		<td align="center"><strong>Date</strong></td>
		<td align="center"><strong>Name/Link</td>
		<td align="center"><strong>Category</strong></td>
		<td align="center"><strong>Action</strong></td>
	</tr>
<cfoutput query="endofyear">
	<tr>
		<td>#DateFormat(mydate, "m/d")#</td>
		<td><a href="#link#" target="_blank"><strong>#listname#</strong></a> from #source#</td>
		<td>#category#</td>
		<td nowrap><a href="edit.cfm?id=#id#">edit</a> | <a href="delete.cfm?id=#id#">delete</a></td>
	</tr>
</cfoutput>
</table>

</body>
</html>
