
<cfquery name="datesearch" datasource="fimothree">
select entrynumber, title, thisdate, entry
from tblContent
where entrynumber = #URL.id#
order by entrynumber DESC 
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Fimoculous.com: Feeding On Itself</title>
<style type="text/css" media="all">
     @import "/styles/styles.css";
</style>
</head>


<body marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" onload="window.defaultStatus='Fimoculous: Feeding On Itself'">
<cfinclude template="siteheader-new.cfm">
	<cfoutput query="datesearch">
	<table border="0" cellspacing="0" cellpadding="10" align="center">
		<tr>
			<td>
			<div class="bodytext">
			<h1>#title#</h2>
			<div class="title">#DateFormat(thisdate,"mmmm d, yyyy")#</div>
			#entry#
			</div>
			</td>
		</tr>
	</table>
	<br>
	</cfoutput>
<br><br>
</body>
</html>
