
<cfset session.loggedin = false>

<cfquery name="CheckUser" datasource="mspot">
	SELECT UserID, Password, numberID, displayName, adminRights
	FROM tblPasswords
	WHERE UserID = '#Form.UserID#'
</cfquery>

<!-- Is the user present in the database? -->
<cfif checkuser.recordcount greater than 0>
	<!--- Passwords are not case-sensitive in this application (use Compare() if you want to enable case sensitivity) --->
	<cfif CheckUser.Password is form.password>
		<!-- Does the application structure exist? If not, create one -->
		<cfif #isdefined("application.UsersLoggedin")# is false>
			<cfset application.usersloggedin=structnew()>
		</cfif>
		<cfset useridatdoor = checkuser.userid>
		<!-- Is there a user already using this login? -->
		<cfif #structkeyexists(application.usersloggedin, useridatdoor)# is true>
			<!-- If so, we check if the session is 'virtually' timed out -->
			<cfset endtime = #application.usersloggedin[useridatdoor].timecreated# + #apptimespan#>
			<cfif #datecompare("#Now()#", "#EndTime#")# is 1>
				<!-- If the application variable is timed out then we delete the user from the structure, to leave some room for the new user -->
				<cfoutput>
				<cfscript>
				StructDelete(application.UsersLoggedin, #CheckUser.UserID#, true);
				</cfscript>
				</cfoutput>
				<!-- These Session variables are used to control the login validity through the application using the application.cfm -->
				<cfset session.loggedin = true>
				<cfset session.userid = checkuser.userid>
	
				<!-- We then add the current user session structure to the Application structure -->
				<cfset application.usersloggedin["#session.UserID#"] = session>
				<!-- We add a time stamp to determinate the approximate timeout in case of an unexpected departure of the user -->
				<cfset application.usersloggedin["#Session.UserID#"].timecreated = now()> 
				
			<cfelse>
				<!-- If the session of the user currently logged in is not over, we display a message -->
				<cfoutput>
				<cfif #datediff("n", "#Now()#", "#EndTime#")# lt 1>
					<cfset minutesleft = 'less than one'>
				<cfelse>
					<cfset minutesleft = #datediff("n", "#Now()#", "#EndTime#")#>
				</cfif>
				<cfset reason = ": \n\n1- User #CheckUser.UserID# is already logged-in.\n2- OR you have terminated your last session abnormaly (e.g. your computer crashed).\n\nThis account will be unlocked in: #MinutesLeft# minute(s) from now.">
				</cfoutput>	
			</cfif>
		
		<!-- if we don't detect any user already logged in with the same login, we give the user access to the application -->
		<cfelse>
			<!-- These Session variables are used to control the login validity through the application using the application.cfm -->
			<cfset session.loggedin = true>
			<cfset session.userid = checkuser.userid>
			<cfset session.adminrights = checkuser.adminRights>

			<!-- We then add the current user session structure to the Application structure -->
			<cfset application.usersloggedin["#session.UserID#"] = session>
			<!-- We add a time stamp to determinate the approximate timeout in case of an unexpected departure of the user -->
			<cfset application.usersloggedin["#Session.UserID#"].timecreated = now()> 

		</cfif>
	
	<!-- if the password was incorrect -->
	<cfelse>
		<cfset reason = "the password you\'ve typed is invalid. Try again">
	</cfif>
	
<!-- if the username was not present in the database -->	
<cfelse>
	<cfoutput>
	<cfset reason = 'i could not find a user named #form.userid# here.'>
	</cfoutput>
</cfif>
	
<!-- If the user is authenticated we transfer him/her to the homepage -->
<cfif session.loggedin>

	<script language="JavaScript">
	self.location ='/cms/index.cfm';
	</script>

<!-- If not we transfer the user to the login page -->
<cfelse>
	<cfoutput>
	<script>
	alert("Sorry!  Your login was unsuccessful because #Reason#");
	self.location="login.cfm";
	</script>	
	</cfoutput>

</cfif>