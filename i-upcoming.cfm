<cftry>
	<cfhttp url="http://www.upcoming.org/services/rest/?api_key=93a0e8960a&method=user.getWatchlist&user_id=11&token=a63bda99b792c90296b4240b2c113cae31d48e36" method="get" timeout="2">
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
		<cfloop index="itm" from="1" to="2">
			<cfset tmp_Item = MyXMLRoot.event[itm]>
			<cfset titl = tmp_item.XmlAttributes.name>
			<cfset whre = tmp_item.XmlAttributes.venue_name>
			<cfset id = tmp_item.XmlAttributes.id>
			<cfset dte = #CreateODBCDateTime(tmp_item.XmlAttributes.start_date)#>
				<cfoutput>
					<li>#DateFormat(dte,"m/d")#: <a href="http://upcoming.org/event/#id#" target="_blank">#titl#</a> (#whre#)</li>
				</cfoutput>
		</cfloop>
			</ul>
</cfif>