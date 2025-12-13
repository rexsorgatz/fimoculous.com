<cfquery name="calContent" datasource="mspot" dbtype="ODBC">
	Select myDate, topItemLocation, calEntry, calEvent, commentnum
	FROM mnCal
	ORDER BY myDate DESC
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
		<td colspan="4" align="center"><a href="edit.cfm"><b>Add A New Calendar Item</b></a></td>
	</tr>
	<tr>
		<td><strong>EVENT</strong></td>
		<td><strong>DATE</strong></td>
		<td><strong>LOCATION</strong></td>
		<td><strong>ACTION</strong></td>
	</tr>
<cfoutput query="calContent">
	<tr>
		<td><strong><a href="edit.cfm?calEntry=#calEntry#">#calEvent#</a></strong>  (#commentnum#)</td>
		<td nowrap>#DateFormat(myDate, "m/d, ddd")#</td>
		<td><cfif len(topItemLocation) EQ 0>&nbsp;<cfelse>#topItemLocation#</cfif></td>
		<td><a href="delete.cfm?calEntry=#calEntry#">delete</a></td>
	</tr>
</cfoutput>
</table>

</body>
</html>
