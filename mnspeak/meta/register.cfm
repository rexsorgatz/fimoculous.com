<cfif #session.loggedin# is "TRUE">
	<cfquery name="getUserData" datasource="mspot">
		SELECT UserID, Password, displayName, userEmail, userFullName, userWebsite, userEmail, userPic, userBio, adminRights, userZip, userAIM
		FROM tblPasswords
		WHERE  UserID = '#Session.UserID#'
	</cfquery>
</cfif>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Meta</title>
	<link rel="stylesheet" type="text/css" href="/mnspeak/styles.css">
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>
	<script>
		function validateOnSubmit() {
		if (document.myform.userFullName.value.length < 3) {
			alert("You must enter a full name.");
			return false;
			}
		else if (document.myform.UserID.value.length < 3) {
			alert("You must enter a username. It should be at least three characters.");
			return false;
			}
		else if (document.myform.Password.value.length < 3) {
			alert("You must enter a password. It should be at least three characters.");
			return false;
			}
		else if (document.myform.userEmail.value.length < 3) {
			alert("You must enter an email address.");
			return false;
			}
		else {
			//make zip a number.
			var sText = document.myform.userZip.value;
			var ValidChars = "0123456789";
			var IsNumber=true;
			for (i = 0; i < sText.length; i++) {
				var charx = sText.charAt(i); 
				if (ValidChars.indexOf(charx) == -1) {
					alert("The Zip Code must be a number.");
					IsNumber=false;
					break;
					}
				}
			//no spaces in username.
			var tText = document.myform.UserID.value;
			var inValidChars = " ";
			var containsNoSpaces=true;
			for (i = 0; i < tText.length; i++) {
				var charx = tText.charAt(i); 
				if (inValidChars.indexOf(charx) == -1) {
					} 
				else {
					alert("Your username contains a space.");
					containsNoSpaces=false;
					break;
					}
				}
			if (IsNumber == true && containsNoSpaces == true && containsNoUpperCase == true) {
				return true;
				} else {
				return false;
				}
			}
		 };
	</script>
</head>

<body background="/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="../header.cfm">
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
				<tr>
					<td width="10%">&nbsp;</td>
					<td width="80%" align="center" valign="top"><br />
						<form name="myform" onSubmit="return validateOnSubmit()" action="registered.cfm" method="post" enctype="multipart/form-data">
							<input type="hidden" name="adminRights" <cfif #session.loggedin# is "TRUE"> value="<cfoutput>#getUserData.adminRights#</cfoutput>"<cfelse> value="2"</cfif>>
							<table width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
								<cfif #session.loggedin# is "TRUE">
								<tr>
									<td colspan="2" align="center"><div class="title">Update Your Profile</div><br /></td>
								</tr>
								</cfif>
								<tr>
									<td colspan="2"><strong><u>REQUIRED FIELDS:</u></strong><br /></td>
								</tr>
								<tr>
									<td colspan="2">To keep the peace, we require you to use your <strong>real full name</strong>.<br />Profiles from fake or incomplete names will not be accepted.<br />Let's repeat that: <strong>REAL. FULL. NAME.</strong><br /><br /></td>
								</tr>
								<tr>
									<td nowrap>Full Name:</td>
									<td nowrap><input type="text" name="userFullName" size="20" maxlength="30"<cfif #trim(session.loggedin)# is "TRUE"> value="<cfoutput>#getUserData.userFullName#</cfoutput>"</cfif>> (Example: <em>John Smith</em>. This will only appear on your profile page.)</td>
								</tr>
								<tr>
									<td>Username:</td>
									<td nowrap><cfif #session.loggedin# is "TRUE"><cfoutput><strong>#getUserData.UserID#</strong></cfoutput><cfelse><input type="text" name="UserID" size="15" maxlength="8"> (Lowercase, no spaces, max of 8 characters. Example: <em>jsmith</em>.)</cfif></td>
								</tr>
								<tr>
									<td>Password:</td>
									<td nowrap><input type="password" name="Password" size="15" maxlength="15"<cfif #trim(session.loggedin)# is "TRUE"> value="<cfoutput>#getUserData.Password#</cfoutput>"</cfif>></td>
								</tr>
								<tr>
									<td>Email:</td>
									<td><input type="text" name="userEmail" size="20" maxlength="30"<cfif #session.loggedin# is "TRUE"> value="<cfoutput>#trim(getUserData.userEmail)#</cfoutput>"</cfif>> <br />(Your email will NOT be displayed in your public profile.  Only MNSpeak editors will be able to see it and we will never share it with anyone. If you'd like your email to be public, you may include it in your bio below.) </td>
								</tr>
								<tr>
									<td colspan="2"><br /><strong><u>OPTIONAL FIELDS:</u></strong><br /></td>
								</tr>
								<tr>
									<td colspan="2">Every registered user will get a public profile page (<a href="http://www.mnspeak.com/mnspeak/archive/archivetemplate.cfm?author=rex" target="_blank">example</a>). The fields below will appear on your profile.<br /><br /></td>
								</tr>
								<tr>
									<td>Website:</td>
									<td nowrap><input type="text" name="userWebsite" size="30" maxlength="50"<cfif #session.loggedin# is "TRUE"> value="<cfoutput>#trim(getUserData.userWebsite)#</cfoutput>"</cfif>> (Example: <em>http://www.fimoculous.com</em>.)</td>
								</tr>
								<tr>
									<td>AIM:</td>
									<td nowrap><input type="text" name="userAIM" size="30"  maxlength="30"<cfif #session.loggedin# is "TRUE"> value="<cfoutput>#trim(getUserData.userAIM)#</cfoutput>"</cfif>> (This is your AOL instant messenger handle.)</td>
								</tr>
								<tr>
									<td>Zip Code:</td>
									<td nowrap><input type="text" name="userZip" size="30"  maxlength="5"<cfif #session.loggedin# is "TRUE"> value="<cfif #trim(getUserData.userZip)# EQ 0><cfelse><cfoutput>#trim(getUserData.userZip)#</cfoutput></cfif>"</cfif>> (Example: <em>55403</em>.)</td>
								</tr>
								<tr>
									<td nowrap>Photo:</td>
									<td nowrap><input type="text" name="userPic" size="30" maxlength="100"<cfif #session.loggedin# is "TRUE"> value="<cfoutput>#trim(getUserData.userPic)#</cfoutput>"</cfif>> (Must be 75x100. Example: <em>http://www.fimoculous.com/mypic.jpg</em>.)</td>
								</tr>
								<tr>
									<td>Bio:</td>
									<td nowrap><textarea cols="60" rows="6" name="userBio"><cfif #session.loggedin# is "TRUE"><cfoutput>#trim(getUserData.userBio)#</cfoutput></cfif></textarea></td>
								</tr>

								<tr>
									<td colspan="2" align="center"><br>
									<cfif #session.loggedin# is "TRUE">
									<input class="searchbutton" type="submit" value="Save">
									<cfelse>
									<input class="searchbutton" type="submit" value="Register">
									</cfif>
									</td>
								</tr>
							</table>
						</form>
						<br /><br />
					</td>
					<td width="10%">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br>
</body>	
</html>

