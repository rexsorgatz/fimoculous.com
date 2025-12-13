<cfif IsDefined("url.email") IS "No">
	Error! No Emailaddress Supplied!
	<cfabort>
</cfif>

<cfquery username="fimoculous" password="fmcr5473" datasource="mspot">
	DELETE FROM tblEmaillist
	WHERE url.emailnumber = #emailnumber#
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
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
				<tr>
					<td align="center" valign="top"><br>
					<p align="center">You have been unsubscribed from all MNspeak.com newsleters.<br><br><strong>&raquo;<a href="http://www.mnspeak.com/mnspeak/register.cfm">Resubscribe.</a></strong><br><br><strong>&raquo;<a href="http://www.mnspeak.com">Back to MNspeak.</a></strong></p>
					<br><br>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br>
</body>	
</html>
