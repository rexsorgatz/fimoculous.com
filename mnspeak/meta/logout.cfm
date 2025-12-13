<cfif cgi.referer contains "archive">
	<cfset refer="#cgi.referer#">
<cfelse>
	<cfset refer="http://www.mnspeak.com">
</cfif>
<html>
<head>
	<title></title>
<cfoutput>
	<cfscript>
	StructDelete(application.UsersLoggedin, #session.UserID#, true);
	</cfscript>
</cfoutput>
	
<!-- Kills the logging session Variable -->
<cfset session.loggedin = false>
<cfset session.userid = "">

<cfif cgi.http_host contains "fimoculous.com">
	<cflocation url="http://www.fimoculous.com" addToken="No"> 
<cfelse>
	<cflocation url="http://www.mnspeak.com" addToken="No"> 
</cfif>
</head>
<body>
</body>
</html>