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
	<title>MNspeak.com</title>
	<link rel="stylesheet" type="text/css" href="../styles.css">
	<script type="text/javascript" src="../scripts.js"></script>

<script type="text/javascript">
var req;
function loadXMLDoc(url) {
	req = false;
    if(window.XMLHttpRequest) {
    	try {
			req = new XMLHttpRequest();
        } catch(e) {
			req = false;
        }
    } else if(window.ActiveXObject) {
       	try {
        	req = new ActiveXObject("Msxml2.XMLHTTP");
      	} catch(e) {
        	try {
          		req = new ActiveXObject("Microsoft.XMLHTTP");
        	} catch(e) {
          		req = false;
        	}
		}
    }
	if(req) {
		req.onreadystatechange = processReqChange;
		req.open("GET", url, true);
		req.send("");
	}
}
function processReqChange() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            parsetheXML();
         } else {
            alert("There was a problem retrieving the XML data:\n" + req.statusText);
         }
    }
}
function parsetheXML() {
    var items = req.responseXML.getElementsByTagName("comnt");
    // loop through <item> elements, and add each nested
    // <title> element to Topics select element
    for (var i = 0; i < items.length; i++) {
		//alert(i);
        //appendToSelect(select, i, document.createTextNode(getElementTextNS("", "title", items[i], 0)));
    }
    // clear detail display
   // document.getElementById("details").innerHTML = "";
}
loadXMLDoc("http://www.mnspeak.com/mnspeak/archive/allcomments.xml");
//loadXMLDoc("http://www.mnspeak.com/mnspeak/rss/rss.xml");
</script>
</head>

<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
	<tr>
		<td>
<cfinclude template="../header.cfm">
		<table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#ECF0F2">
			<tr>
				<td width="80%" valign="top">
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
<div align="right"><em>&raquo;&raquo; Submitted by<cfif regUser EQ 1></em> <strong><a href="/mnspeak/archive/archivetemplate.cfm?author=#comName#" style="color: ##B22222; text-decoration:none;">&raquo;&raquo;&raquo;</a></strong><em></cfif> <cfif Len(comURL) GT 1><a href="<cfif Mid(comURL, 1, 7) IS NOT "http://">http://#comURL#<cfelse>#comURL#</cfif>" target="_blank"></cfif><cfif Len(comName) LT 1>Anonymous<cfelse>#comName#</a></cfif> at #TimeFormat(DateAdd("h", -1, comDate), "h:mm tt")# in the post <a href="http://www.mnspeak.com/mnspeak/archive/post-#comEntryID#.cfm"><strong>#title#</strong></a></em></div><br />

<hr size="1" noshade>
</cfoutput>
							</td>
						</tr>
					</table>
				</td>
				<td width="20%" valign="top">
					<div class="titlebar">&raquo;OUR SPONSORS</div>
<cfinclude template="../sponsors.cfm">								
						<div class="titlebar">&raquo;MORE</div>
<cfinclude template="../related.cfm">								
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


</body>	
</html>
