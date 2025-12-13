<cfif IsDefined("url.month")>
	<cfif IsDefined("url.day")>
		<cfquery name="archivecontent" datasource="mspot">
			SELECT entrynumber, title, thisdate, longpost, entry, entrylong, author, commentnum, cats
			FROM tblContent
			WHERE thisdate = #createODBCDateTime(createDate(url.year,url.month,url.day))#
			AND accepted = 1
			ORDER BY entrynumber DESC 
		</cfquery>
	<cfelse>
		<cfif url.month EQ 12>
			<cfquery name="archivecontent" datasource="mspot">
				SELECT entrynumber, title, thisdate, longpost, entry, entrylong, author, commentnum, cats
				FROM tblContent
				WHERE thisdate >= #createODBCDateTime(createDate(url.year,12,1))# 
				AND thisdate < #createODBCDateTime(createDate(url.year+1,1,1))#
				AND accepted = 1
				ORDER BY entrynumber DESC 
			</cfquery>
		<cfelse>
			<cfquery name="archivecontent" datasource="mspot">
				SELECT entrynumber, title, thisdate, longpost, entry, entrylong, author, commentnum, cats
				FROM tblContent
				WHERE thisdate >= #createODBCDateTime(createDate(url.year,url.month,1))# 
				AND thisdate < #createODBCDateTime(createDate(url.year,url.month+1,1))#
				AND accepted = 1
				ORDER BY entrynumber DESC 
			</cfquery>
		</cfif>
	</cfif>
<cfelseif IsDefined("url.author")>
	<cfquery name="archivecontent" datasource="mspot">
		SELECT entrynumber, title, thisdate, longpost, entry, entrylong, author, commentnum, cats
		FROM tblContent
		WHERE author = '#url.author#'
		AND accepted = 1
		ORDER BY entrynumber DESC 
	</cfquery>
	<cfquery name="CheckUser" datasource="mspot" maxrows="50">
		SELECT UserID, displayName, userFullName, userEmail, userWebsite, userPic, userBio, userZip, userAIM
		FROM tblPasswords
		WHERE UserID = '#url.author#'
	</cfquery>
	<cfquery name="getComments" datasource="mspot" maxrows="50">
		SELECT tblContent.title, tblComments.comEntryID, tblComments.comName, tblComments.comURL, tblComments.comComment, tblComments.comDate, tblComments.regUser
		FROM tblComments, tblContent
		WHERE comName = '#url.author#'
		AND regUser = 1
		AND tblComments.comEntryID = tblContent.entrynumber
		ORDER BY  tblComments.comDate DESC 
	</cfquery>
	<cfquery name="getCalendarComments" datasource="mspot" maxrows="50">
		SELECT tblCalComments.comID, tblCalComments.comCalID, tblCalComments.comComment, mnCal.myDate
		FROM tblCalComments, mnCal
		WHERE comName = '#url.author#'
		AND tblCalComments.comCalID = mnCal.calEntry
	</cfquery>
	<cfquery name="getUserData" datasource="mspot">
		SELECT id, userid, blogsource
		FROM tblUserBlogs 
		WHERE UserID = '#url.author#'
	</cfquery>
	<cfset userSources = ValueList(getUserData.blogsource)>
<cfelseif IsDefined("url.pastweek")>
	<cfquery name="archivecontent" datasource="mspot">
		SELECT entrynumber, title, thisdate, longpost, entry, entrylong, author, commentnum, cats
		FROM tblContent
		WHERE thisdate >= #DateAdd("d", -7, Now())# 
		AND thisdate <= #Now()#
		AND accepted = 1
		ORDER BY entrynumber DESC 
	</cfquery>
<cfelseif IsDefined("url.pastmonth")>
	<cfquery name="archivecontent" datasource="mspot">
		SELECT entrynumber, title, thisdate, longpost, entry, entrylong, author, commentnum, cats
		FROM tblContent
		WHERE thisdate >= #DateAdd("m", -1, Now())# 
		AND thisdate <= #Now()#
		AND accepted = 1
		ORDER BY entrynumber DESC 
	</cfquery>
