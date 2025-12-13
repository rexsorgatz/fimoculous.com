<cfset myCats = ArrayNew(1)>
<cfset myCats[1] = "online">
<cfset myCats[2] = "music">
<cfset myCats[3] = "film">
<cfset myCats[4] = "tv">
<cfset myCats[5] = "books">
<cfset myCats[6] = "games">
<cfset myCats[7] = "videos">
<cfset myCats[8] = "tshirts">
<cfset myCats[9] = "misc">
<cfset myCats[10] = "work">
<cfset myCats[11] = "convo">

<cfset myCatLen = ArrayNew(1)>
<cfhttp url="http://www.fimoculous.com/str.xml" method="get" timeout="10">
<cfset objRSS = xmlParse(cfhttp.filecontent)>
<cfset MyXMLRoot = objRSS.XmlRoot>
<cfset totalitems = arraylen(MyXMLRoot.order)>
<cfloop index="itm" from="1" to="#totalitems#">
	<cfset ArrayAppend(myCatLen, "#MyXMLRoot.order[itm].xmltext#")>
</cfloop>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>
<form action="edited.cfm" method="post" enctype="multipart/form-data" name="myform" id="myform">
<cfinclude template="../header.cfm">
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
<cfloop index="blah" from="1" to="#ArrayLen(myCats)#">
<cfoutput>
	<tr>
		<td><strong>#myCats[blah]#</strong></td>
		<td><input type="text" name="v#blah#" value="#myCatLen[blah]#" size="3"></td>
	</tr>
</cfoutput>
</cfloop>
	<tr>
		<td colspan="2" align="right">
		<input type="submit" value="Submit">
		</td>
	</tr>
</table>
</form>

</body>
</html>
