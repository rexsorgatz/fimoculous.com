<!---
Programmer: Tim McCarthy (tim@timmcc.com)
Date: February, 2003
Description:
	Implements HMAC, a mechanism for message authentication using hash functions
	as specified in RFC 2104 (http://www.ietf.org/rfc/rfc2104.txt).  HMAC requires
	a hash function H and a secret key K and is computed as follows:
		H(K XOR opad, H(K XOR ipad, data)), where
			ipad = the byte 0x36 repeated 64 times
			opad = the byte 0x5c repeated 64 times
			data = the data to be authenticated
Required parameters: data, key
Optional parameters:
	data_format: hex = data is in hexadecimal format (default is ASCII text)
	key_format: hex = key is in hexadecimal format (default is ASCII text)
	hash_function: md5, sha1, sha256, or ripemd160 (default is md5)
	output_bits: truncate output to leftmost bits indicated (default is all)
Nested custom tags: md5.cfm, ripemd_160.cfm, sha_1.cfm, sha_256.cfm
Example syntax: <cf_hmac data="what do ya want for nothing?" key="Jefe">
Output variable: caller.digest
Note:
	This version accepts input in both ASCII text and hexadecimal formats.
	Previous versions did not accept input in hexadecimal format.
--->


<!---


<cffunction name="hmac">
<!--- default values of optional parameters --->
<CFPARAM name="attributes.data_format" default="">
<CFPARAM name="attributes.key_format" default="">
<CFPARAM name="attributes.data" default="0PJWMQ2AAYM83R89XTR2">
<CFPARAM name="attributes.key" default="5U4WZxBNPQPSKSHnv7b808ew2SChmZ86KsRuThy8">
<CFPARAM name="attributes.hash_function" default="md5">
<CFPARAM name="attributes.output_bits" default="256">

<!--- convert data to ASCII binary-coded form --->
<CFIF attributes.data_format EQ "hex">
	<CFSET hex_data = attributes.data>
<CFELSE>
	<CFSET hex_data = "">
	<CFLOOP index="i" from="1" to="#Len(attributes.data)#">
		<CFSET hex_data = hex_data & Right("0"&FormatBaseN(Asc(Mid(attributes.data,i,1)),16),2)>
	</CFLOOP>
</CFIF>

<!--- convert key to ASCII binary-coded form --->
<CFIF attributes.key_format EQ "hex">
	<CFSET hex_key = attributes.key>
<CFELSE>
	<CFSET hex_key = "">
	<CFLOOP index="i" from="1" to="#Len(attributes.key)#">
		<CFSET hex_key = hex_key & Right("0"&FormatBaseN(Asc(Mid(attributes.key,i,1)),16),2)>
	</CFLOOP>
</CFIF>

<CFSET key_len = Len(hex_key)/2>

<!--- if key longer than 64 bytes, use hash of key as key --->
<CFIF key_len GT 64>
	<CFSWITCH expression="#attributes.hash_function#">
		<CFCASE value="md5">
			<cf_md5 msg="#hex_key#" format="hex">
		</CFCASE>
		<CFCASE value="sha1">
			<cf_sha_1 msg="#hex_key#" format="hex">
		</CFCASE>
		<CFCASE value="sha256">
			<cf_sha_256 msg="#hex_key#" format="hex">
		</CFCASE>
		<CFCASE value="ripemd160">
			<cf_ripemd_160 msg="#hex_key#" format="hex">
		</CFCASE>
	</CFSWITCH>
	<CFSET hex_key = msg_digest>
	<CFSET key_len = Len(hex_key)/2>
</CFIF>

<CFSET key_ipad = "">
<CFSET key_opad = "">
<CFLOOP index="i" from="1" to="#key_len#">
	<CFSET key_ipad = key_ipad & Right("0"&FormatBaseN(BitXor(InputBaseN(Mid(hex_key,2*i-1,2),16),InputBaseN("36",16)),16),2)>
	<CFSET key_opad = key_opad & Right("0"&FormatBaseN(BitXor(InputBaseN(Mid(hex_key,2*i-1,2),16),InputBaseN("5c",16)),16),2)>
</CFLOOP>
<CFSET key_ipad = key_ipad & RepeatString("36",64-key_len)>
<CFSET key_opad = key_opad & RepeatString("5c",64-key_len)>

<CFSWITCH expression="#attributes.hash_function#">
	<CFCASE value="md5">
		<cf_md5 msg="#key_ipad##hex_data#" format="hex">
		<cf_md5 msg="#key_opad##msg_digest#" format="hex">
	</CFCASE>
	<CFCASE value="sha1">
		<cf_sha_1 msg="#key_ipad##hex_data#" format="hex">
		<cf_sha_1 msg="#key_opad##msg_digest#" format="hex">
	</CFCASE>
	<CFCASE value="sha256">
		<cf_sha_256 msg="#key_ipad##hex_data#" format="hex">
		<cf_sha_256 msg="#key_opad##msg_digest#" format="hex">
	</CFCASE>
	<CFCASE value="ripemd160">
		<cf_ripemd_160 msg="#key_ipad##hex_data#" format="hex">
		<cf_ripemd_160 msg="#key_opad##msg_digest#" format="hex">
	</CFCASE>
</CFSWITCH>

<CFSET caller.digest = Left(msg_digest,attributes.output_bits/4)>
</cffunction>



<!---FLICKR--->
<cfset arrraynum = RandRange(1, 7)>
<cfset flickrphoto = ArrayNew(1)>
<cfset flickrphoto[1]="http://farm3.static.flickr.com/2020/1882669968_671ceccd50.jpg">
<cfset flickrphoto[2]="http://farm3.static.flickr.com/2576/3752884382_05505587de.jpg">
<cfset flickrphoto[3]="http://farm3.static.flickr.com/2444/3736264956_5576c984e9.jpg">
<cfset flickrphoto[4]="http://farm4.static.flickr.com/3598/3368450990_af618038b1.jpg">
<cfset flickrphoto[5]="http://farm4.static.flickr.com/3481/3220651401_f4642e27f6.jpg">
<cfset flickrphoto[6]="http://farm4.static.flickr.com/3330/3230955843_27be8b5156.jpg">
<cfset flickrphoto[7]="http://farm4.static.flickr.com/3444/3247702461_ab747036ae.jpg">
<cfset flickrurl = ArrayNew(1)>
<cfset flickrurl[1]="http://www.flickr.com/photos/fimoculous/1882669968/sizes/l/">
<cfset flickrurl[2]="http://www.flickr.com/photos/fimoculous/3752884382/">
<cfset flickrurl[3]="http://www.flickr.com/photos/fimoculous/3736264956/">
<cfset flickrurl[4]="http://www.flickr.com/photos/fimoculous/3368450990/">
<cfset flickrurl[5]="http://www.flickr.com/photos/fimoculous/3220651401/">
<cfset flickrurl[6]="http://www.flickr.com/photos/fimoculous/3230955843/">
<cfset flickrurl[7]="http://www.flickr.com/photos/fimoculous/3247702461/">


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

<cfsavecontent variable="theContentFlickr">

<div class="flickr-label"><a href="http://www.flickr.com/photos/fimoculous/"><img src="/images/flickr-photographs.png" width="14" height="163" alt=""></a></div>
<div class="thumbs">

<cftry>
	<cfhttp url="http://www.flickr.com/services/feeds/photos_public.gne?id=65699349@N00&format=rss_200" method="get" timeout="10">
	<cfcatch type="any">
		<cfoutput>Oops, broken.</cfoutput>
	</cfcatch>
</cftry>
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
	<a href="#lnk#" target="_blank"><img src="#tmp_Item#" title="#ttl#" class="webcam" border="0" alt="#ttl#" width="75" height="75" hspace="1" vspace="5" /></a></cfoutput>
		</cfloop>
</cfif>
		</div>
		<cfoutput><a href="#flickrurl[arrraynum]#"><img src="#flickrphoto[arrraynum]#" alt="" width="330" hspace="0" vspace="0" border="0" /></a></cfoutput>
		<div class="flickr-label"><a href="http://www.flickr.com/photos/fimoculous/favorites/"><img src="/images/flickr-faves.png" width="14" height="71" alt=""></a></div>
		<div class="thumbs">

<cftry>
	<cfhttp url="http://www.flickr.com/services/rest/?method=flickr.favorites.getList&api_key=93fdd5dbfb791cd5d6a6966e3e7b3e14&auth_token=902059-0a1ddbb3e9e181c1&api_sig=#Hash('f2b850154661fbc1api_key93fdd5dbfb791cd5d6a6966e3e7b3e14auth_token902059-0a1ddbb3e9e181c1methodflickr.favorites.getList')#" method="get" timeout="10">
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
	<a href="http://www.flickr.com/photos/#owner#/#photoid#/" target="_blank"><img src="http://static.flickr.com/#srvr#/#photoid#_#secret#_s.jpg" title="#ttl#" border="0" alt="#ttl#" width="75" height="75" hspace="1" vspace="5" /></a></cfoutput>
		</cfloop>
</cfif>
</div>

</cfsavecontent>
<cffile action="write" file="c:\websites\fimoculous\flickr.xml" output="#theContentFlickr#">


<!---FOURSQURE--->


<cftry>
	<cfhttp url="http://feeds.playfoursquare.com/history/ec080e8f9d07840c8db4e1628c78ebdc.rss" method="get" timeout="10">
	<cfset XMLVALIDATION = true>
	<cfcatch type="any">
		<cfoutput><p><em>Oops, foursquare is broken.</em></p></cfoutput>
		<cfset XMLVALIDATION = false>
	</cfcatch>
</cftry>
<cftry>
	<cfset objRSS = xmlParse(cfhttp.filecontent)>
	<cfcatch type="any">
		<cfset XMLVALIDATION = false>
		<cfoutput><p><em>Oops, foursquare is broken.</em></p></cfoutput>
	</cfcatch>
</cftry>
<cfif XMLVALIDATION>
	<cfset MyXMLRoot = objRSS.XmlRoot>
	<!--- <cfoutput>#MyXMLRoot#</cfoutput> --->
<cfsavecontent variable="theFoursquareContent">
	<cfoutput>
	<cfset ln = #ArrayLen(MyXMLRoot.channel)#>
		<cfloop index="itm" from="1" to="1">
			<cfset tmp_Item = MyXMLRoot.channel.item[itm]>
			<cfset title = tmp_item.title.xmltext>
			<cfset link = tmp_item.link.xmltext>
			<cfset title = Replace(tmp_item.title.xmltext,"fimoculous: ","")>
			<cfset date = DateAdd("h", -5, tmp_item.pubDate.xmltext)>
			<cfset date = CREATEODBCDATETIME(date)>
				<cfoutput>
					<a href="#link#">#title#</a> (#lcase(TimeFormat(date, "h:mm tt"))#, #lcase(DateFormat(date,"dddd"))#)
				</cfoutput>
		</cfloop>
	</cfoutput>
</cfsavecontent>
</cfif>
<cffile action="write" file="c:\websites\fimoculous\foursquare.xml" output="#theFoursquareContent#">


<!---AMAZON--->

<!---
<cftry>
	<cfhttp url="http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyId=0PJWMQ2AAYM83R89XTR2&Operation=ListLookup&ListType=WishList&ListId=3KKN9EH42V9T4&ResponseGroup=Small&Signature=<cffunction>hmac()</cffunction>" method="get" timeout="10">
	<cfcatch type="any">
		<cfoutput>Oops, broken.</cfoutput>
	</cfcatch>
</cftry>
<cfset XMLVALIDATION = true>
<cftry>
	<cfset objRSS = xmlParse(cfhttp.filecontent)>
	<cfcatch type="any">
		<cfset XMLVALIDATION = false>
	</cfcatch>
</cftry>
<cfif XMLVALIDATION>
<cfsavecontent variable="theAmazonContent">
	<cfset MyXMLRoot = objRSS.XmlRoot.Lists.List>
		<cfloop index="itm" from="1" to="6">
			<cfset grp = MyXMLRoot.ListItem[itm].Item.ItemAttributes.ProductGroup.xmltext>
			<cfset asn = MyXMLRoot.ListItem[itm].Item.ASIN.xmltext>
			<cfset nme = MyXMLRoot.ListItem[itm].Item.ItemAttributes.Title.xmltext>
			<cfset nme = REReplaceNoCase(nme, ' \([^>]*\)','','ALL')>
			<cfif grp IS "Music">
				<cftry>
					<cfset artist = ', '&MyXMLRoot.ListItem[itm].Item.ItemAttributes.Artist.xmltext>
					<cfcatch>
						<cftry>
							<cfset artist = ', '&MyXMLRoot.ListItem[itm].Item.ItemAttributes.Creator.xmltext>
							<cfcatch>
								<cfset artist = ', '&MyXMLRoot.ListItem[itm].Item.ItemAttributes.Author.xmltext>
							</cfcatch>
						</cftry>
					</cfcatch>
				</cftry>
			<cfelseif grp IS "Book">
				<cftry>
					<cfset artist = ', '&MyXMLRoot.ListItem[itm].Item.ItemAttributes.Author.xmltext>
					<cfcatch>
						<cfset artist = ', '&MyXMLRoot.ListItem[itm].Item.ItemAttributes.Creator.xmltext>
					</cfcatch>
				</cftry>
				<cfelse>
			<cfset artist = ''>
			</cfif>
				<cfoutput>
<a href="http://www.amazon.com/exec/obidos/ASIN/#asn#/ref=nosim/fimoculouscom-20/" target="_blank"><img src="http://images.amazon.com/images/P/#asn#.01._SCTHUMBZZZ_.jpg" title="#nme#, #artist#" alt="#nme#, #artist#" height="57" hspace="0" vspace="0" border="0"></a>
				</cfoutput>
		</cfloop>
</cfsavecontent>
</cfif>

<cffile action="write" file="c:\websites\fimoculous\amazon.xml" output="#theAmazonContent#">

--->

<!---TWITTER--->


<cftry>
	<cfhttp url="http://twitter.com/statuses/user_timeline/41713.rss" method="get" timeout="10">
	<cfset XMLVALIDATION = true>
	<cfcatch type="any">
		<cfoutput><p><em>Oops, Twitter is broken.</em></p></cfoutput>
		<cfset XMLVALIDATION = false>
	</cfcatch>
</cftry>
<cftry>
	<cfset objRSS = xmlParse(cfhttp.filecontent)>
	<cfcatch type="any">
		<cfset XMLVALIDATION = false>
		<cfoutput><p><em>Oops, Twitter is broken.</em></p></cfoutput>
	</cfcatch>
</cftry>
<cfif XMLVALIDATION>
	<cfset MyXMLRoot = objRSS.XmlRoot>
	<!--- <cfoutput>#MyXMLRoot#</cfoutput> --->
<cfsavecontent variable="theContent">
	<cfoutput>
	<cfset ln = #ArrayLen(MyXMLRoot.channel)#>
		<cfloop index="itm" from="1" to="1">
			<cfset tmp_Item = MyXMLRoot.channel.item[itm]>
			<cfset title = tmp_item.title.xmltext>
			<cfset link = tmp_item.link.xmltext>
			<cfset title = Replace(tmp_item.title.xmltext,"fimoculous: ","")>
			<cfset date = DateAdd("h", -5, tmp_item.pubDate.xmltext)>
				<cfoutput>
					#title#
				</cfoutput>
		</cfloop>
	</cfoutput>
</cfsavecontent>
</cfif>
<cffile action="write" file="c:\websites\fimoculous\twitter.xml" output="#theContent#">

--->
