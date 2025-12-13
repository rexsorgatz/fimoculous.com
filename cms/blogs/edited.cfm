<cfif isdefined("FORM.id")>
	<cfset operation = "Updated">
	<cfupdate username="fimoculous" password="fmcr5473" datasource="mspot" tablename="tblBlogs">
<cfelse>
	<cfset operation = "Inserted">
	<cfinsert username="fimoculous" password="fmcr5473" datasource="mspot" tablename="tblBlogs">
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body>

<cfinclude template="../header.cfm">
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td>
			<br><br>
			<cfoutput>
			<strong>Done:</strong> #blogName#<br><br>
			</cfoutput>
			<a href="/cms/blogs/"><b>&raquo;Back To Blog Admin</b></a><br><br>
		</td>
	</tr>
</table>
</body>
</html>
<cfquery name="myBlogs" datasource="mspot" dbtype="ODBC">
	SELECT blogName, feedLoc, blogLoc
	FROM tblBlogs
</cfquery>

<cfsavecontent variable="theOPMLContent">
<opml version="1.0">
  <title>MNspeak Aggregator OPML</title>
  <ownerName>MNspeak</ownerName><body>
<cfoutput query="myBlogs"><cfset bloglocation = #REReplaceNoCase(blogLoc,'&','&amp;','ALL')#><outline title="#blogName#" type="rss" htmlUrl="#bloglocation#" xmlUrl="#feedLoc#"/></cfoutput>
</body></opml>
</cfsavecontent>

<cffile action="write" file="c:\websites\fimoculous\mnspeak\aggregator\opml.xml" output="#theOPMLContent#">



