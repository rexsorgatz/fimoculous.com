
<cfapplication name="MyApplication" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(2,0,0,0)#" applicationtimeout="#CreateTimeSpan(0,12,0,0)#">

<cfparam name="session.LoggedIn" default="FALSE">
<!-- Defines the Time span used to calculate the time remaining if the user 
	gets locked-up. It needs to be synchronized with the application tag parameter. (in this case 1 minutes -->
<cfset apptimespan = #createtimespan(0,0,0,5)#>
<!-- If the user is not logged in yet -->
<cfif #session.loggedin# is "FALSE">
	<!-- ... and not currently on the login pages, or the forgotten password page -->
	<cfif (cgi.script_name is not "/cms/login.cfm") and (cgi.script_name is not "/cms/results.cfm")> 
		<cflocation url="/cms/login.cfm" addToken="No">  
	</cfif>
<cfelse>
	<!-- this will reset the time stamp every time the user accesses a non-login related page, to keep track of his activity.  -->
	<cfif (cgi.script_name is not "/cms/login.cfm") and (cgi.script_name is not "/cms/results.cfm")>  
		<cftry>
			<cfif #session.adminrights# NEQ "0">
				<cflocation url="/cms/login.cfm" addToken="No">  
			</cfif>
			<cfset application.usersloggedin["#Session.UserID#"].timecreated = now()> 
		<cfcatch>
		</cfcatch>
		</cftry>
	</cfif>
	<!--- if you're not a super user, get outta here --->
</cfif>


