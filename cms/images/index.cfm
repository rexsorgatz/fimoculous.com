

<cfquery name="imageQuery" datasource="mspot" dbtype="ODBC">
	SELECT imageID, imageName, imagePath
	FROM tblImages
	ORDER BY imageID DESC
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>



<cfinclude template="../header.cfm">
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td colspan="4" align="center"><a href="/cms/images/edit.cfm"><strong>Add A New Image</strong></a></td>
	</tr>
	<tr>
		<td><strong>#</strong></td>
		<td><strong>Name</strong></td>
		<td><strong>Path</strong></td>
		<td><strong>Action</strong></td>
	</tr>
<cfoutput query="imageQuery">
	<tr>
		<td>#imageID#</td>
		<td><strong><a href="/cms/images/edit.cfm?imageID=#imageID#">#imageName#</a></strong></td>
		<td>#imagePath#</td>
		<td><a href="/cms/images/delete.cfm?imageID=#imageID#">del</a></td>
	</tr>
</cfoutput>
</table>

</body>
</html>
