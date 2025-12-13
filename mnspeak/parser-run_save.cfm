
<cfsetting RequestTimeout=15000> 
<cfscript>
function HTMLToText(HTMLText) {
	var lineFeed=Chr(13)&Chr(10);
	var maxline=70;	
	var text=HTMLText;	
	if(ArrayLen(arguments) eq 2) {
			maxline = arguments[2];	
		}
		// replace special characters
		text = REReplaceNoCase(text,'—','&mdash;','ALL');
		text = REReplaceNoCase(text,'é','&eacute;','ALL');
		text = REReplaceNoCase(text,'’','&rsquo;','ALL');
		text = REReplaceNoCase(text,'“','&quot;','ALL');
		text = REReplaceNoCase(text,'�','&quot;','ALL');
		text = REReplaceNoCase(text,'&lt;','<','ALL');
		text = REReplaceNoCase(text,'&gt;','>','ALL');
		// Replace images
		text = REReplaceNoCase(text, '<img[^>]*>',lineFeed,'ALL');	
		// replace hN tags
		text = REReplaceNoCase(text,'<h[^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'</h[^>]*>',lineFeed,'ALL');
		// replace pre tags
		text = REReplaceNoCase(text,'<pre [^>]*>',lineFeed,'ALL');
		// replace span tags
		text = REReplaceNoCase(text,'<span [^>]*>',lineFeed,'ALL');
		// replace object tags
		text = REReplaceNoCase(text,'<object [^>]*>',lineFeed,'ALL');
		// replace param tags
		text = REReplaceNoCase(text,'<param [^>]*>',lineFeed,'ALL');
		// replace embed tags
		text = REReplaceNoCase(text,'<embed [^>]*>',lineFeed,'ALL');
		// replace meta tags
		text = REReplaceNoCase(text,'<meta [^>]*>',lineFeed,'ALL');
		// replace strong tags
		text = REReplaceNoCase(text,'<strong[^>]*>',lineFeed,'ALL');
		// replace div tags
		text = REReplaceNoCase(text,'<div [^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'</div [^>]*>',lineFeed,'ALL');
		// replace p style
		text = REReplaceNoCase(text,'<p [^>]*>',lineFeed,'ALL');
		// replace col style
		text = REReplaceNoCase(text,'<col [^>]*>',lineFeed,'ALL');
		// replace iframes style
		text = REReplaceNoCase(text,'<iframe [^>]*iframe>',lineFeed,'ALL');
		// replace others style
		text = REReplaceNoCase(text,'<blockquote[^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'<font[^>]*>',lineFeed,'ALL');
		// replace form shit
		text = REReplaceNoCase(text,'<form [^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'<input [^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'<select [^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'<option [^>]*>',lineFeed,'ALL');
		// replace table stuff style
		text = REReplaceNoCase(text,'<table[^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'<tr[^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'<td[^>]*>',lineFeed,'ALL');
		text = REReplaceNoCase(text,'<th[^>]*>',lineFeed,'ALL');
		// replace <b>
		text = REReplaceNoCase(text,'<b[^>]*>',lineFeed,'ALL');
		// replace <br>
		text = REReplaceNoCase(text,'<br[ /]*>',lineFeed,'ALL');
		// Replace <hr>
		text = REReplaceNoCase(text,'<hr[ /]*>',lineFeed,'ALL');
		// Replace various tags
		text = ReplaceList(text, '</option>,<em/>,<sup>,<center>,<center>,</center>,<CENTER>,</CENTER>,</br>,<object>,<param>,<embed>,</object>,<tbody>,</tbody>,</font>,<tt>,</td>,</tr>,</table>,<cite>,</cite>,</span>,</div>,<b>,</b>,<B>,</B>,<u>,</u>,<strong>,</strong>,<ol>,</ol>,<ul>,</ul>,<li>,</li>,<p>,</p>,<P>,</P>,<pre>,</pre>,<blockquote>,</blockquote>,<dl>,<dt>,</dt>,<dd>', ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,,#lineFeed#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#,#RepeatString(lineFeed,2)#');
		// Fix final broken thing
		text = REReplaceNoCase(text,'</>',lineFeed,'ALL');
		return text;
	}
function HTMLToText2(HTMLText) {
	var maxline=70;	
	var text=HTMLText;	
	if(ArrayLen(arguments) eq 2) {
			maxline = arguments[2];	
		}
		text = REReplaceNoCase(text, '[\t\n\r\f]*', '', 'ALL');
		text = ReReplace(text, '<[^>]*>', '', 'ALL');
		return text;
	}
</cfscript> 
<cfquery name="myBlogs" datasource="mspot" dbtype="ODBC">
	SELECT id, blogName, blogLoc, feedLoc, feedType, lastEdited, blogContent, blogThumb, blogCategory, blogOnline
	FROM tblBlogs
	WHERE blogOnline = 'yes'
	<cfif isDefined("URL.term")>
	<cfif URL.term EQ 2>
			AND id >= 80
			AND id < 160
		<cfelseif URL.term EQ 3>
			AND id >= 160
			AND id < 240
		<cfelseif URL.term EQ 4>
			AND id >= 240
			AND id < 320
		<cfelseif URL.term EQ 5>
			AND id >= 320
			AND id < 400
		<cfelseif URL.term EQ 6>
			AND id >= 400
			AND id < 480
	</cfif>
	<cfelse>
		AND id < 80
	</cfif>
	ORDER BY blogName ASC
</cfquery>

<cfset feedNum = 1>

<cfset maxheadlines = 2>
<cfset maxdesclength = 1000>

<cfset myFeedType = ValueList(myBlogs.feedType)>
<cfset myFeedLoc = ValueList(myBlogs.feedLoc)>
<cfset myBlogLoc = ValueList(myBlogs.blogLoc)>
<cfset myBlogName = ValueList(myBlogs.blogName)>
<cfset myBlogId = ValueList(myBlogs.id)>
<cfset myBlogThumb = ValueList(myBlogs.blogThumb)>
<cfset myBlogCategory = ValueList(myBlogs.blogCategory)>

<cfsavecontent variable="theContent">

<cffile action="write" file="c:\websites\fimoculous\mnspeak\parser-output-test.cfm" output="">

<div class="blogcopy">
<cfloop index="blah" from="1" to="#ListLen(myFeedLoc)#">
	<cftry>
		<cfhttp url="#trim(listGetAt(myFeedLoc, feedNum))#" method="get" timeout="10">
		<cfcatch type="any">
			<cfoutput><h1>#blah#</h1></cfoutput>
		</cfcatch>
	</cftry>
	<!--- Validation flag --->
	<cfset XMLVALIDATION = true>

	<cfif #trim(listGetAt(myFeedType, feedNum))# IS "atom3" OR #trim(listGetAt(myFeedType, feedNum))# IS "atom4">
		<cfset temp_objRSS = cfhttp.filecontent>
		<cfset temp_objRSS = #REReplaceNoCase(temp_objRSS,"<content[^>]*>","<content><![CDATA[","ALL")#>
		<cfset temp_objRSS = #REReplaceNoCase(temp_objRSS,"</content>","]]></content>","ALL")#>
		<cftry>
			<cfset objRSS = xmlParse(temp_objRSS)>
			<cfcatch type="any">
				<cfset XMLVALIDATION = false>
			</cfcatch>
		</cftry>
	<cfelse>
		<cftry>
			<cfset objRSS = xmlParse(cfhttp.filecontent)>
			<cfcatch type="any">
				<cfset XMLVALIDATION = false>
			</cfcatch>
		</cftry>
	</cfif>
	<cfif XMLVALIDATION>
	   <!--- Set the XML Root --->
	   <cfset XMLRoot = objRSS.XmlRoot>
	   <!--- Output the meta data in the browser --->
	   <cfoutput>
		<div class="blogcat#trim(listGetAt(myBlogCategory, feedNum))#">
		<div class="blogname"><a href="#trim(listGetAt(myBlogLoc, feedNum))#" target="_blank"><img src="http://www.mnspeak.com/mnspeak/images/blogs/#trim(listGetAt(myBlogThumb, feedNum))#" alt="" style="border: 1px solid black;" width="150" height="50" hspace="0" class="sponsor" vspace="0" border="0" align="top"></a>&raquo;<a href="#trim(listGetAt(myBlogLoc, feedNum))#" target="_blank">#trim(listGetAt(myBlogName, feedNum))#</a></div>
	   </cfoutput>
	   <!--- Set the maximum number of links and text length to show --->
	   <cfset itm = 1>
	   <!--- Retrieve the number of items in the channel --->
	   <cftry>
			<cfif #trim(listGetAt(myFeedType, feedNum))# IS "rss">
				<cfset feedtype = "rss">
				<cfset totalitems = arraylen(XMLRoot.channel.item)>
			<cfelseif #trim(listGetAt(myFeedType, feedNum))# IS "atom" OR #trim(listGetAt(myFeedType, feedNum))# IS "atom3">
				<cfset feedtype = "atom">
				<cfset totalitems = arraylen(XMLRoot.entry)>
			<cfelseif #trim(listGetAt(myFeedType, feedNum))# IS "atom2" or #trim(listGetAt(myFeedType, feedNum))# IS "atom4">
				<cfset feedtype = "atom2">
				<cfset totalitems = arraylen(XMLRoot.entry)>
			<cfelseif #trim(listGetAt(myFeedType, feedNum))# IS "atom5">
				<cfset feedtype = "atom5">
				<cfset totalitems = arraylen(XMLRoot.entry)>
			<cfelseif #trim(listGetAt(myFeedType, feedNum))# IS "rdfrss">
				<cfset feedtype = "rdfrss">
				<cfset totalitems = arraylen(XMLRoot.channel.item)>
			<cfelseif #trim(listGetAt(myFeedType, feedNum))# IS "rdfrss2">
				<cfset feedtype = "rdfrss2">
				<cfset totalitems = arraylen(XMLRoot.channel.item)>
			<cfelse>
				<cfset feedtype = "rdf">
				<cfset totalitems = arraylen(XMLRoot.item)>
			</cfif>
			<cfcatch>
				<cfoutput><!--Broke: #blah#--></cfoutput>
			</cfcatch>
		</cftry>
	   <!--- Loop through all the items --->
	   <ul>
	   <cfloop condition = "itm LESS THAN OR EQUAL TO maxheadlines AND itm LESS THAN OR EQUAL TO totalitems">
	          <!--- Retrieve the current Item in the loop --->
			<cftry>
				<cfif feedtype IS "rss">
					<cfset tmp_Item = XMLRoot.channel.item[itm]>
				<cfelseif feedtype IS "rdfrss">
					<cfset tmp_Item = XMLRoot.channel.item[itm]>
				<cfelseif feedtype IS "rdfrss2">
					<cfset tmp_Item = XMLRoot.channel.item[itm]>
				<cfelseif feedtype IS "atom" OR feedtype IS "atom2" OR feedtype IS "atom5">
					<cfset tmp_Item = XMLRoot.entry[itm]>
				<cfelse>
					<cfset tmp_Item = XMLRoot.item[itm]>
				</cfif>
				<!--- Date --->
				<cfif feedtype IS "rss">
					<cfset item_date = #CreateODBCDateTime(tmp_item.pubDate.xmltext)#>
				<cfelseif feedtype IS "atom" OR feedtype IS "atom2">
					<cftry>
						<cfset item_m = #listGetAt(tmp_item.modified.xmltext, 2, "-")#>
						<cfset item_d = #RemoveChars(tmp_item.modified.xmltext, 11, 10)#>
						<cfset item_d = #RemoveChars(item_d, 1, 8)#>
						<cfset item_y = #Left(tmp_item.modified.xmltext, 4)#>
						<cfset item_min = #RemoveChars(tmp_item.modified.xmltext, 1, 14)#>
						<cfset item_min = #Left(item_min, 2)#>
						<cfset item_hr = #RemoveChars(tmp_item.modified.xmltext, 1, 11)#>
						<cfset item_hr = #Left(item_hr, 2)#>
						<cfset item_sec = #RemoveChars(tmp_item.modified.xmltext, 1, 17)#>
						<cfset item_sec = #Left(item_sec, 2)#>
						<cfset item_date = CreateDateTime(item_y, item_m, item_d, item_hr, item_min, item_sec)>
					<cfcatch>
						<cfset item_date = tmp_item.modified.xmltext>
					</cfcatch>
					</cftry>
				<cfelseif feedtype IS "atom5"><!---for stupid 'updated' rather than 'modified'--->
					<cftry>
						<cfset item_m = #listGetAt(tmp_item.updated.xmltext, 2, "-")#>
						<cfset item_d = #RemoveChars(tmp_item.updated.xmltext, 11, 10)#>
						<cfset item_d = #RemoveChars(item_d, 1, 8)#>
						<cfset item_y = #Left(tmp_item.updated.xmltext, 4)#>
						<cfset item_min = #RemoveChars(tmp_item.updated.xmltext, 1, 14)#>
						<cfset item_min = #Left(item_min, 2)#>
						<cfset item_hr = #RemoveChars(tmp_item.updated.xmltext, 1, 11)#>
						<cfset item_hr = #Left(item_hr, 2)#>
						<cfset item_sec = #RemoveChars(tmp_item.updated.xmltext, 1, 17)#>
						<cfset item_sec = #Left(item_sec, 2)#>
						<cfset item_date = CreateDateTime(item_y, item_m, item_d, item_hr, item_min, item_sec)>
						<cfset feedtype = "atom2">
					<cfcatch>
						<cfset item_date = tmp_item.updated.xmltext>
					</cfcatch>
					</cftry>
				<cfelse>
					<cfset item_z = XmlSearch(tmp_item, "dc:date")>
					<cfset item_z = HTMLToText2(ToString(item_z[1]))>
					<cfset item_m = #listGetAt(item_z, 2, "-")#>
					<cfset item_d = #RemoveChars(item_z, 11, 15)#>
					<cfset item_d = #RemoveChars(item_d, 1, 8)#>
					<cfset item_y = #Left(item_z, 4)#>
					<cfset item_min = #RemoveChars(item_z, 1, 14)#>
					<cfset item_min = #Left(item_min, 2)#>
					<cfset item_hr = #RemoveChars(item_z, 1, 11)#>
					<cfset item_hr = #Left(item_hr, 2)#>
					<cfset item_sec = #RemoveChars(item_z, 1, 17)#>
					<cfset item_sec = #Left(item_sec, 2)#>
					<cfset item_date = CreateDateTime(item_y, item_m, item_d, item_hr, item_min, item_sec)>
				</cfif>
				<!--- If it's recent, add it--->
				<cfif item_date GT DateAdd("d", -2, Now())>
					<!--- Retrieve the item data --->
					<cfset item_title = tmp_item.title.xmltext>
					<cfset item_title = HTMLToText(ToString(item_title))>
					<!---Link--->
					<cfif feedtype IS "atom">
						<cftry>
							<cfset item_link = tmp_item.link[2].XmlAttributes.href>
						<cfcatch>
							<cfset item_link = tmp_item.link.XmlAttributes.href>
						</cfcatch>
						</cftry>
					<cfelseif feedtype IS "atom2">
						<cfset item_link = tmp_item.link.XmlAttributes.href>
					<cfelse>
						<cfset item_link = tmp_item.link.xmltext>
					</cfif>
					<!---Description--->
					<cfif feedtype IS "atom">
						<cftry>
							<cfset item_description = tmp_item.content.div.xmltext>
						<cfcatch>
							<cftry>
								<cfset item_description = tmp_item.content.div.span.xmltext>
							<cfcatch>
								<cftry>
									<cfset item_description = tmp_item.content.div.p.xmltext>
								<cfcatch>
									<cftry>
										<cfset item_description = tmp_item.content.xmltext>
										<cfcatch>
											<cftry>
												<cfset item_description = tmp_item.summary.div.xmltext>
												<cfcatch>
													<cftry>
														<cfset item_description = tmp_item.content.div.xmltext>
														<cfcatch>
															<cfset item_description = tmp_item.summary.xmltext>
														</cfcatch>
													</cftry>
												</cfcatch>
											</cftry>
										</cfcatch>
									</cftry>
								</cfcatch>
								</cftry>
							</cfcatch>
							</cftry>
						</cfcatch>
						</cftry>
					<cfelseif feedtype IS "atom2">
						<cftry>
							<cfset item_description = tmp_item.content.div.p.xmltext>
						<cfcatch>
							<cftry>
								<cfset item_description = tmp_item.content.div.span.xmltext>
							<cfcatch>
								<cftry>
									<cfset item_description = tmp_item.content.div.xmltext>
								<cfcatch>
									<cftry>
										<cfset item_description = tmp_item.content.xmltext>
										<cfcatch>
											<cftry>
												<cfset item_description = tmp_item.summary.div.xmltext>
												<cfcatch>
													<cftry>
														<cfset item_description = tmp_item.content.div.xmltext>
														<cfcatch>
															<cfset item_description = tmp_item.summary.xmltext>
														</cfcatch>
													</cftry>
												</cfcatch>
											</cftry>
										</cfcatch>
									</cftry>
								</cfcatch>
								</cftry>
							</cfcatch>
							</cftry>
						</cfcatch>
						</cftry>
					<cfelseif feedtype IS "rdfrss2">
						<cfset item_description = XmlSearch(tmp_item, "content:encoded")>
					<cfelse>
						<cfset item_description = tmp_item.description.xmltext>
					</cfif>
					<cfset item_description = HTMLToText(ToString(item_description))>
					<!--- item length --->
					<cfif feedtype IS "atom" OR feedtype IS "atom2">
						<cfset item_description_length = len(tmp_item.xmltext)>
					<cfelse>
						<cfset item_description_length = len(tmp_item.description.xmltext)>
					</cfif>
			          <!--- Output the items in the browser --->
					<cfoutput>
						<cfset item_date = #DateAdd("h", -6, item_date)#>
						<p><strong><a href="#item_link#" target="_blank">#Ucase(item_title)# &raquo;&raquo;</a></strong> <span class="blogdateline">(#DateFormat(item_date,"m/d/yy")#, #TimeFormat(item_date,"h:mm tt")#)</span><br/>
						#Mid(item_description, 1, maxdesclength)#<cfif item_description_length GREATER THAN maxdesclength>...</cfif>><a href="#item_link#" target="_blank">&raquo;&raquo;</a></s></i></em></strike></strong></p>
					</cfoutput>
					<cfif itm EQ 1>
						<cfquery name="updateBlogContent" datasource="mspot">
							UPDATE tblBlogs
							SET content_one = '#item_description#', date_one = #item_date#, headline_one = '#item_title#', link_one = '#item_link#'
							WHERE id = #listGetAt(myBlogId, feedNum)#
						</cfquery>
					</cfif>
				</cfif>
		   		<cfset itm = itm + 1>
			<cfcatch>
		   		<cfset itm = itm + 1>
				<cfoutput><!--Empty: #blah#--></cfoutput>
			</cfcatch>
			</cftry>
	   </cfloop>
	   <cfset feedNum = feedNum + 1>
	   </ul>
	<cfelse>
	   <!--- If the validation flag is false display error --->
	   <cfset feedNum = feedNum + 1>
	   Invalid XML/RSS object!
	</cfif>
	<!---TEST FILE!
	--->
		<cfsavecontent variable="theSmallContent">
			<cfoutput>
				#trim(listGetAt(myBlogLoc, feedNum-1))#
			</cfoutput>
		</cfsavecontent>
		<cffile action="append" file="c:\websites\fimoculous\mnspeak\parser-output-test.cfm" output="#theSmallContent#">
	<hr size="1" noshade>
	</div>
</cfloop>
</div>
</cfsavecontent>

<cfoutput>
#theContent#
</cfoutput>
<cfset rightnow = #TimeFormat(DateAdd("h", -1, Now()), "h:mm tt")#>
<cffile action="write" file="c:\websites\fimoculous\mnspeak\aggregator\parser-lastparsed.cfm" output="#rightnow#">

<cfif isDefined("URL.term")>
	<cfif URL.term EQ 2>
		<cffile action="write" file="c:\websites\fimoculous\mnspeak\parser-output.cfm" output="#theContent#">
		<cflocation url="/mnspeak/parser-run.cfm?term=3" addToken="No">
	<cfelseif URL.term EQ 3>
		<cffile action="append" file="c:\websites\fimoculous\mnspeak\parser-output.cfm" output="#theContent#">
		<cflocation url="/mnspeak/parser-run.cfm?term=4" addToken="No">
	<cfelseif URL.term EQ 4>
		<cffile action="append" file="c:\websites\fimoculous\mnspeak\parser-output.cfm" output="#theContent#">
		<cflocation url="/mnspeak/parser-run.cfm?term=5" addToken="No">
	<cfelseif URL.term EQ 5>
		<cffile action="append" file="c:\websites\fimoculous\mnspeak\parser-output.cfm" output="#theContent#">
		<cflocation url="/mnspeak/parser-run.cfm?term=6" addToken="No">
	<cfelseif URL.term EQ 6>
	</cfif>
	<cfelse>
		<cflocation url="/mnspeak/parser-run.cfm?term=2" addToken="No">
</cfif>

	