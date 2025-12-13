<cfset ds="nswk">


<cfset startDate = Now()> 
<!--- captureDate <= #startDate# --->
<cfquery name="DailyEntry" datasource="#ds#" dbtype="ODBC">
	SELECT *
	FROM dailyStats, metrics
	WHERE dailyStats.metricNum = metrics.ID
	ORDER BY dailyStats.id
</cfquery>
<cfquery name="allCats" datasource="#ds#" dbtype="ODBC">
	SELECT *
	FROM metrics
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>NSWK</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>
<table width="95%" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td></td>
		<cfoutput query="allCats">
		<td><strong>#metric#</strong></td>
		</cfoutput>
	</tr>
<cfset Start = 1> 
<cfset dateStart = 15> 
<cfloop index="counter" from="#Start#" to="999">
	<cfoutput query = "DailyEntry" startRow="#counter#" maxRows="1">
		<cfif (DailyEntry.currentRow-1) MOD 70 EQ 0><cfset dateStart += 1><tr><td colspan="8">9/#dateStart#</td></tr></cfif>
		<cfif (DailyEntry.currentRow-1) MOD 7 EQ 0><tr></cfif>
			<cfif (DailyEntry.currentRow-1) MOD 7 EQ 0><td><strong>#person#</strong></td></cfif>
			<td>#NumberFormat(dailyStats, ',')#</td>
		<cfif (DailyEntry.currentRow) MOD 7 EQ 0></tr></cfif>
	</cfoutput>
</cfloop>
</table>

</body>
</html>
