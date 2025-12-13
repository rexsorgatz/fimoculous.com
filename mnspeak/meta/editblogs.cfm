<cfif #session.loggedin# is "TRUE">
	<cfquery name="getUserData" datasource="mspot">
		SELECT id, userid, blogsource
		FROM tblUserBlogs 
		WHERE userid = '#Session.UserID#'
	</cfquery>
	<cfset mySourcesCheckedList = ValueList(getUserData.blogsource)>
<cfelse>
	<cflocation url="/mnspeak/meta/login.cfm" addToken="No">
</cfif>

<cfquery name="myNewsBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogName, blogLoc, blogCategory
	FROM tblBlogs
	WHERE blogCategory = 'news'
	ORDER BY blogName
</cfquery>
<cfquery name="myPersonalBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogName, blogLoc, blogCategory
	FROM tblBlogs
	WHERE blogCategory = 'personal'
	ORDER BY blogName
</cfquery>
<cfquery name="myPolitcalBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogName, blogLoc, blogCategory
	FROM tblBlogs
	WHERE blogCategory = 'political'
	ORDER BY blogName
</cfquery>
<cfquery name="mySportsBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogName, blogLoc, blogCategory
	FROM tblBlogs
	WHERE blogCategory = 'sports'
	ORDER BY blogName
</cfquery>
<cfquery name="myBusinessBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogName, blogLoc, blogCategory
	FROM tblBlogs
	WHERE blogCategory = 'business'
	ORDER BY blogName
</cfquery>
<cfquery name="myTechBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogName, blogLoc, blogCategory
	FROM tblBlogs
	WHERE blogCategory = 'tech'
	ORDER BY blogName
</cfquery>
<cfquery name="myEntertainmentBlogs" datasource="mspot" dbtype="ODBC" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
	SELECT id, blogName, blogLoc, blogCategory
	FROM tblBlogs
	WHERE blogCategory = 'entertainment'
	ORDER BY blogName
</cfquery>

<cfset newsblogs = myNewsBlogs.recordcount>
<cfset personalblogs = myPersonalBlogs.recordcount>
<cfset politicalblogs = myPolitcalBlogs.recordcount>
<cfset sportsblogs = mySportsBlogs.recordcount>
<cfset businessblogs = myBusinessBlogs.recordcount>
<cfset techblogs = myTechBlogs.recordcount>
<cfset entertainmentblogs = myEntertainmentBlogs.recordcount>

<cfset reccounters = "#newsblogs#,#personalblogs#,#politicalblogs#,#sportsblogs#,#businessblogs#,#techblogs#,#entertainmentblogs#">
<cfset blogqueries = "myNewsBlogs,myPersonalBlogs,myPolitcalBlogs,mySportsBlogs,myBusinessBlogs,myTechBlogs,myEntertainmentBlogs">
<cfset blognames = "NEWS,PERSONAL,POLITICAL,SPORTS,BUSINESS,TECH,CULTURE">


<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Personalize Aggregator</title>
	<link rel="stylesheet" type="text/css" href="/mnspeak/styles.css">
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>

<script language="JavaScript">
function checkAll(field) {
	for (i = 0; i < field.length; i++)
		field[i].checked = true ;
	}
function uncheckAll(field) {
	for (i = 0; i < field.length; i++)
		field[i].checked = false ;
	}
function checkCatTheBoxes() {
	opts = document.myform.blgs.length;
	var txtstr = "edtedblogs.cfm?m=";
	for (i = 0; i < opts; i++) {
		if (document.myform.blgs[i].checked) {
			txtstr = txtstr+document.myform.blgs[i].value+","
		}
	}
	document.forms[0].action = txtstr;
}
</script>
</head>

<body background="/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">
<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="../header.cfm">
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
				<tr>
				<tr>
					<td colspan="3">
						<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#C9CED5" style="border: 1px solid Black; padding: 2px; margin-top: 10px;">
							<tr>
								<td>
								<div class="blogcopy"><strong>What is this?</strong> Use this page to create a personalized aggregator. Just check the sources below that you want to see in your aggregator, and then his the 'Save' button at the bottom of the page.</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="10%">&nbsp;</td>
					<td width="80%" align="center" valign="top"><br />
						<form name="myform" onSubmit="return checkCatTheBoxes()" action="" method="post" enctype="multipart/form-data">
							<input class="searchbutton" type="button" name="CheckAll" value="Check All" onClick="checkAll(document.myform.blgs)">
							<input class="searchbutton" type="button" name="UnCheckAll" value="Uncheck All" onClick="uncheckAll(document.myform.blgs)">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
							<cfloop index="blah" from="1" to="7">
							<tr>
								<td colspan="3">
								<div class="titlebar">&raquo;<cfoutput>#listGetAt(blognames, blah)#</cfoutput> SOURCES</div>
								</td>
							</tr>
							<tr>
								<td align="left" valign="top">
								<cfset counter = 0>
								<cfset rowcounter = #int(listGetAt(reccounters, blah)/3)#+1>
								<cfloop query="#listGetAt(blogqueries, blah)#">
									<cfset counter = counter + 1>
									<cfoutput><input type="checkbox" name="blgs" value="#id#"<cfif #session.loggedin# is "TRUE"><cfloop index="blah" from="1" to="#ListLen(mySourcesCheckedList)#"><cfif listGetAt(mySourcesCheckedList, blah) IS id> checked</cfif></cfloop></cfif>> <a href="#blogLoc#" target="_blank">#blogName#</a><br /></cfoutput>
									<cfif counter EQ rowcounter-1></td><td align="left" valign="top"></cfif>
									<cfif counter EQ rowcounter*2-1></td><td align="left" valign="top"></cfif>
									<cfif counter EQ rowcounter*3></td><td align="left" valign="top"></cfif>
								</cfloop>
								</td>
							</tr>
							</cfloop>
							<tr>
								<td colspan="3" align="right"><br>
								<input class="searchbutton" type="submit" value="Save">
								</td>
							</tr>
						</table>
						</form>
						<br /><br />
					</td>
					<td width="10%">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br>
</body>	
</html>

