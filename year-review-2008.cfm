<cfif isDefined("URL.cat")>
	<cfquery name="endofyearcat" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = '#cat#'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfset includeCats = false>
<cfelseif isDefined("URL.chron")>
	<cfquery name="endofyearchron" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfset includeCats = false>
<cfelseif isDefined("URL.source")>
	<cfquery name="endofyearsource" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY source
	</cfquery>
	<cfset includeCats = false>
<cfelse>
	<cfset includeCats = true>
	<cfquery name="endofyearMusic" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Music'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearScience" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Science'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearComedy" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Comedy'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTheater" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Theater'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMusicvideos" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Musicvideos'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearDesign" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Design'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearArchitecture" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Architecture'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPolitics" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Politics'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearReligion" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Religion'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearDance" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Dance'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearParanormal" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Paranormal'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTech" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Tech'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearArt" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Art'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTV" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'TV'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearIdeas" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Ideas'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearAdvertising" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Advertising'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearFood" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Food'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearGadgets" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Gadgets'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearBusiness" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Business'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearHealth" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Health'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearEducation" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Education'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPhotos" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Photos'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearAutomobiles" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Automobiles'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearBooks" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Books'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearFashion" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Fashion'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearFilm" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Film'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearDVD" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'DVD'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearGames" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Games'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPeople" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'People'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearToys" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Toys'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearOnline" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Online'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMedia" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Media'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearSports" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Sports'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearComics" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Comics'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearSex" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Sex'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearWords" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Words'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTravel" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Travel'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMiscellaneous" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Miscellaneous'
		AND mydate > #createODBCdate("9/1/2008")#
		AND mydate < #createODBCdate("4/1/2009")#
		ORDER BY mydate DESC
	</cfquery>
</cfif>





<cfquery name="convoposts" datasource="fimothree" maxrows="5">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.longpost = 0
	AND tblCategoriesContent.category = 'convo' 
	AND tblContent.entrynumber = tblCategoriesContent.coid
	ORDER BY entrynumber DESC 
</cfquery>

<cfquery name="shortposts" datasource="fimothree" maxrows="25">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.longpost = 0
	AND tblCategoriesContent.category <> 'convo'
	AND tblContent.entrynumber = tblCategoriesContent.coid
	ORDER BY entrynumber DESC 
</cfquery>

<cfquery name="longpost" datasource="fimothree" maxrows="5">
	SELECT entrynumber, title, thisdate, entry, images, hascomments, commentnum
	FROM tblContent
	WHERE longpost = 1
	ORDER BY entrynumber DESC 
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Fimoculous.com: 2008 End-Of-Year Lists</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="content-language" content="en-us" />
<meta name="keywords" lang="en-us" content="rex sorgatz, lists, 2008, best, fimoculous, blog, blogger, rex, twin cities, minneapolis, sorgatz, media, community, urban, parasite, lists" />
<meta name="robots" content="index,follow" />
<meta name="description" content="Rex Sorgatz' website, feeding on internet culture." />
<meta name="author" content="Rex Sorgatz" />
<link rel="shortcut icon" href="http://www.fimoculous.com/favicon.ico">
<link rel="alternate" type="application/rss+xml" title="Fimoculous" href="http://www.fimoculous.com/rss/rss.xml" />
<link rel="stylesheet" type="text/css" href="/styles/styles2.css">
</head>

<body background="/settingsun/tile.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<cfinclude template="siteheader-new.cfm">

<table width="1000" border="0" cellspacing="5" cellpadding="6" align="center">
	<tr>
		<td valign="top" width="75%" height="100%">
			<table cellpadding="3" class="container">
				<tr>
					<td valign="top" height="100%">
<div class="bodybox" style="height:99.99%">
<div class="header">
<div class="title" style="margin-bottom: 10px;">LISTS: 2008</div>
</div>
<div class="bodytext">
<div class="sortbox">



