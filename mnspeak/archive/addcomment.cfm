<cfset bad = "true">

<cfif lcase(form.spamfield) EQ "mnspeak">
	<cfset bad = "false">
	
	<cfset naughty = "<h1,<hr,<div,<h2,<li,<ol,<font,<table,<tr,<td,<block,<span,<center,<h3,<script">
	<cfloop index="spamWords" from="1" to="#ListLen(naughty)#">
		<cfif form.comComment CONTAINS #trim(listGetAt(naughty, spamWords))#>
			<cfset bad = "true">
			<cfbreak> 
		</cfif>
	</cfloop>
</cfif>





<cfif bad EQ "false">

<cfscript>
function formatText(myText) {
	var textToChange = myText;
	textToChange = ReReplace(textToChange, '\r','<br />','ALL');	
	return textToChange;
	}
</cfscript>

<cfset mytext = formatText(Form.comComment)>

<cfif mytext DOES NOT CONTAIN "<h1>" AND mytext DOES NOT CONTAIN "phentermine" AND mytext DOES NOT CONTAIN "poker">

	<cfquery username="fimoculous" password="fmcr5473" name="checkcount" datasource="mspot">
			SELECT COUNT(*) as ct 
			FROM tblPasswords 
			WHERE LCase(UserID) = Trim(LCase('#form.comName#'))
	</cfquery>
	
	<cfif checkcount.ct EQ 0 OR form.regUser EQ 1>
		<cfset dComDate = DateAdd("h", -1, Now())>
		<cfset Variables.comDate = "{ts '" & DateFormat(dComDate, "yyyy-mm-dd") & " " & TimeFormat(dComDate, "HH:mm:ss") & "'}">
	
		<!--- log the commenter's ip address --->
		<cftry>
			<cfif form.regUser EQ 1>
				<cfset LoggedInName = form.comName>	<!--- screen name of logged in user --->
			<cfelse>
				<cfset LoggedOutName = form.comName><!--- screen name of logged out, anonymous user --->
			</cfif>
			<cfset Comment = "#form.comEntryID#:#mytext#"> <!--- include the post number and the comment text --->
			<cfset LogFilePathAbsolute = GetDirectoryFromPath(GetCurrentTemplatePath())> <!--- just dump where we stand and worry about covering up the smell later --->
			<cfset LogDatetime = Variables.comDate>
			<cfinclude template="logvisitor.cfm">
			<cfcatch type="Any">
				<!-- ** WARNING: logging error ** -->
			</cfcatch>
		</cftry>

		<cfquery name="updatethatcommentstable" datasource="mspot">
			INSERT INTO tblComments(comEntryID, comName, comURL, comComment, comDate, regUser)
			VALUES(#form.comEntryID#, '#form.comName#', '#form.comURL#', '#mytext#', #Variables.comDate#, #trim(form.regUser)#)
		</cfquery>
		
		<cfquery name="updatethatcommentcolumn" datasource="mspot">
			UPDATE tblContent
			SET commentnum = commentnum + 1
			WHERE entrynumber = #form.comEntryID#
		</cfquery>
		
		<cfquery name="getemaillist" datasource="mspot">
			SELECT emails
			FROM tblContent
			WHERE entrynumber = #form.comEntryID#
		</cfquery>
		<cfset emaillist = ValueList(getemaillist.emails)>
		<cfloop index="i" from="1" to="#ListLen(emaillist)#">
			<cfmail to="#listGetAt(emaillist, i)#" from="mnspeak@gmail.com" subject="MNspeak Comment Added" type="HTML">
		Hello from MNspeak.com. You requested to be informed when the post <a href="http://www.mnspeak.com/mnspeak/archive/post-#form.comEntryID#.cfm">#form.posttitle#</a> has a new comment. It just happened.
			</cfmail>
			<!---keeps out duplicates--->
			<cfif isDefined("form.emailaddy")>
			<cfif listGetAt(emaillist, i) EQ form.emailaddy>
			<cfset dontdoit="true">
			</cfif>
			</cfif>
		</cfloop>
		
		<cfif isDefined("form.emails")>
			<cfif isDefined("dontdoit")>
			<cfelse>
			<cfquery name="setemaillist" datasource="mspot">
				UPDATE tblContent
				SET emails = '#getemaillist.emails#'+','+'#form.emailaddy#'
				WHERE entrynumber = #form.comEntryID#
			</cfquery>
			</cfif>
		</cfif>
		<!---
			<cfmail to="mnspeak@gmail.com" from="mnspeak@gmail.com" subject="MNspeak Comment" type="HTML">
			#form.comName#<br><br>#form.posttitle#<br><br>#form.comComment#
			</cfmail>
		--->
	
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
		<cfinclude template="../header.cfm">								
					<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
						<tr>
							<td align="center" valign="top"><br>
							<p align="center">Yo, thanks for leaving a comment.<br /><br />
							&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/archive/post-<cfoutput>#comEntryID#</cfoutput>.cfm#comments">Go back and see what you wrote.</a><br /><br />
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
		</body></html>
		
		
		<cfelse>
	
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
		<cfinclude template="../header.cfm">								
					<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
						<tr>
							<td width="30%" valign="top"></td>
							<td width="40%" valign="top"><br>
							<p>Oooops! The username you tried using is already taken by a registered user. You have three options from here:<br><br></p>
							<p>&raquo;&raquo; <a href="javascript:history.back()">Go back</a> and enter a different username.<br>
							&raquo;&raquo; If you are registered, <a href="http://www.mnspeak.com/mnspeak/meta/login.cfm?entryid=<cfoutput>#form.comEntryID#</cfoutput>">login</a>.<br />
							&raquo;&raquo; If you are not registered, <a href="http://www.mnspeak.com/mnspeak/meta/register.cfm">register</a>.
							</p>
							<br><br>
							</td>
							<td width="30%" valign="top"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		
		</div>
		<br>
		</body></html>
	</cfif>
</cfif>
<cfelse>
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
		<cfinclude template="../header.cfm">								
					<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
						<tr>
							<td width="30%" valign="top"></td>
							<td width="40%" valign="top"><br>
							<p>Sorry, you typed something naughty into the comment form.  It was probably a spam filter keyword or an html tag which is not allowed.<br><br></p>
							<p>&raquo;&raquo; <a href="javascript:history.back()">Go back</a> and try again.<br>
							&raquo;&raquo; If you are registered, <a href="http://www.mnspeak.com/mnspeak/meta/login.cfm?entryid=<cfoutput>#form.comEntryID#</cfoutput>">login</a>.<br />
							&raquo;&raquo; If you are not registered, <a href="http://www.mnspeak.com/mnspeak/meta/register.cfm">register</a>.
							</p>
							<br><br>
							</td>
							<td width="30%" valign="top"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		
		</div>
		<br>
		</body></html>
</cfif>
	


