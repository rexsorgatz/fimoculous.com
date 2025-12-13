<cfquery name="CheckUser" datasource="mspot">
	SELECT id, userid, blogsource
	FROM tblUserBlogs
	ORDER BY userid
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
		<td colspan="2" align="center"><a href="edit.cfm"><b>Add A New User</b></a></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><a href="/cms/users/"><b>Users</b></a></td>
	</tr>
	<tr>
		<td align="center"><strong>NAME</strong></td>
		<td align="center"><strong>SOURCES</strong></td>
	</tr>
<cfoutput query="CheckUser">
	<tr>
		<td align="center">#userid#</td>
		<td align="center">#blogsource#</td>
	</tr>
</cfoutput>
</table>

</body>
</html>
