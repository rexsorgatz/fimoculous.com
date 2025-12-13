<cfif isdefined("url.author")>
<cfquery cachedWithin="#createTimeSpan(1,0,0,0)#" name="shortposts" datasource="fimothree" maxrows="300">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.entrynumber = tblCategoriesContent.coid
	AND tblCategoriesContent.category <> 'convo'
	AND tblCategoriesContent.category <> 'mp3'
	AND tblContent.author = 'adm'
	ORDER BY entrynumber DESC
</cfquery>
<cfquery cachedWithin="#createTimeSpan(1,0,0,0)#" name="mp3post" datasource="fimothree" maxrows="1">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.longpost = 0
	AND tblCategoriesContent.category = 'mp3'
	AND tblContent.author = 'adm'
	AND tblContent.entrynumber = tblCategoriesContent.coid
	ORDER BY entrynumber DESC
</cfquery>
<cfelse>
<cfquery cachedWithin="#createTimeSpan(1,0,0,0)#" name="shortposts" datasource="fimothree" maxrows="15">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.entrynumber = tblCategoriesContent.coid
	AND tblCategoriesContent.category <> 'convo'
	AND tblCategoriesContent.category <> 'mp3'
	ORDER BY entrynumber DESC
</cfquery>
<cfquery cachedWithin="#createTimeSpan(1,0,0,0)#" name="mp3post" datasource="fimothree" maxrows="1">
	SELECT tblCategoriesContent.*, tblContent.*
	FROM tblContent, tblCategoriesContent
	WHERE tblContent.longpost = 0
	AND tblCategoriesContent.category = 'mp3'
	AND tblContent.entrynumber = tblCategoriesContent.coid
	ORDER BY entrynumber DESC
</cfquery>
</cfif> 


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="openid.server" href="http://www.myopenid.com/server">
<link rel="openid.delegate" href="http://rexsorgatz.myopenid.com/">
<title>Fimoculous.com</title>
<cfinclude template="headerstuff2.cfm">
</head>

<body>

<div id="cell">
<a name="top" href="/#top"><div id="transparent"></div></a>
<div id="whitespace">&nbsp;</div>
<!--
<div id="tweets">
</div>
-->
<div id="content">
	<div id="logo"><a href="/"><img src="/images/logo-fimoc.png" width="340" height="78" alt="Fimoculous.com"></a></div>
	<cfinclude template="alert.cfm">
	<cfoutput query="shortposts">
	<div class="post">
		<div class="tags"><a href="http://www.fimoculous.com/archive/archivetemplate.cfm?cat=#lcase(category)#">#lcase(category)#</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="0" border="0"></div>
		<a href="/archive/post-#entrynumber#.cfm" title="#title#"><div class="datebox"><cfif thisdate GT DateAdd("d", -1, Now())>today<cfelseif thisdate GT DateAdd("d", -2, Now())>yesterday<cfelse>#lcase(DateFormat(thisdate,"dddd"))#</cfif><div class="comment-number">#commentnum# comment<cfif commentnum NEQ 1>s</cfif></div></div></a>
		<p>#entry#</p>
	</div>
	</cfoutput>
<!---<object width="710" height="740">  <param name="name" value="vyouPlayer"> <param name="movie" value="http://vyou.com/player/reg001"></param><param name="FlashVars" value="virtual_user=rexsorgatz&display_name=Rex Sorgatz&embed=true"> <param name="allowFullScreen" value="true"></param>  <param name="allowscriptaccess" value="always"></param>  <embed src="http://vyou.com/player/reg001" type="application/x-shockwave-flash" FlashVars="virtual_user=rexsorgatz&display_name=Rex Sorgatz&embed=true" allowscriptaccess="always" allowfullscreen="true" width="710" height="740" name="vyouPlayer" id="vyouPlayer">  </embed>  </object>	--->
</div>
<div id="foursquare">
	<div id="foursquare-content">
		<div class="foursquare-label">Visting</div>
		<div id="foursquare-icon"><a href="http://foursquare.com/fimoculous"><img src="/images/logo-foursqare.png" width="15" height="15" alt="Foursquare Logo"></a></div>
		<p><cfinclude template="foursquare.xml"></p>
	</div>
</div>
<div id="media">
	<div id="media-content">
		<div id="media-label">Desiring</div>
		<div id="media-icon"><a href="http://www.amazon.com/gp/registry/wishlist/"><img src="/images/logo-amazon.png" width="15" height="15" alt="Amazon Logo"></a></div>
		<p><cfinclude template="amazon.xml"></p>
	</div>
</div>
<div id="projects">
	<div id="projects-content">
		<div id="projects-label">Developing</div>
		<p><a href="http://www.mogulite.com/">Mogulite</a> | <a href="http://www.nearsay.com/">Nearsay</a> | <a href="http://www.4food.com/">4Food</a> | <a href="http://www.roomorama.com/">Roomorama</a> | <a href="http://www.ofakind.com/">Of A Kind</a> | <a href="http://vyou.com/">VYou</a> | <a href="http://www.kindasortamedia.com/">more...</a></p>
	</div>
</div>
<div id="photos">
	<div id="photographs">
		<cfinclude template="flickr.xml">
	</div>
</div>
<div id="search">
	<form action="http://www.fimoculous.com/search.cfm" name="searchform" id="searchform">
		<input type="text" name="s" size="15" class="searchbox" />
		<input type="submit" value="Search" class="searchbutton" /> 
	</form>
</div>
<div id="footer">
		<cfinclude template="footer.cfm">
</div>
</div>
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

