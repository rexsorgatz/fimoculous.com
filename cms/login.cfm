

<html>
<head>
	<title>CMS</title>
	<link rel="stylesheet" type="text/css" href="/styles/fimostyles_cms.css">
</head>
<body bgcolor="Silver" onLoad="document.LoginForm.UserID.focus()">
<br><br><br><br><br><br>
<form name="LoginForm" action="results.cfm" method="POST">	
<table width="500" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#7D8A96" class="cmstable">
	<tr>
		<td><b>Login:</b> <input type="text" maxlength="20" name="UserID"></td>
		<td><b>Password:</b> <input type="password" maxlength="20" name="Password"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="Login"></td>
	</tr>
</table>

</form>


</body>

</html>