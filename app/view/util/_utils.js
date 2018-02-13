
// init the global variable if it doesn't exist
var _ = _ || {};

// Wait for Ext to ready-up
Ext.onReady(function(){

	// Create a basic utility object
	_.util = {
		debugger: true,
		debug: function(msg, type){
			type = type || 'info';

			if(_.util.debugger && msg){
				console[type](msg);
			}
		}
	}

	_.ajax = {
		description: 'Methods for working with AJAX requests throughout the application',
		help: {
			responseObj: 'The full response.responseText returned from the original request',
			storageObj: 'The name of the scope within the global _ variable to store the results of the call',
			queryName: 'The name of the query within the called method found in which CFC - format: cfc.method.query'
		},
		getKeys: function(responseObj, storageObj, queryName){
			let _local = {};
			_local.arrayObj = responseObj.COLUMNS || [];
			_local.keys = [];

			if(_local.arrayObj.length){

				_[storageObj] = _[storageObj] || {};	// this is the same as adding an object to _, for example _.storageObj but it retains the name passed into the function

				_[storageObj].query = queryName;
				_local.returnObj = _local.arrayObj;
			}

			return _local.returnObj;
		},
		getRecords: function(responseObj, storageObj, queryName){
			let _local = {};
			_local.arrayObj = responseObj.DATA || [];

			if(_local.arrayObj.length){
				_[storageObj] = _[storageObj] || {};

				_[storageObj].recordset = _local.arrayObj;
				_[storageObj].query = queryName;
			}

			return _[storageObj].recordset;
		}

	}


	// Handle themes
	_.theme = {
		default: {
			name:	'crisp',
			path:	'ext-5.0.1/packages/ext-theme-crisp/build/resources/ext-theme-crisp-all.css'
		},
		change: function(n){
			for(i=0;i<_.scheme.allowed.length-1;i++){
				if(_.scheme.allowed[i].name === n){
					// load the CSS class to change styles
					Ext.getHead().dom.innerHTML = Ext.getHead().dom.innerHTML + '<link rel=\"stylesheet\" type=\"text/css\" href=\"' + _.scheme.allowed[i].path + '">'
				}
			}
		},
		allowed:[
			{
				name:	'aria',
				path:	'ext-5.0.1/packages/ext-theme-aria/build/resources/ext-theme-aria-all.css'
			},
			{
				name:	'crisp',
				path:	'ext-5.0.1/packages/ext-theme-crisp/build/resources/ext-theme-crisp-all.css'
			},
			{
				name:	'neptune',
				path:	'ext-5.0.1/packages/ext-theme-neptune/build/resources/ext-theme-neptune-all.css'
			}
		]
	}
});
