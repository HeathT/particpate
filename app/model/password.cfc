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

</cfcomponent>


