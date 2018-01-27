<cfcomponent displayname="userMethods" output="false" extends="util" hint="Handles session creation, updates, and deletion">


	<cffunction name="createSession" access="public" returntype="any">
		<cfargument name="userinfo" required="true" type="query" />

		<cfset session.userInfo = {} />

		<cfinvoke component="util" method="queryToArray" returnvariable="newArray">
			<cfinvokeargument name="data" value="#arguments.userinfo#" />
		</cfinvoke>

		<cfloop from="1" to="#arrayLen(structKeyArray(newArray[1]))#" index="i">
			<cfset thisKey = lcase(structKeyArray(newArray[1])[i]) />

			<cfset session.userInfo[thisKey] = newArray[1][thisKey] />

		</cfloop>

		<cfreturn true />
	</cffunction>


	<cffunction name="deleteSession" access="public" returntype="any">

		<cfset session.userInfo = {} />

		<cfreturn true />
	</cffunction>



	<cffunction name="updateSession" access="public" returntype="any">
		<cfargument name="userid" required="true" type="numeric" />



		<cfreturn true />
	</cffunction>
</cfcomponent>