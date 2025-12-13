
<cfif IsDefined("numberID")>
	<cfset NewEntry = "No">
<cfelse>
	<cfset NewEntry = "Yes">
</cfif>

<cfif NewEntry IS "No">
	<cfquery username="fimoculous" password="fmcr5473" name="userQuery" datasource="mspot">
		SELECT UserID, Password, numberID, displayName, userEmail, userWebsite, userPic, userFullName, userBio, adminRights, userZip, userAIM
		FROM tblPasswords
		WHERE numberID = #URL.numberID#
	</cfquery>
	<cfquery username="fimoculous" password="fmcr5473" name="userBlogQuery" datasource="mspot">
		SELECT id, userid, blogsource
		FROM tblUserBlogs 
		WHERE userid = '#URL.userID#'
	</cfquery>
	<cfset myBlogList = ValueList(userBlogQuery.blogsource)>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<form action="edited.cfm" method="post" enctype="multipart/form-data">
<cfif NewEntry IS "No">
<cfoutput query="userQuery">
<input type="hidden" name="numberID" value="#numberID#">
</cfoutput>
</cfif>
<cfinclude template="../header.cfm">

<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td>Login:</td>
		<td><input type="text" name="UserID" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(UserID)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Password:</td>
		<td><input type="text" name="Password" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(Password)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Admin Rights:</td>
		<td><input type="text" name="adminRights" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(adminRights)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Full Name:</td>
		<td><input type="text" name="userFullName" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(userFullName)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Display Name:</td>
		<td><input type="text" name="displayName" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(displayName)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Email:</td>
		<td><input type="text" name="userEmail" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(userEmail)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Website:</td>
		<td><input type="text" name="userWebsite" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(userWebsite)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Zip Code:</td>
		<td><input type="text" name="userZip" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(userZip)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>AIM:</td>
		<td><input type="text" name="userAIM" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(userAIM)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Picture:</td>
		<td><input type="text" name="userPic" size="20" <cfif NewEntry IS "No"><cfoutput query="userQuery"> value="#Trim(userPic)#"</cfoutput></cfif>></td>
	<tr>
	<tr>
		<td>Blogs:</td>
		<td><cfif NewEntry IS "No"><cfoutput>#Trim(myBlogList)#</cfoutput></cfif></td>
	<tr>
	<tr>
		<td>Bio:</td>
		<td><textarea cols="25" rows="5" name="userBio"><cfif NewEntry IS "No"><cfoutput query="userQuery">#Trim(userBio)#</cfoutput></cfif></textarea></td>
	<tr>
	<tr>
		<td colspan="2" align="right"><br>
		<cfif NewEntry IS "Yes">
		<input type="submit" value="Add User">
		<cfelse>
		<input type="submit" value="Update User">
		</cfif>
		</td>
	</tr>
</table>
</form>

</body>
</html>
