

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="../header.cfm">

<cfif IsDefined("URL.imageID")>
<cfquery name="imageQuery" datasource="mspot" dbtype="ODBC">
	SELECT *
	FROM tblImages
	WHERE imageID = #URL.imageID#
</cfquery>

<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td align="left"><textarea cols="70" rows="10"><cfoutput query="imageQuery"><img src="http://www.fimoculous.com/images/#imagePath#" align="right" height="#imageHeight#" width="#imageWidth#" alt="#imageName#" /></cfoutput></textarea></td>
	<tr>
</table>


<cfelse>

<form action="edited.cfm" method="post" enctype="multipart/form-data" name="myform" id="myform">
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td align="left"><strong>Image Name:</strong></td>
		<td align="left"><input type="text" name="imageName" size="20"></td>
	<tr>
	<tr>
		<td align="left"><strong>Image Path:</strong></td>
		<td align="left"><input type="file" name="imageAlt" size="20"></td>
	<tr>
	<tr>
		<td colspan="2" align="right">
		<input type="submit" value="Add Image">
		</form>
		</td>
	</tr>
</table>

</cfif>

</body>
</html>
