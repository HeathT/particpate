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


<cfinvoke method="verify" component="login" returnvariable="loggedUser">
	<cfinvokeargument name="username" value="Heath" />
	<cfinvokeargument name="password" value="8675309" />
</cfinvoke>
<br />
<cfdump var="#loggedUser#" />

<br /><br />

<cfinvoke method="findUser" component="user" returnvariable="test2">
	<cfinvokeargument name="username" value="Heath" />
</cfinvoke>

<br /><br />
<cfdump var="#test2#" label="Return from method: findUser" />


<br /><br />
<cfinvoke method="createSession" component="session" returnvariable="allThings">
	<cfinvokeargument name="userInfo" value="#test2#" />
</cfinvoke>

<br /><br />
<cfdump var="#session#" label="Session Information" />

<br /><br />


