
<cfscript>
function formatText(myText) {
	var textToChange = myText;
	textToChange = ReReplace(textToChange, '  ',' ','ALL');	
	return textToChange;
	}
</cfscript>

<cfset mytext = formatText(Form.entry)>

<cfquery name="submitpost" datasource="mspot">
	INSERT INTO tblContent(accepted, longpost, hascomments, thisdate, author, title, commentnum, entry<cfif isDefined("form.emails")>, emails</cfif>)
	VALUES(#form.accepted#, #form.longpost#, #form.hascomments#, '#form.thisdate#', '#form.author#', '#form.title#', #form.commentnum#, '#mytext#'<cfif isDefined("form.emails")>, '#form.useremail#'</cfif>)
</cfquery>

<cfmail to="mnspeakpost@gmail.com,editors@mnspeak.com" from="mnspeak@gmail.com" subject="MNspeak Post" type="HTML">
#form.author#:  #Form.title# <br /><br /> #Form.entry#
</cfmail>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Meta</title>
	<link rel="stylesheet" type="text/css" href="/mnspeak/styles.css">
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>
</head>

<body background="/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">
<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="../header.cfm">								
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
				<tr>
					<td align="center" valign="top"><br>
					<p align="center">Yo, thanks for leaving the post. It should be moderated and posted relatively quickly.<br /><br />
					&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/meta/">See your post on MNspeak Unfiltered.</a><br /><br />
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

