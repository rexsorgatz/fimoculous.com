
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="openid.server" href="http://www.myopenid.com/server">
<link rel="openid.delegate" href="http://rexsorgatz.myopenid.com/">
<title>2010 Year Lists - Fimoculous.com</title>
<cfinclude template="headerstuff2.cfm">
</head>
<div id="cell">
<a name="top" href="/#top"><div id="transparent"></div></a>
<div id="whitespace">&nbsp;</div>
<div id="tweets">
	<div id="tweets-content">
		<div id="twitter-icon"><a href="http://twitter.com/fimoculous"><img src="/images/twitter-icon.png" width="38" height="38" alt="Twitter Logo"></a></div>
		<div id="twitter-icon-bio-pic"><a href="http://twitter.com/fimoculous"><img src="http://a3.twimg.com/profile_images/783788107/rex_bigger.jpg" width="34" height="34" alt="Rex Sorgatz"></a></div>
		<p><cfinclude template="i-twitter.cfm"></p>
	</div>
</div>

<table width="750" border="0" cellspacing="5" cellpadding="6" align="center">
	<tr>
		<td valign="top" width="100%" height="100%">
<div class="bodybox" style="height:99.99%">
<div class="header">
<div class="title" style="margin-bottom: 10px;">LISTS: 2010: SUBMIT</div>
</div>
<div class="bodytext">
<div class="sortbox">


<p><em><strong>Want to submit a link to the <a href="http://www.fimoculous.com/year-review-2010.cfm">List of Lists</a>? Some notes on style:</strong></em></p>
<p><em>+ Please eliminate the words "of 2010" or "of the year" from the List Name.</em></p>
<p><em>+ Use capitals for all words in the List Name.</em></p>
<p><em>+ So, for example, "Best films of 2010" should be written as simply "Best Films".</em></p>
<p><em>+ Please only submit lits that have to do with 2010. For example, don't submit "Best Cars Of All Time".</em></p>
<hr style="border: 1px dotted #CCCCCC;width:100%;" /><br />
<form action="year-review-submited.cfm" method="post" enctype="multipart/form-data">
<table width="500" cellspacing="0" cellpadding="5" align="center" class="cmstable">
	<tr>
		<td align="left"><strong>List Name:</strong></td>
		<td align="left"><input type="text" name="listname" size="40"></td>
	</tr>
	<tr>
		<td align="left"><strong>Source:</strong></td>
		<td align="left"><input type="text" name="source" size="40"></td>
	</tr>
	<tr>
		<td align="left"><strong>Link:</strong></td>
		<td align="left"><input type="text" name="link" size="40"></td>
	</tr>
	<tr>
		<td align="left"><strong>Category:</strong></td>
		<td align="left">
<select name="category" >
  <option value="advertising">Advertising</option>
  <option value="architecture">Architecture</option>
  <option value="art">Art</option>
  <option value="automobiles">Automobiles</option>
  <option value="books">Books</option>
  <option value="business">Business</option>
  <option value="comedy">Comedy</option>
  <option value="comics">Comics</option>
  <option value="dance">Dance</option>
  <option value="design">Design</option>
  <option value="dvd">DVD</option>
  <option value="fashion">Fashion</option>
  <option value="education">Education</option>
  <option value="film">Film</option>
  <option value="food">Food/Drink</option>
  <option value="gadgets">Gadgets</option>
  <option value="games">Games</option>
  <option value="ideas">Ideas</option>
  <option value="media">Media</option>
  <option value="miscellaneous">Miscellaneous</option>
  <option value="music">Music</option>
  <option value="online">Online</option>
  <option value="paranormal">Paranormal</option>
  <option value="people">People</option>
  <option value="photos">Photos</option>
  <option value="politics">Politics</option>
  <option value="religion">Religion</option>
  <option value="sports">Sports</option>
  <option value="science">Science</option>
  <option value="sex">Sex</option>
  <option value="technology">Technology</option>
  <option value="theater">Theater</option>
  <option value="toys">Toys</option>
  <option value="travel">Travel</option>
  <option value="tv">TV</option>
  <option value="musicvideos">Videos</option>
  <option value="words">Words/Search</option>
</select>
	</tr>
	<tr>
		<td colspan="2" align="center"><br>
		<input type="hidden" name="mydate" value="<cfoutput>#DateFormat(Now(), "MM/DD/YY")#</cfoutput>">
		<input type="submit" value="Submit Link">
		</form>
		</td>
	</tr>
</table>


</div>
<br /><br />
</div>
</div>
		</td>
	</tr>
</table>
<br />


<script type="text/javascript">
var _sf_async_config={uid:2823,domain:"fimoculous.com"};
(function(){
  function loadChartbeat() {
    window._sf_endpt=(new Date()).getTime();
    var e = document.createElement('script');
    e.setAttribute('language', 'javascript');
    e.setAttribute('type', 'text/javascript');
    e.setAttribute('src',
       (("https:" == document.location.protocol) ? "https://s3.amazonaws.com/" : "http://") +
       "static.chartbeat.com/js/chartbeat.js");
    document.body.appendChild(e);
  }
  var oldonload = window.onload;
  window.onload = (typeof window.onload != 'function') ?
     loadChartbeat : function() { oldonload(); loadChartbeat(); };
})();

</script>
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

