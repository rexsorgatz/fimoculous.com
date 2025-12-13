<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Meta</title>
	<link rel="stylesheet" type="text/css" href="/mnspeak/styles.css">
	<script type="text/javascript" src="/mnspeak/scripts.js"></script>
    <script src="http://maps.google.com/maps?file=api&v=1&key=ABQIAAAASCHmQRbH3viCqlJ3Bwea9RQkU1YkUjtuLGoU6jLdzpdQ620ggRS6Dok010xeTwBMY0mkcXhM4KVDpQ" type="text/javascript"></script>
<style>
  #map {
    width: 100%;
	text-align: right;
	width: 780px; 
	height: 500px;
	border: 1px solid black;
  }
  </style>
</head>

<body background="/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#ECF0F2">
	<tr>
		<td>
<cfinclude template="../header.cfm">
		<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#C9CED5" style="border: 1px solid Black; padding: 2px; margin-top: 10px;">
			<tr>
				<td>
				<div class="blogcopy"><strong>What is this?</strong> This page aggregates recent posts from approximately 200 Minnesota-authored blogs and media sources. It updates every hour. Using the controls below, you can organize this page alphabetically (with all sources visible), chronologically (with recent posts visible), geographically (with sources placed on a map), or personalized (with sources you choose).</div>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" style="border: padding: 2px; margin-top: 10px;">
			<tr>
				<td>
					<table border="0" cellspacing="5" cellpadding="0" class="submenu" style="border: 1px solid Black;">
						<tr>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/aggregator/index-chron.cfm"><strong>VIEW CHRONOLOGICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/aggregator/index-alph.cfm"><strong>VIEW ALPHABETICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menusel"><a><strong>VIEW GEOGRAPHICALLY</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
							<td width="23%" align="center" class="menuunsel"><a href="/mnspeak/aggregator/index-personal.cfm"><strong>VIEW PERSONALIZED</strong></a><br /></td>
							<td width="1%" align="center">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#ECF0F2">
			<tr>
				<td width="98%" align="center" valign="top">
				
<div id="map"></div>
<br />
<strong>Note:</strong> The above represents registered users who have entered a zip code in their profile and have a blog in the aggregator.<br/>Also, the above geographical markers are not accurate to street level -- they are only approximations based upon zip codes.
<br /><br />
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<!---
http://mapki.com/zipcode.php?zip=55403
http://www.mnspeak.com/mnspeak/meta/users-mapped.cfm
http://www.google.com/apis/maps/documentation/
--->


<script type="text/javascript">
var map = new GMap(document.getElementById("map"));
map.addControl(new GSmallMapControl());
map.addControl(new GMapTypeControl());
map.centerAndZoom(new GPoint(-93.22, 44.97), 7);

var request = GXmlHttp.create();
request.open('GET', 'data.xml', true);

request.onreadystatechange = function() {
	function createMarker(point, number) {
		var marker = new GMarker(point);
		var html = markers[i].childNodes[0].nodeValue;
		var url = markers[i].getAttribute("htmlUrl");
		var title = markers[i].getAttribute("title");
		var user = markers[i].getAttribute("userFullName");
		var id = markers[i].getAttribute("userID");
		GEvent.addListener(marker, 'click', function() {
			marker.openInfoWindowHtml("<div style=\"white-space: nowrap; text-align: left;\"><strong>"+user+"</strong><br />Blog: <a href=\""+url+"\" target=\"_blank\">"+title+"</a><br />Profile: <a href=\"/mnspeak/archive/archivetemplate.cfm?author="+id+"\" target=\"_blank\">"+id+"</a></div>");
		});
	  	return marker;
	}
	if (request.readyState == 4) {
	var xmlDoc = request.responseXML;
	var markers = xmlDoc.documentElement.getElementsByTagName("marker");
	for (var i = 0; i < markers.length; i++) {
	  	var point = new GPoint(parseFloat(markers[i].getAttribute("lng"))-(Math.random()/70),parseFloat(markers[i].getAttribute("lat"))-(Math.random()/70));
  		var marker = createMarker(point, i + 1);
  		map.addOverlay(marker);
	}
  }
}
request.send(null);

</script>

</body>
</html>
