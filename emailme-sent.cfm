<cfmail to="#Form.friendemail#" from="#Form.youremail#" subject="From Fimoculous.com" bcc="rex@fimoculous.com" type="HTML">
<body marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" bgcolor="##333333">
<img src="http://www.fimoculous.com/header/logo.jpg" alt="" width="380" height="72" hspace="0" vspace="0" border="0">
<font color="##808080" style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 12px; color: ##CCCCCC;">
<br><br>
<b>#Form.yourname#</b> at <b>#Form.youremail#</b> thinks you might be interested in this piece of information from Fimoculous.com:
<br><br>
<b><a style="font-weight: bold; color: ##6699CC;" href="http://www.fimoculous.com/calendar-search.cfm?month=#URL.month#&day=#URL.day#&year=#URL.year#">http://www.fimoculous.com/calendar-search.cfm?month=#URL.month#&day=#URL.day#&year=#URL.year#</a></b>
<br><br>
#Form.message#
</font>
</cfmail>

<cfquery name="datesearch" datasource="fimo">
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
			<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td colspan="2" nowrap bgcolor="Gray" class="blogtext"><br>A link to this page has been delivered has been delivered to <b>#Form.friendname#</b> at <b>#Form.friendemail#</b>.<br><br><b>Head On Back To <a href="http://www.fimoculous.com/">Fimoculous.com</a></b><br><br></td>
				</tr>
				<tr>
					<td colspan="2" valign="middle" nowrap bgcolor="##003333" class="blogheader"><cfif Images IS ""><img src="/dailypics/blank.jpg" alt="" width="50" height="40" hspace="0" vspace="0" border="1" align="right"><cfelse><img src="dailypics/#images#" alt="" width="50" height="40" hspace="0" vspace="0" border="1" align="right"></cfif>&nbsp;#DateFormat(date,"mmmm d")#<br><font color="##660000">&nbsp;#title#</font></td>
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
			<br>
			</cfoutput>
		</td>
		<cfinclude template="righbar.cfm">
	</tr>
</table>
<br><br>
</body>
</html>
