<cfif isDefined("URL.chron")>
	<cfquery name="endofyear" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
<cfelse>
	<cfquery name="endofyearMusic" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Music'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearScience" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Science'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearComedy" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Comedy'
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTheater" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Theater'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMusicvideos" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Musicvideos'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearArchitecture" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Architecture'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearParanormal" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Paranormal'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearArt" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Art'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearTV" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'TV'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearIdeas" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Ideas'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearAdvertising" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Advertising'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearFood" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Food'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearGadgets" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Gadgets'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearBusiness" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Business'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearHealth" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Health'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearEducation" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Education'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPhotos" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Photos'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearAutomobiles" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Automobiles'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearBooks" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Books'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearFilm" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Film'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearDVD" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'DVD'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearGames" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Games'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearPeople" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'People'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearToys" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Toys'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearOnline" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Online'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMedia" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Media'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearSports" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Sports'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearComics" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Comics'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearSex" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Sex'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearWords" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Words'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
	<cfquery name="endofyearMiscellaneous" datasource="fimothree">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE category = 'Miscellaneous'
		AND mydate > #createODBCdate("6/1/2005")#
		AND mydate < #createODBCdate("6/1/2006")#
		ORDER BY mydate DESC
	</cfquery>
</cfif>

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
<br />
<div align="center">
<script type="text/javascript"><!--
google_ad_client = "pub-5400842764382734";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_as";
google_ad_type = "text";
google_ad_channel ="";
google_color_border = "680104";
google_color_bg = "B3C3D3";
google_color_link = "680104";
google_color_url = "680104";
google_color_text = "000000";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>

<table width="100%" border="0" cellspacing="20" cellpadding="0" align="center">
<tr>
<td valign="top" width="70%">
	<div class="headertext">&nbsp;</div>
	<div class="bodybox">
	<div class="bodytext">
	<br />
	<div style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 25px; font-weight: bold;">Lists: 2005</div>
	<br />
	Please <a href="mailto:rex@fimoculous.com?Subject=best2005">email me</a> list suggestions.<!--- Here's <a href="http://www.rexblog.com/2005/11/27#a8841" target="_blank">an interview</a> with me talking about this list of lists, and here's <a href="http://tech2.nytimes.com/mem/technology/techreview.html?res=9C05E1D71E3EF932A35752C0A9629C8B63" target="_blank">last year's <em>NYT</em> story</a> that mentioned it.--->
	<br /><br />
	
<cfif isDefined("URL.chron")>
	<hr size="1" style="border: 1px dashed #650B09;" noshade>
	<a href="/year-review-2005.cfm"><strong>Sort Categorically</strong></a> | <strong>Page Sorted Chronologically</strong>&nbsp;&nbsp;&nbsp;<span style="color: Gray; font-size: 9px;">(date added)</span>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<cfoutput query="endofyear">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <strong>#category#:</strong> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>
	<cfoutput><span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyear.RecordCount#</cfoutput> total lists)</span></cfoutput>
