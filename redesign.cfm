<cfif cgi.http_host contains "edebiyat-thejournal.com">
<cflocation url="http://www.edebiyat-thejournal.com/edebiyat/">
</cfif> 
<cfquery name="maincontent" datasource="fimotwo" maxrows="1">
Select entrynumber, title, date, entry, longpost
FROM tblContent
WHERE longpost = 0
ORDER BY date DESC
</cfquery>
<cfquery name="secondarycontent" datasource="fimotwo" maxrows="1">
Select entrynumber, title, date, entry, longpost
FROM tblContent
WHERE longpost = 1
ORDER BY date DESC
</cfquery>
<cfquery name="archivecontent" datasource="fimotwo" maxrows="10">
Select entrynumber, title, date, entry, longpost
FROM tblContent
ORDER BY date DESC
</cfquery>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en-us">
<head>
<title>Fimoculous.com: Feeding On Itself</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="content-language" content="en-us" />
<meta name="keywords" lang="en-us" content="rex sorgatz, fimoculous, blog, blogger, rex, sorgatz, media, community, urban, parasite" />
<meta name="robots" content="index,follow" />
<meta name="author" content="Rex Sorgatz" />
<link rel="alternate" type="application/rss+xml" title="Fimoculous" href="http://www.fimoculous.com/rss/" />
<style type="text/css" media="all">
     @import "/styles/styles.css";
</style>
<script language="JavaScript" src="/styles/scripts.js" type="text/javascript"></script>
</head>

<body background="/structureimages/background-left.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<cfinclude template="siteheader.cfm">

<table width="100%" border="0" cellspacing="20" cellpadding="0" align="center">
<tr>
<td valign="top" width="33%">
	<div class="headertext"><img src="/structureimages/col_header1.jpg" alt="" width="200" height="40" hspace="0" vspace="0" border="0"></div>
	<div class="bodybox">
	<div class="bodytext">
	<cfoutput query="maincontent">
	<div class="title">#DateFormat(date,"mmmm d, yyyy")#</div>
   	#entry#
	<div align="right" class="permlink"><a href="/archive/post-#entrynumber#.cfm">perm link</a></div>
	</cfoutput>
	</div>
	</div>
</td>
<td valign="top" width="33%">
	<div class="headertext"><img src="/structureimages/col_header2.jpg" alt="" width="200" height="40" hspace="0" vspace="0" border="0"></div>
	<div class="bodybox">
	<div class="bodytext">
	<cfoutput query="secondarycontent">
	<div class="title">#title#</div>
   	#entry#
	<div align="right" class="permlink"><a href="/archive/post-#entrynumber#.cfm">perm link</a></div>
	</cfoutput>
	</div>
	</div>
</td>
<td valign="top" width="33%">
	<div class="headertext"><img src="/structureimages/col_header3.jpg" alt="" width="200" height="40" hspace="0" vspace="0" border="0"></div>
	<div class="bodybox">
	<div class="bodytext">
	<cfinclude template="rightcontent.cfm">
	</div>
	</div>
</td>
</tr>
</table>
<div align="center" class="footertxt">
<br /><form><input onclick="shake(10)" class="searchbutton" type="button" value="Press For Instant Gratification"></form>
</div>
</body>
</html>

