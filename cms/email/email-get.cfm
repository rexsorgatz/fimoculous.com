<cfif cgi.http_host contains "mnspeak.com">
	<cfset ds="mspot">
<cfelse>
	<cfset ds="fimothree">
</cfif> 

<cfquery name="GetEmail" datasource=mspot>
	SELECT emailaddress, emailnumber, emailname, emailentryblog, emailentrycal
	FROM tblEmaillist
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="../header.cfm">
<form action="email-send.cfm" method="post">
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td colspan="4"><strong><a href="http://www.mnspeak.com/mnspeak/newsletter-cal.cfm" target="_blank">Send Calendar To Participants Below</a></strong></td>
	</tr>
	<tr>
		<td colspan="4"><strong><a href="http://www.mnspeak.com/mnspeak/newsletter-blog.cfm" target="_blank">Send Daily Post To Participants Below</a></strong></td>
	</tr>
</table>
<br />
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td><strong>Email Addresses</strong></td>
		<td><strong>Name</strong></td>
		<td width="60"align="center"><strong>Calendar</strong></td>
		<td width="60"align="center"><strong>Blog</strong></td>
		<td width="60"align="center"><strong>Action</strong></td>
	</tr>
<cfoutput query="GetEmail">
	<tr>
		<td>#emailaddress#</td>
		<td>#emailname#&nbsp;</td>
		<td align="center"><input type="checkbox" name="emailentryblog"<cfif GetEmail.emailentryblog IS "1"> checked</cfif>></td>
		<td align="center"><input type="checkbox" name="emailentrycal"<cfif GetEmail.emailentrycal IS "1"> checked</cfif>></td>
		<td align="center"><a href="/cms/email/email-delete.cfm?emailnumber=#emailnumber#">del</a></td>
	</tr>
</cfoutput>
<cfoutput>
	<tr>
		<td colspan="5" align="right"><strong>Total Subscribers: #GetEmail.RecordCount#</strong></td>
	</tr>
</cfoutput>
</table>
<!---
<br />
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td colspan="2"><strong>Send Custom Email To Participants Above:</strong></td>
	</tr>
	<tr>
		<td><strong>Subject:</strong></td>
		<td><input type="text" name="subject" size="45" maxlength="100"></td>
	</tr>
	<tr>
		<td><strong>Text:</strong></td>
		<td><textarea cols="40" rows="15" name="message"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="submit" value="Send"></td>
	</tr>
</table>
</form>
--->
</body>
</html>
