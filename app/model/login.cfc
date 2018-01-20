<cfcomponent displayname="login" output="false">

	<cffunction access="remote" returnType="any" returnFormat="JSON" name="verify"> 
		<cfargument required="true" type="string" name="username" />
		<cfargument required="true" type="string" name="password" />
		<cfargument required="false" type="string" name="method" default="web" />

		<cfquery datasource="#application.ds#" name="getKey">
			SELECT	privacykey
			FROM 	user
			WHERE	username = '#arguments.username#'
			AND 	privacykey is not NULL
			AND		active = 1
		</cfquery>

		<cfif getKey.recordcount GT 0> <!--- valid user as it has an existing username, is active, and has a valid key -- now to validate the login credentials --->

			<cfset newPass =  encrypt(arguments.password, getKey.privacykey, 'AES', 'HEX') />


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
				WHERE   username = '#arguments.username#'
				AND     password = '#newPass#'
				AND     active = 1
			</cfquery> 

			<cfif #getLogin.recordcount# NEQ 1>  <!--- valid user account but it is a failed login attempt --->

				<cfquery datasource="#application.ds#" name="getFailureInfo">
					SELECT  id,
							failurecount
					FROM 	user
					WHERE 	username = '#arguments.username#'
				</cfquery>

				<cfset newCount = getFailureInfo.failurecount + 1>

				<cfquery datasource="#application.ds#" name="setLastLoginAttempt">
					UPDATE 	user
					SET    	lastfailure = CURRENT_TIMESTAMP,
							lastip = '#CGI.REMOTE_ADDR#',
							failurecount = #newCount#
					WHERE  	id = #getFailureInfo.id#
				</cfquery>

				<cfquery datasource="#application.ds#" name="recordTheAttempt">
					INSERT into loginhistory
					SET 	userid = '#getFailureInfo.id#',
							ipaddress = '#cgi.remote_addr#',
							isfailure = 1
				</cfquery>


				<cfreturn false>


			<cfelse> <!--- valid user and the login information is  --->

				<cfquery datasource="#application.ds#" name="recordlogin">
					INSERT 	into loginhistory
					SET		userid = #getLogin.id#,
							ipaddress = '#CGI.REMOTE_ADDR#';
				</cfquery>

				<cfquery datasource="#application.ds#" name="setLastLogin">
					UPDATE 	user
					SET    	lastlogin = CURRENT_TIMESTAMP,
							lastip = '#CGI.REMOTE_ADDR#'
					WHERE  	id = #getLogin.id#
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

		<cfelse> <!--- Username does not exist or user is not active or user does not have a valid key --->


			<cfreturn false>

		</cfif>

	</cffunction>

</cfcomponent>

