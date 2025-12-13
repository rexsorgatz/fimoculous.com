<cfset bad = "false">
<cfset naughty = "<h1>,Phentermine,useful info!Regards!,[url= http,[url=http,cheap flight,cheap flights,ringtone,home equity line of credit,Regards!it4sepo,pandaetu,gentoand,elfurl.com,altipresco,mantidona,mentos89,klavdi7,meditor,soma4u,delapondo,graciita,itgrande,manciperla,goyamit,milanmagic,hiamarego,prima2do,manutenzione,gracipediat,librotesta,consultazione,remeron,xwiki,lortab,glucophage,ephedrine,What hosting service do you use?,flonase,lorazepam,flexeril,lipitor,auto insurance,hotelnewsonline,webhostingfree,warcraft,effexor,very need money,onredelijk,placepublique,safskincare,maxisex,pisem,needle45,hoodia,freetarot,luckybet,zyban,zyprexa,zovirax,pillexa,poker,rolex,areaseo,ringtones,anal toys,web hosting,online directory,tubgirl,tramadol,cialis,facials,bravehost,ringer tone,vioxx,ritalin,adderall,eurosport,viagra,roulette,mortgage loan,hydrocodone,xanax,Great site,valium,pharmacy,honda civic,batcave,gangbang,net casino,femdom,cumfiesta,blowjobs,penis enlargement,fioricet,cumshot,mywebpage,Buy soma,didrex,ambien,allabout,propecia,konoplin,sports-betting,milavitsa,phendimetrazine,online-loan,adderal,texas-holdem,ativan,codeine,diet-pills,online-casinos,ultram,xenical,life insurance,used cars,meridia,personal-loan,levitra,carisoprodol,diazepam,online-gambling,milavitsa,auto-insurance,adipex,shemale,cum eating,oxycodone,wellbutrin,lisinopril,celebrex,metformin,paxil,tamiflu,vigrx,clenbuterol,persianktty,spyware doctor,lowestairfares,ionic breeze,tempurpedic,mpghunter,pokemonxxx,dragonbalxxx,milfcruiser,fist fuck, bangthumbs,gucci store,turbotax,cashadvancelaons,travel-insurance,Great web site!,girlsgonewild,hentai,nflleatherjacket,bunnyteens,porn movie,milf hunter,online car race,250free,thehun,bontril,tripod.com,mpeghunter,sexy teens,rwr.ru,alprazolam,sex midget,gay orgy,Nice site!,free resume,onlinecasino,camel toe,Online auctions,Good design!,zocor,lorcet,fluoxetine,diflucan,Good work!,Cool site!,Great work!,perfect breasts,chubby girl,lingerie modeling,dark magician girl,topless girls,cyclobenzaprine,lesbian teens,interacial sex,naked lesbians,milf seeker,asian school girls,fisting sex,nylon secretaries,anal orgasm,mexican hat dance,zoloft,japanese sex,milf seeker,cheap flights france,female ejaculation,see her squirt,vagina squirt,latin pussy,free printable,patricia ford,shower locker,pill identifier,.ru,.nu,sell home in encino,las vegas homes,Hello WebMaster!,Well done!,Thank you!,script src=,please follow this link,xoomer,.it,.pl,freewebpages,50megs,ultracet,oxycontin,venlafaxene,cheaptickets,raznoe,plavix,vicodin,norco,clonazepam,mabulle,sicilia,ativan,very informative site,geklette,grunhowl,blaukatze,akamiyo,vorbivor,nexium,[/url]">
<cfloop index="spamWords" from="1" to="#ListLen(naughty)#">
	<cfif form.comComment CONTAINS #trim(listGetAt(naughty, spamWords))#>
		<cfset bad = "true">
		<cfbreak> 
	</cfif>
</cfloop>

<cfif bad EQ "false">

<cfscript>
function formatText(myText) {
	var textToChange = myText;
	textToChange = ReReplace(textToChange, '\r','<br />','ALL');	
	return textToChange;
	}
</cfscript>

<cfset mytext = formatText(Form.comComment)>

