<cfif isdefined("FORM.numberID")>
	<cfset operation = "Updated">
	<cfupdate username="fimoculous" password="fmcr5473" datasource="mspot" tablename="tblPasswords">
<cfelse>
	<cfset operation = "Inserted">
	<cfinsert username="fimoculous" password="fmcr5473" datasource="mspot" tablename="tblPasswords">
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
			<cfoutput>
			<strong>#Operation#</strong>
			</cfoutput>
			<br><br>
			<cfif isdefined("FORM.numberID")>
				<cfoutput>
			<a href="edit.cfm?numberID=#numberID#"><b>&raquo;Re-Edit User</b></a><br><br>
				</cfoutput>
			</cfif>
			<a href="/cms/users/"><b>&raquo;Back To User Admin</b></a><br><br>
		</td>
	</tr>
</table>
</body>
</html>
