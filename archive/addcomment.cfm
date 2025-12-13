<cfset bad = "false">
<cfquery name="checkdate" datasource="fimothree">
	SELECT thisdate
	FROM tblContent
	WHERE entrynumber = #form.comEntryID#
</cfquery>
<cfif checkdate.thisdate GT DateAdd("d", -30, Now())><cfset bad = "false"><cfelse><cfset bad = "true"></cfif>

<cfif bad EQ "false">

<cfscript>
function formatText(myText) {
	var textToChange = myText;
	textToChange = ReReplace(textToChange, '\r','<br />','ALL');	
	return textToChange;
	}
</cfscript>

<cfset mytext = formatText(Form.comComment)>

<cfif mytext DOES NOT CONTAIN "<script>" and mytext DOES NOT CONTAIN "Acai Berry">

<!---<cfif form.comEntryID NEQ 4270>--->

<cfif lcase(form.spamfield) CONTAINS "hello">

<cfif CGI.REMOTE_ADDR NEQ "65.198.140.246" 
and CGI.REMOTE_ADDR NEQ "93.84.249.206" 
and CGI.REMOTE_ADDR NEQ "85.106.86.194" 
and CGI.REMOTE_ADDR NEQ "112.65.16.123" 
and CGI.REMOTE_ADDR NEQ "58.246.248.23" 
and CGI.REMOTE_ADDR NEQ "112.65.18.55" 
and CGI.REMOTE_ADDR NEQ "112.64.18.183" 
and CGI.REMOTE_ADDR NEQ "58.246.250.65" 
>

<cfquery name="updatethatcommentstable" datasource="fimothree">
	INSERT INTO tblComments(comEntryID, comName, comURL, comComment, comDate, ipAddy)
	VALUES(#form.comEntryID#, '#form.myComNamess#', '#form.comURL#', '#mytext#', #Now()#, '#CGI.REMOTE_ADDR#')
</cfquery>

<cfquery name="updatethatcommentcolumn" datasource="fimothree">
	UPDATE tblContent
	SET commentnum = commentnum + 1
	WHERE entrynumber = #form.comEntryID#
</cfquery>

<cfquery name="titlequery" datasource="fimothree">
	SELECT title
	FROM tblContent
	WHERE entrynumber = #form.comEntryID#
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Fimoculous.com</title>
<cfinclude template="/headerstuff2.cfm">
</head>

<body>

<div id="content">
	<div id="logo"><a href="/"><img src="/images/logo-fimoc.png" width="318" height="78" alt="Fimoculous.com"></a></div>
	<div class="post">
		<strong><p>Thanks for the comment, yo.</p>
		<p><img class="dot" src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="0" border="0"> <a href="/archive/post-<cfoutput>#comEntryID#</cfoutput>.cfm">Go back to post.</p></a>
		<p><img class="dot" src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="0" border="0"> <a href="http://www.fimoculous.com">Go back to homepage.</a></p><br><br>
	</div>
</div>
<div id="search">
	<form action="http://www.fimoculous.com/search.cfm" name="searchform" id="searchform">
		<input type="text" name="s" size="15" class="searchbox" />
		<input type="submit" value="Search" class="searchbutton" /> 
	</form>
</div>
<div id="footer">
	<div id="footer-content">
		<div id="dot-icon"><img src="/images/dot-large.png" width="13" height="13" alt=""></div>
		<h1>Rex Sorgatz</h1>
		<p><a href="http://twitter.com/fimoculous">Twitter</a> | <a href="http://www.facebook.com/rexsorgatz">Facebook</a> | <a href="http://www.flickr.com/photos/fimoculous/">Flickr</a> | <a href="http://amazon.com/o/registry/3KKN9EH42V9T4/">Amazon</a> | <a href="http://playfoursquare.com/user/fimoculous">Foursquare</a></p>
		<p><a href="mailto:rex@fimoculous.com?subject=Fimoculous&body=Your%20blog%20is%20dumb.">rex@fimoculous.com</a></p>
	</div>
</div>

<cfquery name="myComments" datasource="fimothree" maxrows=1 dbtype="ODBC">
	SELECT comID, comEntryID
	FROM tblComments
	WHERE comEntryID = #form.comEntryID#
	ORDER BY comDate DESC
</cfquery>

<cfmail to="rex@fimoculous.com" from="rex@fimoculous.com" subject="Fimoc Comment" type="HTML">
#form.myComNamess#<br><br>#titlequery.title#<br><br>#form.comComment#<br><br>http://www.fimoculous.com/archive/post-#form.comEntryID#.cfm<br><br>http://www.fimoculous.com/cms/comments/delete.cfm?comID=<cfoutput>#myComments.comID#</cfoutput>&comEntryID=#form.comEntryID#
</cfmail>
<cfelse>
Sorry, this site's futile attempt at spam filtering has identified something in your comment as naughty.
</cfif>
<cfelse>
You forgot to enter the spam-defying password on the previous page. Hit the back button and try again.
</cfif>
</cfif>
</cfif>

</body>
</html>
