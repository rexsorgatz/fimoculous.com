
<cfheader statuscode="301" statustext="Moved permanently">
<cfheader name="Location" value="http://www.mnspeak.com#CGI.SCRIPT_NAME#">

	<cfset post = "50">
	<cfinclude template="archivetemplate.cfm">
	
