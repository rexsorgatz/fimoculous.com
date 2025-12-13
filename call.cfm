<cfhttp url="http://www.tvinsider.com/show/supergirl/feed/"></cfhttp>
<cfset xml = XmlParse(cfhttp.FileContent)>
<cfset xml = xml["rss"]["channel"]["XmlChildren"]>
<cfset news = ArrayNew(1)>
<cfset newsItem = StructNew()>
<cfloop array="#xml#" index="item">
	<cfif item.XmlName eq "item">
		<cfset newsItem.link = item["link"].XmlText>
		<cfset newsItem.title = item["title"].XmlText>
		<cfoutput><a href="#newsItem.link#">#newsItem.link#</a><br/></cfoutput>
	</cfif>
</cfloop>

