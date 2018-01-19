<title>TEST-PAD</title>

<cfinvoke component="login" method="verify" returnvariable="getLogin">
	<cfinvokeargument name="username" value="Heath">
	<cfinvokeargument name="password" value="8675309">
</cfinvoke>

<cfdump var="#getLogin#">