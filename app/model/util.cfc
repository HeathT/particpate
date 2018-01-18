<cfcomponent displayname="util" output="false">

<!--- JSON SERIALIZER --->
	<cffunction name="makeJson" access="private" returntype="array">
		<!--- I should be able to pass in the query object and loop over it's key/value pairs --->
		<cfargument required="true" type="query" name="queryObj" />
		<cfargument >


		
		<cfset myResults = '{"data":['>
		<cfset loopCount = 0>
		<cfset keyCount = 0>
		<cfloop query="queryObj">
			<cfset loopCount = loopCount + 1>
			<!--- <cfset myResults = 	myResults & '{'
								<cfloop index="i" from=""></cfloop>
								& '"id":"' & getAmenity.amenity_id & '"'
								& ',"description":"' & getAmenity.description & '"' 
								& ',"amenity":"' & getAmenity.amenity & '"'
								& ',"active":"' & getAmenity.active & '"'
								& ',"dtUpdated":"' & left(getAmenity.dtUpdated, (len(getAmenity.dtUpdated)-2)) & '"}'>
			<cfif loopCount LT getAmenity.recordCount>
				<cfset myResults = myResults & ','>
			<cfelse>
				<cfset myResults = myResults & ']}'>
				<cfbreak />
			</cfif> --->
		</cfloop>
	</cffunction>


	<cffunction name="QueryToArray" access="public" returntype="array" output="false" hint="This turns a query into an array of structures.">

		<!--- Define arguments. --->
		<cfargument name="Data" type="query" required="yes" />

		<cfscript>
			// Define the local scope.
			var LOCAL = StructNew();
			// Get the column names as an array.
			LOCAL.Columns = ListToArray( ARGUMENTS.Data.ColumnList );
			// Create an array that will hold the query equivalent.
			LOCAL.QueryArray = ArrayNew( 1 );
			// Loop over the query.
			for (LOCAL.RowIndex = 1 ; LOCAL.RowIndex LTE ARGUMENTS.Data.RecordCount ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
				// Create a row structure.
				LOCAL.Row = StructNew();
				// Loop over the columns in this row.
				for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE ArrayLen( LOCAL.Columns ) ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
					// Get a reference to the query column.
					LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
					// Store the query cell value into the struct by key.
					LOCAL.Row[ LOCAL.ColumnName ] = ARGUMENTS.Data[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
				}
				// Add the structure to the query array.
				ArrayAppend( LOCAL.QueryArray, LOCAL.Row );
			}
			// Return the array equivalent.
			return( LOCAL.QueryArray );
		</cfscript>
	</cffunction>

</cfcomponent>