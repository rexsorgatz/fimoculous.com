
<cfif cgi.http_host contains "mnspeak.com">
	<cfset ds="mspot">
<cfelse>
	<cfset ds="fimothree">
</cfif> 

<cfset operation = "Comment Edited">
<cfupdate datasource="#ds#" tablename="tblComments" dbtype="ODBC" username="fimoculous" password="fmcr5473">

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>
<cfinclude template="../header.cfm">

<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td>
			<cfoutput>
			<strong>#Operation#</strong>
			</cfoutput>
			<br><br>
			<a href="/cms/comments/"><b>&raquo;Back To Comments Admin</b></a><br><br>
			<a href="/cms/"><b>&raquo;Back To Main Admin</b></a><br><br>
		</td>
	</tr>
</table>


<cfsavecontent variable="commentsXML"><?xml version="1.0" encoding="UTF-8"?><cfquery name="myComments" datasource="mspot" dbtype="ODBC">
	SELECT tblContent.title, tblComments.comName, tblComments.comURL, tblComments.comComment, tblComments.comID, tblComments.comDate, tblComments.comEntryID, tblComments.regUser
	FROM tblComments, tblContent
	WHERE tblComments.comDate >= #DateAdd("d", -1, Now())#
	AND tblComments.comEntryID = tblContent.entrynumber
	ORDER BY tblComments.comDate DESC
</cfquery>
<comments>
<cfoutput query="myComments"><comnt title="#title#" author="#comName#" authorurl="#comURL#" time="#TimeFormat(DateAdd("h", -1, comDate), "h:mm tt")#"><![CDATA[#comComment#]]></comnt></cfoutput>
</comments>
</cfsavecontent>
<cffile action="write" file="c:\websites\fimoculous\mnspeak\archive\allcomments.xml" output="#commentsXML#">



</body>
</html>
