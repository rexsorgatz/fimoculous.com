<cfif IsDefined("calEntry")>
	<cfset NewEntry = "No">
	<cfelse>
	<cfset NewEntry = "Yes">
</cfif>

<cfif NewEntry IS "No">
	<cfquery name="calContent" datasource="mspot" username="fimoculous" password="fmcr5473">
		SELECT myDate, topItemLocation, topItemPicture, topItemCaption, topItemLink, relatedItems, calEntry, calEvent, myTime, calAuthor
		FROM mnCal
		WHERE calEntry = #URL.calEntry#
	</cfquery>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="../header.cfm">
<form action="edited.cfm" method="post" enctype="multipart/form-data">
	<cfif NewEntry IS "No">
		<cfoutput query="calContent">
		<input type="hidden" name="calEntry" value="#URL.calEntry#">
		</cfoutput>
	<cfelse>
		<input type="hidden" name="commentnum" value="0">
	</cfif>
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td align="left"><strong>Event:</strong></td>
		<td align="left"><input type="text" name="calEvent" size="40" <cfif NewEntry IS "No"><cfoutput query="calContent"> value="#calEvent#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Date/Time:</strong></td>
		<td align="left"><input type="text" name="myDate" size="10" value="<cfif NewEntry IS "No"><cfoutput query="calContent">#DateFormat(myDate, "m/d/yy")#</cfoutput><cfelse><cfoutput>#DateFormat(Now(), "m/d/yy")#</cfoutput></cfif>">&nbsp;&nbsp;<input type="text" name="myTime" size="10" <cfif NewEntry IS "No"><cfoutput query="calContent"> value="#myTime#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Author:</strong></td>
		<td align="left"><input type="text" name="calAuthor" size="40" <cfif NewEntry IS "No"><cfoutput query="calContent"> value="#calAuthor#"</cfoutput><cfelse> value="<cfoutput>#Session.UserID#</cfoutput>"</cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Venue:</strong></td>
		<td align="left"><input type="text" name="topItemLocation" size="40" <cfif NewEntry IS "No"><cfoutput query="calContent"> value="#topItemLocation#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Image:</strong></td>
		<td align="left"><input type="text" name="topItemPicture" size="40" <cfif NewEntry IS "No"><cfoutput query="calContent"> value="#topItemPicture#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Link:</strong></td>
		<td align="left"><input type="text" name="topItemLink" size="40" <cfif NewEntry IS "No"><cfoutput query="calContent"> value="#topItemLink#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Description:</strong></td>
		<td align="left"><textarea cols="33" rows="10" name="topItemCaption"><cfif NewEntry IS "No"><cfoutput query="calContent">#topItemCaption#</cfoutput></cfif></textarea></td>
	</tr>
	<tr>
		<td align="left"><strong>More Events Today:</strong></td>
		<td align="left"><textarea cols="33" rows="10" name="relatedItems"><cfif NewEntry IS "No"><cfoutput query="calContent">#relatedItems#</cfoutput></cfif></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<cfif NewEntry IS "Yes">
		<input type="submit" value="Add Entry">
		<cfelse>
		<input type="submit" value="Update Entry">
		</cfif>
		</td>
	</tr>
</table>
</form>

</body>
</html>
