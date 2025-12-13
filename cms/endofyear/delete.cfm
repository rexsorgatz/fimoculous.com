
<cfquery username="fimoculous" password="fmcr5473" datasource="fimothree">
	DELETE FROM tblEndOfYear
	WHERE id = #id#
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
		<a href="/cms/endofyear/"><b>&raquo;Back To End Of Year</b></a><br><br>
		</td>
	</tr>
</table>
</body>
</html>
