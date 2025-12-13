<cftry>
	<cfhttp url="http://ws.audioscrobbler.com/1.0/user/rexsorgatz/recenttracks.xml" method="get" timeout="2">
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
		<cfoutput><p><em>Oops, this feed broke. Should be back online soon.</em></p></cfoutput>
	</cfcatch>
</cftry>
<cfif XMLVALIDATION>
	<cfset MyXMLRoot = objRSS.XmlRoot>
	<cfset ln = #ArrayLen(MyXMLRoot.track)#>
	<cfif ln GT 6><cfset ln = 6></cfif>
			<ul>
		<cfloop index="itm" from="1" to="#ln#">
			<cfset tmp_Item = MyXMLRoot.track[itm]>
			<cfset rtst = tmp_item.artist.xmltext>
			<cfset sng = tmp_item.name.xmltext>
			<cfset rl = tmp_item.url.xmltext>
				<cfoutput>
					<li> <a href="http://www.amazon.com/exec/obidos/redirect?link_code=ur2&tag=fimoculouscom-20&camp=1634&creative=6738&path=external-search%3Fsearch-type=ss%26index=music%26keyword=#rtst#" target="_blank">#rtst#</a>: "#sng#"</li>
				</cfoutput>
		</cfloop>
			</ul>
</cfif>
