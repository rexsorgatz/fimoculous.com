<cfset referertruefalse = true>
<cfif IsDefined("URL.refer")>
	<cfif url.refer EQ "slander">
		<cfset referer = "SlanderousMinneapolis">
	<cfelseif url.refer EQ "butter">
		<cfset referer = "Brand & Butter">
	<cfelseif url.refer EQ "hwts">
		<cfset referer = "HowWasTheShow.com">
	<cfelseif url.refer EQ "mnstories">
		<cfset referer = "MNstories.com">
	<cfelse>
		<cfset referer = "MNspeak.com">
		<cfset referertruefalse = false>
	</cfif>
	<cfelse>
		<cfset referer = "MNspeak.com">
		<cfset referertruefalse = false>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>MNspeak.com</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src="scripts.js"></script>
</head>

<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#ffffff" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
	<tr>
		<td>
<cfinclude template="header.cfm">								
			<table width="95%" border="0" cellspacing="0" cellpadding="1" align="center">
				<tr>
					<td colspan="2" align="center"><hr size="1" noshade></td>
				</tr>
				<tr>
					<td width="300" valign="top"><h1>Viewer Information</h1></td>
					<td align="left" valign="top">
					<ul>
						<li><strong>Website Scope:</strong> 1,900+ daily (13,000+ weekly) unique visitors.  1,400 registered contributors. 230,000 page views monthly. [Statistics from Google Analytics]</li>
						<li><strong>Audience:</strong> Readers include local architects, artists, lawyers, designers, filmmakers, restaurateurs, musicians, journalists, and creative professionals of many different stripes.</li>
					</ul>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><hr size="1" noshade></td>
				</tr>
				<tr>
					<td width="300" colspan="2" valign="top"><h1>300x250 Featured Sponsorship</h1></td>
				</tr>
				<tr>
					<td width="300" align="center" valign="top">
						<img src="http://www.mnspeak.com/mnspeak/images/sponsors/walker_300x250.gif" alt="" width="300" height="250" hspace="0" vspace="10" border="1" align="top">
					</td>
					<td valign="top">
					<ul>
						<li><strong>Per/1,000 Impression Rate:</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong>$28.00 **</strong></li>
						<li><strong>Position:</strong> The ad will rotate in 4 positions on the site. Featured next to and below Today's Talk.  Similar positions on thread pages. </li>
						<li><strong>Size:</strong> 300x250</li>
						<li><strong>Format:</strong> JPEG, GIF or Flash.  Animations okay.</li>
					</ul>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><hr size="1" noshade></td>
				</tr>
				<tr>
					<td width="300" colspan="2" valign="top"><h1>160x600 Tower</h1></td>
				</tr>
				<tr>
					<td width="300" align="center" valign="top">
						<img src="http://www.mnspeak.com/mnspeak/images/sponsors/160x600demo.gif" alt="" width="160" height="600" hspace="0" vspace="10" border="1" align="top">
					</td>
					<td valign="top">
					<ul>
						<li><strong>Per/1,000 Impression Rate:</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong>$20.00 **</strong></li>
						<li><strong>Position:</strong> The ad will rotate on the right side of the thread pages. </li>
						<li><strong>Size:</strong> 160x600</li>
						<li><strong>Format:</strong> JPEG, GIF or Flash.  Animations okay.</li>
					</ul>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><hr size="1" noshade></td>
				</tr>
				<tr>
					<td width="300" colspan="2" valign="top"><h1>150x150 Tile</h1></td>
				</tr>
				<tr>
					<td width="300" align="center" valign="top">
						<img src="http://www.mnspeak.com/mnspeak/images/sponsors/chinoadvert.jpg" alt="" width="150" height="150" hspace="0" vspace="10" border="1" align="top">
					</td>
					<td valign="top">
					<ul>
						<li><strong>Weekly Rate:</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong>$100 **</strong></li>
						<li><strong>Position:</strong> Top position below the site contents on the left</li>
						<li><strong>Size:</strong> 150x150.</li>
						<li><strong>Format:</strong> JPEG, GIF or Flash.  Animations okay.</li>
					</ul>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><hr size="1" noshade></td>
				</tr>
				<tr>
					<td width="300" colspan="2" valign="top"><h1>150x60 Tile</h1></td>
				</tr>
				<tr>
					<td width="300" align="center" valign="top">
						<img src="http://www.mnspeak.com/mnspeak/images/sponsors/ripshark.gif" alt="" width="150" height="60" hspace="0" vspace="10" border="1" align="top">
					</td>
					<td valign="top">
					<ul>
						<li><strong>Weekly Rate:</strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong>$55 **</strong></strong></li>
						<li><strong>Position:</strong> Below the site contents on the left</li>
						<li><strong>Size:</strong> 150x60.</li>
						<li><strong>Format:</strong> JPEG or GIF. No animations.</li>
					</ul>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><hr size="1" noshade></td>
				</tr>
				<tr>
					<td width="300" valign="top"><h1>More Info</h1></td>
					<td align="left" valign="top">
					<ul>
						<li>* A discount of 7% is offered for pre-paid agreements of 10 weeks or longer.  All 26 week or longer agreements receive a 15% discount (no pre-payment necessary). </li>
						<li>** Miniumim 25,000 impressions for 300x250 ads or 15,000 impressions for 600x160 ads</li>
						<li><strong>Payment Types Accepted:</strong> Check, Credit Card (via PayPal).  </li>
					</ul>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><hr size="1" noshade></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><br /><strong>Interested? Fill out <a href="http://www.mnspeak.com/mnspeak/advertise.cfm<cfif IsDefined("URL.refer")>?refer=<cfoutput>#URL.refer#</cfoutput><cfelse></cfif>">this form</a> to get in contact with us.</strong><br /><br /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><hr size="1" noshade></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


</div>
<br />
</body>	
</html>
