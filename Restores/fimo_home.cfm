

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
<link rel="openid.server" href="http://www.myopenid.com/server">
<link rel="openid.delegate" href="http://rexsorgatz.myopenid.com/">
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
				<tr>
					<td valign="top" width="100%">
						<div class="bodybox" style="height:99.6%">
						<div class="header">
						<div class="title">TWITTER</div>
						<div class="more"><a href="http://twitter.com/fimoculous/" target="_blank">&raquo;MORE</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>What I'm Doing Right Now:</strong></div>
						<div style="text-align:right; float:right;"><a href="http://twitter.com/fimoculous/"><img src="http://assets3.twitter.com/system/user/profile_image/41713/normal/drink.png" alt="" width="48" height="48" hspace="5" vspace="5" border="2" style="border: 2px solid #680104;"></a></div>
						<cfinclude template="i-twitter.cfm">
						</div>
						</div>
					</td>
				</tr>
						<!---

				<tr>
					<td valign="top" width="100%">
						<div class="bodybox" style="height:99.4%">
						<div class="header">
						<div class="title">2006 LISTS</div>
						<div class="more"><a href="http://www.fimoculous.com/year-review-2006.cfm" target="_blank">&raquo;MORE</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Most Recent Lists I've Collected:</strong></div>
						<cfinclude template="i-lists.cfm">
						</div>
						</div>
					</td>
				</tr>
						--->
				<tr>
					<td width="100%" valign="top">
						<cfoutput query="longpost" maxrows="1">
						<div class="bodybox">
						<div class="header">
						<div class="title">EVEN MORE TWITTER</div>
						</div>
						<div class="bodytext">
						<div class="date"><a href="/archive/post-#entrynumber#.cfm">You Twit</a><br/><span style="font-size: 10px;">Posted: #DateFormat(thisdate,"mmmm d, yyyy")#</span></div>
#entry#

						<div style="margin-left:250px;" class="commentcol"><a href="/archive/post-#entrynumber#.cfm"><strong>#commentnum#</strong></a></div>
						</cfoutput>
						<br clear="all" />
						<div class="subnav">ARCHIVE</div>
						<ul>
						<cfoutput query="longpost" maxrows=5>
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
						<div class="bodybox" style="height:130px;">
						<div class="header">
						<div class="title" style="float:none;margin-bottom:12px;">MEDIA</div>
						</div>
						
						<div style="float:left;padding-left:3px;padding-right:20px;">
						<div class="subnav">LISTENING</div>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000OLHGBQ/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://images.amazon.com/images/P/B000OLHGBQ.01._SCTHUMBZZZ_.jpg" title="header=[Mirrored] body=[by Battles]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000NVIXFA/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://images.amazon.com/images/P/B000NVIXFA.01._SCTHUMBZZZ_.jpg" title="header=[Volta] body=[by Bjork]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000NVIGC0/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://images.amazon.com/images/P/B000NVIGC0.01._SCTHUMBZZZ_.jpg" title="header=[Sky Blue Sky] body=[by Wilco]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000NQR7UC/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://images.amazon.com/images/P/B000NQR7UC.01._SCTHUMBZZZ_.jpg" title="header=[5:55] body=[by Charlotte Gainsbourg]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000MMLOJ2/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://images.amazon.com/images/P/B000MMLOJ2.01._SCTHUMBZZZ_.jpg" title="header=[Myths of the Near Future] body=[by Klaxons]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000M3452Y/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://images.amazon.com/images/P/B000M3452Y.01._SCTHUMBZZZ_.jpg" title="header=[Sound of Silver] body=[by LCD Soundsystem]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						</div>

						<div style="float:left;padding-left:3px;padding-right:20px;">
						<div class="subnav">READING</div>
						<a href="http://www.amazon.com/exec/obidos/ASIN/1416546022/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec1.images-amazon.com/images/P/1416546022.01._SCTHUMBZZZ_.jpg" title="header=[Falling Man] body=[by Don DeLillo]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/0307265838/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec1.images-amazon.com/images/P/0307265838.01._SCTHUMBZZZ_.jpg" title="header=[After Dark] body=[by Murakami]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/038551218X/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec1.images-amazon.com/images/P/038551218X.01._SCTHUMBZZZ_.jpg" title="header=[You Don't Love Me Yet] body=[by Jonathan Lethem]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/0805080430/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec3.images-amazon.com/images/P/0805080430.01._SCTHUMBZZZ_.jpg" title="header=[Everything Is Miscellaneous] body=[by David Weinberger]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						</div>

						<div style="float:left;padding-left:3px;padding-right:20px;">
						<div class="subnav">WATCHING</div>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B00005JPA6/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec1.images-amazon.com/images/P/B00005JPA6.01._SCTHUMBZZZ_.jpg" title="header=[Pan's Labyrinth] body=[directed by Guillermo del Toro]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000MRA56K/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec3.images-amazon.com/images/P/B000MRA56K.01._SCTHUMBZZZ_.jpg" title="header=[When the Leaves Blow Away] body=[directed by Steven Wright]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000M3439E/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec3.images-amazon.com/images/P/B000M3439E.01._SCTHUMBZZZ_.jpg" title="header=[Twin Peaks - Season Two] body=[directed by David Lynch]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000MCH5P4/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec3.images-amazon.com/images/P/B000MCH5P4.01._SCTHUMBZZZ_.jpg" title="header=[Babel] body=[directed by Alejandro González Iñárritu]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						<a href="http://www.amazon.com/exec/obidos/ASIN/B000K7VIKY/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://ec3.images-amazon.com/images/P/B000K7VIKY.01._SCTHUMBZZZ_.jpg" title="header=[McLuhan's Wake] body=[starring Marshall McLuhan]" alt="" height="62" hspace="0" vspace="0" border="0"></a>
						</div>

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
					<td valign="top" width="25%" height="100%">
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
					<td valign="top" width="25%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">STUFF</div>
						<div class="more"><a href="http://amazon.com/o/registry/3KKN9EH42V9T4/" target="_blank">&raquo;AMAZON</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Added To My Wishlist:</strong></div>
						<cfinclude template="i-amazon.cfm">
						</div>
						</div>
					</td>
					<td valign="top" width="25%" height="100%">
						<div class="bodybox">
						<div class="header">
						<div class="title">EVENTS</div>
						<div class="more"><a href="http://upcoming.org/user/11/" target="_blank">&raquo;UPCOMING</a></div>
						</div>
						<div class="bodytext">
						<div class="descriptor"><strong>Events I'm Attending:</strong></div>
						<cfinclude template="i-upcoming.cfm">
						</div>
						</div>
					</td>
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
					<!--- 
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

