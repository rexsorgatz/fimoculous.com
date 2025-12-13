
<cfquery name="makeemaillist" datasource="mspot" dbtype="ODBC">
	SELECT emailaddress, emailentryblog 
	FROM tblEmaillist
	WHERE emailentryblog = 1
</cfquery>

<cfset newsletter = "true">

<cfsavecontent variable="theContent">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com</title>
	<style>
	<cfinclude template="styles.css">
	</style>
</head>

<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="460" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="header-small.cfm">
			<table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#ECF0F2">
				<tr>
					<td width="80%" valign="top">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr><td height="25" align="left" bgcolor="#336699"><font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="2" color="#EFEFEF"><strong>&raquo;TODAY'S TALK</strong></font></td></tr>
						</table>
<cfinclude template="maincontent.cfm">
					</td>
					<td width="20%" valign="top">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr><td height="25" align="left" bgcolor="#336699"><font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="2" color="#EFEFEF"><strong>&raquo;OUR SPONSORS</strong></font></td></tr>
						</table>
<cfinclude template="sponsors.cfm">								
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#ECF0F2">
				<tr>
					<td align="center"><p><font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="1">To unsubscribe, just hit 'reply' with 'unsubscribe' in the subject line.</font></p></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br />
</body>	
</html>
</cfsavecontent>
<cfmail query="makeemaillist" to="#emailaddress#" from="newsletters@mnspeak.com" subject="Today's Talk From MNspeak.com" type="HTML">
#theContent#
</cfmail>
<cfoutput>
#theContent#
</cfoutput>

