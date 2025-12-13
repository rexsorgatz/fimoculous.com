<cfquery name="searchthing" datasource="fimothree">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.entrynumber = tblCategoriesContent.coid
	<cfloop index="word" list="#URL.s#" delimiters=" ">
	AND entry LIKE '%#word#%'
	</cfloop>
	ORDER BY entrynumber DESC
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Search - Fimoculous.com</title>
<cfinclude template="/headerstuff2.cfm">
<script>

function carrySrchStr() {
	var mytrm = window.location.search.substring(3);
	while (mytrm.indexOf("+") > -1) {
	mytrm = mytrm.replace("+"," ");
	}
	document.searchform.s.value = mytrm;
}
</script>



</head>

</head>

<body onload="carrySrchStr();">
<div id="cell">
<a href="/"><div id="transparent"></div></a>
<div id="whitespace">&nbsp;</div>

<div id="search">
	<form action="http://www.fimoculous.com/search.cfm" name="searchform" id="searchform">
		<input type="text" name="s" size="15" class="searchbox" />
		<input type="submit" value="Search" class="searchbutton" /> 
	</form>
</div>
<div id="content">
	<div id="logo"><a href="/"><img src="/images/logo-fimoc.png" width="340" height="78" alt="Fimoculous.com"></a></div>



<cfif s IS "">
	<p class="searchtext"><b>Loser. Enter something in the search box before hitting the button.</b></p>
	
<cfelseif searchthing.RecordCount IS 0>
	<p class="searchtext"><b>No entries were found with that exact phrase or word.</b></p>

<cfelseif searchthing.RecordCount IS 1>
	<cfoutput query="searchthing" maxrows=1>

	<p class="searchtext"><b>There was 1 entry found with "#s#":</b></p>

	<div class="post">
		<div class="tags"><a href="http://www.fimoculous.com/archive/archivetemplate.cfm?cat=#lcase(category)#">#lcase(category)#</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="0" border="0"></div>
		<a href="/archive/post-#entrynumber#.cfm" title="#title#"><div class="datebox"><cfif thisdate GT DateAdd("d", -1, Now())>today<cfelseif thisdate GT DateAdd("d", -2, Now())>yesterday<cfelse>#lcase(DateFormat(thisdate,"dddd"))#</cfif><div class="comment-number">#commentnum# comment<cfif commentnum NEQ 1>s</cfif></div></div></a>
		<p>#entry#</p>
	</div>
	</cfoutput>
<cfelse>
	<cfoutput query="searchthing" maxrows=1>
	<p class="searchtext"><b>There were #RecordCount# entries found with "#s#":</b></p>
	</cfoutput>
	<cfoutput query="searchthing">
	<div class="post">
		<div class="tags"><a href="http://www.fimoculous.com/archive/archivetemplate.cfm?cat=#lcase(category)#">#lcase(category)#</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="0" border="0"></div>
		<a href="/archive/post-#entrynumber#.cfm" title="#title#"><div class="datebox"><cfif thisdate GT DateAdd("d", -1, Now())>today<cfelseif thisdate GT DateAdd("d", -2, Now())>yesterday<cfelse>#lcase(DateFormat(thisdate,"dddd"))#</cfif><div class="comment-number">#commentnum# comment<cfif commentnum NEQ 1>s</cfif></div></div></a>
		<p>#entry#</p>
	</div>
	</cfoutput>
</cfif>
</div>

<div id="footer">
		<cfinclude template="footer.cfm">
</div>
</div>

</body>
</html>

