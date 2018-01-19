<cfcomponent displayname="login" output="false">

	<cffunction access="remote" returnType="any" returnFormat="JSON" name="verify"> 
		<cfargument required="true" type="string" name="username" />
		<cfargument required="true" type="string" name="password" />
		<cfargument required="false" type="string" name="method" default="web" />

		<cfquery datasource="#application.ds#" name="getLogin">
			SELECT  id,
					fname,
					lname,
					username,
					active,
					role,
					lastlogin,
					created
			FROM    user
			WHERE   username = '#username#'
			AND     password = '#password#'
			AND     active = 1
		</cfquery> 

		<cfif #getLogin.recordcount# NEQ 1>
			<cfreturn false>
		<cfelse>

			<cfquery datasource="#application.ds#" name="recordlogin">
				INSERT 	into loginhistory
				SET		userid = #getLogin.id#;
			</cfquery>

			<cfquery datasource="#application.ds#" name="setLastLogin">
				UPDATE user
				SET    lastlogin = CURRENT_TIMESTAMP
				WHERE  id = #getLogin.id#
			</cfquery>

			<cfinvoke component="util" method="makeJSON" returnvariable="q2aResults">
				<cfinvokeargument name="queryObj" value="#getLogin#">
			</cfinvoke>

			<!--- set session variables so we're not requiring information from the front end --->
			<cfset session.userInfo = {} />
			<cfset session.userInfo.userid = getLogin.id />
			<cfset session.userInfo.fname = getLogin.fname />
			<cfset session.userInfo.lastlogin = getLogin.lastlogin />

			<cfreturn q2aResults> 
		</cfif>

	</cffunction>

</cfcomponent>

