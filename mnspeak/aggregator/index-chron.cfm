<cfset maxdesclength = 1000>
<cfquery name="myBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT id, blogName, blogLoc, feedLoc, feedType, blogThumb, blogCategory, blogOnline, date_one, content_one, headline_one, link_one
	FROM tblBlogs
	WHERE blogOnline = 'yes'
	AND date_one <= #Now()# 
	AND date_one >= #DateAdd("d", -2, Now())#
	ORDER BY date_one DESC
</cfquery>

<cfquery name="myPersBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT tblPasswords.UserID, tblPasswords.numberID, tblPasswords.userWebsite, tblBlogs.id, tblBlogs.blogName, tblBlogs.blogLoc, tblBlogs.feedLoc, tblBlogs.feedType, tblBlogs.blogThumb, tblBlogs.blogCategory, tblBlogs.blogOnline, tblBlogs.date_one, tblBlogs.content_one, tblBlogs.headline_one, tblBlogs.link_one
	FROM tblBlogs, tblPasswords
	WHERE tblBlogs.blogOnline = 'yes'
	AND tblBlogs.date_one <= #Now()# 
	AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
	AND tblPasswords.userWebsite = tblBlogs.blogLoc
	ORDER BY tblBlogs.date_one DESC
</cfquery>
<cfset myBlogSites = ValueList(myPersBlogs.blogLoc)>
<cfset myBlogNames = ValueList(myPersBlogs.UserID)>

<cfquery name="myNewsBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogCategory, blogOnline
	FROM tblBlogs
	WHERE blogCategory = 'news' 
	AND blogOnline = 'yes'
	AND date_one <= #Now()# 
	AND date_one >= #DateAdd("d", -2, Now())#
</cfquery>
<cfquery name="myPersonalBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogCategory, blogOnline
	FROM tblBlogs
	WHERE blogCategory = 'personal'
	AND blogOnline = 'yes'
	AND date_one <= #Now()# 
	AND date_one >= #DateAdd("d", -2, Now())#
</cfquery>
<cfquery name="myPolitcalBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogCategory, blogOnline
	FROM tblBlogs
	WHERE blogCategory = 'political'
	AND blogOnline = 'yes'
	AND date_one <= #Now()# 
	AND date_one >= #DateAdd("d", -2, Now())#
</cfquery>
<cfquery name="mySportsBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogCategory, blogOnline
	FROM tblBlogs
	WHERE blogCategory = 'sports'
	AND blogOnline = 'yes'
	AND date_one <= #Now()# 
	AND date_one >= #DateAdd("d", -2, Now())#
</cfquery>
<cfquery name="myBusinessBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogCategory, blogOnline
	FROM tblBlogs
	WHERE blogCategory = 'business'
	AND blogOnline = 'yes'
	AND date_one <= #Now()# 
	AND date_one >= #DateAdd("d", -2, Now())#
</cfquery>
<cfquery name="myTechBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogCategory, blogOnline
	FROM tblBlogs
	WHERE blogCategory = 'tech'
	AND blogOnline = 'yes'
	AND date_one <= #Now()# 
	AND date_one >= #DateAdd("d", -2, Now())#
</cfquery>
<cfquery name="myEntertainmentBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogCategory, blogOnline
	FROM tblBlogs
	WHERE blogCategory = 'entertainment'
	AND blogOnline = 'yes'
	AND date_one <= #Now()# 
	AND date_one >= #DateAdd("d", -2, Now())#
</cfquery>

<cfset newsblogs = myNewsBlogs.recordcount>
<cfset personalblogs = myPersonalBlogs.recordcount>
<cfset politicalblogs = myPolitcalBlogs.recordcount>
<cfset sportsblogs = mySportsBlogs.recordcount>
<cfset businessblogs = myBusinessBlogs.recordcount>
<cfset techblogs = myTechBlogs.recordcount>
<cfset entertainmentblogs = myEntertainmentBlogs.recordcount>
<cfset totalblogs = newsblogs+personalblogs+politicalblogs+sportsblogs+businessblogs+techblogs+entertainmentblogs>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - The Aggregator</title>
<script language="JavaScript">
function radiochecker(thisvalue) {
	var a = document.styleSheets[0];
	thisvalue = thisvalue - 1;
	if (document.styleSheets) {
		var s = document.styleSheets[0];
		if (s.cssRules){
	  		var b = a.cssRules;
	  	}
		else if (s.rules){ 
			var b = a.rules;
	  	}
	}
	if (thisvalue<0) {
		for (i=0; i<8; i++) { 
			b[i].style.display = 'block';
		 	document.getElementById("cba"+i).className = "menuunsel";
		}   
		document.getElementById("cba0").className = "menusel";
	}
	else {
		for (i=0; i<8; i++) { 
			b[i].style.display = 'none';
		 	document.getElementById("cba"+i).className = "menuunsel";
		}   
		b[thisvalue].style.display = 'block';
		thisvalue = thisvalue + 1;
		document.getElementById("cba"+thisvalue).className = "menusel";
	}
	return false;
}
</script>

	<script type="text/javascript" src="../scripts.js"></script>
	<link rel="stylesheet" type="text/css" href="../styles.css">
</head>
<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#ECF0F2">
	<tr>
		<td>
