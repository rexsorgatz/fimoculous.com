<!---
this gets the post id, but it's useless
			<cfset strLen=23>
			<cfif len(cgi.script_name) IS 21><cfset strLen=21></cfif>
			<cfset post = #Mid(cgi.script_name, find("-",cgi.script_name)+1, strLen-find(".",cgi.script_name))#>
--->
<cfif IsDefined("url.cat")>
	<cfquery cachedWithin="#createTimeSpan(20,0,0,0)#" name="maincontent" datasource="fimothree">
		SELECT tblCategoriesContent.*, tblContent.*
		FROM tblContent, tblCategoriesContent
		<cfif url.cat EQ 'all'>WHERE tblContent.entrynumber = tblCategoriesContent.coid<cfelse>
		WHERE tblCategoriesContent.category = '#url.cat#'
		AND tblContent.entrynumber = tblCategoriesContent.coid
		</cfif>
		ORDER BY entrynumber DESC 
	</cfquery>
<cfelse>
	<cfquery cachedWithin="#createTimeSpan(20,0,0,0)#" name="checkpost" datasource="fimothree" maxrows="1">
	SELECT longpost
	FROM tblContent
	WHERE tblContent.entrynumber = #post#
	</cfquery>
	<cfquery cachedWithin="#createTimeSpan(20,0,0,0)#" name="maincontent" datasource="fimothree" maxrows="1">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.entrynumber = #post#
	<cfif checkpost.longpost IS "0">AND tblContent.entrynumber = tblCategoriesContent.coid</cfif>
	</cfquery>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><cfoutput>#maincontent.title#</cfoutput> - Fimoculous.com</title>
<cfinclude template="/headerstuff2.cfm">
</head>

