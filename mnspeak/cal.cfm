<div class="titlebar">&raquo;TONIGHT'S PLAY</div>
<cfif newsletter IS "true">
	<cfquery name="calContent" datasource="mspot" maxrows="1">
	Select calEntry, myDate, myTime, topItemLocation, topItemPicture, topItemCaption, topItemLink, relatedItems, calAuthor
	FROM mnCal
	WHERE myDate >= #DateAdd("d", -1, Now())# 
	AND myDate <= #DateAdd("d", 1, Now())#
	ORDER BY myDate ASC
	</cfquery>
	<table width="100%" border="0" cellspacing="5" cellpadding="0">
		<tr>
			<td valign="top">
				<cfoutput query="calContent">
				<div class="contentareaactive">
				<h4><font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="3">#DateFormat(myDate,"mmmm d")#</font></h4>
				<h3><font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="2">#topItemLocation#<cfif myTime NEQ "">, #myTime#</cfif></font></h3>
				<div align="center"><a href="#topItemLink#" target="_blank"><img class="mainpic" src="http://www.mnspeak.com/mnspeak/images/cal/#topItemPicture#" alt="" width="240" height="150" hspace="0" vspace="2"></a></div>
				<font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="2">#topItemCaption# <cfif topItemCaption NEQ ""><span class="author"><a href="http://www.mnspeak.com/mnspeak/archive/archivetemplate.cfm?author=#calAuthor#">[#calAuthor#]</a></span> </cfif><span class="dailytitle"><a href="#topItemLink#" target="_blank"><strong>&raquo;&raquo;</strong></a></span></font>
				<cfif relatedItems NEQ "">
				<hr size="1" noshade>
				<div class="subtitlebar"><font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="1"><strong>MORE PLAY TODAY:</strong></font></div>
				<font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="2">#relatedItems#</font>
				</cfif>
				</div>
				</cfoutput>
			</td>
		</tr>
	</table>
<cfelseif isDefined("calnum")>
	<cfquery name="getComments" datasource="mspot">
		SELECT comID, comCalID, comName, comURL, comComment
		FROM tblCalComments
		WHERE comCalID = #URL.calnum#
		ORDER BY comID 
	</cfquery>
	<cfif session.loggedin is TRUE>
		<cfquery username="fimoculous" password="fmcr5473" name="userQuery" datasource="mspot">
			SELECT UserID, displayName, userEmail, userWebsite
			FROM tblPasswords
			WHERE UserID = '#Session.UserID#'
		</cfquery>
	</cfif>
	<cfquery name="calContent" datasource="mspot" maxrows="1">
	Select calEntry, myDate, myTime, topItemLocation, topItemPicture, topItemCaption, topItemLink, relatedItems, calAuthor
	FROM mnCal
	WHERE calEntry = #URL.calnum#
	</cfquery>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top">
				<table border="0" cellspacing="3" cellpadding="0" class="subcal">
					<tr>
						<td align="center" class="calunseltwo">You are viewing a past or future event. <a href="http://www.mnspeak.com/">Click here to return to main page</a>.</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<div class="contentareaactive">
				<cfoutput query="calContent">
				<table width="100%" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td colspan="2" valign="top"><h1>#DateFormat(myDate,"mmmm d, yyyy")#<cfif myTime NEQ ""> --  #myTime#</cfif></h1></td>
				</tr>
				<tr>
					<td width="240" valign="top"><a href="#topItemLink#" target="_blank"><cfif len(topItemPicture) GT 1><img class="mainpic" src="http://www.mnspeak.com/mnspeak/images/cal/#topItemPicture#" alt="" width="240" height="150" hspace="0" vspace="0"><cfelse><img class="mainpic" src="http://www.mnspeak.com/mnspeak/images/cal/blank.gif" alt="" width="240" height="150" hspace="0" vspace="2"></cfif></a></td>
					<td align="left" valign="top">
						<h3 style="margin-top: -4px;">#topItemLocation#</h3>
						#topItemCaption# <span class="dailytitle"><a href="#topItemLink#" target="_blank"><strong>&raquo;&raquo;</strong></a></span><br />
						<cfif topItemCaption NEQ ""><span class="author">Author: <a href="http://www.mnspeak.com/mnspeak/archive/archivetemplate.cfm?author=#calAuthor#">#calAuthor#</a></span></cfif>
						<cfif relatedItems NEQ "">
						<hr size="1" noshade>
						<div class="subtitlebar">MORE PLAY TODAY:</div>
						#relatedItems#
						</cfif>
					</td>
				</tr>
				</table>
				</cfoutput>
				</div>
			</td>
		</tr>
	</table>
	</td>
