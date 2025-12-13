

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
					<td width="30%">&nbsp;</td>
					<td width="40%" align="center" valign="top"><br />
						<form name="LoginForm" action="results.cfm<cfif isDefined("URL.entryid")>?entryid=<cfoutput>#URL.entryid#</cfoutput><cfelseif isDefined("URL.calnum")>?calnum=<cfoutput>#URL.calnum#</cfoutput><cfelseif isDefined("URL.aggregator")>?aggregator</cfif>" method="POST">
							<table width="100%" border="0" cellspacing="0" cellpadding="2" align="center">
								<tr>
									<td><strong>Username:</strong></td>
									<td><input type="text" maxlength="20" name="UserID"></td>
								</tr>
								<tr>
									<td><strong>Password:</strong></td>
									<td><input type="password" maxlength="20" name="Password"></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><br /><input class="searchbutton" type="submit" value="Login"></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><br /><br /><a href="register.cfm">Need to register?</a></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><br /><a href="password.cfm">Forgot your password?</a></td>
								</tr>
							</table>
						</form>
						<br /><br />
					</td>
					<td width="30%">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br>
</body>	
</html>

