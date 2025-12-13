<cfif IsDefined("sendit")>
	<cfif lcase(form.spamfield) EQ "mnspeak">
		<cfmail to="editors@mnspeak.com" from="mnspeak@gmail.com" subject="Contact Note From MNspeak" type="text">
		#form.namefield#
		
		#form.fromfield#
		
		#form.messagefield#
		</cfmail>
	</cfif>
</cfif>

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
					<td width="25%"></td>
					<td width="50%" align="left" valign="top"><br>
						<cfif IsDefined("sendit")>
						<cfif lcase(form.spamfield) EQ "mnspeak">
							<br /><p align="center">Thanks for the info.<br /><br /><strong>&raquo; <a href="http://www.mnspeak.com">Back To MNspeak.com</a>.</strong></p><br />
							<cfelse>
							<br /><p align="center">Sorry, you didn't get past our spam stopper.  Please hit the back button and try again. <br /><br /><strong>&raquo; <a href="http://www.mnspeak.com">Back To MNspeak.com</a>.</strong></p><br />
						</cfif>
						<cfelse>
						<form action="contact.cfm?sendit=yes" method="post">
								<div align="center" class="title">To Email Us:</div><br />
								<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
								<tr>
									<td><strong>Your Name:</strong></td>
									<td><input type="text" name="namefield" size="20" maxlength="40"></td>
								</tr>
								<tr>
									<td><strong>Your Email:</strong></td>
									<td><input type="text" name="fromfield" size="20" maxlength="40"></td>
								</tr>
								<tr>
									<td><strong>Notes:</strong></td>
									<td>
									<textarea cols="40" rows="8" name="messagefield"></textarea>
									</td>
								</tr>
								<tr>
									<td><strong>To stop spammers, please type "mnspeak" into this box:</strong></td>
									<td>
									<input type="text" name="spamfield" size="20" maxlength="40"
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
									<br />
									<input class="searchbutton" type="submit" value="Send It!">
									</td>
								</tr>
							</table>
						</form>
							<br /><hr size="1" noshade><br />
							<div align="center" class="title">To Snail Mail Us:</div><br />
							<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
								<tr>
									<td align="center"><strong>MNspeak.com c/o Matt Bartel</strong><br />1500 Jackson St NE Ste 435<br />Minneapolis, MN 55413</td>
								</tr>
								<tr>
									<td><br /><hr size="1" noshade><br />
									<div align="center" class="title">Press Releases:</div><br />
									Please email press releases to pressrelease [at] mnspeak</td>
								</tr>
							</table>
							<br /><br /><br />
						</cfif>
					</td>
					<td width="25%"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br>
</body>	
</html>
