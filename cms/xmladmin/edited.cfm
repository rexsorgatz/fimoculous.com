<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>
<cfinclude template="../header.cfm">

<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td>
			<br><br>
			<a href="/cms/xmladmin/"><b>&raquo;Back To XML Admin</b></a><br><br>
			<a href="/cms/"><b>&raquo;Back To Main Admin</b></a><br><br>
		</td>
	</tr>
</table>

<cfsavecontent variable="commentsXML"><str>
<order><cfoutput>#form.v1#</cfoutput></order>
<order><cfoutput>#form.v2#</cfoutput></order>
<order><cfoutput>#form.v3#</cfoutput></order>
<order><cfoutput>#form.v4#</cfoutput></order>
<order><cfoutput>#form.v5#</cfoutput></order>
<order><cfoutput>#form.v6#</cfoutput></order>
<order><cfoutput>#form.v7#</cfoutput></order>
<order><cfoutput>#form.v8#</cfoutput></order>
<order><cfoutput>#form.v9#</cfoutput></order>
<order><cfoutput>#form.v10#</cfoutput></order>
<order><cfoutput>#form.v11#</cfoutput></order>
</str>
</cfsavecontent>
<cffile action="write" file="c:\websites\fimoculous\str.xml" output="#commentsXML#">


</body>
</html>
