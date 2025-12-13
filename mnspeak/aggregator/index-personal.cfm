<cfset maxdesclength = 1000>

<cfif #session.loggedin# is "TRUE">
	<cfquery name="getUserData" datasource="mspot">
		SELECT id, userid, blogsource
		FROM tblUserBlogs 
		WHERE userid = '#Session.UserID#'
	</cfquery>
	<cfset mySourcesCheckedList = ValueList(getUserData.blogsource)>
	
	<cfquery name="myBlogs" datasource="mspot" dbtype="ODBC">
		SELECT tblBlogs.id, tblBlogs.blogName, tblBlogs.blogLoc, tblBlogs.feedLoc, tblBlogs.feedType, tblBlogs.blogThumb, tblBlogs.blogCategory, tblBlogs.blogOnline, tblBlogs.date_one, tblBlogs.content_one, tblBlogs.headline_one, tblBlogs.link_one
		FROM tblBlogs, tblUserBlogs
		WHERE tblBlogs.blogOnline = 'yes'
		AND tblBlogs.date_one <= #Now()# 
		AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
		AND tblUserBlogs.userid = '#Session.UserID#'
		AND tblUserBlogs.blogsource = tblBlogs.id
		ORDER BY tblBlogs.date_one DESC
	</cfquery>
	
	<cfquery name="myNewsBlogs" datasource="mspot" dbtype="ODBC">
		SELECT tblBlogs.id, tblBlogs.blogCategory, tblBlogs.blogOnline
		FROM tblBlogs, tblUserBlogs
		WHERE tblBlogs.blogCategory = 'news' 
		AND tblBlogs.blogOnline = 'yes'
		AND tblBlogs.date_one <= #Now()# 
		AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
		AND tblUserBlogs.userid = '#Session.UserID#'
		AND tblUserBlogs.blogsource = tblBlogs.id
	</cfquery>
	<cfquery name="myPersonalBlogs" datasource="mspot" dbtype="ODBC">
		SELECT tblBlogs.id, tblBlogs.blogCategory, tblBlogs.blogOnline
		FROM tblBlogs, tblUserBlogs
		WHERE tblBlogs.blogCategory = 'personal'
		AND tblBlogs.blogOnline = 'yes'
		AND tblBlogs.date_one <= #Now()# 
		AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
		AND tblUserBlogs.userid = '#Session.UserID#'
		AND tblUserBlogs.blogsource = tblBlogs.id
	</cfquery>
	<cfquery name="myPolitcalBlogs" datasource="mspot" dbtype="ODBC">
		SELECT tblBlogs.id, tblBlogs.blogCategory, tblBlogs.blogOnline
		FROM tblBlogs, tblUserBlogs
		WHERE tblBlogs.blogCategory = 'political'
		AND tblBlogs.blogOnline = 'yes'
		AND tblBlogs.date_one <= #Now()# 
		AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
		AND tblUserBlogs.userid = '#Session.UserID#'
		AND tblUserBlogs.blogsource = tblBlogs.id
	</cfquery>
	<cfquery name="mySportsBlogs" datasource="mspot" dbtype="ODBC">
		SELECT tblBlogs.id, tblBlogs.blogCategory, tblBlogs.blogOnline
		FROM tblBlogs, tblUserBlogs
		WHERE tblBlogs.blogCategory = 'sports'
		AND tblBlogs.blogOnline = 'yes'
		AND tblBlogs.date_one <= #Now()# 
		AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
		AND tblUserBlogs.userid = '#Session.UserID#'
		AND tblUserBlogs.blogsource = tblBlogs.id
	</cfquery>
	<cfquery name="myBusinessBlogs" datasource="mspot" dbtype="ODBC">
		SELECT tblBlogs.id, tblBlogs.blogCategory, tblBlogs.blogOnline
		FROM tblBlogs, tblUserBlogs
		WHERE tblBlogs.blogCategory = 'business'
		AND tblBlogs.blogOnline = 'yes'
		AND tblBlogs.date_one <= #Now()# 
		AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
		AND tblUserBlogs.userid = '#Session.UserID#'
		AND tblUserBlogs.blogsource = tblBlogs.id
	</cfquery>
	<cfquery name="myTechBlogs" datasource="mspot" dbtype="ODBC">
		SELECT tblBlogs.id, tblBlogs.blogCategory, tblBlogs.blogOnline
		FROM tblBlogs, tblUserBlogs
		WHERE tblBlogs.blogCategory = 'tech'
		AND tblBlogs.blogOnline = 'yes'
		AND tblBlogs.date_one <= #Now()# 
		AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
		AND tblUserBlogs.userid = '#Session.UserID#'
		AND tblUserBlogs.blogsource = tblBlogs.id
	</cfquery>
	<cfquery name="myEntertainmentBlogs" datasource="mspot" dbtype="ODBC">
		SELECT tblBlogs.id, tblBlogs.blogCategory, tblBlogs.blogOnline
		FROM tblBlogs, tblUserBlogs
		WHERE tblBlogs.blogCategory = 'entertainment'
		AND tblBlogs.blogOnline = 'yes'
		AND tblBlogs.date_one <= #Now()# 
		AND tblBlogs.date_one >= #DateAdd("d", -2, Now())#
		AND tblUserBlogs.userid = '#Session.UserID#'
		AND tblUserBlogs.blogsource = tblBlogs.id
	</cfquery>
	
	<cfset newsblogs = myNewsBlogs.recordcount>
	<cfset personalblogs = myPersonalBlogs.recordcount>
	<cfset politicalblogs = myPolitcalBlogs.recordcount>
	<cfset sportsblogs = mySportsBlogs.recordcount>
	<cfset businessblogs = myBusinessBlogs.recordcount>
	<cfset techblogs = myTechBlogs.recordcount>
	<cfset entertainmentblogs = myEntertainmentBlogs.recordcount>
	<cfset totalblogs = newsblogs+personalblogs+politicalblogs+sportsblogs+businessblogs+techblogs+entertainmentblogs>

