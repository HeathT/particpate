<cfcomponent displayname="userMethods" output="false" extends="password" hint="Encapsulates all CRUD functionality for the user table">


	<cffunction name="createUser" access="public" returntype="any" returnformat="JSON" hint="(Crud)  create a new user account">
		<cfargument name="username" required="true" type="string" />
		<cfargument name="firstname" required="true" type="string" />
		<cfargument name="lastname" required="true" type="string" />
		<cfargument name="password" required="true" type="string" />
		<cfargument name="email" required="true" type="string" />

		<cfargument name="phone" required="false" type="string" />

		<cfquery datasource="#application.ds#" name="checkExisting">
			SELECT 	username
			FROM 	user
			WHERE 	username = '#arguments.username#'
		</cfquery>

		<!--- 	more work needs to be done here
				- add arguments for each potential passed field
				- handle the query for those args not passed

		--->	

		<cfif checkExisting.recordcount EQ 0>
			<cfinvoke method="keygen" component="password" returnvariable="key"></cfinvoke>
			<cfinvoke method="passgen" component="password" returnvariable="password">
				<cfinvokeargument name="key" value="#key#" />
				<cfinvokeargument name="password" value="#arguments.password#" />
			</cfinvoke>


			<cfquery datasource="#application.ds#" name="makeUser">
				INSERT into user
				SET		username = '#arguments.username#',
						fname = '#arguments.firstname#',
						lname = '#arguments.lastname#',
						email = '#arguments.email#',
						privacykey = '#key#',
						password = '#password#'
			</cfquery>
		</cfif>
	</cffunction>




	<cffunction name="findUser" access="public" returntype="any" hint="(cRud) Get user information">
		<cfargument name="username" required="false" default="" type="string" />
		<cfargument name="fname" required="false" default="" type="string" />
		<cfargument name="lname" required="false" default="" type="string" />
		<cfargument name="email" required="false" default="" type="string" />
		<cfargument name="phone" required="false" default="" type="string" />
		<!--- if the list of arguments change, the query below should automatically add it to the SELECT statement --->

		<cfset thisArgs = structKeyArray(arguments) />

		<cfdump var="#thisArgs#" label="The arguments object" />

		<cfquery datasource="#application.ds#" name="getLogin">
			SELECT  u.id 'userid',
					u.fname 'first',
					u.lname 'last',
					u.username,
					u.active,
					u.lastlogin 'last login',
					u.created 'created on',
					r.name AS 'role'
			FROM    user u INNER JOIN
					role r ON u.role = r.id
			WHERE   1=1
			<cfloop from="1" to="#arrayLen(thisArgs)#" index="i"> <!--- loop through all the arguments and build the statement --->
				<cfset tempVar = evaluate("arguments." & #lcase(thisArgs[i])#) />
				<cfif isDefined('tempVar') AND tempVar GT ''>
					AND	#lcase(thisArgs[i])# = '#tempVar#'
				</cfif>				
			</cfloop>
		</cfquery> 

		<cfreturn getLogin />

	</cffunction>




	<cffunction name="updateUser" access="public" returntype="any"  hint="(crUd)  Update the user information">

	</cffunction>




	<cffunction name="deactivateUser" access="public" returntype="any"  hint="(cruD) Deactivate a user in the system">


	</cffunction>




	<cffunction name="markVerified" access="public" returntype="any" hint="used to verify a volunteer by email or a sponsor/monitor via a coordinator screen">

	</cffunction>




	<cffunction name="changePass" access="public" returntype="any" hint="used to allow the user to change their password">


	</cffunction>

</cfcomponent>