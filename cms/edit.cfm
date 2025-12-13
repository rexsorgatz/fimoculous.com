<cfif cgi.http_host contains "mnspeak.com">
<cfset ds="mspot">
<cfelse>
<cfset ds="fimothree">
</cfif> 

<cfif IsDefined("entrynumber")>
	<cfset NewEntry = "No">
<cfelse>
	<cfset NewEntry = "Yes">
</cfif>

<cfif NewEntry IS "No">
<cfif cgi.http_host contains "mnspeak.com">
	<cfquery username="fimoculous" password="fmcr5473" name="DailyEntry" datasource="#ds#">
		SELECT entrynumber, title, thisdate, entry, hascomments, author, longpost, entrylong, accepted, emails, placement
		FROM tblContent
		WHERE entrynumber = #url.entrynumber#
	</cfquery>
<cfelse>
	<cfquery username="fimoculous" password="fmcr5473" name="DailyEntry" datasource="#ds#">
		SELECT entrynumber, title, thisdate, entry, hascomments, author, longpost
		FROM tblContent
		WHERE entrynumber = #url.entrynumber#
	</cfquery>
</cfif> 
	<cfquery name="myCatsChecked" datasource="#ds#">
		SELECT id, coid, category 
		FROM tblCategoriesContent
		WHERE coid = #url.entrynumber#
	</cfquery>
	<cfset myCatsCheckedList = ValueList(myCatsChecked.category)>
</cfif>
	<cfquery name="myCats" datasource="#ds#" dbtype="ODBC">
		SELECT cat_short, cat_long
		FROM tblCategories
		ORDER BY cat_short ASC
	</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
<script language="JavaScript">
function checkCatTheBoxes() {
	opts = document.myform.cbs.length;
	var txtstr = "edited.cfm?";
	for (i = 0; i < opts; i++) {
		if (document.myform.cbs[i].checked) {
			txtstr = txtstr+document.myform.cbs[i].value+"=1&"
		}
	}
	document.forms[0].action = txtstr;
}
function checkboxchecker() {
	if (document.myform.hascomments.checked) {
		document.myform.hascomments.value = 1;
	} else {
		document.myform.hascomments.value = 0;
	}
}

</script>
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<form onSubmit="return checkCatTheBoxes()" action="" method="post" enctype="multipart/form-data" name="myform" id="myform">
<cfif NewEntry IS "No">
<cfoutput query="DailyEntry">
<input type="hidden" name="entrynumber" value="#entrynumber#">
</cfoutput>
</cfif>
<input type="hidden" name="hascomments" value="1">

<cfinclude template="header.cfm">