<cfelse>

	<cfset newsblogs = 0>
	<cfset personalblogs = 0>
	<cfset politicalblogs = 0>
	<cfset sportsblogs = 0>
	<cfset businessblogs = 0>
	<cfset techblogs = 0>
	<cfset entertainmentblogs = 0>
	<cfset totalblogs = 0>

</cfif>


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
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/aggregator/index-chron.cfm"><strong>VIEW CHRONOLOGICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/aggregator/index-alph.cfm"><strong>VIEW ALPHABETICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/meta/users-mapped.cfm"><strong>VIEW GEOGRAPHICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menusel"><a><strong>VIEW PERSONALIZED</strong></a><br /></td>
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
				<cfif #session.loggedin# is "FALSE">
					<table width="70%" border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#C9CED5" style="border: 1px solid Black; padding: 2px;">
						<tr>
							<td><div align="center" class="blogcopy"><strong>&raquo;&raquo; To personalize this service, you must <a href="http://www.mnspeak.com/mnspeak/meta/register.cfm">register</a>.<br/><br/>&raquo;&raquo; If you are already registered, just <a href="http://www.mnspeak.com/mnspeak/meta/login.cfm?aggregator">login</a>.</strong></div></td>
						</tr>
					</table>
				<br /><br />
				<cfelseif len(mySourcesCheckedList) EQ 0>
					<table width="70%" border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#C9CED5" style="border: 1px solid Black; padding: 2px;">
						<tr>
							<td><div align="center" class="blogcopy"><strong>&raquo;&raquo; To personalize this service, you need to <a href="http://www.mnspeak.com/mnspeak/meta/editblogs.cfm">add sources</a>.</strong></div></td>
						</tr>
					</table>
				<br /><br />
				<cfelse>
					<table width="70%" border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#C9CED5" style="border: 1px solid Black; padding: 2px;">
						<tr>
							<td><div align="center" class="blogcopy"><a href="http://www.mnspeak.com/mnspeak/meta/editblogs.cfm"><strong>&raquo;&raquo; Add or remove sources to your personalized aggregator</strong></a>.</div></td>
						</tr>
					</table>
				<br /><br />
				</cfif>
<cfif #session.loggedin# is "TRUE">				
<div class="blogcopy">
<cfoutput query="myBlogs">
	<div class="blogcat#blogCategory#">
	<div class="blogname"><a href="#blogLoc#" target="_blank"><img src="http://www.mnspeak.com/mnspeak/images/blogs/#blogThumb#" alt="" style="border: 1px solid black;" width="150" height="50" hspace="0" class="sponsor" vspace="0" border="0" align="top"></a>&raquo;<a href="#blogLoc#" target="_blank">#blogName#</a></div>
	<ul>
		<p><strong><a href="#link_one#" target="_blank">#Ucase(headline_one)# &raquo;&raquo;</a></strong> <span class="blogdateline">(#DateFormat(date_one,"m/d/yy")#, #TimeFormat(date_one,"h:mm tt")#)</span><br/>
		#Mid(content_one, 1, maxdesclength)#<cfif content_one GREATER THAN maxdesclength>...</cfif>><a href="#link_one#" target="_blank">&raquo;&raquo;</a></s></i></em></strike></strong></p>
	</ul>
	<hr size="1" noshade>
	</div>
</cfoutput>
</div>
</cfif>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


</body>	
</html>
