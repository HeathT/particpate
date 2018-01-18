<cfapplication name="project2participate" 
			   loginstorage="session" 
               clientmanagement="yes" 
               clientstorage="registry" 
               sessionmanagement="yes" 
               sessiontimeout="#CreateTimeSpan(0,4,0,0)#">


<cfset application.httpProxy = cgi.server_name>

<cfset application.userFilesPath="http://#application.httpProxy#/participate/resources/">

<cfparam name="application.cfcPath" default="participate.model"> 	<!--- path to cfc directory --->
<cfset application.root="http://#application.httpProxy#/participate/"> 		<!--- used to provide the root path --->
<cfset application.ds="projectp">