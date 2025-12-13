<!---
<cfquery name="datesearch" datasource="fimothree">
select entrynumber, title, date, entry, images
from tblContent
where date = #createODBCDateTime(createDate(url.year,url.month,url.day))#
order by entrynumber DESC 
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en-us">
<head>
<title>(((oooo))) Fimoculous.com: Feeding Time</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="window-target" content="_top"> 
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="content-language" content="en-us">
<meta name="copyright" content="copyright (c)2001 Rex Sorgatz.  All rights reserved.">
<meta name="description" lang="en-us" content="A Blog Feeding Upon Itself Designed And Developed By Rex Sorgatz, But For Communal Purposes">
<meta name="author" content="Rex Sorgatz">
<base href="http://www.fimoculous.com/">
<link rel="shortcut icon" href="http://www.fimoculous.com/images/icon.ico">
<script language="JavaScript" src="/styles/fimoculous.js" type="text/javascript"></script>
<cfif cgi.HTTP_USER_AGENT contains "MSIE">
<link rel="stylesheet" type="text/css" href="/styles/fimostyles_ideal.css" media="screen">
<cfelseif cgi.HTTP_USER_AGENT contains "Mozilla/4">
<link rel="stylesheet" type="text/css" href="/styles/fimostyles_nn4.css" media="screen">
<cfelse>
<link rel="stylesheet" type="text/css" href="/styles/fimostyles_ideal.css" media="screen">
</cfif> 

</head>

<body marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" background="/images/background2.gif" bgcolor="#333333" onload="window.defaultStatus='Fimoculous: Feeding On Itself'">


<table cellspacing="0" cellpadding="0" align="center" style="border: 3px dotted Lime;">
	<cfinclude template="headerrow.cfm">
	<tr>
		<td width="580" valign="top" bgcolor="#3E3E3E" class="backgroundright">
			<div align="center" class="blogtext">
				<form action="self">
				<b>open all links in:</b>
				&nbsp;&nbsp;
				<input type="radio" name="targetnew" checked onClick="targetWin(this.checked)">new window
				&nbsp;&nbsp;
				<input type="radio" name="targetnew" onClick="targetWin()">this window
				</form>
			</div>
			<!--Open module-->
			<cfoutput query="datesearch">
			<form action="emailme-sent.cfm?month=#URL.month#&day=#URL.day#&year=#URL.year#" method="post">
			<table border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td colspan="2">
						<table border="0" cellspacing="0" cellpadding="10" align="center">
							<tr>
								<td bgcolor="Gray" colspan="2" class="blogtext"><br><b>Fill out the information below to send this page to a friend:</b><br></td>
							</tr>
							<tr>
								<td width="30" nowrap bgcolor="Gray" class="blogtext"><b>Your name:</b></td><td bgcolor="Gray" class="blogtext"><input type="text" name="yourname" class="searchbox" size="10" maxlength="30" style="width: 125px;"></td>
							</tr>
							<tr>
								<td bgcolor="Gray" nowrap class="blogtext"><b>Your email:</b></td><td bgcolor="Gray" class="blogtext"><input type="text" name="youremail" class="searchbox" size="10" maxlength="30" style="width: 125px;"></td>
							</tr>
							<tr>
								<td bgcolor="Gray" nowrap class="blogtext"><b>Friend name:</b></td><td bgcolor="Gray" class="blogtext"><input type="text" name="friendname" class="searchbox" size="10" maxlength="30" style="width: 125px;"></td>
							</tr>
							<tr>
								<td bgcolor="Gray" nowrap class="blogtext"><b>Friend email:</b></td><td bgcolor="Gray" class="blogtext"><input type="text" name="friendemail" class="searchbox" size="10" maxlength="30" style="width: 125px;"></td>
							</tr>
							<tr>
								<td valign="top" nowrap bgcolor="Gray" class="blogtext"><b>Message:</b></td><td bgcolor="Gray" class="blogtext"><textarea cols="30" rows="6" name="message" wrap="hard" class="searchbox" style="width: 300px;"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" valign="top" nowrap bgcolor="Gray" class="blogtext"><b>Note:</b> Email sent in html format.</td>
							</tr>
							<tr>
								<td colspan="2" nowrap bgcolor="Gray" align="right" class="blogtext"><input type="submit" value="Send" class="searchbutton"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="middle" nowrap bgcolor="##003333" class="blogheader"><cfif Images IS ""><img src="/dailypics/blank.jpg" alt="" width="50" height="40" hspace="0" vspace="0" border="0" align="right"><cfelse><img src="dailypics/#images#" alt="" width="50" height="40" hspace="0" vspace="0" border="0" align="right"></cfif>&nbsp;#DateFormat(date,"mmmm d")#<br><font color="##660000">&nbsp;#title#</font></td>
				</tr>
				<tr>
					<td colspan="2" bgcolor="##333333" class="blogtext" style="border-left: thin ridge Gray;border-right: thin ridge Gray; padding-left: 3px; padding-right: 3px;">

#entry#
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right" bgcolor="##333333" class="blogtext" style="border: thin ridge Gray;"><a href="http://www.fimoculous.com/calendar-search.cfm?month=#DateFormat(date,"m")#&day=#DateFormat(date,"d")#&year=#DateFormat(date,"yyyy")#"><img src="/images/icons/link.gif" width="11" height="8" hspace="0" vspace="0" border="0" alt="permanent link"></a> | <a href="http://www.fimoculous.com/print.cfm?month=#DateFormat(date,"m")#&day=#DateFormat(date,"d")#&year=#DateFormat(date,"yyyy")#"><img src="/images/icons/print.gif" width="11" height="8" hspace="0" vspace="0" border="0" alt="print"></a> | <a href="http://www.fimoculous.com/emailme.cfm?month=#DateFormat(date,"m")#&day=#DateFormat(date,"d")#&year=#DateFormat(date,"yyyy")#"><img src="/images/icons/email.gif" width="11" height="8" hspace="0" vspace="0" border="0" alt="email"></a>&nbsp;
					</td>
				</tr>
			</table>
			</form>
			<br>
			</cfoutput>
		</td>
		<cfinclude template="righbar.cfm">
	</tr>
</table>
<br><br>
</body>
</html>

--->
