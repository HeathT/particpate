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
		<cfargument name="role" required="false" default="" type="string" />

		
		<!--- only pass adminCheck if you are performing an admin function (ie. change password) --->
		<cfargument name="admincheck" required="false" default="false" type="boolean" />

		<cfset thisArgs = structKeyArray(arguments) />


		<!--- if the list of arguments change, the query below should automatically add it to the SELECT statement --->
		<cfquery datasource="#application.ds#" name="getLogin">
			SELECT  u.id,
					u.fname,
					u.lname,
					u.username,
					u.active,
					u.lastlogin,
					u.created,
					<cfif arguments.admincheck> <!--- only collect these if there is an admin func occuring --->
					u.privacykey 'key',
					u.password,
					</cfif>
					u.role,
					r.sponsor,
					r.coordinator,
					r.monitor,
					r.volunteer,
					r.admin,
					r.superadmin,
					r.name AS 'rolename'
			FROM    user u INNER JOIN
					role r ON u.role = r.id
			WHERE   1=1
			<cfloop from="1" to="#arrayLen(thisArgs)#" index="i"> <!--- loop through all the passed arguments and build the statement based on only those - if none passed, find all records --->
				<cfset tempVar = evaluate("arguments." & #lcase(thisArgs[i])#) />
				<cfif isDefined('tempVar') AND tempVar GT '' AND lcase(thisArgs[i]) NEQ 'admincheck' AND lcase(thisArgs[i]) NEQ 'id'>
					AND	#lcase(thisArgs[i])# = '#tempVar#'
				<cfelseif isDefined('tempVar') AND tempVar GT '' AND lcase(thisArgs[i]) EQ 'id'>
					AND	#lcase(thisArgs[i])# = #tempVar#
				</cfif>				
			</cfloop>
		</cfquery> 

		<cfreturn getLogin />

	</cffunction>




	<cffunction name="updateUser" access="public" returntype="any"  hint="(crUd)  Update the user information">
		<!--- this update will not allow password to be changed - please see password.cfc --->
		<cfargument name="id" required="true" default="" type="numeric" />

		<cfargument name="username" required="false" default="" type="string" />
		<cfargument name="fname" required="false" default="" type="string" />
		<cfargument name="lname" required="false" default="" type="string" />
		<cfargument name="role" required="false" default="" type="string" />
		<cfargument name="phone" required="false" default="" type="string" />
		<cfargument name="email" required="false" default="" type="string" />


		<cfset thisArgs = structKeyArray(arguments) />
		<cfdump var="#thisArgs#" label="The arguments object" />

		<cfif isDefined(session.userInfo.userid) AND (session.userInfo.userid EQ arguments.id OR session.userInfo.admin) AND arguments.id GTE 0>  <!--- user is making a profile update or an admin is making one on another user --->
			<cfquery datasource="#application.ds#" name="updateUser">
				UPDATE 	user
				SET 	updated = CURRENT_TIMESTAMP
				<cfloop from="1" to="#arrayLen(thisArgs)#" index="i"> <!--- loop through all the passed arguments and build the statement based on only those - if none passed, find all records --->
					<cfset tempVar = evaluate("arguments." & #lcase(thisArgs[i])#) />
					<cfif isDefined('tempVar') AND tempVar GT '' AND lcase(thisArgs[i]) NEQ 'id'>
						,#lcase(thisArgs[i])# = '#tempVar#'
					</cfif>				
				</cfloop>
				WHERE	id = #arguments.id#
			</cfquery>
		</cfif>

		<!--- TODO: NEEDS A RETURN VALUE --->
		<cfreturn false />
	</cffunction>




	<cffunction name="deactivateUser" access="public" returntype="any"  hint="(cruD) Deactivate a user in the system">
		<cfargument name="id" required="true" default="" type="numeric" />

		<cfquery datasource="#application.ds#" name="deactivateUser">
			UPDATE 	user
			SET 	active = 0,
					updated = CURRENT_TIMESTAMP
			WHERE	id = #arguments.id#
		</cfquery>


		<!--- TODO: NEEDS A RETURN VALUE --->
		<cfreturn false />
	</cffunction>




	<cffunction name="activateUser" access="public" returntype="any"  hint="Activate a user in the system">
		<cfargument name="id" required="true" default="" type="numeric" />

		<cfquery datasource="#application.ds#" name="activateUser">
			UPDATE 	user
			SET 	active = 1,
					updated = CURRENT_TIMESTAMP
			WHERE	id = #arguments.id#
		</cfquery>


		<!--- TODO: NEEDS A RETURN VALUE --->
		<cfreturn false />
	</cffunction>




	<cffunction name="markVerified" access="public" returntype="any" hint="used to verify a volunteer by email or a sponsor/monitor via a coordinator screen">
		<cfargument name="id" required="true" default="" type="numeric" />

		<cfquery datasource="#application.ds#" name="verifyUser">
			UPDATE 	user
			SET 	verified = 1,
					updated = CURRENT_TIMESTAMP,
					verifiedon = CURRENT_TIMESTAMP
			WHERE	id = #arguments.id#
		</cfquery>


		<!--- TODO: NEEDS A RETURN VALUE --->
		<cfreturn false />
	</cffunction>

</cfcomponent>