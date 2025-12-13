
<!--- first check to see if username is taken--->
<cfif #session.loggedin# is "TRUE">
	<cfquery name="updateuseraccount" datasource="mspot">
		UPDATE tblPasswords
		SET adminRights = #Form.adminRights#, Password = '#Form.Password#', userFullName = '#Form.userFullName#'<cfif Form.userEmail NEQ "">, userEmail = '#Form.userEmail#'<cfelse>, userEmail = ' '</cfif><cfif Form.userWebsite NEQ "">, userWebsite = '#Form.userWebsite#'<cfelse>, userWebsite = ' '</cfif><cfif Form.userPic NEQ "">, userPic = '#Form.userPic#'<cfelse>, userPic = ' '</cfif><cfif Form.userZip NEQ "">, userZip = #Form.userZip#<cfelse>, userZip = 0</cfif><cfif Form.userAIM NEQ "">, userAIM = '#Form.userAIM#'<cfelse>, userAIM = ' '</cfif><cfif Form.userBio NEQ "">, userBio = '#Form.userBio#'<cfelse>, userBio = ' '</cfif>
		WHERE UserID = '#Session.UserID#'
	</cfquery>
<cfelse>
	<cfquery username="fimoculous" password="fmcr5473" name="checkcount" datasource="mspot">
		SELECT COUNT(*) as ct 
		FROM tblPasswords 
		WHERE UserID = '#form.UserID#'
	</cfquery>
	<cfif checkcount.ct EQ 0>
		
			<cfinsert username="fimoculous" password="fmcr5473" datasource="mspot" tablename="tblPasswords">

		
	<cfelse>
		<cfset alertmessage = "Sorry, that username is already taken.">
	</cfif>
	
		<cfmail to="editors@mnspeak.com" from="mnspeak@gmail.com" subject="MNspeak NEW USER" type="HTML">
		#Form.UserID# | #Form.userFullName#
		</cfmail>
		
	
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
					<td align="center" valign="top"><br>
						<cfif #session.loggedin# is "TRUE">
						<p align="center"><strong>Your profile has been updated.</strong><br /><br />
						&raquo;&raquo; <a href="http://www.mnspeak.com/">Go back to the homepage.</a><br /><br /></p>
						<cfelseif isdefined("alertmessage")>
						<strong><cfoutput>#alertmessage#</cfoutput></strong><br />
						<cfelse>
						<strong>Welcome, <cfoutput>#UserID#</cfoutput>.</strong><br /><br />
						&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/meta/create.cfm">Login to create a MNspeak.com post.</a><br /><br />
						&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/register.cfm">Sign up for email alerts from MNspeak.com.</a><br /><br />
						&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/meta/login.cfm?aggregator">Personalize your aggregator</a>.<br /><br />
						</cfif>
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