<div align="right"><em>This page aggregates all of the 2008 lists. Please <a href="mailto:rex@fimoculous.com?Subject=best2008">email me</a> list suggestion.</em></div>
<div style="margin:10px 0px 10px 0px;padding-top:5px;height:35px;background-color:#D9E3EA;border-top:1px dotted #CCCCCC;border-bottom:1px dotted #CCCCCC;width:100%;">
	<div class="entry" style="width:340px;margin-left:-20px;"><strong><a href="http://www.fimoculous.com/year-review-2008.cfm"><cfif isDefined("URL.source")><img src="http://www.fimoculous.com/images/sort-right.png" alt="" width="6" height="11" border="0"><cfelseif isDefined("URL.chron")><img src="http://www.fimoculous.com/images/sort-right.png" alt="" width="6" height="11" border="0"><cfelse><img src="http://www.fimoculous.com/images/sort-down.png" alt="" width="11" height="6" border="0"></cfif>CATEGORY</a></strong></div>
	<div class="datestamp" style="width:260px;"><strong><a href="http://www.fimoculous.com/year-review-2008.cfm?source"><cfif isDefined("URL.source")><img src="http://www.fimoculous.com/images/sort-down.png" alt="" width="11" height="6" border="0"><cfelse><img src="http://www.fimoculous.com/images/sort-right.png" alt="" width="6" height="11" border="0"></cfif>SOURCE</a></strong></div>
	<div class="commentcolshort"><strong><a href="http://www.fimoculous.com/year-review-2008.cfm?chron"><cfif isDefined("URL.chron")><img src="http://www.fimoculous.com/images/sort-down.png" alt="" width="11" height="6" border="0"><cfelse><img src="http://www.fimoculous.com/images/sort-right.png" alt="" width="6" height="11" border="0"></cfif>DATE</a></strong></div>
<br clear="all" />
</div>

<cfif isDefined("URL.cat")>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><cfoutput><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=#URL.cat#">#URL.cat#</a></cfoutput></div>
<div class="totallists"><cfoutput>#endofyearcat.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearcat">
<div class="catrowsshrt">
	<div class="list"><strong>#category#:</strong> <a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<cfelseif isDefined("URL.chron")>
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm">total</a></div>
<div class="totallists"><cfoutput>#endofyearchron.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearchron">
<div class="catrowsshrt">
	<div class="list"><strong>#category#:</strong> <a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<cfelseif isDefined("URL.source")>
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm">total</a></div>
<div class="totallists"><cfoutput>#endofyearsource.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearsource">
<div class="catrowsshrt">
	<div class="list"><strong>#category#:</strong> <a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<cfelse>

<a name="advertising"></a>
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=advertising">advertising</a></div>
<div class="totallists"><cfoutput>#endofyearAdvertising.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearAdvertising">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="architecture"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=architecture">architecture</a></div>
<div class="totallists"><cfoutput>#endofyearArchitecture.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearArchitecture">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="art"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=art">art</a></div>
<div class="totallists"><cfoutput>#endofyearArt.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearArt">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="automobiles"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=automobiles">automobiles</a></div>
<div class="totallists"><cfoutput>#endofyearAutomobiles.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearAutomobiles">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="books"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=books">books</a></div>
<div class="totallists"><cfoutput>#endofyearBooks.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearBooks">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="business"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=business">business</a></div>
<div class="totallists"><cfoutput>#endofyearBusiness.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearBusiness">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="comedy"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=comedy">comedy</a></div>
<div class="totallists"><cfoutput>#endofyearComedy.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearComedy">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="comics"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=comics">comics</a></div>
<div class="totallists"><cfoutput>#endofyearComics.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearComics">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="design"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=dance">dance</a></div>
<div class="totallists"><cfoutput>#endofyearDance.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearDance">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="design"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=design">design</a></div>
<div class="totallists"><cfoutput>#endofyearDesign.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearDesign">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="dvd"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=dvd">dvd</a></div>
<div class="totallists"><cfoutput>#endofyearDVD.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearDVD">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="fashion"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=fashion">fashion</a></div>
<div class="totallists"><cfoutput>#endofyearFashion.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearFashion">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="education"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=education">education</a></div>
<div class="totallists"><cfoutput>#endofyearEducation.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearEducation">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="film"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=film">film</a></div>
<div class="totallists"><cfoutput>#endofyearFilm.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearFilm">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="food"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=food">food/drink</a></div>
<div class="totallists"><cfoutput>#endofyearFood.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearFood">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="gadgets"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=gadgets">gadgets</a></div>
<div class="totallists"><cfoutput>#endofyearGadgets.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearGadgets">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="games"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=games">games</a></div>
<div class="totallists"><cfoutput>#endofyearGames.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearGames">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="ideas"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=ideas">ideas</a></div>
<div class="totallists"><cfoutput>#endofyearIdeas.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearIdeas">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="media"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=media">media</a></div>
<div class="totallists"><cfoutput>#endofyearMedia.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearMedia">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="miscellaneous"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=miscellaneous">miscellaneous</a></div>
<div class="totallists"><cfoutput>#endofyearMiscellaneous.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearMiscellaneous">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="music"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=music">music</a></div>
<div class="totallists"><cfoutput>#endofyearMusic.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearMusic">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="online"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=online">online</a></div>
<div class="totallists"><cfoutput>#endofyearOnline.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearOnline">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="paranormal"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=paranormal">paranormal</a></div>
<div class="totallists"><cfoutput>#endofyearParanormal.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearParanormal">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="people"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=people">people</a></div>
<div class="totallists"><cfoutput>#endofyearPeople.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearPeople">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="photos"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=photos">photos</a></div>
<div class="totallists"><cfoutput>#endofyearPhotos.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearPhotos">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="politics"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=politics">politics</a></div>
<div class="totallists"><cfoutput>#endofyearPolitics.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearPolitics">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="religion"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=religion">religion</a></div>
<div class="totallists"><cfoutput>#endofyearReligion.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearReligion">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="sports"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=sports">sports</a></div>
<div class="totallists"><cfoutput>#endofyearSports.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearSports">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="science"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=science">science</a></div>
<div class="totallists"><cfoutput>#endofyearScience.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearScience">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="sex"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=sex">sex</a></div>
<div class="totallists"><cfoutput>#endofyearSex.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearSex">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="technology"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=tech">technology</a></div>
<div class="totallists"><cfoutput>#endofyearTech.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearTech">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="theater"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=theater">theater</a></div>
<div class="totallists"><cfoutput>#endofyearTheater.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearTheater">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="toys"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=toys">toys</a></div>
<div class="totallists"><cfoutput>#endofyearToys.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearToys">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="travel"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=travel">travel</a></div>
<div class="totallists"><cfoutput>#endofyearTravel.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearTravel">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="tv"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=tv">tv</a></div>
<div class="totallists"><cfoutput>#endofyearTV.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearTV">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="videos"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=musicvideos">videos</a></div>
<div class="totallists"><cfoutput>#endofyearMusicvideos.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearMusicvideos">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="words"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/year-review-2008.cfm?cat=words">words/search</a></div>
<div class="totallists"><cfoutput>#endofyearWords.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearWords">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />
</cfif>

