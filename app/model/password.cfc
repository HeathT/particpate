<cfcomponent displayname="userMethods" output="false">

	<cffunction name="passgen" access="public" returntype="string">
		<cfargument name="password" required="true" type="string" />
		<cfargument name="key" required="true" type="string" />

		<cfset ePass = encrypt(arguments.password, arguments.key, 'AES', 'HEX') />

		<cfreturn ePass />
	</cffunction>


	<cffunction name="keygen" access="public" returntype="string">
		<cfset key = generateSecretKey("AES") />
		<cfreturn key />
	</cffunction>

<!--- 

	<cffunction name="changePass" access="public" returntype="any" hint="used to allow the user to change their password">
		<cfargument name="id" required="true" type="numeric" />
		<cfargument name="oldpass" required="true" type="string" />
		<cfargument name="oldkey" required="true" type="string" />
		<cfargument name="newpass" required="true" type="string" /> --->

		<!--- verify the old password --->

<!--- 		<cfinvoke method="findUser" component="user" hint="Retrieve the user information" returnvariable="userProfile">
			<cfinvokeargument name="id" value="#arguments.id#" />
			<cfinvokeargument name="admincheck" value="true" />
		</cfinvoke> --->

<!--- 		<cfif userProfile.recordCount GT 0>
			<cfinvoke method="findUser" component="user" returnvariable="userInfo" />
				<cfinvokeargument name="username" value="#userProfile.username#" /> --->
				<!--- <cfinvokeargument nam --->
<!--- 			</cfif>
		</cfif> --->



		<!--- generate new key --->

<!--- 		<cfinvoke method="keygen" component="password" returnvariable="newkey"></cfinvoke>
 --->
		<!--- generate new password --->

<!--- 		<cfinvoke method="passgen" component="password" returnvariable="newpass">
			<cfinvokeargument name="password" value="#newpass#" />
			<cfinvokeargument name="key" value="#newkey#" />
		</cfinvoke>


		<cfreturn false />
	</cffunction> --->

</cfcomponent>