<table width="650" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td align="left"><strong>Entry Title:</strong></td>
		<td align="left"><input type="text" name="title" size="40" <cfif NewEntry IS "No"><cfoutput query="DailyEntry"> value="#Trim(title)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Entry Date:</strong></td>
		<td align="left"><input type="text" name="thisdate" size="10" <cfif NewEntry IS "No"><cfoutput query="DailyEntry"> value="#DateFormat(thisdate, "m/d/yy")#"</cfoutput><cfelse><cfoutput> value="#DateFormat(Now(), "MM/DD/YY")#"</cfoutput></cfif>></td>
	</tr>
	<cfif cgi.http_host contains "mnspeak.com">
	<tr>
		<td align="left"><strong>Entry Placement:</strong></td>
		<td align="left"><input type="text" name="placement" size="1" <cfif NewEntry IS "No"><cfoutput query="DailyEntry"> value="<cfif len(placement) GT 0>#int(placement)#<cfelse>0</cfif>"</cfoutput><cfelse><cfoutput> value="1"</cfoutput></cfif>></td>
	</tr>
	</cfif>
	<tr>
		<td align="left"><strong>Author:</strong></td>
		<td align="left"><input type="text" name="author" size="10" <cfif NewEntry IS "No"><cfoutput query="DailyEntry"> value="#Trim(author)#"</cfoutput><cfelse><cfoutput>value="#Session.UserID#"</cfoutput></cfif>></td>
	</tr>
	<cfif cgi.http_host contains "mnspeak.com">
	<tr>
		<td align="left"><strong>Accepted:</strong></td>
		<td align="left"><input type="checkbox" name="accepted" <cfif NewEntry IS "No"><cfoutput query="DailyEntry"> <cfif accepted IS "1">value="1" checked</cfif></cfoutput><cfelse>value="1" checked</cfif>></td>
	</tr>
	</cfif>
	<tr>
		<td align="left"><strong>Long Post:</strong></td>
		<td align="left"><input type="checkbox" name="longpost" <cfif NewEntry IS "No"><cfoutput query="DailyEntry"> <cfif longpost IS "1">value="1" checked</cfif></cfoutput><cfelse>value="0"</cfif>></td>
	</tr>
	<cfif cgi.http_host contains "mnspeak.com">
	<tr>
		<td align="left"><strong>Email List:</strong></td>
		<td align="left"><input type="text" name="emails" size="30" <cfif NewEntry IS "No"><cfoutput query="DailyEntry"> value="#Trim(emails)#"</cfoutput></cfif>></td>
	</tr>
	</cfif>
	<tr>
		<td colspan="2" align="center">
		<textarea style="width:100%; height: 200px;" id="comComment" name="comComment"><cfif NewEntry IS "No"><cfoutput query="DailyEntry">#Trim(entry)#</cfoutput></cfif></textarea> 
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<div id="toolbar">
				<img class="buttons" onmouseover="mouseover(this);" onmouseout="mouseout(this);" onmousedown="mousedown(this);" onmouseup="mouseup(this);" onclick="return pnhEditTextarea('comComment','strong')" src="http://www.fimoculous.com/mnspeak/images/misc/bold.gif">
				<img class="buttons" onmouseover="mouseover(this);" onmouseout="mouseout(this);" onmousedown="mousedown(this);" onmouseup="mouseup(this);" onclick="return pnhEditTextarea('comComment','emphasis')" src="http://www.fimoculous.com/mnspeak/images/misc/italic.gif">
				<img class="buttons" onmouseover="mouseover(this);" onmouseout="mouseout(this);" onmousedown="mousedown(this);" onmouseup="mouseup(this);" onclick="return pnhEditTextarea('comComment','a_href')" src="http://www.fimoculous.com/mnspeak/images/misc/link.gif" width="32" height="16" align="middle">
			</div>
		</td>
	</tr>
	<cfif cgi.http_host contains "mnspeak.com">
	<cfif isDefined("DailyEntry.longpost")>
	<cfif DailyEntry.longpost IS "1">
	<tr>
		<td colspan="2" align="center">
		<textarea style="width:100%; height: 200px;" name="entrylong"><cfif NewEntry IS "No"><cfoutput query="DailyEntry">#Trim(entrylong)#</cfoutput></cfif></textarea> 
		</td>
	</tr>
	</cfif>
	</cfif>
	</cfif>
	<tr>
		<td colspan="2" align="left">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td align="left" valign="top">
	<cfif cgi.http_host contains "mnspeak.com">
					<cfset counter = 0>
					<cfloop query="myCats">
						<cfset counter = counter + 1>
						<cfoutput><input type="checkbox" name="cbs" value="#cat_short#"<cfif NewEntry IS "No"><cfloop index="blah" from="1" to="#ListLen(myCatsCheckedList)#"><cfif listGetAt(myCatsCheckedList, blah) IS cat_short> checked</cfif></cfloop></cfif>> #cat_short#<br /></cfoutput>
						<cfif counter EQ 16></td><td align="left" valign="top"></cfif>
						<cfif counter EQ 32></td><td align="left" valign="top"></cfif>
						<cfif counter EQ 48></td><td align="left" valign="top"></cfif>
						<cfif counter EQ 64></td><td align="left" valign="top"></cfif>
					</cfloop>
	<cfelse>
					<cfset counter = 0>
					<cfloop query="myCats">
						<cfset counter = counter + 1>
						<cfoutput><input type="checkbox" name="cbs" value="#cat_short#"<cfif NewEntry IS "No"><cfloop index="blah" from="1" to="#ListLen(myCatsCheckedList)#"><cfif listGetAt(myCatsCheckedList, blah) IS cat_short> checked</cfif></cfloop></cfif>> #cat_short#<br /></cfoutput>
						<cfif counter EQ 6></td><td align="left" valign="top"></cfif>
						<cfif counter EQ 12></td><td align="left" valign="top"></cfif>
						<cfif counter EQ 18></td><td align="left" valign="top"></cfif>
						<cfif counter EQ 24></td><td align="left" valign="top"></cfif>
					</cfloop>
	</cfif>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<cfif NewEntry IS "Yes">
		<input type="submit" value="Add Entry">
		<cfelse>
		<input type="submit" value="Update Entry">
		</cfif>
		</form>
		</td>
	</tr>
</table>

</body>
</html>
