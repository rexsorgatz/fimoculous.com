<div class="titlebar">&raquo;MY MNSPEAK</div>
<cfif session.loggedin is TRUE>
<p style="padding: 2px"><cfoutput><strong>logged in: #Session.UserID#</strong></cfoutput></p>

<p align="center">
	&raquo;<a class="navlinks" href="/mnspeak/meta/create.cfm">submit post</a> 
	&raquo;<a class="navlinks" href="/mnspeak/archive/archivetemplate.cfm?author=<cfoutput>#Session.UserID#</cfoutput>">view profile</a>
	&raquo;<a class="navlinks" href="/mnspeak/meta/register.cfm?author=<cfoutput>#Session.UserID#</cfoutput>">edit profile</a><br />
	&raquo;<a class="navlinks" href="/mnspeak/meta/logout.cfm">log out</a>
</p>
<cfelse>
<p style="padding: 2px">create an account to comment and submit posts:</p>
<p align="center">&raquo;<a class="navlinks" href="/mnspeak/meta/register.cfm">sign up</a>
&raquo;<a class="navlinks" href="/mnspeak/meta/login.cfm">log in</a>
</p>

</cfif>

