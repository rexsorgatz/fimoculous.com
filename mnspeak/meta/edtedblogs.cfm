<cfquery name="clearBlogs" datasource="mspot" dbtype="ODBC">
	DELETE FROM tblUserBlogs
	WHERE userid = '#Session.UserID#'
</cfquery>

<cfset mySourcesCheckedList = #URL.m#>

<cfloop index="blah" from="1" to="#ListLen(mySourcesCheckedList)#">
	<cfquery name="updateBlogs" datasource="mspot">
		INSERT INTO tblUserBlogs(userid, blogsource)
		VALUES('#Session.UserID#', #listGetAt(mySourcesCheckedList, blah)#)
	</cfquery>
</cfloop>

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
						<cfif ListLen(mySourcesCheckedList) EQ 0>
							<p align="center">
							<strong>You didn't select any sources.</strong><br /><br />
							&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/meta/editblogs.cfm">Try again.</a><br /><br />
							&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/aggregator/index-chron.cfm">Go back to the aggregator.</a><br /><br />
							</p>
						<cfelse>
							<p align="center">
							<strong>You have updated your personalized aggregator.</strong><br /><br />
							&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/aggregator/index-personal.cfm">Try out your personalized aggregator.</a><br /><br />
							&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/meta/editblogs.cfm">Go back and add more sources to your aggregator.</a><br /><br />
							</p>
						</cfif>
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

