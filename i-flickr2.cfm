<div class="flickr-label"><a href="http://www.flickr.com/photos/fimoculous/"><img src="/images/flickr-photographs.png" width="14" height="163" alt=""></a></div>
<div class="thumbs">
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
		<cfloop index="itm" from="1" to="4">
			<cfset ttl = MyXMLRoot.item[itm].title.xmltext>
			<cfset lnk = MyXMLRoot.item[itm].link.xmltext>
			<cfset aut = MyXMLRoot.item[itm].author.xmltext>
			<cfset desc = MyXMLRoot.item[itm].description.xmltext>
			<cfset tmp_Item = MyXMLRoot.item[itm].description.xmltext>
			<cfset tmp_Item = HTMLToText(ToString(tmp_Item))>
				<cfoutput>
					<a href="#lnk#" target="_blank"><img src="#tmp_Item#" title="#ttl#" class="webcam" border="1" alt="#ttl#" width="75" height="75" hspace="1" vspace="5" /></a>
				</cfoutput>
		</cfloop>
</cfif>
		</div>
		<a href="http://www.flickr.com/photos/fimoculous/3752884382/"><img src="http://farm3.static.flickr.com/2576/3752884382_05505587de.jpg" alt="" width="330" hspace="0" vspace="0" border="0" /></a>
		<div class="flickr-label"><a href="http://www.flickr.com/photos/fimoculous/favorites/"><img src="/images/flickr-faves.png" width="14" height="71" alt=""></a></div>
		<div class="thumbs">

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
		<cfloop index="itm" from="1" to="4">
			<cfset photoid = MyXMLRoot.photo[itm].XmlAttributes.id>
			<cfset secret = MyXMLRoot.photo[itm].XmlAttributes.secret>
			<cfset srvr = MyXMLRoot.photo[itm].XmlAttributes.server>
			<cfset owner = MyXMLRoot.photo[itm].XmlAttributes.owner>
			<cfset ttl = MyXMLRoot.photo[itm].XmlAttributes.title>
				<cfoutput>
					<a href="http://www.flickr.com/photos/#owner#/#photoid#/" target="_blank"><img src="http://static.flickr.com/#srvr#/#photoid#_#secret#_s.jpg" title="#ttl#" class="webcam" border="1" alt="#ttl#" width="75" height="75" hspace="1" vspace="5" /></a>
				</cfoutput>
		</cfloop>
</cfif>
</div>