</tr>
<tr>
	<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><br /><br />
				<cfoutput query="getComments" maxrows="50">
				<p>
				#comComment#<br />
				<div align="right"><em>&raquo;&raquo; Submitted by</em> <strong><a href="/mnspeak/archive/archivetemplate.cfm?author=#comName#" style="color: ##B22222; text-decoration:none;">&raquo;&raquo;&raquo;</a></strong><em> <cfif Len(comURL) GT 1><a href="<cfif Mid(comURL, 1, 7) IS NOT "http://">http://#comURL#<cfelse>#comURL#</cfif>" target="_blank"></cfif><cfif Len(comName) LT 1>Anonymous<cfelse>#comName#</cfif><cfif Len(comURL) GT 1></a></cfif></em></div><br />
				<hr width="400" size="1" noshade><br />
				</p>
				</cfoutput>
				<hr size="1" noshade>
				<form action="/mnspeak/calsubmit.cfm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="comCalID" value="<cfoutput>#URL.calnum#</cfoutput>">
					<div class="title">Leave A Comment:</div><br />
					<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
					<tr>
						<td colspan="2"><em>Conduct Note: You can leave a comment about an event you think should be listed <strong>on this day</strong>, but please don't leave gigantic press releases.</em><br /><br /></td>
					<tr>
					<cfif session.loggedin is TRUE>
					<tr>
						<td valign="top"><strong>Your Name:</strong></td>
						<td><input type="text" name="comName" size="20" maxlength="40"<cfif session.loggedin is TRUE> value="<cfoutput>#userQuery.UserID#</cfoutput>" readonly</cfif>> (<em>required</em>)</td>
					<tr>
					<tr>
						<td valign="top"><strong>Your URL:</strong></td>
						<td><input type="text" name="comURL" size="30" maxlength="50"<cfif session.loggedin is TRUE> value="<cfoutput><cfif Len(userQuery.userWebsite) GT 0>#userQuery.userWebsite#</cfoutput><cfelse> </cfif>" readonly</cfif>> (<em>optional</em>)</td>
					<tr>
					<tr>
						<td valign="top"><strong>Your Comment:</strong></td>
						<td>
						<textarea cols="65" rows="10" name="comComment" id="comComment" style="width:450px;"></textarea><br clear="all" />
						<div id="toolbar">
							<img class="buttons" onmouseover="mouseover(this);" onmouseout="mouseout(this);" onmousedown="mousedown(this);" onmouseup="mouseup(this);" onclick="return pnhEditTextarea('comComment','strong')" src="http://www.mnspeak.com/mnspeak/images/misc/bold.gif" title="click to make your text selection bold (or type control-shift-b)">
							<img class="buttons" onmouseover="mouseover(this);" onmouseout="mouseout(this);" onmousedown="mousedown(this);" onmouseup="mouseup(this);" onclick="return pnhEditTextarea('comComment','emphasis')" src="http://www.mnspeak.com/mnspeak/images/misc/italic.gif" title="click to make your text selection italicized (or type control-shift-t)">
							<img class="buttons" onmouseover="mouseover(this);" onmouseout="mouseout(this);" onmousedown="mousedown(this);" onmouseup="mouseup(this);" onclick="return pnhEditTextarea('comComment','a_href')" src="http://www.mnspeak.com/mnspeak/images/misc/link.gif" width="32" height="16" align="middle" title="click to add a link to the selected text (or type control-shift-a)">
						</div>
						 (to use these buttons, highlight a word first)<br /><br />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
						<br />
						<input type="submit" class="searchbutton" value="Add Calendar Comment">
						</td>
					</tr>
					<cfelse>
					<tr>
						<td colspan="2"><em>You must be logged in to leave a comment in the calendar. <a href="/mnspeak/meta/login.cfm?calnum=<cfoutput>#URL.calnum#</cfoutput>">Login</a> or <a href="/mnspeak/meta/register.cfm">register</a>.</em><br /><br /></td>
					<tr>
					</cfif>
				</table>
				</form>
			</td>
		</tr>
	</table>
