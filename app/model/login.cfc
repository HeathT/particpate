<cfcomponent displayname="login" output="false">

	<cffunction access="remote" returntype="string" returnformat="JSON" name="verify" httpMethod="post"> 
		<cfargument required="true" type="string" name="username" />
		<cfargument required="true" type="string" name="password" />
		<cfargument required="false" type="string" name="method" default="web" />

		<cfquery datasource="projectp" name="getLogin">
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

			<cfquery datasource="projectp" name="recordlogin">
				INSERT into loginhistory
				SET    (userid)
				VALUES (#getLogin.id#)
			</cfquery>

			<cfreturn getLogin> 
		</cfif>

	</cffunction>

</cfcomponent>