<cfif mytext DOES NOT CONTAIN "<h1>" AND mytext DOES NOT CONTAIN "phentermine" AND mytext DOES NOT CONTAIN "poker">

	<cfquery username="fimoculous" password="fmcr5473" name="checkcount" datasource="mspot">
			SELECT COUNT(*) as ct 
			FROM tblPasswords 
			WHERE LCase(UserID) = Trim(LCase('#form.comName#'))
	</cfquery>
	
	<cfif checkcount.ct EQ 0 OR form.regUser EQ 1>
		   
		<cfquery name="updatethatcommentstable" datasource="mspot">
			INSERT INTO tblComments(comEntryID, comName, comURL, comComment, comDate, regUser)
			VALUES(#form.comEntryID#, '#form.comName#', '#form.comURL#', '#mytext#', #form.comDate#, #trim(form.regUser)#)
		</cfquery>
		
		<cfquery name="updatethatcommentcolumn" datasource="mspot">
			UPDATE tblContent
			SET commentnum = commentnum + 1
			WHERE entrynumber = #form.comEntryID#
		</cfquery>
		
		<cfquery name="getemaillist" datasource="mspot">
			SELECT emails
			FROM tblContent
			WHERE entrynumber = #form.comEntryID#
		</cfquery>
		<cfset emaillist = ValueList(getemaillist.emails)>
		<cfloop index="i" from="1" to="#ListLen(emaillist)#">
			<cfmail to="#listGetAt(emaillist, i)#" from="mnspeak@gmail.com" subject="MNspeak Comment Added" type="HTML">
		Hello from MNspeak.com. You requested to be informed when the post <a href="http://www.mnspeak.com/mnspeak/archive/post-#form.comEntryID#.cfm">#form.posttitle#</a> has a new comment. It just happened.
			</cfmail>
			<!---keeps out duplicates--->
			<cfif isDefined("form.emailaddy")>
			<cfif listGetAt(emaillist, i) EQ form.emailaddy>
			<cfset dontdoit="true">
			</cfif>
			</cfif>
		</cfloop>
		
		<cfif isDefined("form.emails")>
			<cfif isDefined("dontdoit")>
			<cfelse>
			<cfquery name="setemaillist" datasource="mspot">
				UPDATE tblContent
				SET emails = '#getemaillist.emails#'+','+'#form.emailaddy#'
				WHERE entrynumber = #form.comEntryID#
			</cfquery>
			</cfif>
		</cfif>
		<cfmail to="mnspeak@gmail.com" from="mnspeak@gmail.com" subject="MNspeak Comment" type="HTML">
		#form.comName#<br><br>#form.posttitle#<br><br>#form.comComment#
		</cfmail>
	
		<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
		
		<html>
		<head>
			<title>MNspeak.com</title>
			<link rel="stylesheet" type="text/css" href="/mnspeak/styles.css">
			<script type="text/javascript" src="/mnspeak/scripts.js"></script>
		</head>
		
		<body background="/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">
		<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
			<tr>
				<td>
		<cfinclude template="../header.cfm">								
					<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
						<tr>
							<td align="center" valign="top"><br>
							<p align="center">Yo, thanks for leaving a comment.<br /><br />
							&raquo;&raquo; <a href="http://www.mnspeak.com/mnspeak/archive/post-<cfoutput>#comEntryID#</cfoutput>.cfm#comments">Go back and see what you wrote.</a><br /><br />
							&raquo;&raquo; <a href="http://www.mnspeak.com/">Go back to the homepage.</a><br /><br />
							</p>
							<br><br>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</div>
		<br>
		
		
		
		<cfelse>
	
		<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
		
		<html>
		<head>
			<title>MNspeak.com</title>
			<link rel="stylesheet" type="text/css" href="/mnspeak/styles.css">
			<script type="text/javascript" src="/mnspeak/scripts.js"></script>
		</head>
		
		<body background="/mnspeak/images/structure/pattern.gif" bgcolor="#85AAB8" leftmargin="0" topmargin="5" marginwidth="0" marginheight="5">
		<table class="bodycopy" width="800" cellspacing="0" cellpadding="0" align="center" bgcolor="#D4E0E6">
			<tr>
				<td>
		<cfinclude template="../header.cfm">								
					<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#ECF0F2">
						<tr>
							<td width="30%" valign="top"></td>
							<td width="40%" valign="top"><br>
							<p>Oooops! The username you tried using is already taken by a registered user. You have three options from here:<br><br></p>
							<p>&raquo;&raquo; <a href="javascript:history.back()">Go back</a> and enter a different username.<br>
							&raquo;&raquo; If you are registered, <a href="http://www.mnspeak.com/mnspeak/meta/login.cfm?entryid=<cfoutput>#form.comEntryID#</cfoutput>">login</a>.<br />
							&raquo;&raquo; If you are not registered, <a href="http://www.mnspeak.com/mnspeak/meta/register.cfm">register</a>.
							</p>
							<br><br>
							</td>
							<td width="30%" valign="top"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		
		</div>
		<br>
	
	</cfif>
</cfif>
<cfelse>
Sorry, this site's futile attempt at spam filtering has identified something in your comment as naughty.
</body></html></cfif>
	


