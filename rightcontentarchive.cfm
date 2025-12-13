<cfquery name="archivecontent" datasource="fimothree" maxrows="10">
	SELECT entrynumber, title, thisdate, entry, longpost, commentnum
	FROM tblContent
	WHERE longpost = 1
	ORDER BY thisdate DESC
</cfquery>
	<div class="subnav">&nbsp;Archive</div><br />
	<cfoutput query="archivecontent">
	<img src="/structureimages/bullet-small.png" alt="" width="11" height="9" hspace="0" border="0" align="bottom" /> <a href="/archive/post-#entrynumber#.cfm">#title#</a> <span class="comment"><a href="/archive/post-#entrynumber#.cfm">&raquo;#commentnum#</a></span><br />
	</cfoutput>
	<br />