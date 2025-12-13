<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:-10px; height:330px;">
	<tr>
		<td colspan="10"><div class="descriptor"><strong>From My Photostream</strong> <span class="comment" style="align:right;"><a href="http://www.flickr.com/photos/fimoculous/" target="_blank">&raquo;MORE</a></span></div></td>
	</tr>
	<tr>
<cfscript>
function HTMLToText(HTMLText) {
	var text = REReplaceNoCase(HTMLText,'farm1.','','ALL');
	var texttemp = REReplaceNoCase(text,'farm2.','','ALL');
	var s =	find("static",texttemp)-8;
	var e =	find(".jpg",texttemp);
	texttemp = mid(texttemp,s,58);
	texttemp = REReplaceNoCase(texttemp,'_m','_s','ALL');
	texttemp = REReplaceNoCase(texttemp,'"','','ALL');
	texttemp = REReplaceNoCase(texttemp,'cos','com','ALL');
	return texttemp;
}
function HTMLToText2(HTMLText) {
	var text = REReplaceNoCase(HTMLText,'farm1.','','ALL');
	var texttemp = REReplaceNoCase(text,'farm2.','','ALL');
	var s =	find("static",texttemp)-13;
	var e =	find(".jpg",texttemp);
	texttemp = mid(texttemp,s,65);
	texttemp = REReplaceNoCase(texttemp,'_m','_s','ALL');
	texttemp = REReplaceNoCase(texttemp,'"','','ALL');
	texttemp = REReplaceNoCase(texttemp,'cos','com','ALL');
	return texttemp;
}
</cfscript>		

<cftry>
	<cfhttp url="http://www.flickr.com/services/feeds/photos_public.gne?id=65699349@N00&format=rss_200" method="get" timeout="4">
	<cfcatch type="any">
		<cfoutput>Oops, broken.</cfoutput>
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
	<cfset MyXMLRoot = objRSS.XmlRoot.channel>
		<cfloop index="itm" from="1" to="10">
			<cfset ttl = MyXMLRoot.item[itm].title.xmltext>
			<cfset lnk = MyXMLRoot.item[itm].link.xmltext>
			<cfset aut = MyXMLRoot.item[itm].author.xmltext>
			<cfset desc = MyXMLRoot.item[itm].description.xmltext>
			<cfset tmp_Item = MyXMLRoot.item[itm].description.xmltext>
			<cfset tmp_Item = HTMLToText(ToString(tmp_Item))>
				<cfoutput>
					<td align="center"><a href="#lnk#" target="_blank"><img src="#tmp_Item#" title="header=[#ttl#] body=[(photo from: fimoculous)]" class="webcam" border="1" alt="#ttl#" width="75" height="75" hspace="1" vspace="5" /></a></td>
				</cfoutput>
		</cfloop>
</cfif>
	</tr>
	<tr>
		<td colspan="10"><div class="descriptor"><strong>From My Favorites Photostream</strong> <span class="comment"><a href="http://www.flickr.com/photos/fimoculous/favorites/" target="_blank">&raquo;MORE</a></span></div></td>
	</tr>
	<tr>
<cftry>
	<cfhttp url="http://www.flickr.com/services/rest/?method=flickr.favorites.getList&api_key=93fdd5dbfb791cd5d6a6966e3e7b3e14&auth_token=902059-0a1ddbb3e9e181c1&api_sig=#Hash('f2b850154661fbc1api_key93fdd5dbfb791cd5d6a6966e3e7b3e14auth_token902059-0a1ddbb3e9e181c1methodflickr.favorites.getList')#" method="get" timeout="4">
	<cfcatch type="any">
		<cfoutput>Oops, broken.</cfoutput>
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
	<cfset MyXMLRoot = objRSS.XmlRoot.photos>
		<cfloop index="itm" from="1" to="10">
			<cfset photoid = MyXMLRoot.photo[itm].XmlAttributes.id>
			<cfset secret = MyXMLRoot.photo[itm].XmlAttributes.secret>
			<cfset srvr = MyXMLRoot.photo[itm].XmlAttributes.server>
			<cfset owner = MyXMLRoot.photo[itm].XmlAttributes.owner>
			<cfset ttl = MyXMLRoot.photo[itm].XmlAttributes.title>
				<cfoutput>
					<td align="center"><a href="http://www.flickr.com/photos/#owner#/#photoid#/" target="_blank"><img src="http://static.flickr.com/#srvr#/#photoid#_#secret#_s.jpg" title="header=[#ttl#] body=[]" class="webcam" border="1" alt="#ttl#" width="75" height="75" hspace="1" vspace="5" /></a></td>
				</cfoutput>
		</cfloop>
</cfif>
	</tr>
	<tr>
		<td colspan="10"><div class="descriptor"><strong>From My Friends Photostream</strong> <span class="comment"><a href="http://www.flickr.com/photos/fimoculous/friends/" target="_blank">&raquo;MORE</a></span></div></td>
	</tr>
	<tr>
<cftry>
	<cfhttp url="http://flickr.com/services/feeds/photos_friends.gne?user_id=65699349@N00&friends=0&display_all=1&format=rss_200" method="get" timeout="4">
	<cfcatch type="any">
		<cfoutput>Oops, broken.</cfoutput>
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
	<cfset MyXMLRoot = objRSS.XmlRoot.channel>
		<cfloop index="itm" from="1" to="10">
			<cfset ttl = MyXMLRoot.item[itm].title.xmltext>
			<cfset lnk = MyXMLRoot.item[itm].link.xmltext>
			<cfset aut = MyXMLRoot.item[itm].author.xmltext>
			<cfset tmp_Item = MyXMLRoot.item[itm].description.xmltext>
			<cfset tmp_Item = HTMLToText2(ToString(tmp_Item))>
				<cfoutput>
					<td align="center"><a href="#lnk#" target="_blank"><img src="#tmp_Item#" title="header=[#ttl#] body=[#REReplaceNoCase(aut,'nobody@flickr.com \(','(photo from: ','ALL')#]" class="webcam" border="1" alt="#ttl#" width="75" height="75" hspace="1" vspace="5" /></a></td>
				</cfoutput>
		</cfloop>
</cfif>
	</tr>
</table>
