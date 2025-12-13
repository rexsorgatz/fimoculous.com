<!--- BE CAREFULL NOT TO REMOVE THIS VARIABLE. IT CONTROLS EMAIL.--->
<cfset newsletter = "false">


<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center" valign="top">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" width="800" height="260" id="myMovieName">
		<param name="movie" value="http://www.mnspeak.com/mnspeak/images/structure/header.swf" />
		<param name="quality" value="high" />
		<param name="bgcolor" value="#ECF0F2" />
		<embed src="http://www.mnspeak.com/mnspeak/images/structure/header.swf" quality="high" bgcolor="#ffffff" width="800" height="260" name="myMovieName" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
		</embed>
		</object>
		</td>
	</tr>
</table>
<div style="position:relative;">
<div class="weather"><cfinclude template="../mnspeak/weather-output.cfm"></div>
</div>
