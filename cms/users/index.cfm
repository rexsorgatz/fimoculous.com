<cfquery name="CheckUser" datasource="mspot">
	SELECT UserID, Password, userWebsite, numberID, displayName, userEmail, userFullName, adminRights
	FROM tblPasswords
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
		<td colspan="4" align="center"><a href="edit.cfm"><b>Add A New User</b></a></td>
	</tr>
	<tr>
		<td colspan="4" align="center"><a href="personalized.cfm"><b>Personalized Users</b></a></td>
	</tr>
	<tr>
		<td align="center"><strong>LOGIN</strong></td>
		<td align="center"><strong>NAME</strong></td>
		<td align="center"><strong>RIGHTS</strong></td>
		<td align="center"><strong>ACTION</strong></td>
	</tr>
<cfoutput query="CheckUser">
	<tr>
		<td>#UserID#</td>
		<td>#userFullName#</td>
		<td>#adminRights#</td>
		<td align="center" nowrap><a href="/cms/users/edit.cfm?numberID=#numberID#&userID=#UserID#">edit</a> | <a href="/cms/users/delete.cfm?numberID=#numberID#">del</a></td>
	</tr>
</cfoutput>
<cfoutput query="CheckUser" maxrows="1">
	<tr>
		<td colspan="4" align="right"><strong>Total Users: #RecordCount#</strong></td>
	</tr>
</cfoutput>
</table>

</body>
</html>
