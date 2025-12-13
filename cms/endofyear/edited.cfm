

<cfif isdefined("FORM.id")>
	<cfset operation = "Updated">
	<cfupdate username="fimoculous" password="fmcr5473" datasource="fimothree" tablename="tblEndOfYear">
<cfelse>
	<cfset operation = "Inserted">
	<cfinsert username="fimoculous" password="fmcr5473" datasource="fimothree" tablename="tblEndOfYear">
</cfif>


<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

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
			<a href="/year-review-2010.cfm"><b>&raquo;View Lists</b></a><br><br>
			<a href="/cms/endofyear/edit.cfm"><b>&raquo;Add Another List</b></a><br><br>
			<a href="/cms/endofyear/"><b>&raquo;Back To End Of Year Admin</b></a><br><br>
			<a href="/cms/"><b>&raquo;Back To Main Admin</b></a><br><br>
		</td>
	</tr>
</table>

</body>
</html>
