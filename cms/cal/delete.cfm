<cfif IsDefined("calEntry") IS "No">
	Error! No Entrynumber Supplied!
	<cfabort>
</cfif>

<cfquery username="fimoculous" password="fmcr5473" datasource="mspot">
	DELETE FROM mnCal
	WHERE calEntry = #calEntry#
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
		</td>
	</tr>
</table>
</body>
</html>
