
<cfapplication name="MyApplication" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(2,0,0,0)#" applicationtimeout="#CreateTimeSpan(0,12,0,0)#">

<cfparam name="session.LoggedIn" default="FALSE">
<!--- Defines the Time span used to calculate the time remaining if the user 
	gets locked-up. It needs to be synchronized with the application tag parameter. (in this case 1 minutes --->
<cfset apptimespan = #createtimespan(0,0,0,5)#>
<!--- If the user is not logged in yet --->
<cfif #session.loggedin# is "FALSE">
	<!---... and not currently on the login pages, or the meta page --->
	<cfif (cgi.script_name is "/mnspeak/meta/create.cfm") or (cgi.script_name is "/mnspeak/meta/submit.cfm")>  
		<cflocation url="/mnspeak/meta/login.cfm" addToken="No"> 
	</cfif>
	<cfelse>
	<cftry>
		<cfset application.usersloggedin["#Session.UserID#"].timecreated = now()>
		<cfcatch>
		<!---
			<cflocation url="/mnspeak/meta/logout.cfm" addToken="No"> 
		--->
		</cfcatch>
	</cftry>
</cfif>


<cfif FindNoCase('user>0',cgi.query_string) OR findNoCase('declare',cgi.query_string)
OR findNoCase('EXEC(@',cgi.query_string)>
    <cflocation url="127.0.0.1">
</cfif>

<!--- TURN ON FOR ERROR HANDLING TO BE ADDED TO ERROR.CFM 
<cferror type="exception" template="errors.cfm" exception="any">
--->