<cfscript>
function zipToLat(zip) {
	if (zip eq 54021) {
		return 44.747648;
	} else if (zip eq 55011) {
		return 45.336494;
	} else if (zip eq 55044) {
		return 44.674865;
	} else if (zip eq 55075) {
		return 44.888128;
	} else if (zip eq 55077) {
		return 44.850123;
	} else if (zip eq 55101) {
		return 44.969963;
	} else if (zip eq 55102) {
		return 44.937228;
	} else if (zip eq 55103) {
		return 44.960798;
	} else if (zip eq 55104) {
		return 44.953179;
	} else if (zip eq 55105) {
		return 44.934723;
	} else if (zip eq 55106) {
		return 44.968384;
	} else if (zip eq 55107) {
		return 44.927235;
	} else if (zip eq 55108) {
		return 44.982217;
	} else if (zip eq 55109) {
		return 45.011859;
	} else if (zip eq 55110) {
		return 45.074527;
	} else if (zip eq 55111) {
		return 44.901548;
	}  else if (zip eq 55112) {
		return 45.074129;
	}  else if (zip eq 55113) {
		return 45.012876;
	}  else if (zip eq 55114) {
		return 44.967968;
	}  else if (zip eq 55116) {
		return 44.914007;
	}  else if (zip eq 55117) {
		return 44.992165;
	}  else if (zip eq 55119) {
		return 44.955384;
	}  else if (zip eq 55122) {
		return 44.803593;
	}  else if (zip eq 55124) {
		return 44.746147;
	}  else if (zip eq 55125) {
		return 44.916195;
	}  else if (zip eq 55126) {
		return 45.083334;
	}  else if (zip eq 55129) {
		return 0;
	}  else if (zip eq 55303) {
		return 45.238537;
	}  else if (zip eq 55317) {
		return 44.867924;
	}  else if (zip eq 55318) {
		return 44.806071;
	}  else if (zip eq 55337) {
		return 44.76086;
	}  else if (zip eq 55364) {
		return 44.938158;
	}  else if (zip eq 55369) {
		return 45.108636;
	}  else if (zip eq 55378) {
		return 44.761547;
	}  else if (zip eq 55379) {
		return 44.7793;
	}  else if (zip eq 55401) {
		return 44.983473;
	}  else if (zip eq 55402) {
		return 44.976184;
	}  else if (zip eq 55403) {
		return 44.967345;
	}  else if (zip eq 55404) {
		return 44.960891;
	}  else if (zip eq 55405) {
		return 44.968734;
	}  else if (zip eq 55406) {
		return 44.938359;
	}  else if (zip eq 55407) {
		return 44.937787;
	}  else if (zip eq 55408) {
		return 44.946575;
	}  else if (zip eq 55409) {
		return 44.926378;
	}  else if (zip eq 55411) {
		return 44.999601;
	}  else if (zip eq 55412) {
		return 45.024236;
	}  else if (zip eq 55413) {
		return 44.997994;
	}  else if (zip eq 55414) {
		return 44.977908;
	}  else if (zip eq 55416) {
		return 44.946899;
	}  else if (zip eq 55417) {
		return 44.905371;
	}  else if (zip eq 55418) {
		return 45.01923;
	}  else if (zip eq 55419) {
		return 44.902567;
	}  else if (zip eq 55120) {
		return 44.873825;
	}  else if (zip eq 55121) {
		return 44.843039;
	}  else if (zip eq 55422) {
		return 45.0089;
	}  else if (zip eq 55423) {
		return 44.875731;
	}  else if (zip eq 55424) {
		return 44.904385;
	}  else if (zip eq 55426) {
		return 44.954448;
	}  else if (zip eq 55430) {
		return 45.061106;
	}  else if (zip eq 55437) {
		return 44.823279;
	}  else if (zip eq 55446) {
		return 45.032446;
	}  else if (zip eq 55447) {
		return 44.998593;
	}  else if (zip eq 55455) {
		return 44.981562;
	}  else if (zip eq 55719) {
		return 47.500744;
	}  else if (zip eq 55720) {
		return 46.726041;
	}  else if (zip eq 55805) {
		return 46.798733;
	}  else if (zip eq 56082) {
		return 44.335107;
	}  else if (zip eq 56178) {
		return 44.277342;
	}  else if (zip eq 56307) {
		return 45.615114;
	}  else if (zip eq 56401) {
		return 46.357219;
	}  else if (zip eq 56537) {
		return 46.289723;
	}  else if (zip eq 98109) {
		return 47.633875;
	}  else if (zip eq 96815) {
		return 21.281084;
	} 
	else {
		return 0;
	}
}
function zipToLong(zip) {
	if (zip eq 54021) {
		return -92.753528;
	} else if (zip eq 55011) {
		return -93.265834;
	} else if (zip eq 55044) {
		return -93.257802;
	} else if (zip eq 55075) {
		return -93.046013;
	} else if (zip eq 55077) {
		return -93.073938;
	} else if (zip eq 55101) {
		return -93.083167;
	} else if (zip eq 55102) {
		return -93.120852;
	} else if (zip eq 55103) {
		return -93.121594;
	} else if (zip eq 55104) {
		return -93.15797;
	} else if (zip eq 55105) {
		return -93.165148;
	} else if (zip eq 55106) {
		return -93.048817;
	} else if (zip eq 55107) {
		return -93.086157;
	} else if (zip eq 55108) {
		return -93.17458;
	} else if (zip eq 55109) {
		return -93.017072;
	} else if (zip eq 55110) {
		return -93.011299;
	} else if (zip eq 55111) {
		return -93.202579;
	}  else if (zip eq 55112) {
		return -93.199691;
	}  else if (zip eq 55113) {
		return -93.149245;
	}  else if (zip eq 55114) {
		return -93.198067;
	}  else if (zip eq 55116) {
		return -93.172747;
	}  else if (zip eq 55117) {
		return -93.196937;
	}  else if (zip eq 55119) {
		return -93.196937;
	}  else if (zip eq 55120) {
		return -93.12902;
	}  else if (zip eq 55121) {
		return -93.16753;
	}  else if (zip eq 55122) {
		return -93.196937;
	}  else if (zip eq 55124) {
		return -93.20776;
	}  else if (zip eq 55125) {
		return -92.951413;
	}  else if (zip eq 55126) {
		return -93.134367;
	}  else if (zip eq 55129) {
		return 0;
	}  else if (zip eq 55303) {
		return -93.535906;
	}  else if (zip eq 55317) {
		return -93.535906;
	}  else if (zip eq 55318) {
		return -93.608314;
	}  else if (zip eq 55337) {
		return -93.275283;
	}  else if (zip eq 55364) {
		return -93.656087;
	}  else if (zip eq 55369) {
		return -93.43987;
	}  else if (zip eq 55378) {
		return -93.343445;
	}  else if (zip eq 55379) {
		return -93.268251;
	}  else if (zip eq 55401) {
		return -93.268251;
	}  else if (zip eq 55402) {
		return -93.275871;
	}  else if (zip eq 55403) {
		return -93.282841;
	}  else if (zip eq 55404) {
		return -93.26416;
	}  else if (zip eq 55405) {
		return -93.299096;
	}  else if (zip eq 55406) {
		return -93.221357;
	}  else if (zip eq 55407) {
		return -93.2545;
	}  else if (zip eq 55408) {
		return -93.286173;
	}  else if (zip eq 55409) {
		return -93.28182;
	}  else if (zip eq 55411) {
		return -93.300548;
	}  else if (zip eq 55412) {
		return -93.302033;
	}  else if (zip eq 55413) {
		return -93.255194;
	}  else if (zip eq 55414) {
		return -93.219904;
	}  else if (zip eq 55416) {
		return -93.340344;
	}  else if (zip eq 55417) {
		return -93.23606;
	}  else if (zip eq 55418) {
		return -93.240108;
	}  else if (zip eq 55419) {
		return -93.288618;
	}  else if (zip eq 55422) {
		return -93.3395;
	}  else if (zip eq 55423) {
		return -93.335005;
	}  else if (zip eq 55424) {
		return -93.335005;
	}  else if (zip eq 55426) {
		return -93.379627;
	}  else if (zip eq 55430) {
		return -93.299068;
	}  else if (zip eq 55437) {
		return -93.343499;
	}  else if (zip eq 55446) {
		return -93.472323;
	}  else if (zip eq 55447) {
		return -93.494695;
	}  else if (zip eq 55455) {
		return -93.23928;
	}  else if (zip eq 55719) {
		return -92.45282;
	}  else if (zip eq 55720) {
		return -92.45282;
	}  else if (zip eq 55805) {
		return -92.094553;
	}  else if (zip eq 56082) {
		return -93.981061;
	}  else if (zip eq 56178) {
		return -96.130235;
	}  else if (zip eq 56307) {
		return -94.574022;
	}  else if (zip eq 56401) {
		return -94.201873;
	}  else if (zip eq 56537) {
		return -96.064338;
	}  else if (zip eq 98109) {
		return -122.347615;
	}  else if (zip eq 96815) {
		return -157.826616;
	} 
	else {
		return 0;
	}
}
</cfscript>


<cfquery name="myPBlogs" datasource="mspot" dbtype="ODBC">
	SELECT tblPasswords.userFullName, tblPasswords.UserID, tblPasswords.userZip, tblPasswords.userWebsite, tblBlogs.id, tblBlogs.blogName, tblBlogs.blogLoc, tblBlogs.blogThumb, tblBlogs.headline_one
	FROM tblBlogs, tblPasswords
	WHERE tblPasswords.userWebsite = tblBlogs.blogLoc
	AND tblPasswords.userZip > 1
</cfquery>


<cfsavecontent variable="theGoogleMapsContent"><markers>
<cfoutput query="myPBlogs"><cfset bloglocation = #REReplaceNoCase(blogLoc,'&','&amp;','ALL')#><marker title="#blogName#" userID="#userID#" userFullName="#userFullName#" htmlUrl="#bloglocation#" lat="#zipToLat(userZip)#" lng="#zipToLong(userZip)#">asdf</marker>
</cfoutput></markers>
</cfsavecontent>

<cffile action="write" file="c:\websites\fimoculous\mnspeak\meta\data.xml" output="#theGoogleMapsContent#">
