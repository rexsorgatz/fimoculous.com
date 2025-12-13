
<cfquery name="myPostCats" datasource="mspot" dbtype="ODBC">
	SELECT cat_short, cat_long
	FROM tblCategories
	ORDER BY cat_long
</cfquery>

<cfset myBlogCats="News,Personal,Political,Sports,Business,Tech,Entertainment">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Search</title>
	<link rel="stylesheet" type="text/css" href="../styles.css">
	<script type="text/javascript" src="../scripts.js"></script>
</head>

<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="../header.cfm">							
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
				<tr>
					<td width="20%"></td>
					<td width="60%" valign="top"><br />
					<form action="http://www.mnspeak.com/mnspeak/search/search.cfm" name="searchform" id="searchform">
						<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
						<tr>
							<td align="center">Search Terms: <input type="text" name="s" size="25"><br /><br /></td>
						</tr>
						<tr>
							<td align="center" valign="top" bgcolor="#CCCCCC" style="border: 1px solid Gray; height: 90px;">
								<table width="85%" border="0" cellspacing="0" cellpadding="2" align="center">
									<tr>
										<td colspan="3" align="center"><strong>COLLECTIONS</strong><br /><br /></td>
									</tr>
									<tr>
										<td align="right">MNspeak Posts:</td>
										<td align="right">
											<select name="postcats" style="width: 200px;">
												<option value="all">All</option>
												<cfoutput query="myPostCats">
												<option value="#cat_short#">+#cat_long#</option>
												</cfoutput>
											</select>
										</td>
										<td><input type="checkbox" value="asdf" checked></td>
									</tr>
									<tr>
										<td align="right">Aggregator Sources:</td>
										<td align="right">
										 <select name="blogcats" style="width: 200px;">
											<option value="all"> All</option>
											<cfloop index="blah" from="1" to="#ListLen(myBlogCats)#">
											<cfoutput><option value="#lcase(listGetAt(myBlogCats, blah))#">+#listGetAt(myBlogCats, blah)#</option></cfoutput>
											</cfloop>
										</select>
										</td>
										<td><input type="checkbox" value="asdf" checked></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center"><br /><br /><input class="searchbutton" type="submit" value="Search"></td>
						</tr>
						</table>
					</form>
					<br /><br />
					</td>
					<td width="20%"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br />
</body>	
</html>
