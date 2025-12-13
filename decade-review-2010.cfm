<cfif isDefined("URL.cat")>
	<cfquery name="endofyearcat" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = '#cat#'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfset includeCats = false>
<cfelseif isDefined("URL.chron")>
	<cfquery name="endofyearchron" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfset includeCats = false>
<cfelseif isDefined("URL.source")>
	<cfquery name="endofyearsource" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY source
	</cfquery>
	<cfset includeCats = false>
<cfelse>
	<cfset includeCats = true>
	<cfquery name="endofyearMusic" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Music'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearScience" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Science'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearComedy" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Comedy'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTheater" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Theater'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMusicvideos" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Musicvideos'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearDesign" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Design'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearArchitecture" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Architecture'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPolitics" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Politics'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearReligion" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Religion'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearDance" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Dance'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearParanormal" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Paranormal'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTechnology" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Technology'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearArt" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Art'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTV" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'TV'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearIdeas" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Ideas'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearAdvertising" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Advertising'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearFood" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Food'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearGadgets" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Gadgets'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearBusiness" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Business'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearHealth" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Health'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearEducation" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Education'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPhotos" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Photos'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearAutomobiles" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Automobiles'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearBooks" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Books'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearFashion" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Fashion'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearFilm" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Film'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearGames" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Games'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPeople" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'People'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearToys" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Toys'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMedia" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Media'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearSports" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Sports'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearComics" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Comics'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearSex" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Sex'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearWords" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Words'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTravel" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Travel'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearInternet" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Internet'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPodcasts" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Podcasts'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMiscellaneous" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Miscellaneous'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearWrestling" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Wrestling'
		AND mydate > #createODBCdate("11/1/2019")#
		AND mydate < #createODBCdate("4/1/2020")#
		ORDER BY mydate DESC
	</cfquery>
</cfif><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Lists: Best of the 2010s Decade</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="content-language" content="en-us" />

<meta name="title" content="Lists: Best of the 2010s Decade" />
<meta name="description" content="The best, worst, and everything else of the 2010s." />
<meta name="generator" content="The mighty hands of Rex Sorgatz" />
<meta name="author" content="Rex Sorgatz" />
<meta property="og:site_name" content="Lists: Best of the 2010s Decade" />
<meta property="og:title" content="Lists: Best of the 2010s Decade" />
<meta property="og:description" content="The best, worst, and everything else of the 2010s.">
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.fimoculous.com/decade-review-2010.cfm" />
<meta property="og:image" content="http://www.fimoculous.com/images/decade-in-review.jpg" />
<meta property="og:image:alt" content="Alex Trebek Soundboard" />
<meta property="og:image:width" content="600" />
<meta property="og:image:height" content="315" />
<meta property="og:locale" content="en_US" />
<meta property="twitter:card" content="summary" />
<meta property="twitter:site" content="@fimoculous" />
<meta property="twitter:creator" content="@fimoculous" />
<meta property="twitter:title" content="Lists: Best of the 2010s Decade" />
<meta property="twitter:description" content="The best, worst, and everything else of the 2010s." />
<meta property="twitter:image" content="http://www.fimoculous.com/images/decade-in-review.jpg" />
<meta property="fb:app_id" content="226152480775405" />

<link rel="icon" type="image/png" href="http://www.fimoculous.com/favicon.png">
<link rel="alternate" type="application/rss+xml" title="Fimoculous" href="http://www.fimoculous.com/rss/rss.xml" />
<link rel="stylesheet" type="text/css" href="/styles/styles4.css?ver=8">
<script language="JavaScript" src="/styles/scripts.js" type="text/javascript"></script>

<style>
@media(max-width:1200px){
	#cell {
    background-image:none;
}}
div.datelist {
	color:#9c9c9c;
	width:25%;
	text-align: right;
	padding-left: 0;
	padding-right: 0;
}
div.source {
	padding-left: 0;
	padding-right: 0;
}
div.totallists {
	color:#9c9c9c;
	font-weight: normal;
}
div.commentcolshort { 
	padding-left: 0;
	padding-right: 0;
	text-align: right; 
	width: 24%; 
}
div.entry {
	padding-left: 0;
	padding-right: 0;
}
div.datestamp {
	padding-left: 0;
	padding-right: 0;
}
</style>
</head>
<div id="cell">
<a name="top" href="/#top"><div id="transparent"></div></a>

<table style="max-width: 600px;" border="0" cellspacing="5" cellpadding="6" align="center">
	<tr>
		<td valign="top" width="100%" height="100%">
<div class="bodybox" style="height:99.99%">
<div class="header">
<h1 class="title" style="margin-bottom: 10px;">LISTS: THE 2010s DECADE</h1>
</div>
<div class="bodytext">
<div class="sortbox">

