<cfset referertruefalse = true>
<cfif IsDefined("URL.refer")>
	<cfif url.refer EQ "slander">
		<cfset referer = "Slanders Minneapolis">
	<cfelseif url.refer EQ "butter">
		<cfset referer = "Brand & Butter">
	<cfelseif url.refer EQ "hwts">
		<cfset referer = "How Was The Show">
	<cfelseif url.refer EQ "mnstories">
		<cfset referer = "MNstories.com">
	<cfelse>
		<cfset referer = "MNspeak.com">
		<cfset referertruefalse = false>
	</cfif>
	<cfelse>
		<cfset referer = "MNspeak.com">
		<cfset referertruefalse = false>
</cfif>

<cfif IsDefined("sendit")>
<cfif lcase(form.spamfield) EQ "mnspeak">
	<cfmail to="matt@mnspeak.com" from="mnspeak@gmail.com" subject="Advert On MNspeak" type="HTML">
	Name: #Form.namefield#<br><br>
	
	Biz Name: #Form.businessfield#<br><br>

	Email: #Form.fromfield#<br><br>
	
	Phone: #Form.phonefield#<br><br>
	
	Message: #Form.messagefield#<br><br>

	Referer: #Form.referer#<br><br>
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
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#FFFFFF">
				<tr>
					<td width="10%"></td>
					<td width="80%" align="center" valign="top"><br />	
						<cfif IsDefined("sendit")>
							<cfif lcase(form.spamfield) EQ "mnspeak">
							<br /><p align="center">Thank you for your interest in advertising. We'll be in touch.<br /><br /><strong>&raquo; <a href="http://www.mnspeak.com">Back To MNspeak.com</a>.</strong></p><br />
							<cfelse>
							<br /><p align="center">Sorry, you didn't get past our spam stopper.  Please hit your back button and try again.<br /><br /><strong>&raquo; <a href="http://www.mnspeak.com">Back To MNspeak.com</a>.</strong></p><br />
							</cfif>
						<cfelse>
						<form action="advertise.cfm?sendit=yes" method="post">
								<input type="hidden" name="referer" value="<cfoutput>#referer#</cfoutput>">
								<div align="center" class="title">Interested in advertising on MNSpeak?</div>
								
								<br /><br /><strong>First, take a look at <a href="http://www.mnspeak.com/mnspeak/rates.cfm<cfif IsDefined("URL.refer")>?refer=<cfoutput>#URL.refer#</cfoutput><cfelse></cfif>">our rates and available ad formats</a>.</strong><br />
								
								<br /><strong>Then fill out the form below, and we'll be in contact:</strong><br /><br /><br />
								<table width="60%" border="0" cellspacing="0" cellpadding="2" align="center">
								<tr>
									<td><strong>Your Name:</strong></td>
									<td><input type="text" name="namefield" size="20" maxlength="50"></td>
								</tr>
								<tr>
									<td><strong>Your Business:</strong></td>
									<td><input type="text" name="businessfield" size="20" maxlength="50"></td>
								</tr>
								<tr>
									<td><strong>Your Email:</strong></td>
									<td><input type="text" name="fromfield" size="20" maxlength="50"></td>
								</tr>
								<tr>
									<td><strong>Your Phone:</strong><br />(optional)</td>
									<td><input type="text" name="phonefield" size="20" maxlength="15"></td>
								</tr>
								<tr>
									<td><strong>Additional Info:</strong><br />(optional)</td>
									<td>
									<textarea cols="30" rows="4" name="messagefield"></textarea>
									</td>
								</tr>
								<tr>
									<td><strong>Spam Stopper:</strong><br />(please type "mnspeak" into this box)</td>
									<td><input type="text" name="spamfield" size="20" maxlength="15"></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
									<br />
									<input type="submit" value="Send It!">
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center"><br /><br /><br /><br /><br /></td>
								</tr>
							</table>
						</form>
						</cfif>
					</td>
					<td width="10%"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br />
</body>	
</html>
