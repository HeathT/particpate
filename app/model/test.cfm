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

<cfset myResults = '{"data":['>

<cfloop query="getLogin">
	<cfset loopCount = loopCount + 1>

	<cfset myResults = 	myResults & '{' />
						<!--- <cfloop index="i" from="0" to="1" step="1"> --->
							<cfset myResults = myResults & getLogin[loopCount]['id'][1]>
						<!--- </cfloop> --->
						<!--- & '"id":"' & getAmenity.amenity_id & '"'
						& ',"description":"' & getAmenity.description & '"' 
						& ',"amenity":"' & getAmenity.amenity & '"'
						& ',"active":"' & getAmenity.active & '"'
						& ',"dtUpdated":"' & left(getAmenity.dtUpdated, (len(getAmenity.dtUpdated)-2)) & '"}'> --->
	<cfif loopCount LT getAmenity.recordCount>
		<cfset myResults = myResults & ','>
	<cfelse>
		<cfset myResults = myResults & ']}'>
		<cfbreak />
	</cfif>

</cfloop>

<cfoutput>#myResults#</cfoutput>