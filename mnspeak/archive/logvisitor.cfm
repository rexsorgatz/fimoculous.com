<!---	File: logvisitor.cfm
		Purpose: Generic logging for use when standard log directory is not accessible to administrators (logs written with <cflog> tag)
--->

<cfparam name="LoggedInName" default="">	<!--- screen name of logged in user --->
<cfparam name="LoggedOutName" default="">	<!--- screen name of logged out, anonymous user --->
<cfparam name="Comment" default="">			<!--- leading snippet of comment left --->
<cfparam name="LogFileName" default="commentlog.txt">	<!--- filename of log file to write to --->
<cfparam name="LogFileURLPath" default="">			<!--- URL path for log file (must end in "/") e.g. "/comments/" --->
<cfparam name="LogFilePathAbsolute" default="">		<!--- filesystem path to log file (must end in "\" or "/" depending on filesystem type); to be used if log file exists outside of document root) e.g. "d:\websites\mnspeak\comments\" --->
<cfparam name="LogDatetime" default="#Now()#">		<!--- current date/time --->

<!--- To change the length of the logged comment snippet, change the value of this variable. Optionally, you may set it to -1 to include all of the 
	comment or 0 to include none of the comment. --->
<cfset CommentLength = 100>

<!--- **** Note that if both LogFilePathAbsolute and LogFileURLPath are non-blank values, LogFilePathAbsolute overrides LogFileURLPath **** --->

<cfif LogFilePathAbsolute EQ "">
	<!--- if filesystem path blank, derive it from url path if provided --->
	<cfif LogFileURLPath NEQ "">
		<cfset LogFilePathAbsolute = ExpandPath(LogFileURLPath)>
	<cfelse>
		<!--- if url path not provided, then use the directory containing the Application.cfm file. --->
		<cfset LogFilePathAbsolute = GetDirectoryFromPath(GetCurrentTemplatePath())>
		<cfset PrevLogFilePathAbsolute = "">
		<!--- crawlin' all up in yo' directory structure, ya'll! --->
		<cfloop condition="NOT FileExists('#LogFilePathAbsolute#Application.cfm') AND LogFilePathAbsolute NEQ PrevLogFilePathAbsolute">
			<!--- loop until you reach the first parent directory containing an Application.cfm file, or if one doesn't exist, write the log to the document root --->
			<cfset PrevLogFilePathAbsolute = LogFilePathAbsolute>
			<cfset LogFilePathAbsolute = REReplace(LogFilePathAbsolute, "([/\\])[^/\\]*[/\\]$", "\1")>
		</cfloop>
	</cfif>
</cfif>

<!--- strip html tags, pipes (|), and control characters from comment for logging purposes --->
<cfset Comment = REReplace(Comment, "<[^>]*>", "", "all")>
<cfset Comment = Replace(Comment, "|", "", "all")>
<cfset Comment = REReplace(Comment, "[[:cntrl:]]*", "", "all")>

<!--- trim trailing part of comment --->
<cfif CommentLength gt 0 and Len(Comment) gt CommentLength>
	<cfset Comment = Left(Comment, CommentLength)>
<cfelseif CommentLength eq 0>
	<cfset Comment = "">
</cfif>

<!--- log file format: date time|LoggedInName|LoggedOutName|remote address|remote host|Comment --->
<cfset LogEntry = "#DateFormat(LogDateTime, 'mm/dd/yyyy')# #TimeFormat(LogDateTime, 'HH:mm:ss')#|#LoggedInName#|#LoggedOutName#|#CGI.REMOTE_ADDR#|#CGI.REMOTE_HOST#|#Comment#">

<!--- lock the log file while writing to avoid problems if multiple log entries need to be written at once (avoid a naughty chinchilla) --->
<cflock name="#LogFilePathAbsolute##LogFileName#" type="exclusive" timeout="5"><!---don't lock for more than 5 seconds--->
	<cffile action="append" file="#LogFilePathAbsolute##LogFileName#" output="#LogEntry#" addnewline="yes">
</cflock>
