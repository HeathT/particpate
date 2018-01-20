<title>TEST-PAD</title>

<!--- <cfinvoke component="login" method="verify" returnvariable="getLogin">
	<cfinvokeargument name="username" value="Heath">
	<cfinvokeargument name="password" value="8675309">
</cfinvoke> --->

<!--- <cfdump var="#getLogin#"> --->

<cfset session.userInfo = {} />
<cfset session.userInfo.sessionid = session.sessionid />

<!--- <cfinvoke method="createUser" component="user" returnvariable="test">
	<cfinvokeargument name="username" value="Jimmy008" />
	<cfinvokeargument name="firstname" value="Impostor" />
	<cfinvokeargument name="lastname" value="Bond" />
	<cfinvokeargument name="password" value="stirred" />
	<cfinvokeargument name="email" value="ib008@evil.plot.com" />
</cfinvoke> --->


<br /><br />

<cfinvoke method="findUser" component="user" returnvariable="test2">
	<cfinvokeargument name="email" value="heath.thompson@gmail.com" />
</cfinvoke>

<br /><br />
<cfdump var="#test2#" label="Return from method: findUser" />

<br /><br />
<cfdump var="#session#" />
