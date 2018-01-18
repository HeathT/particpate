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

<cfscript>

	udf = createObject("component", "util");

</cfscript>

<cfset myResults = udf.QueryToArray(getLogin)>

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

<cfoutput>#myResults#</cfoutput>