<cfquery name="myCats" datasource="mspot" dbtype="ODBC">
	SELECT cat_short, cat_long
	FROM tblCategories
	ORDER BY cat_long
</cfquery>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src="scripts.js"></script>
</head>

<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="header.cfm">
		<table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#ECF0F2">
			<tr>
				<td width="80%" valign="top">
					<div class="titlebar">&raquo;Tags</div><br />
					<p><em>These are all the topics MNspeak.com is currently tracking.</em></p><br />
				
					<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td align="left" valign="top">
							<cfset counter = 0>
							<cfloop query="myCats">
								<cfset counter = counter + 1>
								<cfoutput><p><strong>&raquo;</strong> <a href="http://www.mnspeak.com/mnspeak/archive/archivetemplate.cfm?cat=#cat_short#"><strong>#cat_long#</strong></a></p></cfoutput>
								<cfif counter EQ 32></td><td align="left" valign="top"></cfif>
								<cfif counter EQ 64></td><td align="left" valign="top"></cfif>
							</cfloop>
							</td>
						</tr>
					</table>
				</td>
				<td width="20%" valign="top">
					<div class="titlebar">&raquo;OUR SPONSORS</div>
<cfinclude template="sponsors.cfm">								
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


</body>	
</html>