<body>
<div id="cell">
<a href="/"><div id="transparent"></div></a>
<div id="whitespace">&nbsp;</div>
<div id="tweets">
</div>
<div id="content">
	<div id="logo"><a href="/"><img src="/images/logo-fimoc.png" width="340" height="78" alt="Fimoculous.com"></a></div>
	<cfinclude template="/alert.cfm">
	<cfif IsDefined("url.cat")>
	<cfoutput query="maincontent">
		<div class="post">
			<div class="tags"><a href="http://www.fimoculous.com/archive/archivetemplate.cfm?cat=#lcase(category)#">#lcase(category)#</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="0" border="0"></div>
			<a href="/archive/post-#entrynumber#.cfm" title="#title#"><div class="datebox"><cfif thisdate GT DateAdd("d", -1, Now())>today<cfelseif thisdate GT DateAdd("d", -2, Now())>yesterday<cfelse>#lcase(DateFormat(thisdate,"dddd"))#</cfif><div class="comment-number">#commentnum# comment<cfif commentnum NEQ 1>s</cfif></div></div></a>
			<p>#entry#</p>
		</div>
	</cfoutput>
	<cfelse>
		<cfoutput query="maincontent">
		<div class="post">
			<div class="tags"><a href="http://www.fimoculous.com/archive/archivetemplate.cfm?cat=#lcase(category)#">#lcase(category)#</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="0" border="0"></div>
			<div class="datebox">#lcase(DateFormat(thisdate,"MMM d"))#<div class="comment-number">#lcase(DateFormat(thisdate,"yyyy"))#</div></div>
			<h1>#title#</h1>
			<p>
			<cfif category EQ 'mp3'>
				<cfquery cachedWithin="#createTimeSpan(20,0,0,0)#" name="mp3post" datasource="fimothree" maxrows="1">
					SELECT tblCategoriesContent.*, tblContent.*
					FROM tblContent, tblCategoriesContent
					WHERE tblContent.longpost = 0
					AND tblCategoriesContent.category = 'mp3'
					AND tblContent.entrynumber = tblCategoriesContent.coid
					ORDER BY entrynumber DESC
				</cfquery>
				<cfoutput>
				<cfxml variable="myxmlContent">
					<startpoint>#entry#</startpoint>
				</cfxml>
				<cfset objRSS = xmlParse(myxmlContent)>
				<cfset linky = objRSS.startpoint.a.XmlAttributes.href>
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=7,0,0,0" width="90" height="30" id="player" align="middle">
						<param name="allowScriptAccess" value="sameDomain" />
						<param name="movie" value="/mp3/player2.swf?link=#linky#" />
						<param name="quality" value="high" />
						<param name="wmode" value="transparent" />
						<param name="bgcolor" value="##dfe6eb" />
						<embed src="/mp3/player2.swf?link=#linky#" wmode="transparent" quality="high" bgcolor="##dfe6eb" width="90" height="30" name="player" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>
				</cfoutput>
			</cfif>
			#entry#</p>
		</div>
		</cfoutput>
	<cfset thisposthascomments = "false"><cfif maincontent.hascomments IS "1"><cfset thisposthascomments = "true"></cfif>
	<cfquery cachedWithin="#createTimeSpan(20,0,0,0)#" name="comments" datasource="fimothree" dbtype="ODBC">
		SELECT comName, comURL, comComment, comID, comDate, comEntryID
		FROM tblComments
		WHERE comEntryID = #post#
		ORDER BY comDate ASC
	</cfquery>
	<div id="comments">
	<cfif thisposthascomments IS "true" AND comments.RecordCount GT 0>
		<cfoutput><div class="comments-span">#comments.RecordCount# </cfoutput>comment<cfif comments.RecordCount GT 1>s</cfif></div>
			<cfoutput query="comments">
			<p class="comment">#comComment#</p>
			<p class="comment-atribution"><em>posted by <cfif Len(comURL) GT 1><cfif comURL NEQ "http://"><a href="#comURL#" target="_blank"></cfif></cfif><cfif Len(comName) LT 1>Anonymous<cfelse>#comName#</cfif><cfif Len(comURL) GT 1><cfif comURL NEQ "http://"></a></cfif></cfif> at #TimeFormat(comDate, "h:mm tt")# on #DateFormat(comDate, "mmmm d, yyyy")#</em> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="0" border="0"></p>
			</cfoutput>
		</cfif>
		<cfoutput query="maincontent">
			<cfif thisdate GT DateAdd("d", -7, Now())>
			<form action="addcomment.cfm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="comEntryID" value="#post#">
				<div class="comments-span">Leave a Comment</div>
				<!---<p class="note">Dear annoying seo spammers: I have added <em>rel="nofollow"</em> to all comment links, so trying to comment here will do nothing for you. Plus I'll delete it.</p>--->
				<div class="comments-field"><div class="comments-label">Your Name:</div><input type="text" name="myComNamess" size="20" maxlength="40"> (required)</div>
				<div class="comments-field"><div class="comments-label">Your URL:</div><input type="text" name="comURL" size="20" value="http://" maxlength="50"> (optional)</div>
				<div class="comments-field"><div class="comments-label">Password:</div><input type="text" name="spamfield" size="20" maxlength="20"> (enter the word "hello")</div>
				<textarea id="comComment" name="comComment"></textarea> 
				<div id="toolbar">
					<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','strong')" src="/mnspeak/images/misc/bold.gif" title="click to make your text selection bold">
					<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','emphasis')" src="/mnspeak/images/misc/italic.gif" title="click to make your text selection italicized">
					<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','a_href')" src="/mnspeak/images/misc/link.gif" width="32" height="16" align="middle" title="click to add a link to the selected text">
				</div>
				<input type="submit" value="Add Comment" class="searchbutton">
			</form>
			<cfelse>
				<br/><br/><br/><p><em><strong>NOTE:</strong> The commenting window has expired for this post.</em></p>
			</cfif>
		</cfoutput>
	</cfif>
</div>
</div>
<div id="search">
	<form action="http://www.fimoculous.com/search.cfm" name="searchform" id="searchform">
		<input type="text" name="s" size="15" class="searchbox" />
		<input type="submit" value="Search" class="searchbutton" /> 
	</form>
</div>
<div id="footer">
		<cfinclude template="/footer.cfm">
</div>
</div>


<script type="text/javascript">
var _sf_async_config={uid:2823,domain:"fimoculous.com"};
(function(){
  function loadChartbeat() {
    window._sf_endpt=(new Date()).getTime();
    var e = document.createElement('script');
    e.setAttribute('language', 'javascript');
    e.setAttribute('type', 'text/javascript');
    e.setAttribute('src',
       (("https:" == document.location.protocol) ? "https://s3.amazonaws.com/" : "http://") +
       "static.chartbeat.com/js/chartbeat.js");
    document.body.appendChild(e);
  }
  var oldonload = window.onload;
  window.onload = (typeof window.onload != 'function') ?
     loadChartbeat : function() { oldonload(); loadChartbeat(); };
})();

</script>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-12347764-1");
pageTracker._trackPageview();
} catch(err) {}</script>

</body>
</html>