<cfelseif IsDefined("url.cat")>
	<cfquery name="archivecontent" datasource="mspot" maxrows="50">
		SELECT tblCategoriesContent.*, tblContent.*
		FROM tblContent, tblCategoriesContent
		WHERE tblContent.accepted = 1
		AND tblCategoriesContent.category = '#url.cat#'
		AND tblContent.entrynumber = tblCategoriesContent.coid
		ORDER BY entrynumber DESC 
	</cfquery>
	<cfquery name="catname" datasource="mspot">
		SELECT cat_short, cat_long
		FROM tblCategories
		WHERE cat_short = '#url.cat#'
	</cfquery>
<cfelse>
	<cfquery name="archivecontent" datasource="mspot" maxrows="1">
		SELECT entrynumber, title, thisdate, longpost, entry, entrylong, author, commentnum, cats
		FROM tblContent
		WHERE entrynumber = #post#

		AND accepted = 1
	</cfquery>
	<cfif session.loggedin is TRUE>
		<cfquery username="fimoculous" password="fmcr5473" name="userQuery" datasource="mspot">
			SELECT UserID, displayName, userEmail, userWebsite
			FROM tblPasswords
			WHERE UserID = '#Session.UserID#'
		</cfquery>
	</cfif>
</cfif>

<cfif IsDefined("url.author") AND IsDefined("url.format")>
	
	<rss version="2.0">
		<channel>
			<title>MNspeak.com - <cfoutput>#url.author#</cfoutput> feed</title>
			<description>Twin Cities Culture, Media, Politics, Events and Fun</description>
			<link>http://www.mnspeak.com/</link>
			<language>en-us</language> 
			<ttl>60</ttl>
			<cfoutput query="archivecontent" maxrows="5">
			<item>
				<title>#title#</title>
				<link>http://www.mnspeak.com/mnspeak/archive/post-#entrynumber#.cfm</link>
				<description><![CDATA[#entry#]]></description>
			</item>
			</cfoutput>
		</channel>
	</rss>
<cfelse>

<cfheader statuscode="301" statustext="Moved permanently">
<cfif CGI.QUERY_STRING IS NOT "" >
		<cfheader name="Location" value="http://www.mnspeak.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
<cfelse>
		<cfheader name="Location" value="http://www.mnspeak.com#CGI.SCRIPT_NAME#">
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com<cfif IsDefined("url.month")><cfelseif IsDefined("url.author")> - <cfoutput>#CheckUser.userFullName#</cfoutput><cfelse> - <cfoutput>#archivecontent.title#</cfoutput></cfif></title>
	<link rel="stylesheet" type="text/css" href="http://www.mnspeak.com/mnspeak/styles_2.css">
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>


<!-- Google Ad Manager Tags -->
<script type="text/javascript" src="http://partner.googleadservices.com/gampad/google_service.js">
</script>
<script type="text/javascript">
  GS_googleAddAdSenseService("ca-pub-1747671153388161");
  GS_googleEnableAllServices();
</script>
<script type="text/javascript">
  GA_googleAddSlot("ca-pub-1747671153388161", "SOTC_Middle1_300x250");
  GA_googleAddSlot("ca-pub-1747671153388161", "SOTC_Right1_300x250");
  GA_googleAddSlot("ca-pub-1747671153388161", "SOTC_Right2_160x600");
</script>
<script type="text/javascript">
  GA_googleFetchAds();
</script>
<!-- END Google Ad Manager Tags -->
	
</head>

<body <cfif IsDefined("url.month") OR IsDefined("url.author") OR IsDefined("url.cat") OR IsDefined("url.pastweek") OR IsDefined("url.pastmonth")><cfelse>onLoad="showPreview();" </cfif>background="/mnspeak/images/structure/pattern.gif" bgcolor="#ffffff" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="850" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<td colspan="2">
		<cfinclude template="../header.cfm">	
	</td>
	</tr>
	<tr>
	<td>
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			<tr>
			<td width="150" valign="top" class="navcell" valign="top">	
				<cfinclude template="../navbar.cfm">
			</td>	
				
			<td width="700" class="bodycells" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
					<td width="365" class="topbodycells" valign="top">
						<div class="titlebar">&raquo;ARCHIVED TALK</div>
						<cfif IsDefined("url.month") AND IsDefined("url.day")><div class="title"><cfoutput>These are the posts from #DateFormat(archivecontent.thisdate,"mmmm d, yyyy")#</cfoutput>:</div><br />
						<cfelseif IsDefined("url.month")><div class="title"><cfoutput>These are the posts from #DateFormat(archivecontent.thisdate,"mmmm, yyyy")#</cfoutput>:</div><br />
						<cfelseif IsDefined("url.pastweek")><div class="title">These are the posts from the past seven days:</div><br />
						<cfelseif IsDefined("url.pastmonth")><div class="title">These are the posts from the past 30 days:</div><br />
						<cfelseif IsDefined("url.cat")><div class="title"><cfoutput>These are the #archivecontent.recordcount# posts from the category <u>#catname.cat_long#</u>:</cfoutput></div><br />
						<cfelseif IsDefined("url.author")>
						<table width="100%" border="0" cellspacing="0" cellpadding="8" align="left" bgcolor="#C9CED5" style="border: 1px solid #3A3A3A;"><tr>
						<cfif Len(CheckUser.userPic) GT 1><td valign="top" width="75"><img src="<cfoutput>#CheckUser.userPic#</cfoutput>" align="left" border="1" width="75" hspace="0" vspace="0" height="100" /></td><td valign="top"><cfelse><td></cfif>
						<cfoutput><strong>#CheckUser.userFullName#</strong>
						<cfif Len(CheckUser.userWebsite) GT 1><br />&nbsp;<strong>&raquo;Website:</strong> <a href="#CheckUser.userWebsite#" target="_blank">#CheckUser.userWebsite#</a></cfif>
						<cfif Len(CheckUser.userAIM) GT 1><br />&nbsp;<strong>&raquo;Aim:</strong> <a href="aim:goim?screenname=#CheckUser.userAIM#">#CheckUser.userAIM#</a></cfif>
						<cfif Len(CheckUser.userZip) GT 1><br />&nbsp;<strong>&raquo;Zip:</strong> #CheckUser.userZip#</cfif>
						<!---
						<cfif Len(userSources) GT 1><br />&nbsp;<strong>&raquo;Personal Aggregator Sources:</strong>
							<cfloop index="blah" from="1" to="#ListLen(userSources)#">
								<cfquery name="sourceQuery" datasource="mspot">
									SELECT id, blogName, blogLoc
									FROM tblBlogs
									WHERE id = #listGetAt(userSources, blah)#
								</cfquery>
								<cfoutput><a href="#sourceQuery.blogLoc#" target="_blank">#sourceQuery.blogName#</a>, </cfoutput>
							</cfloop>
						</cfif>
						--->
						<cfif Len(CheckUser.userBio) GT 1><br /><br />#CheckUser.userBio#</cfif><br/><br/>
						<cfoutput>
						<p>
						<strong>Total Posts</strong>: #archivecontent.recordcount#<br />
						</cfoutput>
						</p>
	
						</td></tr></table><br clear="all" /><br />
						</cfoutput>
						
						
						
						<cfif archivecontent.recordcount GT 0>
						<br clear="all" />
						<div class="title"><cfoutput>These are the <cfif archivecontent.recordcount GT 49>50<cfelse>#archivecontent.recordcount#</cfif> most recent posts from #url.author#</cfoutput>:</div><br /></p>
						</cfif>
						</cfif>
						
						<cfoutput query="archivecontent">
						<div class="dailytitle"><cfif IsDefined("url.month") OR IsDefined("url.author") OR IsDefined("url.pastweek") OR IsDefined("url.cat") OR IsDefined("url.pastmonth")><a href="/mnspeak/archive/post-#entrynumber#.cfm"></cfif>#title#<cfif IsDefined("url.month") OR IsDefined("url.author") OR IsDefined("url.cat") OR IsDefined("url.pastweek") OR IsDefined("url.pastmonth")></a></cfif></div>
						<cfif IsDefined("url.day")><cfelse><p><em>Posted #DateFormat(thisdate,"mmmm d, yyyy")#</em></p></cfif>
						<p>#entry#<cfif longpost IS "1"><cfif IsDefined("url.month") OR IsDefined("url.author") OR IsDefined("url.cat") OR IsDefined("url.pastweek") OR IsDefined("url.pastmonth")><cfelse></p><hr size="1" noshade><p>#entrylong#</cfif></cfif>
						<div class="author">&raquo; <cfif IsDefined("url.month") OR IsDefined("url.author") OR IsDefined("url.cat") OR IsDefined("url.pastweek") OR IsDefined("url.pastmonth")><a href="/mnspeak/archive/post-#entrynumber#.cfm"><strong>#commentnum# comment<cfif commentnum NEQ 1>s</cfif></strong></a> | </cfif><cfset catList = #cats#><cfif catList IS NOT " ">Categories: <cfloop index="i" from="1" to="#ListLen(catList)#"><a href="/mnspeak/archive/archivetemplate.cfm?cat=#trim(LCase(listGetAt(catList, i)))#">#trim(LCase(listGetAt(catList, i)))#</a> </cfloop> | </cfif>Author: <a href="/mnspeak/archive/archivetemplate.cfm?author=#LCase(author)#" rel="nofollow">#LCase(author)#</a></p></div>
						<hr size="1" noshade>
						</cfoutput>
						
						
		
						
	
	
					</td>
					<td width="10">&nbsp;
					
					</td>
					
					<td width="305" class="topbodycells" valign="top">
							<!-- AD SLOT SOTC_Middle1_300x250 -->
								<script type="text/javascript">
								  GA_googleFillSlot("SOTC_Middle1_300x250");
								</script>
							<!-- END AD SLOT SOTC_Middle1_300x250 -->
						<a class="AdLink" href="http://www.mnspeak.com/mnspeak/advertise.cfm">Advertise on MNspeak</a>
					</td>
				</tr>
			</table>
			
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="500" valign="top">
			
			<!--- DO NOT SHOW COMMENTS IN USER PROFILES
			
						<cfif IsDefined("url.author")>
						<cfif getComments.recordcount GT 0>
						<br />
						<div class="title"><cfoutput>These are the <cfif getComments.recordcount GT 49>50<cfelse>#getComments.recordcount#</cfif> most recent comments from #url.author#</cfoutput>:</div><br /></p>
						<cfoutput query="getComments" maxrows="50">
						<p>
						#comComment#<br />
						&raquo; <em>Created in the post <a href="/mnspeak/archive/post-#comEntryID#.cfm">#getComments.title#</a> on #DateFormat(comDate,"mmmm d, yyyy")#</em>
						<br />
						<hr size="1" noshade>
						</p>
						</cfoutput>
						</cfif>
						</cfif>
						
						<cfif IsDefined("url.author")>
						<cfif getCalendarComments.recordcount GT 0>
						<br />
						<div class="title"><cfoutput>These are the <cfif getCalendarComments.recordcount GT 49>50<cfelse>#getCalendarComments.recordcount#</cfif> most recent calendar comments from #url.author#</cfoutput>:</div><br /></p>
						<cfoutput query="getCalendarComments" maxrows="50">
						<p>
						#comComment#<br />
						&raquo; <em>Created in the <a href="http://www.mnspeak.com/mnspeak/calendar.cfm?calnum=#comCalID#">#DateFormat(mydate,"mmmm d, yyyy")# calendar</a></em>
						<br />
						<hr size="1" noshade>
						</p>
						</cfoutput>
						</cfif>
						</cfif>
			--->
						
			
						<cfif IsDefined("url.month") OR IsDefined("url.cat") OR IsDefined("url.author") OR IsDefined("url.pastweek") OR IsDefined("url.pastmonth")>
						<cfelse>
						<cfquery name="comments" datasource="mspot" dbtype="ODBC">
							SELECT comName, comURL, comComment, comID, comDate, comEntryID, regUser
							FROM tblComments
							WHERE comEntryID = #post#
							ORDER BY comID ASC
						</cfquery>
						<br />
						<cfif comments.recordcount GT 0>
						<a name="comments"></a>
						<br />
						<div class="title"><cfoutput>#comments.recordcount#</cfoutput> <cfif comments.recordcount EQ 1>Comment:<cfelse>Comments:</cfif></div><br /><br />
							<cfoutput query="comments">
							#comComment#<br />
							<div align="right"><em>&raquo;&raquo; Submitted by<cfif regUser EQ 1></em> <strong><a href="/mnspeak/archive/archivetemplate.cfm?author=#comName#" rel="nofollow" style="color: ##B22222; text-decoration:none;">&raquo;&raquo;&raquo;</a></strong><em></cfif> <cfif Len(comURL) GT 1><a href="<cfif Mid(comURL, 1, 7) IS NOT "http://">http://#comURL#<cfelse>#comURL#</cfif>" target="_blank"></cfif><cfif Len(comName) LT 1>Anonymous<cfelse>#comName#</cfif><cfif Len(comURL) GT 1></a></cfif> at #TimeFormat(DateAdd("h", -0, comDate), "h:mm tt")# on #DateFormat(DateAdd("h", -1, comDate), "mmmm d")#</em></div><br />
							<hr width="400" size="1" noshade><br />
							</cfoutput>
							<p><strong><font color="#B22222;">&raquo;&raquo;&raquo;</font></strong> = <em>registered user. click on it to see the user's profile.</em><br /<br /></p>
						</cfif>
			
			
			
						<!--- trackbacks--->
						<cfset maxtrackbacks = 10>
						<cftry>
						<cfhttp url="http://www.google.com/blogsearch_feeds?q=http://www.mnspeak.com/mnspeak/archive/post-#post#.cfm&num=10&output=rss" method="get" timeout="15">
						<cfset objRSS = cfhttp.filecontent>
						<cfset objRSS = xmlParse(objRSS)>
						<cfset XMLRoot = objRSS.XmlRoot>
						<cfif structKeyexists(XMLRoot.channel,"item")>
							<cfset totaltrackbacks = arraylen(XMLRoot.channel.item)>
							<hr size="1" noshade>
							<br />
							<div class="title"><cfoutput>#totaltrackbacks#</cfoutput> <cfif totaltrackbacks EQ 1>Trackback:<cfelse>Trackbacks:</cfif></div><br /><br />
							<cfset itm = 1>
							<cfloop condition = "itm LESS THAN OR EQUAL TO maxtrackbacks AND itm LESS THAN OR EQUAL TO totaltrackbacks">
								<cfset tmp_Item = XMLRoot.channel.item[itm]>
								<cfset item_title = tmp_item.title.xmltext>
								<cfset item_description = tmp_item.description.xmltext>
								<cfset item_link = tmp_item.link.xmltext>
								<cfset item_publisher = XmlSearch(tmp_item, "dc:publisher")>
								<cfset item_publisher = ToString(item_publisher[1])>
								<cfif item_link contains "http://www.mnspeak.com">
								<cfset itm = itm + 1>
								<cfelse>
								<cfoutput>
									<strong>#item_title#</strong>: #item_description#<br />
									<div align="right"><em>&raquo;&raquo; Posted on: <a href="#item_link#" target="_blank">#item_publisher#</a></em></div>
									<hr width="400" size="1" noshade><br />
								</cfoutput>
								<cfset itm = itm + 1>
								</cfif>
							</cfloop>
						</cfif>
						<cfcatch type="any"></cfcatch>
						</cftry>
			

			

			</td>
			<td width="40">&nbsp;</td>
			<td width="160" valign="top">
			<br clear="all" />
			<br clear="all" />
			<br clear="all" />
			<br clear="all" />
				<!-- AD SLOT SOTC_Right2_160x600 -->
				<script type="text/javascript">
				  GA_googleFillSlot("SOTC_Right2_160x600");
				</script>
				<!-- END AD SLOT SOTC_Right2_160x600 -->
			</td>
			</tr>
			</table>
			
			


			<cfoutput query="archivecontent">
			<hr size="1" noshade>

				<form action="addcomment.cfm" method="post" enctype="multipart/form-data" name="commentForm">
					
					
					<div class="title">Leave A Comment:</div><br />
					<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">

					<cfif session.loggedin is TRUE>
						<cfif session.loggedin is TRUE AND #userQuery.userEmail# GT 0>
							<input type="hidden" name="emailaddy" value="#userQuery.userEmail#">
						</cfif>
					<input type="hidden" name="regUser" value="1">
					<input type="hidden" name="comEntryID" value="#post#">
					<input type="hidden" name="comDate" value="#Now()#">
					<input type="hidden" name="posttitle" value="#title#">
					<tr>
						<td colspan="2"><em>Note: You are logged in. <a href="/mnspeak/meta/logout.cfm">Click here to logout</a>.</em><br /><br /></td>
					</tr>
					<tr>
						<td valign="top"><strong>Your Name:</strong></td>
						<td><input type="text" name="comName" size="20" maxlength="40" value="<cfoutput>#userQuery.UserID#</cfoutput>" readonly ></td>
					</tr>
					<tr>
						<td valign="top"><strong>Your URL:</strong></td>
						<td><input type="text" name="comURL" size="30" maxlength="50" value="<cfoutput>#userQuery.userWebsite#</cfoutput>" readonly ></td>
					</tr>

					<tr>
						<td valign="top"><strong>Your Comment:</strong></td>
						<td>
						<textarea onKeyUp="showPreview();" cols="65" rows="10" name="comComment" id="comComment" style="width:450px;"></textarea><br clear="all" />
						<div id="toolbar">
							<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','strong')" src="http://www.mnspeak.com/mnspeak/images/misc/bold.gif" title="click to make your text selection bold (or type control-shift-b)">
							<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','emphasis')" src="http://www.mnspeak.com/mnspeak/images/misc/italic.gif" title="click to make your text selection italicized (or type control-shift-t)">
							<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','a_href')" src="http://www.mnspeak.com/mnspeak/images/misc/link.gif" width="32" height="16" align="middle" title="click to add a link to the selected text (or type control-shift-a)">
						</div>
						<br /><br /><b>Comment Preview:</b><br />
						<div style="padding: 1px; width:450px; border: 1px solid ##CCCCCC;" id="textDisplay"></div><br />
						</td>
					</tr>

					<input type="hidden" name="spamfield" size="30" maxlength="20" value="mnspeak">

					<tr>
						<td colspan="2" align="right">
						<br />
						<input type="submit" class="searchbutton" value="Add Comment">
						<br />
						<br />
						</td>
					</tr>


					<cfelse>
					<tr>
					<td colspan="2">Sorry, you must be logged in to comment.  <a href="/mnspeak/meta/login.cfm?entryid=<cfoutput>#entrynumber#</cfoutput>">Log in</a> // <a href="/mnspeak/meta/register.cfm">Sign up</a>. <br /><br /></td>
					</tr>

					</cfif>

					<tr>
						<td>&nbsp;</td>
						<td align="center">
							    <!-- AD SLOT SOTC_Right1_300x250 -->
									<script type="text/javascript">
									  GA_googleFillSlot("SOTC_Right1_300x250");
									</script>
								<!-- END AD SLOT SOTC_Right1_300x250 -->
						</td>
					</tr>
				</table>
				</form>
			</cfoutput>
			</cfif>						
			
	
			
		</td>
	</tr>

									
			
	<tr bgcolor="#FFFFFF">
		<td align="center" colspan="2"><br><a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/2.5/"><img alt="Creative Commons License" border="0" src="http://creativecommons.org/images/public/somerights20.gif" /></a><br clear="all">Copyright � LOQUAMUR, LLC<br><br></td>
	</tr>
</table>


</div>
<br />
	<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-285694-1";
	urchinTracker();
	</script>
</body>	
</html>
</cfif>