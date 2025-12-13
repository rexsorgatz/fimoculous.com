<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfquery name="myCatsChecked" datasource="mspot">
	SELECT id, coid, category 
	FROM tblCategoriesContent
</cfquery>
<cfoutput query="myCatsChecked">
#id# - #coid# - #category# <br />
</cfoutput>

</body>
</html>
