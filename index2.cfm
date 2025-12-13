
<cfquery name="convoposts" datasource="fimothree" maxrows="5">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.longpost = 0
	AND tblCategoriesContent.category = 'convo' 
	AND tblContent.entrynumber = tblCategoriesContent.coid
	ORDER BY entrynumber DESC 
</cfquery>

<cfquery name="shortposts" datasource="fimothree" maxrows="55">
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
<cfinclude template="headerstuff.cfm">
</head>

<body background="/structureimages/background-left.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<title>Fimoculous.com: Feeding On Itself</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="content-language" content="en-us" />
<meta name="keywords" lang="en-us" content="rex sorgatz, fimoculous, blog, blogger, rex, twin cities, minneapolis, sorgatz, media, community, urban, parasite" />
<meta name="robots" content="index,follow" />
<meta name="description" content="Rex Sorgatz' website, feeding on internet culture." />
<meta name="author" content="Rex Sorgatz" />
<link rel="shortcut icon" href="http://www.fimoculous.com/favicon.ico">
<link rel="alternate" type="application/rss+xml" title="Fimoculous" href="http://www.fimoculous.com/rss/rss.xml" />
<link rel="stylesheet" type="text/css" href="/styles/styles3.css">
<script language="JavaScript" src="/styles/scripts.js" type="text/javascript"></script>


<script language="JavaScript">
function radiochecker(thisvalue) {
	var a = document.styleSheets[0];
	thisvalue = thisvalue - 1;
	if (document.styleSheets) {
		var s = document.styleSheets[0];
		if (s.cssRules){
	  		var b = a.cssRules;
	  	}
		else if (s.rules){ 
			var b = a.rules;
	  	}
	}
	if (thisvalue<0) {
		for (i=0; i<12; i++) { 
			b[i].style.display = 'block';
		 	document.getElementById("cba"+i).className = "menuunsel";
		}   
		document.getElementById("cba0").className = "menusel";
	}
	else {
		for (i=0; i<12; i++) { 
			b[i].style.display = 'none';
			alert(b[i].selectorText);
		 	document.getElementById("cba"+i).className = "menuunsel";
		}   
		b[thisvalue].style.display = 'block';
		thisvalue = thisvalue + 1;
		document.getElementById("cba"+thisvalue).className = "menusel";
	}
	return false;
}
</script>
<table width="1000" border="0" cellspacing="5" cellpadding="6" align="center">
	<tr>
		<td valign="top" width="65%" height="100%">
			<table cellpadding="3" class="container">
				<tr>
					<td valign="top" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title" style="margin-bottom:15px;float:none;">LINKS</div>
						</div>
						<div style="margin-bottom:10px;text-align:center;">
							<span id="cba0" class="menusel"><a href="javascript:void(0)" onclick="radiochecker(0)">ALL</span></a> 
							<span id="cba1" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(1)">books</a></span> 
							<span id="cba2" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(2)">film</a></span> 
							<span id="cba3" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(3)">games</a></span> 
							<span id="cba4" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(4)">internal</a></span> 
							<span id="cba5" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(5)">media</a></span> 
							<span id="cba6" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(6)">misc</a></span> 
							<span id="cba7" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(7)">music</a></span> 
							<span id="cba8" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(8)">online</a></span> 
							<span id="cba9" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(9)">tshirts</a></span> 
							<span id="cba10" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(10)">tv</a></span> 
							<span id="cba11" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(11)">videos</a></span> 
							<span id="cba12" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(12)">work</a></span>
						</div>
						<div class="bodytext">
						<div class="sortbox">
						<cfoutput query="shortposts">
						<div class="catrow">
						<div class="cat#lcase(category)#">
							<div class="category">#lcase(category)#</div>
							<div class="entry">#entry#</div>
							<div class="datestamp"><cfif thisdate GT DateAdd("d", -1, Now())>today<cfelseif thisdate GT DateAdd("d", -2, Now())>yesterday<cfelse>#lcase(DateFormat(thisdate,"ddd"))#</cfif></div>
							<div class="commentcol"><a href="/archive/post-#entrynumber#.cfm">&raquo;#commentnum#</a></div>
						</div>
						</div>
						</cfoutput>
						</div>
						<br />
						</div>
						</div>
					</td>
				</tr>
			</table>
		</td>
		<td valign="top" width="35%">
		<!---
			<table cellpadding="3" class="container">
				<tr>
					<td width="100%" valign="top">
						<cfoutput query="longpost" maxrows="1">
						<div class="bodybox">
						<div class="header">
						<div class="title">#title#</div>
						</div>
						<div class="bodytext">
						<div class="date">Posted: #DateFormat(thisdate,"mmmm d, yyyy")#</div>

