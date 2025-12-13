	<cfquery name="endofyearchron" datasource="fimothree" maxrows="4">
		SELECT id, source, listname, link, mydate, category
		FROM tblEndOfYear
		WHERE mydate > #createODBCdate("6/1/2007")#
		AND mydate < #createODBCdate("6/1/2008")#
		ORDER BY id DESC
	</cfquery>
			<ul>
<cfoutput query="endofyearchron">
	<li>#source#: <a href="#link#">#listname#</a></li>
</cfoutput>
			</ul>

