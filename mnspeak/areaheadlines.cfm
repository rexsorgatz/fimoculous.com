<cfset maxcomments = 15>
<cfquery name="myComments" datasource="mspot" maxrows=#maxcomments# dbtype="ODBC">
	SELECT comName, comURL, comComment, comID, comDate, comEntryID 
	FROM tblComments
	ORDER BY comDate DESC
</cfquery>
<cfquery name="myCommentCount" datasource="mspot" dbtype="ODBC">
	SELECT comID
	FROM tblComments
	WHERE comDate >= #DateAdd("d", -1, Now())#
</cfquery>
<cfscript>
function HTMLToText(HTMLText) {
	txt = HTMLtext;
	txt = REReplaceNoCase(txt,'<br />','','ALL');
	txt = REReplaceNoCase(txt,'<i>','<em>','ALL');
	txt = REReplaceNoCase(txt,'</i>','</em>','ALL');
	txt = REReplaceNoCase(txt,'<a [^>]*>','','ALL');
	txt = REReplaceNoCase(txt,'http:[^>]*','http:','ALL');
	txt = REReplaceNoCase(txt,'www.[^>]*','www.','ALL');
	txt = REReplaceNoCase(txt,'</a>','','ALL');
	return txt;
}
</cfscript>

<!-- //
<br clear="all" />

<div class="titlebar">&raquo;7QQ</div>
THE MNSPEAK INTERVIEW SERIES

<div class="dailytitle"><a href="/mnspeak/7qq/ian-rans.cfm">Ian Rans</a></div>
<p><a href="/mnspeak/7qq/ian-rans.cfm"><img src="/mnspeak/images/7qq/ian-rans-small.jpg" alt="Ian Rans" width="80" height="100" hspace="3" vspace="3" border="0" class="mainpic" align="left"></a>
<a href="/mnspeak/7qq/ian-rans.cfm">Seven quick questions for Ian Rans</a> of <a href="http://www.drinkingwithian.com" target="_blank">Drinking with Ian</a></p>
<br clear="all" />


<div align="right" class="specialhighlight"><a href="/mnspeak/7qq/">7QQ ARCHIVE&raquo;&raquo;</a></div>

// -->


<br clear="all" />
<div class="titlebar" style="margin-bottom: 8px;">&raquo;<cfoutput>#maxcomments#</cfoutput> RECENT COMMENTS</div>
<p><strong>Total Comments Today: <a href="/mnspeak/archive/allcomments.cfm"><cfoutput>#myCommentCount.recordcount#</cfoutput></a></strong></p>
<hr size="1" noshade>
<cfoutput query="myComments">
<p>#Mid(HTMLToText(comComment), 1, 150)#</a></strong></b></em>
<div align="right"><em>&raquo;&raquo; Submitted by #comName# in <a href="http://www.mnspeak.com/mnspeak/archive/post-#comEntryID#.cfm">this post</a></em></div>
</p>
<hr size="1" noshade>
</cfoutput>

<br clear="all" /><p>&nbsp;</p>



