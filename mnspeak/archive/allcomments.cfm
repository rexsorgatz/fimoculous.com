<cfheader statuscode="301" statustext="Moved permanently">
<cfheader name="Location" value="http://www.secretsofthecity.com/talk/recent-comments">

<cfif CGI.QUERY_STRING IS NOT "" >
		<cfheader name="Location" value="http://www.mnspeak.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
<cfelse>
		<cfheader name="Location" value="http://www.mnspeak.com#CGI.SCRIPT_NAME#">
	</cfif>
</cfif>

<cfquery name="myComments" datasource="mspot" dbtype="ODBC">
	SELECT tblContent.title, tblComments.comName, tblComments.comURL, tblComments.comComment, tblComments.comID, tblComments.comDate, tblComments.comEntryID, tblComments.regUser
	FROM tblComments, tblContent
	WHERE tblComments.comDate >= #DateAdd("d", -1, Now())#
	AND tblComments.comEntryID = tblContent.entrynumber
	ORDER BY tblComments.comDate DESC
</cfquery>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - All Comments</title>
	<link rel="stylesheet" type="text/css" href="../styles.css">
	<script type="text/javascript" src="../scripts.js"></script>
<!-- Google Ad Manager Tags for head SECTION -->
<script type="text/javascript" src="http://partner.googleadservices.com/gampad/google_service.js">
</script>
<script type="text/javascript">
  GS_googleAddAdSenseService("ca-pub-1747671153388161");
  GS_googleEnableAllServices();
</script>
<script type="text/javascript">
  GA_googleAddSlot("ca-pub-1747671153388161", "SOTC_Right1_300x250");
  GA_googleAddSlot("ca-pub-1747671153388161", "SOTC_Right2_160x600");
</script>
<script type="text/javascript">
  GA_googleFetchAds();
</script>
<!-- END OF TAG FOR head SECTION -->

	<meta http-equiv="refresh" content="120">
</head>

<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#ffffff" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
	<tr>
		<td>
<cfinclude template="../header.cfm">
		<table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#ffffff">
			<tr>
				<td width="490" valign="top">
					<div class="titlebar">&raquo;ALL COMMENTS</div><br />
					<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td align="left" valign="top">
<hr size="1" noshade>
<cfoutput query="myComments" maxrows=1>
<div class="dailytitle">#myComments.recordcount# comments from the past 24 hours:</div>
</cfoutput>
<hr size="1" noshade><br/>
<cfoutput query="myComments">
<p>#comComment#</a></strong></b></em>
<div align="right"><em>&raquo;&raquo; Submitted by<cfif regUser EQ 1></em> <strong><a href="/mnspeak/archive/archivetemplate.cfm?author=#comName#" rel="nofollow" style="color: ##B22222; text-decoration:none;">&raquo;&raquo;&raquo;</a></strong><em></cfif> <cfif Len(comURL) GT 1><a href="<cfif Mid(comURL, 1, 7) IS NOT "http://">http://#comURL#<cfelse>#comURL#</cfif>" target="_blank"></cfif><cfif Len(comName) LT 1>Anonymous<cfelse>#comName#</a></cfif> at #TimeFormat(DateAdd("h", -1, comDate), "h:mm tt")# in the post <a href="http://www.mnspeak.com/mnspeak/archive/post-#comEntryID#.cfm"><strong>#title#</strong></a></em></div><br />

<hr size="1" noshade>
</cfoutput>
							</td>
						</tr>
					</table>
				</td>
				<td width="310" valign="top" align="right">
				<div align="right">
				
				<!-- AD SLOT SOTC_Right1_300x250 -->
				<script type="text/javascript">
				  GA_googleFillSlot("SOTC_Right1_300x250");
				</script>
				<!-- END AD SLOT SOTC_Right1_300x250 -->
				
				<br clear="all" />
				<br clear="all" />
				<br clear="all" />
				<br clear="all" />
				
				<!-- AD SLOT SOTC_Right2_160x600 -->
				<script type="text/javascript">
				  GA_googleFillSlot("SOTC_Right2_160x600");
				</script>
				<!-- AD SLOT SOTC_Right2_160x600 -->
				</div>
				
				
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

	<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-285694-1";
	urchinTracker();
	</script>
</body>	
</html>
