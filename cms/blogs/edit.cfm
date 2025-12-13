<cfif IsDefined("id")>
	<cfset NewEntry = "No">
	<cfelse>
	<cfset NewEntry = "Yes">
</cfif>

<cfif NewEntry IS "No">
<cfquery name="myBlogs" datasource="mspot" dbtype="ODBC">
	SELECT id, blogName, blogLoc, feedLoc, feedType, blogThumb, blogCategory, blogOnline, date_one, content_one, headline_one, link_one
	FROM tblBlogs
	WHERE id = #id#
</cfquery>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="../header.cfm">
<form action="edited.cfm" method="post" enctype="multipart/form-data">
	<cfif NewEntry IS "No">
		<cfoutput query="myBlogs">
		<input type="hidden" name="id" value="#id#">
	</cfoutput>
	</cfif>
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td align="left"><strong>Blog Name:</strong></td>
		<td align="left"><input type="text" name="blogName" size="40" <cfif NewEntry IS "No"><cfoutput query="myBlogs"> value="#Trim(blogName)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Blog Online:</strong></td>
		<td align="left"><input type="text" name="blogOnline" size="40" <cfif NewEntry IS "No"><cfoutput query="myBlogs"> value="#Trim(blogOnline)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Blog Category:</strong></td>
		<td align="left"><input type="text" name="blogCategory" size="40" <cfif NewEntry IS "No"><cfoutput query="myBlogs"> value="#Trim(blogCategory)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Blog Thumb:</strong></td>
		<td align="left"><input type="text" name="blogThumb" size="40" <cfif NewEntry IS "No"><cfoutput query="myBlogs"> value="#Trim(blogThumb)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Blog Location:</strong></td>
		<td align="left"><input type="text" name="blogLoc" size="40" <cfif NewEntry IS "No"><cfoutput query="myBlogs"> value="#Trim(blogLoc)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Feed Location:</strong></td>
		<td align="left"><input type="text" name="feedLoc" size="40" <cfif NewEntry IS "No"><cfoutput query="myBlogs"> value="#Trim(feedLoc)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Feed Type:</strong></td>
		<td align="left"><input type="text" name="feedType" size="40" <cfif NewEntry IS "No"><cfoutput query="myBlogs"> value="#Trim(feedType)#"</cfoutput></cfif>></td>
	</tr>
	<cfif NewEntry IS "No">
	<tr>
		<td colspan="2" align="left"><strong><cfoutput query="myBlogs"><a href="#link_one#" target="_blank">#headline_one#</a></cfoutput></strong></td>
	</tr>
	<tr>
		<td align="left"><strong>Post Date:</strong></td>
		<td align="left"><cfoutput query="myBlogs">#Trim(date_one)#</cfoutput></td>
	</tr>
	<tr>
		<td align="left"><strong>Post Content:</strong></td>
		<td align="left"><cfoutput query="myBlogs">#content_one#</cfoutput></td>
	</tr>
	</cfif>
	<tr>
		<td colspan="2" align="center"><br>
		<cfif NewEntry IS "Yes">
		<input type="submit" value="Add Blog">
		<cfelse>
		<input type="submit" value="Update Blog">
		</cfif>
		</form>
		</td>
	</tr>
</table>

</body>
</html>
