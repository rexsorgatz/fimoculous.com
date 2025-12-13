
<cftry>
	<cfhttp url="http://millershales.tumblr.com/rss" method="get" timeout="3">
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
	<cfset postTitle = objRSS.XmlRoot.channel.Item.title.xmltext>
	<cfset postLink = objRSS.XmlRoot.channel.Item.guid.xmltext>
	<cfset postContent = objRSS.XmlRoot.channel.Item.description.xmltext>
	<cfset postDate = #CreateODBCDateTime(objRSS.XmlRoot.channel.Item.pubDate.xmltext)#>
<cfoutput>


<h1><a href="#postLink#">#postTitle#</a></h1>
<p class="datestamp">#DateFormat(postDate, "dddd, mmmm d")#</p>
<p>#Mid(postContent, 1, 600)#...</p></strong>
<p align="right"><a href="#postLink#">Continued inside...</a></p>
</cfoutput>

</cfif>

