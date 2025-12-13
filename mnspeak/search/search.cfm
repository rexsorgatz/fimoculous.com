<cfset maxdesclength = 3000>
<cfquery name="searchposts" datasource="mspot">
	SELECT entrynumber, title, thisdate, entry, hascomments, author, commentnum, cats
	FROM tblContent
	WHERE entrynumber = entrynumber
<cfloop index="word" list="#URL.s#" delimiters=" ">
	AND entry LIKE '%#word#%'
</cfloop>
	ORDER BY entrynumber DESC
</cfquery>

<cfquery name="searchaggregator" datasource="mspot">
	SELECT id, blogName, blogLoc, blogThumb, blogCategory, date_one, content_one, headline_one, link_one
	FROM tblBlogs
	WHERE id = id
<cfloop index="word" list="#URL.s#" delimiters=" ">
	AND content_one LIKE '%#word#%'
</cfloop>
	ORDER BY blogName DESC
</cfquery>

<cfquery name="myCats" datasource="mspot" dbtype="ODBC">
	SELECT cat_short, cat_long
	FROM tblCategories
	ORDER BY cat_long
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Search</title>
	<link rel="stylesheet" type="text/css" href="../styles.css">
	<script type="text/javascript" src="../scripts.js"></script>
	<script language="javascript" type="text/javascript">
	function carrySrchStr() {
		var mytrm = window.location.search.substring(3);
		while (mytrm.indexOf("+") > -1) {
		mytrm = mytrm.replace("+"," ");
		}
		document.searchform.s.value = mytrm;
	}
	
	</script>
</head>


<body onLoad="carrySrchStr();" background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="../header.cfm">
		<table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#ECF0F2">
			<tr>
				<td width="80%" valign="top">
				<br />
				<form action="http://www.mnspeak.com/mnspeak/search/search.cfm" name="searchform" id="searchform">
				<input type="text" name="s" size="25">
				<input class="searchbutton" type="submit" value="Search">
				</form><br />
					
					<cfif s IS "">
					<cfelse>
					<cfoutput><div class="dailytitle">Results: #searchposts.RecordCount# mnspeak entries and #searchaggregator.RecordCount# aggregator records.</div></cfoutput>

					<cfoutput query="searchposts" maxrows=1>
					<br /><div class="titlebar">#RecordCount# MNSPEAK ENTRIES</div><br />
					</cfoutput>
					<cfoutput query="searchposts">
					<div class="dailytitle"><a href="/mnspeak/archive/post-#entrynumber#.cfm">#Mid(title, 1, maxdesclength)#</a></div>
					<p>#Mid(entry, 1, maxdesclength)#
					<div class="author">&raquo; Comments: <a href="/mnspeak/archive/post-#entrynumber#.cfm">#commentnum#</a> <cfset catList = #cats#><cfif catList IS NOT " " AND catList IS NOT ""> | Categories: <cfloop index="i" from="1" to="#ListLen(catList)#"><a href="/mnspeak/archive/archivetemplate.cfm?cat=#trim(LCase(listGetAt(catList, i)))#">#trim(LCase(listGetAt(catList, i)))#</a> </cfloop></cfif> | Author: <a href="/mnspeak/archive/archivetemplate.cfm?author=#LCase(author)#">#LCase(author)#</a></div>
					</p>
					<hr size="1" noshade>
					</cfoutput>
					
					<cfoutput query="searchaggregator" maxrows=1>
					<br /><div class="titlebar">#RecordCount# AGGREGATOR RECORDS</div><br />
					</cfoutput>
					<cfoutput query="searchaggregator">
					<div class="blogname"><a href="#link_one#" target="_blank"><img src="http://www.mnspeak.com/mnspeak/images/blogs/#blogThumb#" alt="" style="border: 1px solid black;" width="150" height="50" hspace="0" class="sponsor" vspace="0" border="0" align="top"></a>&raquo;<a href="#link_one#" target="_blank">#blogName#</a></div>
					<p><strong><a href="#link_one#" target="_blank">#Ucase(headline_one)# &raquo;&raquo;</a></strong> <span class="blogdateline">(#DateFormat(date_one,"m/d/yy")#, #TimeFormat(date_one,"h:mm tt")#)</span><br/>
					#Mid(content_one, 1, maxdesclength)#<cfif content_one GREATER THAN maxdesclength>...</cfif>><a href="#link_one#" target="_blank">&raquo;&raquo;</a></s></i></em></strike></strong></p>
					<hr size="1" noshade>
					</cfoutput>

					</cfif>
				</td>
				<td width="20%" valign="top">
					<div class="titlebar">&raquo;OUR SPONSORS</div>
<cfinclude template="../sponsors.cfm">								
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


</body>	
</html>
