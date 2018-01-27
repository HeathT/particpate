<cfcomponent displayname="util" output="false">

<!--- JSON SERIALIZER --->
	<cffunction name="makeJSON" access="public" returntype="any">
		<!--- I should be able to pass in the query object and loop over it's key/value pairs --->
		<cfargument required="true" type="query" name="queryObj" />
		<cfargument required="false" type="boolean" name="sendColumns" default="true" />

		<cfinvoke method="queryToArray" returnvariable="myResults">
			<cfinvokeargument name="data" value="#queryObj#">
		</cfinvoke>

		<cfset packet = '{"ROWCOUNT":' & queryObj.recordCount />
		<cfset rowData = ', "DATA":[' />
		<cfset columnInfo = ', "COLUMNS":[' /> <!--- build the COLUMNS array header --->
		<cfset doColumns = arguments.sendColumns />

		<cfloop from="1" to="#arrayLen(myResults)#" index="i"> <!--- loop through records --->

			<cfset keyCount = 1 />
			<cfset thisRow = myResults[i] /> <!--- each record is retrieved by it's array ordinal --->

			<cfset rowData = rowData & '{' />
			<cfloop collection="#thisRow#" item="key"> <!--- loop through key/value pairs per row --->
				<cfset rowData = rowData & '"#key#":' & '"#thisRow[key]#"'>
				<cfif doColumns><cfset columnInfo = columnInfo & '"#key#"' /></cfif> <!--- if the columns still need to be built, add the key --->

				<cfif keyCount LT structCount(thisRow)> <!--- add a comma between the values if there is another value after this one --->
					<cfset rowData = rowData & ','>
					<cfif doColumns><cfset columnInfo = columnInfo & ',' /></cfif> <!--- if the columns still need to be built and this isn't the last key, add a comma --->
				</cfif>

				<cfset keyCount = keyCount + 1>
			</cfloop>

			<cfif doColumns>
				<cfset columnInfo = columnInfo & ']' /> <!--- close off the COLUMNS array --->
				<cfset doColumns = false /> <!--- indicate that the columns are done being built so that functionality will be skipped for remaining records --->
			</cfif>
			
			<cfset rowData = rowData & '}'> <!--- Close off the record --->
			<cfif i LT arrayLen(myResults)> <!--- If this isn't the last record, we add a comma between it and the next record --->
				<cfset rowData = rowData & ','>
			</cfif>
		</cfloop>

		<cfset rowData = rowData & ']' />
		<cfif arguments.sendColumns>  <!--- if the column headers are supposed to be included, include them --->
			<cfset packet = packet & columnInfo />
		</cfif>
		<cfset packet = packet & rowData />
		<cfset packet = packet & '}' />

		<cfreturn packet />
	</cffunction>



	<cffunction name="queryToArray" returntype="array" access="public" output="yes">
		<cfargument name="data" type="query" required="yes" />

		<cfset var a = ArrayNew(1)>
		<cfset var i = 0> <!--- generic (i)ndex init --->
		<cfset var r = 0> <!--- generic (r)ow counter --->

		<cfloop query="arguments.data">
			<cfset r = Currentrow>

			<cfloop index="i" list="#LCase(arguments.data.columnList)#">
				<cfset a[r][i] = Evaluate(i)>
			</cfloop>

		</cfloop>

		<cfreturn a>

		<!--- <cfreturn SerializeJSON(a)> --->
	</cffunction>



	<cffunction name="dumpDebug" access="public" returntype="struct" output="false">
		<cfargument name="_scope" default="" required="true" type="struct" />
		<cfargument name="_abort" default="" required="false" />

		<cfset dumpVar = arguments._scope />

		<cfif application.debugging>
			<cfdump var="#eval(arguments._scope)#" _abort/>
		</cfif>

	</cffunction>

</cfcomponent>