<p>Even before reading Chris Anderson's new book, <a href="http://www.amazon.com/exec/obidos/ASIN/1401302378/ref=nosim/fimoculouscom-20/" target="_blank"><em>The Long Tail</em></a>, you and I -- we, the people on the internet -- are of two minds about it. Part of us has been waiting with zeal, with a virtual palpitating heart, for a new "big idea" book to debate for the rest of the year -- and also, a treatise that will elucidate for our workplace parents (i.e., bosses) why small is the new big, why this niche economy is different than anything ever before, and why this wisdom-of-the-crowds gibberish actually has some evidential support. The other part of us -- the part that has waited so long for this seemingly-eternal-work-in-progress, which, by now, we've already heard our boss, and our boss' boss, and our boss' boss' secretary, repeat the title of so many times (usually, as an inaccurate reference) that we want to retreat to <em>Second Life</em> for the rest of the summer -- yes, this part of us has already deduced this <a href="http://longtail.typepad.com/" target="_blank">blogged book</a> will be repetitive and cloying and, well, long in the mouth.</p>
<a href="http://www.amazon.com/exec/obidos/ASIN/1401302378/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://www.fimoculous.com/images/misc/thelongtail.jpg" alt="" width="120" height="179" hspace="5" vspace="5" border="1" align="right"></a>
<p>Ah, the fragmented public.</p>
<p>For those of you who haven't been gripped by every nuance of the internet economy over the past few years, perhaps some rewinding is in order. Stating the thesis of <em>The Long Tail</em> requires merely a few words: the mass market economy is turning into a niche economy. That's it? Yep, that's it. I suspect those of us who fall in the middle of Gen X will smirk at this proposition. Since approximately the day I left high school, I've been told I'm part of a new micro-marketing culture, that the difference between me and my parents is <em>choice</em>, that fame will be doled out to my friends in tidy 15 minute portions. I've been walking and breathing <em>niche</em> for so long, it's probably time somebody stopped and asked: is all this true?</p>
<p>One thing is true: just the introduction of <em>The Long Tail</em> will zap you with enough aphorisms to instantly transform you into the hottest internet bon vivant at the next Valleywag-crashed party. Simply toss out these maxims over Web 2.0 martinis: "Scarcity requires hits." "The mass market is turning into a market of niches." "The era of one-size-fits-all is ending, and in its place is something new, a market of multitudes." "If the twentieth-century entertainment industry was about <em>hits</em>, the twenty-first century will be equally about <em>niches</em>." Are you writing these down?</p>
<p>But you realize an odd thing about 50 pages into this book: you're not bored. You suspect you <em>should</em> be bored by either the pop economics or the glib utopianism or perhaps, alas, the hash tables. But, somehow, you enjoy the stories that illustrate the overall economic theories. And, most of all, the data points are simply delicious. You want to memorize them for the next time you argue with your friends about topics that <em>feel true</em> but which you don't <em>actually know</em> are true. Did you know...</p>
<p><a href="http://www.fimoculous.com/archive/post-1055.cfm"><strong>CONTINUED INSIDE...</strong></a></p>
						<div align="right"><a href="/archive/post-#entrynumber#.cfm">&raquo;#commentnum#</a></div>
						</cfoutput>
						<br />
						<div class="subnav">ARCHIVE</div>
						<cfoutput query="longpost" maxrows=5>
						<img src="/structureimages/bullet-small.png" alt="" width="11" height="9" hspace="0" border="0" align="bottom" /> <a href="/archive/post-#entrynumber#.cfm">#title#</a><br />
						</cfoutput>
						<br />
						</div>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" valign="top" width="100%">
			<table cellpadding="3" class="container">
				<tr>
					<td width="100%" colspan="3" valign="top">
						<div class="bodybox">
						<div class="header">
						<div class="title" style="float:none;">FLICKR.COM</div>
						</div>
						<br/>
								<cfinclude template="i-flickr.cfm">
						<br/>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" valign="top" width="100%">
			<table cellpadding="3" class="container">
				<tr>
					<td valign="top" width="33%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">CONVERSATION</div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Places I'm Commenting:</strong></div>
						<cfoutput query="convoposts">
							<p><img src="/structureimages/bullet-small.png" alt="" width="11" height="9" hspace="0" border="0" align="bottom" /> #entry#</p>
						</cfoutput>
						<br />
						</div>
						</div>
					</td>
					<td valign="top" width="33%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">AMAZON.COM</div>
						<div class="more"><a href="http://amazon.com/o/registry/3KKN9EH42V9T4/" target="_blank">&raquo;MORE</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Stuff I've Recently Added To My Amazon Wishlist:</strong></div>
						<cfinclude template="i-amazon.cfm">
						<br />
						</div>
						</div>
					</td>
					<td valign="top" width="33%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">UPCOMING.ORG</div>
						<div class="more"><a href="http://upcoming.org/user/11/" target="_blank">&raquo;MORE</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Events I'm Attending:</strong></div>
						<cfinclude template="i-upcoming.cfm">
						<br />
						</div>
						</div>
					</td>
				</tr>
				<tr>
					<td valign="top" width="33%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">LAST.FM</div>
						<div class="more"><a href="http://www.last.fm/user/rexsorgatz/" target="_blank">&raquo;MORE</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Tracks I'm Playing This Week:</strong></div>
						<cfinclude template="i-lastfm.cfm">
						<br />
						</div>
						</div>
					</td>
					<td valign="top" width="33%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">MNSPEAK.COM</div>
						<div class="more"><a href="http://www.mnspeak.com/mnspeak/archive/archivetemplate.cfm?author=rex" target="_blank">&raquo;MORE</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Posts I've Made On MNspeak.com:</strong></div>
						<cfinclude template="i-mnspeak.cfm">
						<br />
						</div>
						</div>
					</td>
					<td valign="top" width="33%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title" style="float:none;">COLOPHON</div>
						<div class="bodytext">
						<cfinclude template="rightcontentpersonal.cfm">
						</div>
						</div>
						<br/>
						<br/>
					</td>
				</tr>
			</table>
		--->
		</td>
		
	</tr>
</table>
<br />
<!---
	<div align="center">
		<script type="text/javascript"><!--
		google_ad_client = "pub-5400842764382734";
		google_ad_width = 728;
		google_ad_height = 90;
		google_ad_format = "728x90_as";
		google_ad_type = "text";
		google_ad_channel ="";
		google_color_border = "680104";
		google_color_bg = "D9E3EA";
		google_color_link = "680104";
		google_color_url = "680104";
		google_color_text = "000000";
		//--></script>
		<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
	</div>
<br /><br />

--->





</body>
</html>

