
<cfquery name="shortposts" datasource="fimothree" maxrows="23">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.longpost = 0
	AND tblCategoriesContent.category <> 'convo'
	AND tblCategoriesContent.category <> 'mp3'
	AND tblContent.entrynumber = tblCategoriesContent.coid
	ORDER BY entrynumber DESC
</cfquery>


<cfquery name="convoposts" datasource="fimothree" maxrows="5">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.longpost = 0
	AND tblCategoriesContent.category = 'convo'
	AND tblContent.entrynumber = tblCategoriesContent.coid
	ORDER BY entrynumber DESC
</cfquery>

<cfquery name="mp3post" datasource="fimothree" maxrows="1">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.longpost = 0
	AND tblCategoriesContent.category = 'mp3'
	AND tblContent.entrynumber = tblCategoriesContent.coid
	ORDER BY entrynumber DESC
</cfquery>


<cfquery name="longpost" datasource="fimothree" maxrows="10">
	SELECT entrynumber, title, thisdate, entry, images, hascomments, commentnum
	FROM tblContent
	WHERE longpost = 1
	ORDER BY entrynumber DESC
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="openid.server" href="http://www.myopenid.com/server">
<link rel="openid.delegate" href="http://rexsorgatz.myopenid.com/">
<title>Fimoculous.com: Feeding On Itself</title>
<cfinclude template="headerstuff.cfm">
</head>

<body background="/settingsun/tile.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<cfinclude template="siteheader-new.cfm">

<table width="1000" border="0" cellspacing="5" cellpadding="6" align="center">
	<tr>
		<td valign="top" width="65%" height="100%">
			<table cellpadding="3" class="container">
				<tr>
					<td width="100%" valign="top">
						<div class="bodybox">
						<div class="header">
						<div class="title" style="margin-bottom: 10px;">DAILY LINKS</div>
						</div>
						<div class="bodytext">
						<div class="sortbox">
						<cfoutput query="shortposts">
						<div class="catrow">
						<div class="cat#lcase(category)#">
							<div class="category"><a href="http://www.fimoculous.com/archive/archivetemplate.cfm?cat=#lcase(category)#">#lcase(category)#</a></div>
							<div class="entry"<cfif cgi.HTTP_USER_AGENT contains "MSIE"> style="width:380px;"</cfif>>#entry#</div>
							<div class="datestamp"<cfif cgi.HTTP_USER_AGENT contains "MSIE"> style="width:100px;"</cfif>><cfif thisdate GT DateAdd("d", -1, Now())>today<cfelseif thisdate GT DateAdd("d", -2, Now())>yesterday<cfelse>#lcase(DateFormat(thisdate,"ddd"))#</cfif></div>
							<div class="commentcol"><a href="/archive/post-#entrynumber#.cfm" title="#title#">&nbsp;#commentnum#&nbsp;</a></div>
						</div>
						</div>
						</cfoutput>
						<div class="catrow"></div>
						</div>
						</div>
						<br />
						</div>
					</td>
				</tr>
			</table>
		</td>
		<td valign="top" width="35%" height="100%">
			<table cellpadding="3" class="container">
				<!---
				<tr>
					<td valign="top" width="100%">
						<div class="bodybox" style="height:99.6%">
						<div class="header">
						<div class="title">2007 LISTS</div>
						<div class="more"><a href="http://www.fimoculous.com/year-review-2007.cfm" target="_blank">&raquo;MORE</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Most Recent Lists:</strong></div>
						<cfinclude template="i-lists.cfm">
						</div>
						</div>
					</td>
				</tr>
				--->
				<tr>
					<td valign="top" width="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">TWITTER</div>
						<div class="more"><a href="http://twitter.com/fimoculous/" target="_blank">&raquo;MORE</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>What I'm Doing Right Now:</strong></div>
						<div style="text-align:right; float:right;margin-left:5px;"><a href="http://twitter.com/fimoculous/"><img src="http://s3.amazonaws.com/twitter_production/profile_images/57737438/rex.jpg" alt="" width="73" height="73" hspace="5" vspace="5" border="2" style="border: 2px solid #680104;"></a></div>
						<cfinclude template="twitter.xml">
						</div>
						</div>
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%">
						<div class="bodybox" style="height:100px">
						<div class="header">
						<div class="title">SONG OF THE DAY</div>
						</div>
						<div class="bodytext">
						<div style="float:left;margin-top:5px;">
						<cfoutput query="mp3post">
						<cfxml variable="myxmlContent">
							<startpoint>#entry#</startpoint>
						</cfxml>
						<cfset objRSS = xmlParse(myxmlContent)>
						<cfset linky = objRSS.startpoint.a.XmlAttributes.href>
						<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=7,0,0,0" width="50" height="60" id="player" align="middle">
							<param name="allowScriptAccess" value="sameDomain" />
							<param name="movie" value="/mp3/player.swf?link=#linky#" />
							<param name="quality" value="high" />
							<param name="bgcolor" value="##dfe6eb" />
							<embed src="/mp3/player.swf?link=#linky#" quality="high" bgcolor="##dfe6eb" width="50" height="60" name="player" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
						</object>
						</div>
						<div style="padding:10px 0 0 5px;float:left;width:185px;">#entry#</div> <div style="margin: 5px 0px 0px 0px;float:left;padding: 10px 0px 7px 18px; font-weight: bold; width: 48px; background-image: url(/images/comment.png); background-repeat: no-repeat;"><a style="color: ##D9E3EA;" href="/archive/post-#entrynumber#.cfm" title="#title#">&nbsp;#commentnum#&nbsp;</a></div>
						</cfoutput>
						
						</div>
						</div>
				</tr>
				<tr>
					<td valign="top" width="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">PROJECTS</div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Stuff I'm Working On:</strong></div>
						<ul>
						<li><a href="http://mediaite.com/" target="_blank"><strong>Mediaite</strong></a></li>
						<li><a href="http://kindasortamedia.com/" target="_blank"><strong>Kinda Sorta Media</strong></a></li>
				<!---
						<li><a href="http://www.snldigital.com/" target="_blank"><strong>SNLdigital.com</strong></a></li>
						<li><a href="http://www.imjustsayinshow.tv/" target="_blank"><strong>The I'm Just Sayin Show</strong></a></li>
						<li><a href="http://millershalesespnbook.com/" target="_blank"><strong>Untitled ESPN Book</strong></a></li>
						<li><a href="http://viewsource.tv/" target="_blank"><strong>VSN</strong></a></li>
				--->
						</ul>						
						</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="100%" valign="top">
						<cfoutput query="longpost" maxrows="1">
						<div class="bodybox">
						<div class="header">
							<div class="title">REAL VS. FAKE</div>
						</div>

						<div class="bodytext">
						<div class="date"><a href="/archive/post-#entrynumber#.cfm" style="border-bottom:none;">#title#</a></div>
						<span style="font-size: 10px;">Posted: #DateFormat(thisdate,"mmmm d, yyyy")#</span>		<br/>		<br/>		
						
						<div class="comments" style="margin-bottom:0px">
