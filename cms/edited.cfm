<cfif cgi.http_host contains "mnspeak.com">
	<cfset ds="mspot">
	<cfset thisdomain="http://www.mnspeak.com">
	<cfset thissite="MNSpeak.com">
<cfelse>
	<cfset ds="fimothree">
	<cfset thisdomain="http://www.fimoculous.com">
	<cfset thissite="Fimoculous.com">
</cfif> 

<cfif isdefined("form.entrynumber")>
	<cfset operation = "Updated">
	<cfquery name="updateContentTable" datasource="#ds#">
		UPDATE tblContent
		SET title = '#Form.title#', <cfif cgi.http_host contains "mnspeak.com">placement = '#Form.placement#', emails = '#Form.emails#',</cfif> thisdate = '#Form.thisdate#', author = '#Form.author#', <cfif isDefined("Form.accepted")>accepted = #Form.accepted#,</cfif> <cfif isDefined("Form.longpost")>longpost = #Form.longpost#,</cfif> hascomments = #Form.hascomments#, entry = '#Form.comComment#'<cfif isDefined("Form.entrylong")>, entrylong = '#Form.entrylong#'</cfif>
		WHERE entrynumber = #Form.entrynumber#
	</cfquery>
	<cfquery name="clearCats" datasource="#ds#" dbtype="ODBC">
		DELETE FROM tblCategoriesContent
		WHERE coid = #Form.entrynumber#
	</cfquery>
	<cfset catList = "">
	<cfloop collection="#url#" item="i">
		<cfif #url[i]# IS "1">
			<cfquery name="updateCatContentTable" datasource="#ds#">
				INSERT INTO tblCategoriesContent(coid, category)
				VALUES(#Form.entrynumber#, '#i#')
			</cfquery>
			<cfset catList = catList & ", " & i>
		</cfif>
	</cfloop>
	<cfif catList IS NOT "">
		<cfquery name="updateContentTableWithCats" datasource="#ds#">
			UPDATE tblContent
			SET cats = '#catList#'
			WHERE entrynumber = #Form.entrynumber#
		</cfquery>
		<cfelse>
		<cfquery name="updateContentTableWithCats" datasource="#ds#">
			UPDATE tblContent
			SET cats = ' '
			WHERE entrynumber = #Form.entrynumber#
		</cfquery>
	</cfif>
<cfelse>
	<cfset operation = "Inserted">
	<cfquery username="fimoculous" password="fmcr5473" name="insertvals" datasource="#ds#">
		INSERT into tblContent(title, <cfif cgi.http_host contains "mnspeak.com">placement,</cfif> thisdate, author, <cfif isDefined("Form.accepted")>accepted,</cfif> <cfif isDefined("Form.longpost")>longpost,</cfif> hascomments, entry<cfif isDefined("Form.entrylong")>, entrylong</cfif>)
		VALUES ('#Form.title#', <cfif cgi.http_host contains "mnspeak.com">'#Form.placement#',</cfif> '#Form.thisdate#', '#Form.author#', <cfif isDefined("Form.accepted")>#Form.accepted#,</cfif> <cfif isDefined("Form.longpost")>#Form.longpost#,</cfif> #Form.hascomments#, '#Form.comComment#'<cfif isDefined("Form.entrylong")>, '#Form.entrylong#'</cfif>)
	</cfquery>
	<cfquery username="fimoculous" password="fmcr5473" name="curentrynum" datasource="#ds#" maxrows="1">
		SELECT entrynumber
		FROM tblContent
		ORDER BY entrynumber DESC
	</cfquery>
	<cfset entrynumber = #curentrynum.entrynumber#>
	<cfquery name="updatethatcommentcolumn" datasource="#ds#">
		UPDATE tblContent
		SET commentnum = 0
		WHERE entrynumber = #entrynumber#
	</cfquery>
	<cfset catList = "">
	<cfloop collection="#url#" item="i">
		<cfif #url[i]# IS "1">
			<cfquery name="updateCatContentTable" datasource="#ds#">
				INSERT INTO tblCategoriesContent(coid, category)
				VALUES(#curentrynum.entrynumber#, '#i#')
			</cfquery>
			<cfset catList = catList & ", " & i>
		</cfif>
	</cfloop>
	<cfif catList IS NOT "">
		<cfquery name="updateContentTableWithCats" datasource="#ds#">
			UPDATE tblContent
			SET cats = '#catList#'
			WHERE entrynumber = #curentrynum.entrynumber#
		</cfquery>
		<cfelse>
		<cfquery name="updateContentTableWithCats" datasource="#ds#">
			UPDATE tblContent
			SET cats = ' '
			WHERE entrynumber = #curentrynum.entrynumber#
		</cfquery>
	</cfif>
</cfif>

<cffunction name="pingTechnorati" output="false" returnType="boolean" access="public">
   <cfoutput>
      <cfsavecontent variable="pingData">
         <?xml version="1.0"?>
         <methodCall>
          <methodName>weblogUpdates.ping</methodName>
          <params>
          <param>
          <value>#thissite#</value>
          </param>
          <param>
          <value>#thisdomain#</value>
          </param>
          </params>
         </methodCall>
      </cfsavecontent>
   </cfoutput>
   <cfset pingData = trim(pingData)>
   <cfset pingDataLen = len(pingData)>
   <cfhttp method="POST" url="http://rpc.technorati.com/rpc/ping" timeout="20" throwonerror="No">
      <cfhttpparam type="HEADER" name="User-Agent" value="CF"/>
      <cfhttpparam type="HEADER" name="Content-length" value="#pingDataLen#"/>
      <cfhttpparam type="XML" value="#pingData#"/>
   </cfhttp>
   <cfif cfhttp.statuscode contains "200" and cfhttp.filecontent contains "Thanks for the ping">
      <cfreturn true>
   <cfelse>
      <cfreturn false>
   </cfif>
</cffunction>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>
<cfinclude template="header.cfm">

<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td>
			<cfoutput>
			<strong>#Operation#</strong>
			</cfoutput>
			<br><br>
			<cfoutput>
			<a href="/cms/edit.cfm?entrynumber=#entrynumber#"><b>&raquo;Re-Edit Post</b></a><br><br>
			</cfoutput>
			<a href="/cms/edit.cfm"><b>&raquo;Add Another Entry</b></a><br><br>
			<a href="/cms/"><b>&raquo;Back To Admin</b></a><br><br>
		</td>
	</tr>
</table>


<cfset bPingTechnorati = pingTechnorati()>

<cfif cgi.http_host contains "fimoculous.com">
	<cfoutput>
	<cffile action = "write" file = "c:\websites\fimoculous\archive\post-#entrynumber#.cfm" output="
	<cfset post = ""#entrynumber#"">
	<cfinclude template=""archivetemplate.cfm"">
	">
	</cfoutput>
<cfelse>
	<cfoutput>
	<cffile action = "write" file = "c:\websites\fimoculous\mnspeak\archive\post-#entrynumber#.cfm" output="
	<cfset post = ""#entrynumber#"">
	<cfinclude template=""archivetemplate.cfm"">
	">
	</cfoutput>
</cfif> 


<cfif cgi.http_host contains "fimoculous.com">

	<cfquery name="xmldailygen" datasource="#ds#" maxrows=15 username="fimoculous" password="fmcr5473">
		SELECT entrynumber, title, thisdate, entry, cats, author
		FROM tblContent
		WHERE Lcase(Trim(cats)) NOT LIKE '%convo%'
		ORDER BY entrynumber DESC
	</cfquery>
	<cfsavecontent variable="theXML">
	<rss version="2.0">
		<channel>
		<title>Fimoculous.com</title>
		<description>Feeding On Itself</description>
		<copyright>Rex Sorgatz</copyright> 
		<link>http://www.fimoculous.com/</link>
		<language>en-us</language> 
		<ttl>60</ttl>
			<cfoutput query="xmldailygen">
			<item>
				<title>#xmldailygen.title#</title>
				<link>http://www.fimoculous.com/archive/post-#xmldailygen.entrynumber#.cfm</link>
				<pubDate>#DateFormat(xmldailygen.thisdate,"DDD, DD MMM YYYY")# #TimeFormat(xmldailygen.thisdate,"HH:mm:ss")# CST</pubDate>
				<description><![CDATA[#xmldailygen.entry#]]></description>
				<category>#Lcase(REReplaceNoCase(cats,', ','','ONE'))#</category>
				 <author>rex@fimoculous.com</author> 
			</item>
			</cfoutput>
		</channel>
	</rss>
	</cfsavecontent>
	<cffile action = "write" file = "c:\websites\fimoculous\rss\rss.xml" output="#theXML#">

	<cfquery name="mp3post" username="fimoculous" password="fmcr5473"datasource="fimothree" maxrows="1">
		SELECT tblCategoriesContent.*, tblContent.*
		FROM tblContent, tblCategoriesContent
		WHERE tblContent.longpost = 0
		AND tblCategoriesContent.category = 'mp3'
		AND tblContent.entrynumber = tblCategoriesContent.coid
		ORDER BY entrynumber DESC
	</cfquery>
	<cfsavecontent variable="themp3XML">
	<rss version="2.0">
		<channel>
		<title>Fimoculous.com</title>
		<description>Feeding On Itself</description>
		<copyright>Rex Sorgatz</copyright> 
		<link>http://www.fimoculous.com/</link>
		<language>en-us</language> 
		<ttl>60</ttl>
			<cfoutput query="mp3post">
			<item>
				<title>#mp3post.title#</title>
				<link>http://www.fimoculous.com/archive/post-#mp3post.entrynumber#.cfm</link>
				<pubDate>#DateFormat(mp3post.thisdate,"DDD, DD MMM YYYY")# #TimeFormat(mp3post.thisdate,"HH:mm:ss")# CST</pubDate>
				<description>#mp3post.entry#</description>
				<category>mp3</category>
				 <author>rex@fimoculous.com (Rex Sorgatz)</author> 
			</item>
			</cfoutput>
		</channel>
	</rss>
	</cfsavecontent>
	<cffile action = "write" file = "c:\websites\fimoculous\rss\mp3.xml" output="#themp3XML#">



<cfelse>
	<cfquery name="xmldailygen" datasource="#ds#" maxrows=15 username="fimoculous" password="fmcr5473">
		SELECT entrynumber, placement, title, thisdate, entry, hascomments, author, commentnum, accepted, cats
		FROM tblContent
		WHERE placement = 1
		OR placement = 2
		AND accepted = 1
		ORDER BY entrynumber DESC
	</cfquery>
	<cfsavecontent variable="theXML">
	<rss version="2.0">
		<channel>
			<title>MNspeak.com</title>
			<description>Twin Cities Culture, Media, Politics, Events and Fun</description>
			<link>http://www.mnspeak.com/</link>
			<language>en-us</language> 
			<ttl>60</ttl>
			<cfoutput query="xmldailygen">
			<item>
				<title>#xmldailygen.title#</title>
				<link>http://www.mnspeak.com/mnspeak/archive/post-#xmldailygen.entrynumber#.cfm</link>
				<pubDate>#DateFormat(xmldailygen.thisdate,"DDD, DD MMM YYYY")# #TimeFormat(xmldailygen.thisdate,"HH:mm:ss")# CST</pubDate>
				<description><![CDATA[#xmldailygen.entry#]]> </description>
			</item>
			</cfoutput>
		</channel>
	</rss>
	</cfsavecontent>
	<cffile action = "write" file = "c:\websites\fimoculous\mnspeak\rss\rss.xml" output="#theXML#">
</cfif> 


</body>
</html>
