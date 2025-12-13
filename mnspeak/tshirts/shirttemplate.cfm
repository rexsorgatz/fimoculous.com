

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>MNspeak.com - T-Shirts - <cfoutput>#teename#</cfoutput></title>
	<script>
	function checkform(formnum) {
		var thisform = 'myform'+formnum;
		if (document[thisform].os0.selectedIndex == 0)	{
			alert('oops, choose a size first');
			return false;
		}
		else {
			return true;
		}
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../styles.css">
<body background="http://www.mnspeak.com/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">

<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#ECF0F2">
	<tr>
		<td>
<cfinclude template="../header.cfm">
		<table width="98%" border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#ECF0F2">
			<tr>
				<td colspan="2" align="center"><hr size="1" noshade></td>
			</tr>
			<tr>
				<td width="300" align="center">
					<cfloop index="blah" from="1" to="#ListLen(teeimage)#">
						<img src="/mnspeak/images/tshirts/<cfoutput>#listGetAt(teeimage, blah)#</cfoutput>" alt="#listGetAt(teeimage, blah)#" width="300" height="300" hspace="10" vspace="10" align="left"><br clear="all"/>
					</cfloop>
					<br clear="all"/><cfoutput>#teedesc#</cfoutput><br clear="all"/><br>
				</td>
				<td align="left" valign="top">
					<div class="title"><cfoutput>#teename#</cfoutput></div><br />
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="3" align="center"><hr size="1" noshade></td>
						</tr>
						<tr>
							<td colspan="2"><strong>Price: $<cfoutput>#teeprice#</cfoutput> tee + $3 shipping</strong><br /></td>
							<td align="right"><!--In association with: <a href="http://www.vimlab.com/" target="_blank"><img src="/mnspeak/images/tshirts/vimlab.jpg" alt="vimlab" width="88" height="33" hspace="0" vspace="0" border="0" align="right"></a>--></td>
						</tr>
						<cfif teepics GT 1>
						<tr>
							<td colspan="3" align="center"><hr size="1" noshade></td>
						</tr>
						<tr>
							<td colspan="3" align="left" nowrap>
								<strong>Photo Examples:</strong>
								<cfloop index="blah" from="1" to="#ListLen(teepics)#">
									<cfoutput>
									<a href="/mnspeak/tshirts/shirtpictemplate.cfm?teeimg=#listGetAt(teepics, blah)#" onclick="window.open('/mnspeak/tshirts/shirtpictemplate.cfm?teeimg=#listGetAt(teepics, blah)#','','toolbar=no,status=no,location=no,menubar=no,top=50,left=50,height=450,width=600,scrollbars=no'); return false;"><img src="/mnspeak/images/tshirts/<cfoutput>#listGetAt(teepics, blah)#</cfoutput>-small.jpg" alt="<cfoutput>#teename#</cfoutput>" width="60" height="45" class="mainpic" hspace="3" vspace="0" align="center"></a></cfoutput>
								</cfloop>
								(click to enlarge)
							</td>
						</tr>
						</cfif>
						<tr>
							<td colspan="3" align="center"><hr size="1" noshade></td>
						</tr>
						<tr>
							<td colspan="3"><strong>Color:</strong> <cfoutput>#colortee#</cfoutput><br /></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><hr size="1" noshade></td>
						</tr>
						<cfoutput>
						<form action="https://www.paypal.com/cgi-bin/webscr" method="post" name="myform1" id="myform1" onSubmit="return checkform(1)">
						<input type="hidden" name="cmd" value="_xclick">
						<input type="hidden" name="business" value="rex@mnspeak.com">
						<input type="hidden" name="undefined_quantity" value="1">
						<input type="hidden" name="item_name" value="#m_item_name#">
						<input type="hidden" name="item_number" value="#m_item_number#">
						<input type="hidden" name="amount" value="#teeprice#.00">
						<input type="hidden" name="no_shipping" value="2">
						<input type="hidden" name="return" value="http://www.mnspeak.com/mnspeak/tshirts/order-complete.cfm">
						<input type="hidden" name="cancel_return" value="http://www.mnspeak.com/mnspeak/tshirts/">
						<input type="hidden" name="no_note" value="1">
						<input type="hidden" name="currency_code" value="USD">
						<input type="hidden" name="lc" value="US">
						<input type="hidden" name="on0" value="Size">
						<cfif m_sizes GT 1>
						<tr>
							<td width="80"><strong>Guy Sizes:</strong></td>
							<td width="120" valign="bottom">
								<select name="os0">
							    <option value="Select a Size">Select a Size
								<cfloop index="blah" from="1" to="#ListLen(m_sizes)#">
									<option value="#listGetAt(m_sizes, blah)#">#listGetAt(m_sizes, blah)#</option>
								</cfloop>
							    </select>
							</td>
							<td align="center">
								<input type="submit" value="Buy Now">
							</td>
						</tr>
						</cfif>
						</form>
						</cfoutput>
						<cfif m_sizes GT 1>
						<tr>
							<td colspan="5" align="center"><hr size="1" noshade></td>
						</tr>
						</cfif>
						<cfoutput>
						<form action="https://www.paypal.com/cgi-bin/webscr" method="post" name="myform2" id="myform2" onSubmit="return checkform(2)">
						<input type="hidden" name="cmd" value="_xclick">
						<input type="hidden" name="business" value="rex@mnspeak.com">
						<input type="hidden" name="undefined_quantity" value="1">
						<input type="hidden" name="item_name" value="#w_item_name#">
						<input type="hidden" name="item_number" value="#w_item_number#">
						<input type="hidden" name="amount" value="#teeprice#.00">
						<input type="hidden" name="no_shipping" value="2">
						<input type="hidden" name="return" value="http://www.mnspeak.com/mnspeak/tshirts/order-complete.cfm">
						<input type="hidden" name="cancel_return" value="http://www.mnspeak.com/mnspeak/tshirts/">
						<input type="hidden" name="no_note" value="1">
						<input type="hidden" name="currency_code" value="USD">
						<input type="hidden" name="lc" value="US">
						<input type="hidden" name="on0" value="Size">
						<cfif w_sizes GT 1>
						<tr>
							<td width="80"><strong>Girl Sizes:</strong></td>
							<td width="120" valign="bottom">
								<select name="os0">
							    <option value="Select a Size">Select a Size
								<cfloop index="blah" from="1" to="#ListLen(w_sizes)#">
									<option value="#listGetAt(w_sizes, blah)#">#listGetAt(w_sizes, blah)#</option>
								</cfloop>
							    </select>
							</td>
							<td align="center">
								<input type="submit" value="Buy Now">
							</td>
						</tr>
						</cfif>
						</form>
						</cfoutput>
						<cfif w_sizes GT 1>
						<tr>
							<td colspan="3" align="center"><hr size="1" noshade><br /></td>
						</tr>
						</cfif>
						<tr>
							<td colspan="3"><p><strong>Note:</strong> Purchases are through PayPal, but you do not need a PayPal account to complete the purchase. Just indicate on the next page that you do not have a PayPal account and enter your credit card info.</p></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><hr size="1" noshade><br /><br /></td>
						</tr>
						<tr>
							<td colspan="3" align="right">
							<cfif partner EQ "vimlab">
								This shirt brought to you by: <a href="http://www.vimlab.com" target="_blank"><img src="/mnspeak/images/tshirts/vimlab.jpg" alt="vimlab" width="88" height="33" hspace="0" vspace="0" border="0" align="middle"></a><br clear="all" /><br />
								</cfif>
								This shirt printed locally on: <img src="/mnspeak/images/tshirts/americanapparel.jpg" alt="american apparel" width="88" height="33" hspace="0" vspace="0" border="0" align="middle">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><hr size="1" noshade></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div align="left" class="title">The Entire Collection:</div>
					<a href="prairieho.cfm"><img src="/mnspeak/images/tshirts/prairieho-small.jpg" alt="prairie ho companiion" width="100" height="100" hspace="10" vspace="10" border="0" style="border: none;"></a>
					<a href="lakestreet.cfm"><img src="/mnspeak/images/tshirts/lakestreet-small.jpg" alt="lake street is for lovers" width="100" height="100" hspace="10" vspace="10" border="0" style="border: none;"></a>
					<a href="uptown.cfm"><img src="/mnspeak/images/tshirts/uptown-small.jpg" alt="s'uptown" width="100" height="100" hspace="10" vspace="10" border="0" style="border: none;"></a>
					<a href="belindajensen.cfm"><img src="/mnspeak/images/tshirts/belindajensen-small.jpg" alt="belinda jensen" width="100" height="100" hspace="10" vspace="10" border="0" style="border: none;"></a>
					<a href="chomsky.cfm"><img src="/mnspeak/images/tshirts/chomsky-small.jpg" alt="chomsky" width="100" height="100" hspace="10" vspace="10" border="0" style="border: none;"></a>
					<a href="spooningalone.cfm"><img src="/mnspeak/images/tshirts/spooningalone-small.jpg" alt="spooning alone" width="100" height="100" hspace="10" vspace="10" border="0" style="border: none;"></a>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><hr size="1" noshade></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br /><br /><br />

</body>	
</html>

