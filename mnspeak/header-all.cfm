
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>MNspeak.com</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src="scripts.js"></script>
</head>
<cfset credits = "Rex Sorgatz,Margaret Andrews,Margaret Andrews,Rex Sorgatz,Margaret Andrews,Linda Bernin,Margaret Andrews,Margaret Andrews,Margaret Andrews,Margaret Andrews,Margaret Andrews,Margaret Andrews,Margaret Andrews,Margaret Andrews">
<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#C9CED5">
	<tr>
		<td style="padding: 5px;"><strong> <cfoutput>#listLen(credits)#</cfoutput> banners currently in rotation on MNspeak.com:</strong></td>
	</tr>
	<tr>
		<td>
			<cfloop index="i" from="1" to="14">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center" valign="top"><img width="800" height="260" border="0" style="border-top: 1px #3A3A3A solid; border-bottom: 1px #3A3A3A solid;" src="http://www.mnspeak.com/mnspeak/images/structure/header<cfoutput>#i#</cfoutput>.jpg"></td>
				</tr>
				<tr>
					<td align="right" valign="top" class="author">photo by: <cfoutput>#listGetAt(credits, i)#</cfoutput>&nbsp;<br /><br /></td>
				</tr>
			</table>
			</cfloop>
		</td>
	</tr>
</table>


</div>
<br />
</body>	
</html>









