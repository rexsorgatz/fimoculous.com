<!---
<cftry>
	<cfhttp url="http://twitter.com/statuses/user_timeline/41713.rss" method="get" timeout="2">
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
	<cfset ln = #ArrayLen(MyXMLRoot.channel)#>
			<ul>
		<cfloop index="itm" from="1" to="2">
			<cfset tmp_Item = MyXMLRoot.channel.item[itm]>
			<cfset title = tmp_item.title.xmltext>
			<cfset link = tmp_item.link.xmltext>
			<cfset title = Replace(tmp_item.title.xmltext,"fimoculous: ","")>
			<cfset date = DateAdd("h", -5, tmp_item.pubDate.xmltext)>
				<cfoutput>
					<li> #TimeFormat(date,"h:mm tt")#: <a href="#link#" target="_blank">#title#</a></li>
				</cfoutput>
		</cfloop>
			</ul>

</cfif>
--->

<cfset phrases = ArrayNew(1)>
<cfset ArrayAppend(phrases, "The Grey Album is less great in retrospect")>
<cfset ArrayAppend(phrases, "You autocomplete me.")>
<cfset ArrayAppend(phrases, "Idea: a chain of popup stores. (I don't know what it even means, but it seems like everything is now either a chain or a popup store.)")>
<cfset ArrayAppend(phrases, "The side-benefit of dating Jewish girls in this silly city: my Words With Friends gameplay has become much better!")>
<cfset ArrayAppend(phrases, "I'm not passive aggressive. I'm aggressively passive.")>
<cfset ArrayAppend(phrases, "Trying really fucking hard to not be part of the problem.")>
<cfset ArrayAppend(phrases, "Screenplay idea: Man gets amnesia and reconstructs his life from blog comments he wrote. Short film -- he kills himself after 11 minutes.")>
<cfoutput>#phrases[RandRange(1, 7)]#</cfoutput>