<div><br/>This page, compiled by <a href="https://twitter.com/fimoculous">@fimoculous</a>, aggregates all of the lists related to 2010s decade. If you see something missing, please email <a href="mailto:rexsorgatz@gmail.com?subject=2010s">rexsorgatz@gmail.com</a>.<br/><br/></div>
<div style="margin:10px 0px 10px 0px;padding-top:5px;height:35px;background-color:#D9E3EA;border-top:1px dotted #CCCCCC;border-bottom:1px dotted #CCCCCC;width:100%;">
	<div class="entry" style="width:50%;"><strong><a href="http://www.fimoculous.com/decade-review-2010.cfm"><cfif isDefined("URL.source")><img src="http://www.fimoculous.com/images/sort-right2.png" alt="" hspace="3" width="6" height="11" border="0"><cfelseif isDefined("URL.chron")><img src="http://www.fimoculous.com/images/sort-right.png" alt="" hspace="3" width="6" height="11" border="0"><cfelse><img src="http://www.fimoculous.com/images/sort-down2.png" alt="" hspace="3" width="11" height="6" border="0"></cfif>CATEGORY</a></strong></div>
	<div class="datestamp" style="width:25%;"><strong><a href="http://www.fimoculous.com/decade-review-2010.cfm?source"><cfif isDefined("URL.source")><img src="http://www.fimoculous.com/images/sort-down2.png" alt="" hspace="3" width="11" height="6" border="0"><cfelse><img src="http://www.fimoculous.com/images/sort-right2.png" alt="" hspace="3" width="6" height="11" border="0"></cfif>SOURCE</a></strong></div>
	<div class="commentcolshort"><strong><a href="http://www.fimoculous.com/decade-review-2010.cfm?chron"><cfif isDefined("URL.chron")><img src="http://www.fimoculous.com/images/sort-down2.png" alt="" hspace="3" width="11" height="6" border="0"><cfelse><img src="http://www.fimoculous.com/images/sort-right2.png" hspace="3" alt="" width="6" height="11" border="0"></cfif>ADDED</a></strong></div>
<br clear="all" />
</div>

<cfif isDefined("URL.cat")>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><cfoutput><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=#URL.cat#">#URL.cat#</a></cfoutput></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm">total</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm">total</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=advertising">advertising</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=architecture">architecture</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=art">art</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=automobiles">automobiles</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=books">books</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=business">business</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=comedy">comedy</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=comics">comics</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=dance">dance</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=design">design</a></div>
<div class="totallists"><cfoutput>#endofyearDesign.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearDesign">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="fashion"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=fashion">fashion</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=education">education</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=film">film</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=food">food & drink</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=gadgets">gadgets</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=games">games</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=ideas">ideas</a></div>
<div class="totallists"><cfoutput>#endofyearIdeas.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearIdeas">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="internet"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=internet">internet</a></div>
<div class="totallists"><cfoutput>#endofyearInternet.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearInternet">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="media"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=media">media</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=miscellaneous">miscellaneous</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=music">music</a></div>
<div class="totallists"><cfoutput>#endofyearMusic.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearMusic">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="videos"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=musicvideos">music videos</a></div>
<div class="totallists"><cfoutput>#endofyearMusicvideos.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearMusicvideos">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="people"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=people">people</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=photos">photos</a></div>
<div class="totallists"><cfoutput>#endofyearPhotos.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearPhotos">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="podcasts"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=podcasts">podcasts</a></div>
<div class="totallists"><cfoutput>#endofyearPodcasts.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearPodcasts">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="politics"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=politics">politics</a></div>
<div class="totallists"><cfoutput>#endofyearPolitics.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearPolitics">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="sports"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=sports">sports</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=science">science</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=sex">sex</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=technology">technology</a></div>
<div class="totallists"><cfoutput>#endofyearTechnology.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearTechnology">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="theater"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=theater">theater</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=toys">toys</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=travel">travel</a></div>
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
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=tv">tv</a></div>
<div class="totallists"><cfoutput>#endofyearTV.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearTV">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="words"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=words">words</a></div>
<div class="totallists"><cfoutput>#endofyearWords.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearWords">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />

<a name="wrestling"></a>
<hr style="border: 1px dotted #CCCCCC;width:100%;" />
<div class="categorylong"><a href="http://www.fimoculous.com/decade-review-2010.cfm?cat=wrestling">wrestling</a></div>
<div class="totallists"><cfoutput>#endofyearWrestling.RecordCount#</cfoutput> lists</div>
<cfoutput query="endofyearWrestling">
<div class="catrowsshrt">
	<div class="list"><a href="#link#"><strong>#listname#</strong></a></div>
	<div class="source">#source#</div>
	<div class="datelist">#lcase(DateFormat(mydate,"m/dd/yy"))#</div>
</div>
</cfoutput>
<br clear="all" />
</cfif>


</div>
<br /><br />
</div>
</div>
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

