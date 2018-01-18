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
</cfquery> 


		
<cfset loopCount = 0>
<cfset keyCount = 0>

<cfinvoke component="util" method="QueryToArray" returnvariable="myResults">
    <cfinvokeargument name="Data" value="#getLogin#">
</cfinvoke>

<cfset session.myTest = myResults>

<!--- <cfscript>

	udf = createObject("component", "util"); // UDF = User Defined Functions

</cfscript> 

<cfset myResults = udf.QueryToArray(getLogin)>
--->

<!---
<cfset myResults = '{"data":['>

<cfloop query="getLogin">
	<cfset loopCount = loopCount + 1>

	<cfset myResults = 	myResults & '{' />
						<cfloop index="i" from="0" to="1" step="1">
							<cfset myResults = myResults & getLogin[loopCount]['id'][1]>
						</cfloop> 
	<cfif loopCount LT getAmenity.recordCount>
		<cfset myResults = myResults & ','>
	<cfelse>
		<cfset myResults = myResults & ']}'>
		<cfbreak />
	</cfif>

</cfloop>
--->

<cfloop array="#myResults#" index="i">
	<cfset loopCount = loopCount + 1>

	<cfif i LT myResults.length>
		<cfoutput>
			#myResults[i]#		
		</cfoutput>
	</cfif>
</cfloop>