<hr style="border: 1px dotted #CCCCCC;width:100%;" /><br />
<strong>PREVIOUS YEARS</strong>: <a href="http://www.fimoculous.com/year-review-2007.cfm">2007</a> | <a href="http://www.fimoculous.com/year-review-2006.cfm">2006</a> | <a href="http://www.fimoculous.com/year-review-2005.cfm">2005</a> | <a href="http://www.fimoculous.com/year-review-2004.cfm">2004</a> | <a href="http://www.fimoculous.com/year-review-2003.cfm">2003</a> | <a href="http://www.fimoculous.com/year-review.cfm">2001</a>

</div>
<br /><br />
</div>
</div>
					</td>
				</tr>
			</table>
		</td>
		<td valign="top" width="25%">
			<table cellpadding="3" class="container">
				<tr>
					<td width="100%" valign="top">
						<div class="bodybox">
						<div class="header">
						<div class="title">SPONSORS</div>
						</div>
						<br/><br/>
						<div class="bodytext" align="center">
							<script type="text/javascript"><!--
							google_ad_client = "pub-5400842764382734";
							google_ad_width = 160;
							google_ad_height = 600;
							google_ad_format = "160x600_as";
							google_ad_type = "text_image";
							google_ad_channel = "";
 							google_color_border = "680104";
							google_color_bg = "D9E3EA";
							google_color_link = "680104";
							google_color_url = "680104";
							google_color_text = "000000";
							//--></script>
							<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
							</script>
						</div>
						
						<br/><br/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br />




<script type="text/javascript">
var _sf_async_config={uid:2823,domain:"fimoculous.com"};
(function(){
  function loadChartbeat() {
    window._sf_endpt=(new Date()).getTime();
    var e = document.createElement('script');
    e.setAttribute('language', 'javascript');
    e.setAttribute('type', 'text/javascript');
    e.setAttribute('src',
       (("https:" == document.location.protocol) ? "https://s3.amazonaws.com/" : "http://") +
       "static.chartbeat.com/js/chartbeat.js");
    document.body.appendChild(e);
  }
  var oldonload = window.onload;
  window.onload = (typeof window.onload != 'function') ?
     loadChartbeat : function() { oldonload(); loadChartbeat(); };
})();

</script>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-12347764-1");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>