<cfelse>

	<hr size="1" style="border: 1px dashed #650B09;" noshade>
	<strong>Page Sorted Categorically</strong> | <a href="/year-review-2005.cfm?chron"><strong>Sort Chronologically</strong></a>&nbsp;&nbsp;&nbsp;<span style="color: Gray; font-size: 9px;">(date added)</span>
	
	<br/>
	<hr size="1" style="border: 1px dashed #650B09;" noshade>
	<strong>Jump To Category:</strong> <a href="#words">Words & Search</a> | <a href="#dvd">DVD</a> | <a href="#online">Online</a> | <a href="#ideas">Ideas</a> | <a href="#sex">Sex</a> | <a href="#advertising">Advertising/Marketing</a> | <a href="#architecture">Architecture</a> | <a href="#media">Media</a> | <a href="#toys">Toys</a> | <a href="#books">Books</a> | <a href="#film">Film</a> | <a href="#science">Science</a> | <a href="#art">Visual Arts</a> | <a href="#musicvideos">Music Videos</a> | <a href="#comedy">Comedy</a> | <a href="#business">Business</a> | <a href="#people">People</a> | <a href="#gadgets">Gadgets</a> | <a href="#tv">TV</a> | <a href="#games">Games</a> | <a href="#sports">Sports</a> | <a href="#paranormal">Paranormal</a> | <a href="#food">Food</a> | <a href="#health">Health</a> | <a href="#education">Education</a> | <a href="#photos">Photos</a> | <a href="#automobiles">Autombiles</a> | <a href="#theater">Theater</a> | <a href="#comics">Comics</a> | <a href="#music">Music</a> | <a href="#miscellaneous">Miscellaneous</a>

	<a name="words"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">WORDS & SEARCH <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearWords.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearWords">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>
	
	<a name="dvd"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">DVD <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearDVD.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearDVD">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="online"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">ONLINE <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearOnline.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearOnline">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="ideas"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">IDEAS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearIdeas.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearIdeas">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="sex"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">SEX <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearSex.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearSex">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="advertising"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">ADVERTISING/MARKETING <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearAdvertising.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearAdvertising">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="architecture"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">ARCHITECTURE <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearArchitecture.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearArchitecture">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="media"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">MEDIA <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearMedia.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearMedia">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="toys"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">TOYS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearToys.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearToys">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="books"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">BOOKS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearBooks.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearBooks">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>
	
	<a name="film"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">FILM <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearFilm.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearFilm">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="science"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">SCIENCE <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearScience.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearScience">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="art"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">VISUAL ARTS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearArt.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearArt">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="musicvideos"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">MUSIC VIDEOS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearMusicvideos.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearMusicvideos">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="comedy"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">COMEDY <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearComedy.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearComedy">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="business"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">BUSINESS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearBusiness.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearBusiness">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="people"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">PEOPLE <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearPeople.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearPeople">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="gadgets"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">GADGETS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearGadgets.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearGadgets">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="tv"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">TV <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearTV.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearTV">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="games"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">GAMES <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearGames.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearGames">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="sports"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">SPORTS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearSports.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearSports">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="paranormal"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">PARANORMAL <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearParanormal.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearParanormal">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="food"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">FOOD &amp; Drink <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearFood.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearFood">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="health"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">HEALTH <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearHealth.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearHealth">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="education"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">EDUCATION <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearEducation.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearEducation">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="photos"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">PHOTOS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearPhotos.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearPhotos">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="automobiles"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">AUTOMOBILES <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearAutomobiles.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearAutomobiles">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="theater"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">THEATER <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearTheater.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearTheater">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="comics"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">COMICS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearComics.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearComics">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>

	<a name="music"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">MUSIC <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearMusic.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearMusic">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>
	
	<a name="miscellaneous"></a>
	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<div class="title">MISCELLANEOUS <span style="color: Gray; font-size: 9px;">(<cfoutput>#endofyearMiscellaneous.RecordCount#</cfoutput> lists)</span></div>
	<cfoutput query="endofyearMiscellaneous">
	<p><img src="/images/bullet-small.gif" width="11" height="9" alt="" border="0" align="middle" hspace="0" vspace="0"> <a href="#link#" target="_blank"><strong>#listname#</strong></a> from <b>#source#</b> <span style="color: Gray; font-size: 9px;">(#DateFormat(mydate, "MM/DD")#)</span></p>
	</cfoutput>
</cfif>

	<hr size="1" style="border: 1px dashed #650B09;" noshade><br>
	<p>See previously: <a href="http://www.fimoculous.com/year-review-2004.cfm" target="_blank">2004</a> | <a href="http://www.fimoculous.com/year-review-2003.cfm" target="_blank">2003</a> | <a href="http://www.fimoculous.com/year-review.cfm" target="_blank">2001</a>.</p>

</td>
<td valign="top" width="30%">
	<div class="headertext">&nbsp;</div>
	<div class="bodybox">
	<div class="bodytext">
	<cfinclude template="rightcontentpersonal.cfm">
<div align="center">
<script type="text/javascript"><!--
google_ad_client = "pub-5400842764382734";
google_ad_width = 336;
google_ad_height = 280;
google_ad_format = "336x280_as";
google_ad_type = "text";
google_ad_channel ="";
google_color_border = "680104";
google_color_bg = "B3C3D3";
google_color_link = "680104";
google_color_url = "680104";
google_color_text = "000000";
//--></script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
	<br />
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


