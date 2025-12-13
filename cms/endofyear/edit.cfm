<cfif IsDefined("id")>
	<cfset NewEntry = "No">
	<cfelse>
	<cfset NewEntry = "Yes">
</cfif>

<cfif NewEntry IS "No">
<cfquery name="endofyear" datasource="fimothree">
	SELECT id, source, listname, link, mydate, category
	FROM tblEndOfYear
	WHERE id = #id#
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
		<cfoutput query="endofyear">
		<input type="hidden" name="id" value="#id#">
	</cfoutput>
	</cfif>
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td align="left"><strong>List Name:</strong></td>
		<td align="left"><input type="text" name="listname" size="40" <cfif NewEntry IS "No"><cfoutput query="endofyear"> value="#Trim(listname)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Source:</strong></td>
		<td align="left"><input type="text" name="source" size="40" <cfif NewEntry IS "No"><cfoutput query="endofyear"> value="#Trim(source)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Link:</strong></td>
		<td align="left"><input type="text" name="link" size="40" <cfif NewEntry IS "No"><cfoutput query="endofyear"> value="#Trim(link)#"</cfoutput></cfif>></td>
	</tr>
	<tr>
		<td align="left"><strong>Date:</strong></td>
		<td align="left"><input type="text" name="mydate" size="40" value="<cfif NewEntry IS "No"><cfoutput query="endofyear">#DateFormat(mydate, "MM/DD/YY")#</cfoutput><cfelse><cfoutput>#DateFormat(Now(), "MM/DD/YY")#</cfoutput></cfif>"></td>
	</tr>
	<tr>
		<td align="left"><strong>Category:</strong></td>
		<td align="left">
<select name="category" >
  <option value="advertising">Advertising</option>
  <option value="architecture">Architecture</option>
  <option value="art">Art</option>
  <option value="automobiles">Automobiles</option>
  <option value="books">Books</option>
  <option value="business">Business</option>
  <option value="comedy">Comedy</option>
  <option value="comics">Comics</option>
  <option value="dance">Dance</option>
  <option value="design">Design</option>
  <option value="dvd">DVD</option>
  <option value="fashion">Fashion</option>
  <option value="education">Education</option>
  <option value="film">Film</option>
  <option value="food">Food/Drink</option>
  <option value="gadgets">Gadgets</option>
  <option value="games">Games</option>
  <option value="ideas">Ideas</option>
  <option value="internet">Internet</option>
  <option value="media">Media</option>
  <option value="miscellaneous">Miscellaneous</option>
  <option value="music">Music</option>
  <option value="online">Online</option>
  <option value="paranormal">Paranormal</option>
  <option value="people">People</option>
  <option value="photos">Photos</option>
  <option value="podcasts">Podcasts</option>
  <option value="politics">Politics</option>
  <option value="religion">Religion</option>
  <option value="sports">Sports</option>
  <option value="science">Science</option>
  <option value="sex">Sex</option>
  <option value="technology">Technology</option>
  <option value="theater">Theater</option>
  <option value="toys">Toys</option>
  <option value="travel">Travel</option>
  <option value="tv">TV</option>
  <option value="musicvideos">Videos</option>
  <option value="words">Words/Search</option>
  <option value="wrestling">Wrestling</option>
</select>
	</tr>
	<tr>
		<td colspan="2" align="center"><br>
		<cfif NewEntry IS "Yes">
		<input type="submit" value="Add Link">
		<cfelse>
		<input type="submit" value="Update Link">
		</cfif>
		</form>
		</td>
	</tr>
</table>

</body>
</html>
