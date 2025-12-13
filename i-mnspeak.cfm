<cfquery name="mnspeak" datasource="mspot" maxrows="6">
	SELECT entrynumber, title, thisdate, commentnum
	FROM tblContent
	WHERE author = 'rex'
	ORDER BY entrynumber DESC 
</cfquery>
			<ul>
<cfoutput query="mnspeak">
	<li><cfif thisdate GT DateAdd("d", -2, Now())><span class="new">NEW</span></cfif> #DateFormat(thisdate,"m/dd")#: <a href="http://www.mnspeak.com/mnspeak/archive/post-#entrynumber#.cfm" target="_blank">#title#</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.mnspeak.com/mnspeak/archive/post-#entrynumber#.cfm">&raquo;#commentnum#</a></li>
</cfoutput>
			</ul>

