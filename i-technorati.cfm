<cftry>
	<cfhttp url="http://api.technorati.com/search?key=b97066626e46b25f8aee6fb3794c8353&query=fimoculous" method="get" timeout="2">
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
	<cfset MyXMLRoot = objRSS.XmlRoot>
			<ul>
		<cfloop index="itm" from="1" to="6">
			<cfset tmp_Item = MyXMLRoot.document.item[itm]>
			<cfset wblog = tmp_item.weblog.name.xmltext>
			<cfset pstlnk = tmp_item.permalink.xmltext>
			<cfset pstttl = tmp_item.title.xmltext>
			<!---
			<cfset whre = tmp_item.XmlAttributes.venue_name>
			<cfset id = tmp_item.XmlAttributes.id>
			<cfset dte = #CreateODBCDateTime(tmp_item.XmlAttributes.start_date)#>
			--->
				<cfoutput>
					<li>#wblog#: <a href="#pstlnk#">#pstttl#</a></li>
				</cfoutput>
		</cfloop>
			</ul>
</cfif>