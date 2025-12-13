
<cfset totalMainContent = 1>
<cfset totalSecondaryContent = 1>

<cfquery name="maincontent" datasource="fimothree" maxrows=5>
	SELECT entrynumber, title, thisdate, entry, images, hascomments, commentnum
	FROM tblContent
	WHERE longpost = 0
	ORDER BY entrynumber DESC
</cfquery>

<cfquery name="secondarycontent" datasource="fimothree" maxrows=5>
	SELECT entrynumber, title, thisdate, entry, images, hascomments, commentnum
	FROM tblContent
	WHERE longpost = 1
	ORDER BY entrynumber DESC
</cfquery>

<cfquery name="endofyear" datasource="fimothree">
	SELECT id, source, listname, link, mydate, category
	FROM tblEndOfYear
	ORDER BY mydate DESC
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en-us">
<head>
<title>Fimoculous.com: Feeding On Itself</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="content-language" content="en-us" />
<meta name="keywords" lang="en-us" content="rex sorgatz, fimoculous, blog, blogger, rex, twin cities, minneapolis, sorgatz, media, community, urban, parasite" />
<meta name="robots" content="index,follow" />
<meta name="description" content="Rex Sorgatz' website, feeding on internet culture." />
<meta name="author" content="Rex Sorgatz" />
<link rel="alternate" type="application/rss+xml" title="Fimoculous" href="http://www.fimoculous.com/rss/rss.xml" />
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
	
	<cfset cc = 1>
	<cfoutput query="maincontent" maxrows=#totalMainContent#>
	<div class="title">#DateFormat(thisdate,"mmmm d, yyyy")#</div>
	#entry#
	<div align="right" class="permlink"><cfif hascomments IS "1"><a href="/archive/post-#entrynumber#.cfm">comments (#commentnum#)</a> | </cfif><a href="http://www.fimoculous.com/print.cfm?month=#DateFormat(thisdate,"m")#&day=#DateFormat(thisdate,"d")#&year=#DateFormat(thisdate,"yyyy")#">print</a> | <a href="/archive/post-#entrynumber#.cfm">perm link</a></div>
	<cfif cc EQ 1>
	<cfset cc = cc+1>
	</cfif>
	<br />
	</cfoutput>
	
	<br />
	<div class="searchresultsheader">&nbsp;Archive: Last 5 Link Posts</div><br />
	<div class="bodytext">
	<cfoutput query="maincontent" maxrows=5>
	<img src="/images/bullet-small.gif" alt="" width="11" height="9" hspace="0" vspace="0" border="0" align="bottom"> <a href="/archive/post-#entrynumber#.cfm">#DateFormat(thisdate,"mmmm d, yyyy")#</a><br />
	</cfoutput>
	</div>
	<br />
	</div>
	</div>
</td>
<td valign="top" width="33%">
	<div class="headertext"><img src="/structureimages/col_header2.jpg" alt="" width="200" height="40" hspace="0" vspace="0" border="0"></div>
	<div class="bodybox">
	<div class="bodytext">

	<cfset cc = 1>
	<cfoutput query="secondarycontent" maxrows=#totalSecondaryContent#>
	<div class="title">#title#</div>
	#entry#
	<div align="right" class="permlink"><cfif hascomments IS "1"><a href="/archive/post-#entrynumber#.cfm">comments (#commentnum#)</a> | </cfif><a href="http://www.fimoculous.com/print.cfm?month=#DateFormat(thisdate,"m")#&day=#DateFormat(thisdate,"d")#&year=#DateFormat(thisdate,"yyyy")#">print</a> | <a href="/archive/post-#entrynumber#.cfm">perm link</a></div>
	<cfset cc = cc + 1>
	<br />
	</cfoutput>
	<br />

	<div class="searchresultsheader">&nbsp;Archive: Last 5 Long Posts</div><br />
	<cfoutput query="secondarycontent" maxrows=5>
	<img src="/images/bullet-small.gif" alt="" width="11" height="9" hspace="0" vspace="0" border="0" align="bottom"> <a href="/archive/post-#entrynumber#.cfm">#title#</a><br />
	</cfoutput>
<cfinclude template="googleads2.cfm">
	</div>
	<br />
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
<br /><br />

</div>
</body>
</html>