<cfquery name="content" datasource="fimo">
Select entrynumber, title, date, entry, images
FROM tblContent
ORDER BY entrynumber DESC
</cfquery>
<?xml version="1.0"?>
<rdf:RDF 
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
xmlns:dc="http://purl.org/dc/elements/1.1/" 
xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" 
xmlns="http://purl.org/rss/1.0/">

<channel rdf:about="http://www.fimoculous.com/">
<title>fimoculous.com</title>
<link>http://www.fimoculous.com/</link>
<description>Feeding Upon Itself</description>
</channel>

<cfoutput query="content" maxrows=10>
<item rdf:about="http://www.fimoculous.com/">
<title>#title#</title>
<description>
<![CDATA[
#entry#
]]>
</description>
<link>http://www.fimoculous.com/calendar-search.cfm?month=#DateFormat(date,"m")#&amp;day=#DateFormat(date,"d")#&amp;year=#DateFormat(date,"yyyy")#</link>
<dc:creator>rex</dc:creator>
<dc:date>#DateFormat(date,"mm/dd/yy")#</dc:date>
</item>
</cfoutput>


</rdf:RDF>

