

<html>

<head>
	<title>CMS</title>

<cfheader name="Expires" value="Mon, 06 Jan 1990 00:00:01 GMT">
<cfheader name="Pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache">

<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Pragma" content="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    

<!-- Kills the entire key in the app variable UsersLoggedin -->
<cfoutput>
	<cfscript>
	StructDelete(application.UsersLoggedin, #session.UserID#, true);
	</cfscript>
</cfoutput>
	
<!-- Kills the logging session Variable -->
<cfset session.loggedin = false>

<cflocation url="login.cfm" addToken="No"> 

	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>



</body>

</html>