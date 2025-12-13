<cfif newsletter IS "true">
	<cfquery name="todaycontent" datasource="mspot">
		SELECT entrynumber, title, thisdate, entry, hascomments, author, commentnum, accepted
		FROM tblContent
		WHERE placement = 1
		AND accepted = 1
		ORDER BY thisdate DESC
	</cfquery>
	<cfoutput query="todaycontent">
	<div class="dailytitle"><font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="2"><strong><cfif hascomments IS "1"><a href="http://www.mnspeak.com/mnspeak/archive/post-#entrynumber#.cfm"></cfif>#title#<cfif hascomments IS "1">&nbsp;&nbsp;<span class="commentnumber">&raquo; [<span style="color: ##B22222;">#commentnum#</span>]</span></a></cfif></strong></font></div>
	<p><font face="Verdana,Geneva,Arial,Helvetica,sans-serif" size="1">#entry# <span class="author"><a href="http://www.mnspeak.com/mnspeak/archive/archivetemplate.cfm?author=#LCase(author)#">[#LCase(author)#]</a></span></font></p>
	</cfoutput>
<cfelseif IsDefined("unmoderated") IS "yes">
	<cfquery name="todaycontent" datasource="mspot" maxrows="20">
		SELECT entrynumber, title, thisdate, entry, author, accepted
		FROM tblContent
		WHERE accepted = 0
		ORDER BY thisdate DESC
	</cfquery>
	<div class="titlebar">&raquo;MNSPEAK UNFILTERED</div>
	<hr size="1" noshade>
	<p><strong>&raquo;</strong><a href="/mnspeak/meta/create.cfm"><strong>Submit Your Own Post</strong></a></p>
	<hr size="1" noshade>
	<cfoutput query="todaycontent">
	<div class="dailytitle">#title#</div>
	<p>#entry#
	<div class="author">&raquo; Author: <a href="/mnspeak/archive/archivetemplate.cfm?author=#LCase(author)#">#LCase(author)#</a></div>
	</p>
	<hr size="1" noshade class="divider">
	</cfoutput>
<cfelse>
	<cfquery name="todaycontent" datasource="mspot">
		SELECT entrynumber, placement, title, thisdate, entry, hascomments, author, commentnum, accepted, cats
		FROM tblContent
		WHERE placement = 1
		AND accepted = 1
		ORDER BY entrynumber DESC
	</cfquery>
	<cfquery name="yesterdaycontent" datasource="mspot">
		SELECT entrynumber, title, thisdate, entry, hascomments, author, commentnum, accepted, cats
		FROM tblContent
		WHERE placement = 2
		AND accepted = 1
		ORDER BY entrynumber DESC
	</cfquery>
	<div class="titlebar">&raquo;TODAY'S TALK</div>
	<cfoutput query="todaycontent">
	<div class="dailytitle"><a href="/mnspeak/archive/post-#entrynumber#.cfm">#title#</a></div>
	<p>#entry#
	<div class="author">&raquo; <a href="/mnspeak/archive/post-#entrynumber#.cfm"><strong>#commentnum# comment<cfif commentnum NEQ 1>s</cfif></strong></a> <cfset catList = #cats#><cfif catList IS NOT " " AND catList IS NOT ""> <strong>|</strong> Categories: <cfloop index="i" from="1" to="#ListLen(catList)#"><a href="/mnspeak/archive/archivetemplate.cfm?cat=#trim(LCase(listGetAt(catList, i)))#">#trim(LCase(listGetAt(catList, i)))#</a> </cfloop></cfif> <strong>|</strong> Author: <a href="/mnspeak/archive/archivetemplate.cfm?author=#LCase(author)#" rel="nofollow">#LCase(author)#</a></div>
	</p>
	<hr size="1" noshade class="divider">
	</cfoutput>
	<p align="center"><strong>&raquo;</strong><a href="/mnspeak/meta/create.cfm"><strong>Post A Link Or Story</strong></a></p>
	
	<div align="center">
		<!-- AD SLOT SOTC_Middle1_300x250 -->
			<script type="text/javascript">
			  GA_googleFillSlot("SOTC_Middle1_300x250");
			</script>
		<!-- END AD SLOT SOTC_Middle1_300x250 -->
	</div>
	
	<br clear="all" /><br clear="all" />
	
	
	
	
	<div class="titlebar">&raquo;YESTERDAY'S TALK</div>
	<cfoutput query="yesterdaycontent">
	<div class="dailytitle"><a href="/mnspeak/archive/post-#entrynumber#.cfm">#title#</a></div>
	<p>#entry#
	<div class="author">&raquo; <a href="/mnspeak/archive/post-#entrynumber#.cfm"><strong>#commentnum# comment<cfif commentnum NEQ 1>s</cfif></strong></a> <cfset catList = #cats#><cfif catList IS NOT " " AND catList IS NOT ""> <strong>|</strong> Categories: <cfloop index="i" from="1" to="#ListLen(catList)#"><a href="/mnspeak/archive/archivetemplate.cfm?cat=#trim(LCase(listGetAt(catList, i)))#">#trim(LCase(listGetAt(catList, i)))#</a> </cfloop></cfif> <strong>|</strong> Author: <a href="/mnspeak/archive/archivetemplate.cfm?author=#LCase(author)#" rel="nofollow">#LCase(author)#</a></div>
	</p>
	<hr size="1" noshade class="divider">
	</cfoutput>
	<div class="titlebar">&raquo;ARCHIVE</div>
	<table border="0" cellspacing="4" cellpadding="2" class="subcal">
		<tr>
		<cfloop index="abc" from="0" to="6">
		<cfset nowish = #DateAdd("d", (abc*-1), Now())#>
		<cfoutput>
			<td align="center" class="callink"><a href="/mnspeak/archive/archivetemplate.cfm?day=#DateFormat(nowish,"d")#&month=#DateFormat(nowish,"m")#&year=#DateFormat(nowish,"yyyy")#">#DateFormat(nowish,"mmm<br />d")#</a></td>
		</cfoutput>
		</cfloop>
		</tr>
		<tr>
			<td colspan="7" align="center" class="callink"><a href="/mnspeak/archive/archivetemplate.cfm?pastweek">All Posts From Past 7 Days</a></td>
		</tr>
		<tr>
			<td colspan="7" align="center" class="callink"><a href="/mnspeak/archive/archivetemplate.cfm?pastmonth">All Posts From Past 30 Days</a></td>
		</tr>
		<tr>
			<td colspan="7" align="center" class="callink"><a href="/mnspeak/archive/completearchive.cfm">Complete Archive</a></td>
		</tr>
	</table>
</cfif>