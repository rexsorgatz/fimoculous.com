<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>The Untitled ESPN Book</title>
<style type="text/css">
  @import url("http://www.millershalesespnbook.com/espn/styles.css");
</style>
<script>
	function tryit(a) {
		if (document.storysubmit.textbox.value=='Enter your story...') {
			document.storysubmit.textbox.value='';
		} 
	}
</script>
</head>

<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
	<div class="header">
		<div class="logo">
			<a href="http://www.millershalesespnbook.com/"><img src="http://www.millershalesespnbook.com/espn/images/logo-espnbook.png" width="544" height="40" hspace="0" vspace="0" border="0" alt="The Untitled ESPN Book" /></a>
			<br clear="all" />
			<div class="subtitle">* name coming soon!</div>
		</div>
	</div>
	<div class="main" style="height:200px;">
		<br/><br/><br/><br/><br/>
		<p align="center">Thanks for the story!<br/><a href="http://www.millershalesespnbook.com/">Back to the homepage.</a></p>
	</div>
	<div class="copyright">
		Copyright 2009, James Miller & Tom Shales
	</div>
<cfmail to="millershales@gmail.com" from="#form.emailbbox#" subject="ESPN Story Submission" type="HTML">
#form.textbox#<br><br>
</cfmail>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-7043838-1");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>
