
<cfquery name="fetchuser" datasource="mspot" maxrows="1">
	SELECT userEmail
	FROM tblPasswords
	WHERE UserID = '#Session.UserID#'
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - Meta</title>
	<script type="text/javascript" src="../scripts.js"></script>
	<link rel="stylesheet" type="text/css" href="../styles.css">
	<script>
		function validateOnSubmit() {
		if (document.myform.title.value.length < 3) {
			alert("You seem to have forgotten a headline.");
			return false;
			}
		else {
			return true;
			}
		 };
	</script>
</head>
<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#ffffff" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#ffffff">
	<tr>
		<td>
<cfinclude template="../header.cfm">
		<form onSubmit="return validateOnSubmit()" action="submit.cfm" method="post" enctype="multipart/form-data" name="myform" id="myform">
			<input type="hidden" name="accepted" value="0">
			<input type="hidden" name="longpost" value="0">
			<input type="hidden" name="hascomments" value="1">
			<input type="hidden" name="images" value="">
			<input type="hidden" name="entrylong" value="">
			<input type="hidden" name="commentnum" value="0">
			<input type="hidden" name="useremail" value="<cfoutput>#fetchuser.userEmail#</cfoutput>">
			<input type="hidden" name="thisdate" size="10" <cfoutput>value="#DateFormat(Now(), "MM/DD/YY")#"</cfoutput>>
			
			<table width="50%" border="0" cellspacing="0" cellpadding="2" align="center">
				<tr>
					<td colspan="2" align="left"><br />
					<div class="dailytitle">So you want to post. Here are some guidelines:</div>
					
					<ol>
						<li><strong>Topic must be local.</strong> Dylan counts, but just barely.</li>
						<li><strong>No flames.</strong> Attacking people (unless they're famous and deserve it) is simply not tolerated.</li>
						<li><strong>No useless politics.</strong> Political threads are okay, but only if it's a new viewpoint on a new issue. Otherwise, go hang out on the other 100 political blogs in town.</li>
						<li><strong>Include links.</strong> If it doesn't have a link, it's probably not worth a post. As with all totalizing statements, there are exceptions.</li>
						<li><strong>No blatant self-promotion.</strong> Occasionally, it's okay to link to your own content, as long as it's cool, local, and of general interest.  If you choose to do so, please note the nature of your affiliation.  MNSpeak editors may remove your post if you fail to properly identify yourself when posting it.  Be prepared to be mercilessly ridiculed if your stuff stinks.  Sometimes, it's a better idea to email your link to our editors and ask them to post it.  <a href="http://www.mnspeak.com/mnspeak/contact.cfm">contact us</a>.</li>
						<li><strong>Be unique.</strong> A good post isn't necessarily a rehashing of a daily newspaper story. A good post is an overlooked piece of information or a unique perspective.</li>
						<li><strong>No HTML.</strong> You're only allowed to use the bold, italics, and link buttons below. Otherwise, the site turns into a mess. We run a tidy house.</li>
						<li><strong>Have fun.</strong> This is so important. This site is about having a good time.</li>
					</ol>
					<div class="dailytitle">Okay, now give it a whirl:</div>
					<br />
					</td>
				<tr>
				<tr>
					<td align="left"><strong>Headline:</strong></td>
					<td align="left"><input type="text" name="title" size="35" maxlength="40"> (required, title case)</td>
				<tr>
				<tr>
					<td align="left"><strong>Author:</strong></td>
					<td align="left"><input type="text" name="author" value="<cfoutput>#Session.UserID#</cfoutput>" size="35" maxlength="10" readonly> (you can't change this)</td>
				<tr>
				<tr>
					<td align="left"><strong>Post:</strong></td>
					<td align="left">
					<textarea cols="65" rows="10" name="entry" id="comComment"></textarea><br clear="all" />
					<div id="toolbar">
						<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','strong')" src="http://www.mnspeak.com/mnspeak/images/misc/bold.gif" title="click to make your text selection bold (or type control-shift-b)">
						<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','emphasis')" src="http://www.mnspeak.com/mnspeak/images/misc/italic.gif" title="click to make your text selection italicized (or type control-shift-t)">
						<img class="buttons" onMouseOver="mouseover(this);" onMouseOut="mouseout(this);" onMouseDown="mousedown(this);" onMouseUp="mouseup(this);" onClick="return pnhEditTextarea('comComment','a_href')" src="http://www.mnspeak.com/mnspeak/images/misc/link.gif" width="32" height="16" align="middle" title="click to add a link to the selected text (or type control-shift-a)">
					</div>
					(to use these buttons, highlight a word first)
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><br />
					<input type="submit" class="searchbutton" value="Submit Your Post">
					</form>
					</td>
				</tr>
			</table>
			<br /><br /><br /><br /><br />

		</td>
	</tr>
</table>

</body>
</html>
