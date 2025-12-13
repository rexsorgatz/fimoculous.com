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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com<cfif IsDefined("url.month")><cfelseif IsDefined("url.author")> - <cfoutput>#CheckUser.userFullName#</cfoutput><cfelse> - <cfoutput>#archivecontent.title#</cfoutput></cfif></title>
	<link rel="stylesheet" type="text/css" href="http://www.mnspeak.com/mnspeak/styles_2.css">
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>


	<!------ OAS SETUP begin ------>
	<SCRIPT LANGUAGE=JavaScript>
	<!--
	//configuration
	OAS_url = 'http://oascentral.mnspeak.com/RealMedia/ads/';
	OAS_sitepage = 'www.mnspeak.com/threadpage';
	//OAS_sitepage = window.location.hostname + window.location.pathname;
	OAS_listpos = 'Middle1,Middle2,Right1';
	OAS_query = '';
	OAS_target = '_top';
	//end of configuration
	OAS_version = 10;
	OAS_rn = '001234567890'; OAS_rns = '1234567890';
	OAS_rn = new String (Math.random()); OAS_rns = OAS_rn.substring (2, 11);
	function OAS_NORMAL(pos) {
	document.write('<A HREF="' + OAS_url + 'click_nx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '!' + pos + '?' + OAS_query + '" TARGET=' + OAS_target + '>');
	document.write('<IMG SRC="' + OAS_url + 'adstream_nx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '!' + pos + '?' + OAS_query + '" BORDER=0></A>');
	}
	//-->
	</SCRIPT>
	<SCRIPT LANGUAGE=JavaScript1.1>
	<!--
	OAS_version = 11;
	if ((navigator.userAgent.indexOf('Mozilla/3') != -1) || (navigator.userAgent.indexOf('Mozilla/4.0 WebTV') != -1))
	OAS_version = 10;
	if (OAS_version >= 11)
	document.write('<SCR' + 'IPT LANGUAGE=JavaScript1.1 SRC="' + OAS_url + 'adstream_mjx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' +
	OAS_listpos + '?' + OAS_query + '"><\/SCRIPT>');//-->
	</SCRIPT>
	<SCRIPT LANGUAGE=JavaScript>
	<!--
	document.write('');
	function OAS_AD(pos) {
	if (OAS_version >= 11)
	OAS_RICH(pos);
	else
	OAS_NORMAL(pos);
	}
	//-->
	</SCRIPT>
	<!------ OAS SETUP end ------>
	
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
						<cfoutput><strong>#CheckUser.userFullName#</strong><cfif Len(CheckUser.userEmail) GT 1><br />&nbsp;<strong>&raquo;Email:</strong> <a href="mailto:#CheckUser.userEmail#">#CheckUser.userEmail#</a></cfif>
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
							<!------ OAS AD 'Middle1' begin ------>
							<SCRIPT LANGUAGE=JavaScript>
							<!--
							OAS_AD('Middle1');
							//-->
							</SCRIPT>
							<!------ OAS AD 'Middle1' end ------>
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
				<!------ OAS AD 'Right1' begin ------>
				<SCRIPT LANGUAGE=JavaScript>
				<!--
				OAS_AD('Right1');
				//-->
				</SCRIPT>
				<!------ OAS AD 'Right1' end ------>
			</td>
			</tr>
			</table>
			
			


			<cfoutput query="archivecontent">
			<hr size="1" noshade>

				<form action="addcomment.cfm" method="post" enctype="multipart/form-data" name="commentForm">
					<cfif session.loggedin is TRUE><input type="hidden" name="regUser" value="1"><cfelse><input type="hidden" name="regUser" value="0"></cfif>
					<input type="hidden" name="comEntryID" value="#post#">
					<input type="hidden" name="comDate" value="#Now()#">
					<input type="hidden" name="posttitle" value="#title#">
					<cfif session.loggedin is TRUE AND #userQuery.userEmail# GT 0>
					<input type="hidden" name="emailaddy" value="#userQuery.userEmail#">
					</cfif>
					<div class="title">Leave A Comment:</div><br />
					<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">

					<cfif session.loggedin is TRUE>
					<tr>
						<td colspan="2"><em>Note: You are logged in. <a href="/mnspeak/meta/logout.cfm">Click here to logout</a>.</em><br /><br /></td>
					</tr>
					<cfelse>
					<tr>
						<td colspan="2"><a href="/mnspeak/meta/login.cfm?entryid=<cfoutput>#entrynumber#</cfoutput>">Login</a> or <a href="/mnspeak/meta/register.cfm">register</a>. (<em>optional</em>)<br /><br /></td>
					</tr>
					</cfif>
					<tr>
						<td valign="top"><strong>Your Name:</strong></td>
						<td><input type="text" name="comName" size="20" maxlength="40"<cfif session.loggedin is TRUE> value="<cfoutput>#userQuery.UserID#</cfoutput>" readonly</cfif>> (<em>required</em>)</td>
					</tr>
					<tr>
						<td valign="top"><strong>Your URL:</strong></td>
						<td><input type="text" name="comURL" size="30" maxlength="50"<cfif session.loggedin is TRUE> value="<cfoutput>#userQuery.userWebsite#</cfoutput>" readonly</cfif>> (<em>optional</em>)</td>
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
					
					<cfif session.loggedin is FALSE>
					<tr>
						<td valign="top" colspan="2"><em>In an attempt to foil spammers, MNSpeak requires unregistered users to type a password.  <a href="http://www.mnspeak.com/mnspeak/meta/register.cfm" target="_blank">Register</a> if you don't want to do this anymore.</em></td>
					</tr>
					<tr>
						<td valign="top" colspan="2">The password is "<em><strong>mnspeak</strong></em>": <input type="text" name="spamfield" size="30" maxlength="20"> </td>
					</tr>
					</cfif>
					
					<cfif session.loggedin is TRUE>
					<input type="hidden" name="spamfield" size="30" maxlength="20" value="mnspeak">
					</cfif>
					
					<cfif session.loggedin is TRUE AND #userQuery.userEmail# GT 0>
					<tr>
						<td colspan="2" align="right"><em>Email me when new comments arrive</em>:<input type="checkbox" name="emails" id="emails"><br/><br/></td>
					</tr>
					</cfif>
					
					<tr>
						<td colspan="2" align="right">
						<br />
						<input type="submit" class="searchbutton" value="Add Comment">
						<br />
						<br />
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">
							<!------ OAS AD 'Middle2' begin ------>
							<SCRIPT LANGUAGE=JavaScript>
							<!--
							OAS_AD('Middle2');
							//-->
							</SCRIPT>
							<!------ OAS AD 'Middle2' end ------>
						</td>
					</tr>
				</table>
				</form>
			</cfoutput>
			</cfif>						
			
	
			
		</td>
	</tr>

									
			
	<tr bgcolor="#FFFFFF">
		<td align="center" colspan="2"><br><a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/2.5/"><img alt="Creative Commons License" border="0" src="http://creativecommons.org/images/public/somerights20.gif" /></a><br clear="all">Copyright © LOQUAMUR, LLC<br><br></td>
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