<cfelse>
	<cfquery name="calContent" datasource="mspot" maxrows="6">
	SELECT calEntry, myDate, myTime, topItemLocation, topItemPicture, topItemCaption, topItemLink, relatedItems, calAuthor, commentnum
	FROM mnCal
	WHERE myDate >= #DateAdd("d", -1, Now())#
	ORDER BY myDate ASC
	</cfquery>
	
	<!---  Old Cal Query 
	WHERE myDate >= #DateAdd("d", -1, Now())# 
	AND myDate <= #DateAdd("d", 6, Now())#
	
	--->
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top">
				<table border="0" cellspacing="0" cellpadding="0" class="subcal">
					<tr>
					<cfset cc = 1>
					<cfoutput query="calContent">
						<td align="left"><a href="" id="tab#cc#" class="<cfif cc EQ 1>calsel<cfelse>calunsel</cfif>" onclick="ContentArea[#cc-1#].show(); return false;"><cfif cc EQ 1>TODAY<cfelse>#UCase(DateFormat(myDate,"DDD"))#</cfif></a></td>
						<cfset cc = cc + 1>
					</cfoutput>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<cfset counter = "0">
				<cfoutput query="calContent">
				<cfset counter="#NumberFormat((counter) + 1)#">
				<cfif counter EQ 1>
				<div id="contentArea#counter#" class="contentareaactive">
				<cfelse>
				<div id="contentArea#counter#" class="contentAreaInActive">
				</cfif>
				<h4><a href="http://www.mnspeak.com/mnspeak/calendar.cfm?calnum=#calEntry#">#DateFormat(myDate,"mmmm d")#</a></h4>
				<h3>#topItemLocation#<cfif myTime NEQ "">, #myTime#</cfif></h3>
				<div align="center"><a href="#topItemLink#" target="_blank"><cfif len(topItemPicture) GT 1><img class="mainpic" src="http://www.mnspeak.com/mnspeak/images/cal/#topItemPicture#" alt="" width="240" height="150" hspace="0" vspace="2"><cfelse><img class="mainpic" src="http://www.mnspeak.com/mnspeak/images/cal/blank.gif" alt="" width="240" height="150" hspace="0" vspace="2"></cfif></a></div>
				#topItemCaption# <a href="#topItemLink#" target="_blank">&raquo;&raquo;</a><br />
				<hr size="1" noshade>
				<span class="author">&raquo; <strong><a href="http://www.mnspeak.com/mnspeak/calendar.cfm?calnum=#calEntry#">#commentnum# comment<cfif commentnum NEQ 1>s</cfif></a></strong><cfif topItemCaption NEQ ""> | Author: <a href="http://www.mnspeak.com/mnspeak/archive/archivetemplate.cfm?author=#calAuthor#">#calAuthor#</a></cfif></span>
				<cfif relatedItems NEQ "">
				<hr size="1" noshade>
				<div class="subtitlebar">MORE PLAY TODAY:</div>
				#relatedItems#
				</cfif>
				</div>
				</cfoutput>
			</td>
		</tr>
	</table>
</cfif>

