<cfif cgi.http_host contains "edebiyat-thejournal.com">
<cflocation url="http://www.edebiyat-thejournal.com/edebiyat/">
</cfif> 
<cfquery cachedWithin="#createTimeSpan( 5, 0, 0, 0 )#" name="maincontent" datasource="fimothree">
Select entrynumber, title, thisdate
FROM tblContent
ORDER BY thisdate DESC
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

<cfinclude template="../siteheader.cfm">

<table width="100%" border="0" cellspacing="20" cellpadding="0" align="center">
<tr>
<td valign="top" width="50%">
	<div class="headertext"><img src="/structureimages/col_header1.jpg" alt="" width="200" height="40" hspace="0" vspace="0" border="0"></div>
	<div class="bodybox">
	<div class="bodytext">
	<p>You probably want to use the search box in the upper right corner, but here are nearly all archived posts:</p>
	<cfoutput query="maincontent">
	<div class="bodytext"><img src="/images/bullet-small.gif" alt="" width="11" height="9" hspace="0" vspace="0" border="0" align="middle"> <a href="/archive/post-#entrynumber#.cfm">#DateFormat(thisdate,"mmmm d, yyyy")# - #title#</a></div>
	</cfoutput>
	</div>
	</div>
</td>
<td valign="top" width="50%">
	<div class="headertext"><img src="/structureimages/col_header3.jpg" alt="" width="200" height="40" hspace="0" vspace="0" border="0"></div>
	<div class="bodybox">
	<div class="bodytext">
	<cfinclude template="../rightcontentpersonal.cfm">
	<cfinclude template="../googleads2.cfm">
	</div>
	</div>
</td>
</tr>
</table>
<div align="center" class="footertxt">
<br /><br />
<!---<form><input onclick="shake(10)" class="searchbutton" type="button" value="Press For Instant Gratification"></form>--->
</div>
</body>
</html>




