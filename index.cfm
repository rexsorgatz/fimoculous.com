<cfif cgi.http_host contains "fimoculous.com">
	<cfinclude template="fimo_home.cfm">
<cfelseif cgi.http_host contains "edebiyat-thejournal.com">
	<cflocation url="http://www.edebiyat-thejournal.com/edebiyat/" addToken="no">
<cfelseif cgi.http_host contains "kindasortamedia.com">
	<cfinclude template="/ksm/index.cfm">
<cfelseif cgi.http_host contains "rexsorgatz.com">
	<cfinclude template="rex-sorgatz.cfm">
<cfelseif cgi.http_host contains "recs.email">
	<cfif cgi.http_host contains "www">
		<cflocation url="http://recs.email/" addToken="no">
	<cfelse>
		<cfinclude template="/recs/index.cfm">
	</cfif>
<cfelseif cgi.http_host contains "onthetakeshow.com">
	<cfinclude template="/onthetake/index.cfm">
<cfelseif cgi.http_host contains "whysomad.today">
	<cfif cgi.http_host contains "www">
		<cflocation url="http://whysomad.today/" addToken="no">
	<cfelse>
		<cfinclude template="/whysomad/index.cfm">
	</cfif>
<cfelseif cgi.http_host contains "alifbatourguide.com">
	<cfif cgi.http_host contains "www">
		<cflocation url="http://alifbatourguide.com/" addToken="no">
	<cfelse>
		<cfinclude template="/the-arabic-alphabet/index.cfm">
	</cfif>
<cfelseif cgi.http_host contains "gimmetv.app">
	<cfinclude template="/gimme/index.cfm">
<cfelseif cgi.http_host contains "trebek-affirmations.com">
	<cfheader statuscode="301" statustext="Moved Permanently">
	<cfheader name="Location" value="https://www.tvinsider.com/trebek-affirmation-soundboard/">
	<cfabort>
<cfelseif cgi.http_host contains "gimmetvapp.com">
	<cfinclude template="/gimme/index.cfm">
<cfelseif cgi.http_host contains "trfcpa.com">
	<cfinclude template="/trfcpa/index.cfm">
<cfelseif cgi.http_host contains "insertcoolnamehere.com">
	<cflocation url="http://www.fimoculous.com" addToken="no">
<cfelseif cgi.http_host contains "misinfo.wtf">
	<cflocation url="https://bookshop.org/a/15706/9781419729119" addToken="no">
<cfelseif cgi.http_host contains "fakeopedia.com">
	<cflocation url="http://www.fimoculous.com" addToken="no">
<cfelseif cgi.http_host contains "whattimeisrexandmichelleswedding.com">
	<cfinclude template="/wedding/index.cfm">
<cfelseif cgi.http_host contains "darksocial.tv">
	<cfinclude template="/darksocial/index.cfm">
</cfif>



<!---
<cfelseif cgi.http_host contains "mnspeak.com">
	<cfinclude template="mnspeak/index.cfm">
<cfelseif cgi.http_host contains "viewsource.tv">
	<cfinclude template="/viewsource/index.cfm">
<cfelseif cgi.http_host contains "seattlespeak.com">
	<cflocation url="http://www.fimoculous.com" addToken="no">
<cfelseif cgi.http_host contains "azineaboutyoutube.com">
	<cflocation url="http://www.fimoculous.com" addToken="no">
<cfelseif cgi.http_host contains "shalesmillerespnbook.com">
	<cflocation url="http://www.millershalesespnbook.com" addToken="no">
<cfelseif cgi.http_host contains "millershalesespnbook.com">
	<cfinclude template="/espn/index.cfm">
<cfelseif cgi.http_host contains "remoter.tv">
	<cflocation url="http://www.fimoculous.com" addToken="no">
<cfelseif cgi.http_host contains "saltychewy.tv">
	<cflocation url="http://www.fimoculous.com" addToken="no">
<cfelseif cgi.http_host contains "voyeuse.tv">
	<cflocation url="http://www.fimoculous.com" addToken="no">
<cfelseif cgi.http_host contains "stalkshow.tv">
	<cflocation url="http://www.fimoculous.com" addToken="no">
--->