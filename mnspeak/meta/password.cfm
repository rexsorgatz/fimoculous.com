<cfif IsDefined("sendit")>
	<cfquery name="fetchuser" datasource="mspot" maxrows="1">
		SELECT UserID, Password, userEmail
		FROM tblPasswords
		WHERE userEmail = '#emailaddy#'
	</cfquery>
	<cfif fetchuser.recordcount GT 0>
	<cfmail to="#fetchuser.userEmail#" from="rex@mnspeak.com" subject="Your MNspeak Login" type="text">

Hi, it seems you are looking for your MNspeak.com password. Here you go:
	
Username: #fetchuser.UserID#
Password: #fetchuser.Password#

Thanks for using MNspeak.com!
	</cfmail>
	<cfelse>
	<cfset alert="Sorry, we don't have that email address on file.">
	</cfif>
</cfif>


<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Meta</title>
	<link rel="stylesheet" type="text/css" href="/mnspeak/styles.css">
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>
</head>

<body background="/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="../header.cfm">
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
				<tr>
					<td width="20%">&nbsp;</td>
					<td width="60%" align="center" valign="top"><br />
					<cfif IsDefined("alert")>
					<br /><p align="center"><cfoutput>#alert#</cfoutput><br /><br /></p>
					<cfelseif IsDefined("sendit")>
						<br /><p align="center">We have sent you your password. It should be there in less than a minute.</p>
						<br /><p align="center">&raquo; <a href="http://www.mnspeak.com/mnspeak/meta/login.cfm">Login</a>.</p>
						<br /><p align="center">&raquo; <a href="http://www.mnspeak.com">MNspeak.com front page</a>.</p>
						<br />
					<cfelse>
						<form name="pw" action="password.cfm?sendit=yes" method="POST">
							<table width="100%" border="0" cellspacing="0" cellpadding="2" align="center">
								<tr>
									<td align="center">Enter your email address below and we'll email your password to you.<br /><br /></td>
								</tr>
								<tr>
									<td align="center"><strong>Email:</strong> <input type="text" maxlength="50" name="emailaddy"></td>
								</tr>
								<tr>
									<td align="center"><br /><input class="searchbutton" type="submit" value="Send It"></td>
								</tr>
								<tr>
									<td align="center"><br /><br /><a href="register.cfm">Need to register?</a></td>
								</tr>
								<tr>
									<td align="center"><br /><a href="login.cfm">Ready to login?</a></td>
								</tr>
							</table>
						</form>
						<br /><br />
					</td>
					</cfif>
					<td width="20%">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br>
</body>	
</html>