<cfinclude template="../header.cfm">
		<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#C9CED5" style="border: 1px solid Black; padding: 2px; margin-top: 10px;">
			<tr>
				<td>
				<div class="blogcopy"><strong>What is this?</strong> This page aggregates recent posts from approximately 200 Minnesota-authored blogs and media sources. It updates every hour. Using the controls below, you can organize this page alphabetically (with all sources visible), chronologically (with recent posts visible), geographically (with sources placed on a map), or personalized (with sources you choose).</div>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" style="border: padding: 2px; margin-top: 10px;">
			<tr>
				<td>
					<table border="0" cellspacing="5" cellpadding="0" class="submenu" style="border: 1px solid Black;">
						<tr>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menusel"><a><strong>VIEW CHRONOLOGICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/aggregator/index-alph.cfm"><strong>VIEW ALPHABETICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/meta/users-mapped.cfm"><strong>VIEW GEOGRAPHICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/aggregator/index-personal.cfm"><strong>VIEW PERSONALIZED</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
						</tr>
					</table>
					<table border="0" cellspacing="5" cellpadding="0" class="submenu" style="border: 1px solid Black;">
						<tr>
							<td width="11%" align="center" id="cba0" class="menusel"><a href="javascript:void(0)" onclick="radiochecker(0)"><strong>ALL</strong></a><br />(<cfoutput>#totalblogs# sources</cfoutput>)</td>
							<td width="11%" align="center" id="cba1" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(1)"><strong>NEWS</strong></a><br />(<cfoutput>#newsblogs# sources</cfoutput>)</td>
							<td width="11%" align="center" id="cba3" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(3)"><strong>SPORTS</strong></a><br />(<cfoutput>#sportsblogs# sources</cfoutput>)</td>
							<td width="11%" align="center" id="cba7" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(7)"><strong>TECHNOLOGY</strong></a><br />(<cfoutput>#techblogs# sources</cfoutput>)</td>
							<td width="11%" align="center" id="cba2" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(2)"><strong>POLITICAL</strong></a><br />(<cfoutput>#politicalblogs# sources</cfoutput>)</td>
							<td width="11%" align="center" id="cba5" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(5)"><strong>PERSONAL</strong></a><br />(<cfoutput>#personalblogs# sources</cfoutput>)</td>
							<td width="11%" align="center" id="cba6" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(6)"><strong>BUSINESS</strong></a><br />(<cfoutput>#businessblogs# sources</cfoutput>)</td>
							<td width="11%" align="center" id="cba4" class="menuunsel"><a href="javascript:void(0)" onclick="radiochecker(4)"><strong>CULTURE</strong></a><br />(<cfoutput>#entertainmentblogs# sources</cfoutput>)</td>
						</tr>
					</table>
					<table border="0" cellspacing="5" cellpadding="0" style="border: 1px solid Black; background-color: #EAEAEA; height: 40px; width: 100%;">
						<tr>
							<td colspan="8" align="center">
							<form action="http://www.mnspeak.com/mnspeak/aggregator/index-search.cfm" name="searchform" id="searchform">
							<input type="text" name="s" size="25">&nbsp;&nbsp;&nbsp;
							<input class="searchbutton" type="submit" value="Search Aggregator">
							</form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br /><br />
		<table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#ECF0F2">
			<tr>
				<td width="98%" valign="top">
				
<div class="blogcopy">
<cfset c = 1>
<cfoutput query="myBlogs">
	<div class="blogcat#blogCategory#">
	<cfif #listGetAt(myBlogSites, c)# IS #blogLoc# AND c LT ListLen(myBlogSites)>
		<div class="blognamehighlighted"><a href="#blogLoc#" target="_blank"><img src="http://www.mnspeak.com/mnspeak/images/blogs/#blogThumb#" alt="" style="border: 1px solid black;" width="150" height="50" hspace="0" class="sponsor" vspace="0" border="0" align="top"></a>&raquo;<a href="#blogLoc#" target="_blank">#blogName#</a> <a href="http://www.mnspeak.com/mnspeak/archive/archivetemplate.cfm?author=#listGetAt(myBlogNames, c)#"><span class="specialhighlight" style="font-size:10px;">&raquo;&raquo; MNspeak Profile &laquo;&laquo;</span></a></div>
		<cfset c = c + 1>
	<cfelse>
		<div class="blogname"><a href="#blogLoc#" target="_blank"><img src="http://www.mnspeak.com/mnspeak/images/blogs/#blogThumb#" alt="" style="border: 1px solid black;" width="150" height="50" hspace="0" class="sponsor" vspace="0" border="0" align="top"></a>&raquo;<a href="#blogLoc#" target="_blank">#blogName#</a></div>
	</cfif>
	<ul>
		<p><strong><a href="#link_one#" target="_blank">#Ucase(headline_one)# &raquo;&raquo;</a></strong> <span class="blogdateline">(#DateFormat(date_one,"m/d/yy")#, #TimeFormat(date_one,"h:mm tt")#)</span><br/>
		#Mid(content_one, 1, maxdesclength)#<cfif content_one GREATER THAN maxdesclength>...</cfif>><a href="#link_one#" target="_blank">&raquo;&raquo;</a></s></i></em></strike></strong></p>
	</ul>
	<hr size="1" noshade>
	</div>
</cfoutput>
</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>	
</html>
