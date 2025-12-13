
<cfscript>
function formatText(myText) {
	var textToChange = myText;
	textToChange = ReReplace(textToChange, '\r','<br />','ALL');	
	return textToChange;
	}
</cfscript>

<cfset mytext = formatText(Form.comComment)>

<cfquery name="updatethatcommentcolumn" datasource="mspot">
	UPDATE mnCal
	SET commentnum = commentnum + 1
	WHERE calEntry = #form.comCalID#
</cfquery>
<cfquery name="updatethatcommentstable" datasource="mspot">
	INSERT INTO tblCalComments(comCalID, comName, comURL, comComment)
	VALUES(#form.comCalID#, '#form.comName#', '#form.comURL#', '#form.comComment#')
</cfquery>



<cfmail to="mnspeak@gmail.com" from="mnspeak@gmail.com" subject="MNspeak Calendar Comment" type="HTML">
#form.comName#<br><br>#form.comComment#
</cfmail>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MNspeak.com</title>
	<link rel="stylesheet" type="text/css" href="/mnspeak/styles.css">
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>
</head>

<body background="/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">
<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="header.cfm">								
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
				<tr>
					<td align="center" valign="top"><br>
					<p align="center">Yo, thanks for leaving a comment.<br /><br />
					&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/calendar.cfm?calnum=<cfoutput>#Form.comCalID#</cfoutput>">Go back and see what you wrote.</a><br /><br />
					&raquo;&raquo; <a href="http://www.mnspeak.com/">Go back to the homepage.</a><br /><br />
					</p>
					<br><br>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br>
</body>	
</html>

