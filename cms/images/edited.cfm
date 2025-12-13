<cffile action="upload" filefield="form.imageAlt" destination="c:\websites\fimoculous\images\" nameconflict="overwrite">
<cfobject type="JAVA" action="Create" name="tk" class="java.awt.Toolkit"></cfobject>
<cfobject type="JAVA" action="Create" name="img" class="java.awt.Image"></cfobject>
<cfscript>
	loc = CFFILE.ServerFile;
	img = tk.getDefaultToolkit().getImage("c:\websites\fimoculous\images\#loc#");
	width = img.getWidth();
	height = img.getHeight();
</cfscript>

<cfset operation = "Image Added">

<cfquery username="fimoculous" password="fmcr5473" name="insertimagevals" datasource="mspot">
	INSERT into tblImages(imageName, imagePath, imageWidth, imageHeight)
	VALUES ('#Form.imageName#', '#loc#', '#width#', #height#)
</cfquery>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>
<cfinclude template="../header.cfm">
<cfquery name="imageQuery" datasource="mspot" maxrows=1 dbtype="ODBC">
	SELECT *
	FROM tblImages
	ORDER BY imageID DESC
</cfquery>
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td>
			<cfoutput>
			<strong>#Operation#</strong>
			</cfoutput>
			<br><br>
			<a href="/cms/images/"><b>&raquo;Back To Image Admin</b></a><br><br>
			<a href="/cms/"><b>&raquo;Back To Main Admin</b></a><br><br>
		</td>
	</tr>
</table>






</body>
</html>
