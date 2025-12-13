
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Photos</title>
	<script type="text/javascript" src="../scripts.js"></script>
	<link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#ECF0F2">
	<tr>
		<td>
<cfinclude template="../header.cfm">
		<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
			<tr>
				<td width="80%" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#C9CED5" style="border: 1px solid Black; padding: 2px; margin-top: 5px;">
						<tr>
							<td>
							<div class="blogcopy"><strong>What is this?</strong> This page is a photostream of images uploaded to <a href="http://www.flickr.com/photos/tags/twincities/" target="_blank">Flickr</a> and tagged with various local references. Displaying just the 10 most recent photos, the page updates automatically as new images are added to Flickr. Click on the photo to see a larger version on Flickr.</div>
							</td>
						</tr>
					</table><br/>
					<cfset flickrurls="http://www.flickr.com/groups/tc/pool/feed/?format=rss_200,http://www.flickr.com/services/feeds/photos_public.gne?tags=minneapolis&format=rss_200,http://www.flickr.com/services/feeds/photos_public.gne?tags=minnesota&format=rss_200,http://www.flickr.com/services/feeds/photos_public.gne?tags=stpaul&format=rss_200,http://www.flickr.com/services/feeds/photos_public.gne?tags=twincities&format=rss_200">
					<cfset flickrlocs="TWIN CITIES POOL,MINNEAPOLIS TAG,MINNESOTA TAG,ST. PAUL TAG,TWIN CITIES TAG">
					<cfset flickrurllocs="http://www.flickr.com/groups/tc/pool/,http://www.flickr.com/photos/tags/minneapolis/,http://www.flickr.com/photos/tags/minnesota/,http://www.flickr.com/photos/tags/stpaul/,http://www.flickr.com/photos/tags/twincities/">
					<cfloop index="feeds" from="1" to="#ListLen(flickrurls)#">
						<div class="titlebar" style="margin-bottom: -20px;">&raquo;<cfoutput>#listGetAt(flickrlocs, feeds)#</cfoutput></div>
						<cftry>
							<cfhttp url="#listGetAt(flickrurls, feeds)#" method="get" timeout="10">
							<cfcatch type="any">
								<cfoutput><h1>Oops, broken.</h1></cfoutput>
							</cfcatch>
						</cftry>
						<!--- Validation flag --->
						<cfset XMLVALIDATION = true>
						<cftry>
							<cfset objRSS = xmlParse(cfhttp.filecontent)>
							<cfcatch type="any">
								<cfset XMLVALIDATION = false>
							</cfcatch>
						</cftry>
						<cfif XMLVALIDATION>
							<cfset MyXMLRoot = objRSS.XmlRoot>
							<cfset totalitems = arraylen(MyXMLRoot.channel.item)>
								<table width="100%" border="0" cellspacing="40" cellpadding="5" align="center">
									<tr>
								<cfloop index="itm" from="1" to="#totalitems#">
										<td width="240" valign="top" bgcolor="#EAEAEA" style="border: 1px solid #BEC6D1;">
									<cfset tmp_Item = MyXMLRoot.channel.item[itm]>
									<cfset description = tmp_item.description.xmltext>
									<cfset description = REReplaceNoCase(description,' has added a photo to the pool:',' ','ALL')>
									<cfset description = REReplaceNoCase(description,' posted a photo:',' ','ALL')>
									<cfset description = REReplaceNoCase(description,'<p><a href="http://www.flickr.com/people/','<p>From: <a href="http://www.flickr.com/people/','ALL')>
										<cfoutput>
											#description#
										</cfoutput>
										</td>
										<cfif itm EQ 2 OR itm EQ 4 or itm EQ 6 or itm EQ 8 or itm EQ 10>
										</tr><tr>
										</cfif>
								</cfloop>
									</tr>
								</table>
							<div align="center" class="specialhighlight" style="margin-top: -60px; margin-bottom: 30px;"><a href="<cfoutput>#listGetAt(flickrurllocs, feeds)#</cfoutput>">&raquo;&raquo; MORE <cfoutput>#listGetAt(flickrlocs, feeds)#</cfoutput> PHOTOS ON FLICKR</a></div>
						</cfif>
					</cfloop>
				</td>
				<td width="20%" valign="top">
					<div class="titlebar">&raquo;OUR SPONSORS</div>
<cfinclude template="../sponsors.cfm">								
				</td>
			</tr>
		</table>
	</tr>
</table>


</body>	
</html>
