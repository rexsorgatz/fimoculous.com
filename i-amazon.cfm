<cftry>
	<cfhttp url="http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyId=0PJWMQ2AAYM83R89XTR2&Operation=ListLookup&ListType=WishList&ListId=3KKN9EH42V9T4&ResponseGroup=Small" method="get" timeout="3">
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
	<cfset MyXMLRoot = objRSS.XmlRoot.Lists.List>
			<ul>
		<cfloop index="itm" from="1" to="5">
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
					<li>#grp#: <a href="http://www.amazon.com/exec/obidos/ASIN/#asn#/ref=nosim/fimoculouscom-20/" target="_blank"><em>#nme#</em>#artist#</a></li>
				</cfoutput>
		</cfloop>
			</ul>
</cfif>