Let me ask you, what kind of person do you think Scarlett Johansson is?<br /><br />

You have probably never met her, and I definitely have not, yet we both seemingly feel like we could describe her personality with reasonable accuracy.<br /><br />

<a href="http://www.gossipcop.com" style="border:0";><img src="http://www.gossipcop.com/wp-content/themes/gossip/images/logo.png" alt="" width="200" height="226" hspace="5"  style="border:0" vspace="0" border="0" align="right"></a>This is peculiar.<br /><br />

It's not shocking to learn that humans enjoy making personality judgments based upon scant evidence. But with celebrities it seems exceptionally dubious, since we actually know literally <em>nothing</em> about them first-hand. Lohan, Aniston, Springsteen, Cruise -- why do all these people seem to have well-formed personas? How much of it is real and how much is manufactured? What are the sources we use to scrape together these mysterious portraits?<br /><br />

There are a few known mythological origins. Maybe that profile in <em>Rolling Stone</em> had some lasting influence, and perhaps those eight minutes on Leno left an impression. But these sources, mediated and filtered and manicured, seem exceptionally unreliable. So what else is there?<br /><br />

Oh yeah, we have their work. Scarlett gave a lasting impression in <em>Lost in Translation</em>, so perhaps we know a little more about her because of how she gobbles sushi with Bill Murray. But wait -- she was <em>acting</em>. Can we really conclude anything about her personality from these flickering screen moments?<br /><br />

I've spent an inordinate amount of time considering this question: <em>why do we think we know people who we'll never actually know?</em><br /><br />

Here's my best guess: we trust gossip.<br /><br />
<a href="http://www.fimoculous.com/archive/post-6328.cfm"><strong>CONTINUED INSIDE...</strong></a><br/><br/>

						</div>
						<div style="margin-left:250px;" class="commentcol"><a href="/archive/post-#entrynumber#.cfm"><strong>#commentnum#</strong></a></div>
						</cfoutput>
						<br clear="all" />
						<div class="subnav">ARCHIVE</div>
						<ul>
						<cfoutput query="longpost" maxrows=10>
						<li style="margin:0px;"><a href="/archive/post-#entrynumber#.cfm">#title#</a></li>
						</cfoutput>
						</ul>
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
					<td width="100%" valign="top">
					<cfinclude template="i-media.cfm">
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
						<ul>
						<cfoutput query="convoposts">
							<li>#entry#</li>
						</cfoutput>
						</ul>
						</div>
						</div>
					</td>
					<!---
					<td valign="top" width="20%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">LINKED</div>
						<div class="more"><a href="http://www.technorati.com/search/fimoculous.com" target="_blank">&raquo;TECHNORATI</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Posts Linking Here:</strong></div>
						<cfinclude template="i-technorati.cfm">
						</div>
						</div>
					</td>
					--->
					<td valign="top" width="33%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">MEDIA</div>
						<div class="more"><a href="http://amazon.com/o/registry/3KKN9EH42V9T4/" target="_blank">&raquo;AMAZON</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Added To My Wishlist:</strong></div>
						<cfinclude template="i-amazon.cfm">
						</div>
						</div>
					</td>
					<td valign="top" width="33%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">EVENTS</div>
						<div class="more"><a href="http://upcoming.org/user/11/" target="_blank">&raquo;UPCOMING</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Events I'm Attending:</strong></div>
						<!---<cfinclude template="i-upcoming.cfm">--->
						</div>
						</div>
					</td>
					<!---
					<td valign="top" width="25%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">MUSIC</div>
						<div class="more"><a href="http://www.last.fm/user/rexsorgatz/" target="_blank">&raquo;LAST.FM</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Music I'm Listening To:</strong></div>
							<cfinclude template="i-lastfm.cfm">
						<br />
						</div>
						</div>
						<div class="bodybox">
						<div class="header">
						<div class="title">SPONSOR</div>
						</div>
						<div class="bodytext" align="center">
							<script type="text/javascript"><!--
							google_ad_client = "pub-5400842764382734";
							google_ad_width = 250;
							google_ad_height = 250;
							google_ad_format = "250x250_as";
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
					</td>
					--->
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
					<td valign="top" width="100%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">COLOPHON</div>
						<div class="bodytext">
						<cfinclude template="rightcontentpersonal.cfm">
						<br /><br />
						</div>
						</div>
					</td>
				</tr>
			</table>
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

