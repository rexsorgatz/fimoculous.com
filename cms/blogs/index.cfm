
<cfquery name="myBlogs" datasource="mspot" dbtype="ODBC">
	SELECT id, blogName, blogLoc, feedLoc, feedType, lastEdited, blogContent, blogCategory, blogOnline, date_one 
	FROM tblBlogs
	ORDER BY blogName ASC
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>
<cfinclude template="../header.cfm">
<br />
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td colspan="6" align="center"><strong><a href="http://www.mnspeak.com/mnspeak/parser-run.cfm" target="_blank">Run The Parser</a></strong></td>
	</tr>
	<tr>
		<td colspan="6" align="center"><a href="edit.cfm"><b>Add A New Blog</b></a></td>
	</tr>
	<tr>
		<td><b>#</b></td>
		<td><b>row</b></td>
		<td><b>Blog</b></td>
		<td><b>Category</b></td>
		<td><b>On?</b></td>
		<td align="center"><b>Action</b></td>
	</tr>
<cfoutput query="myBlogs">
	<tr>
		<td><strong>#id#</strong></td>
		<td><strong>#currentrow#</strong></td>
		<td><a href="#blogLoc#" target="_blank"><b>#blogName#</b></a> - <a href="#feedLoc#" target="_blank">#feedType#</a></td>
		<td>#blogCategory#</td>
		<td>#blogOnline#</td>
		<td align="center" nowrap><a href="edit.cfm?id=#id#">edit</a> | <a href="delete.cfm?id=#id#">del</a></td>
	</tr>
</cfoutput>
<cfoutput>
	<tr>
		<td colspan="6" align="right"><strong>Total Blogs: #myBlogs.RecordCount#</strong></td>
	</tr>
</table>
</cfoutput>
<br />
</body>
</html>
