
// init the global variable if it doesn't exist
var _ = _ || {};

// Wait for Ext to ready-up
Ext.onReady(function(){

	// Create a basic utility object
	_.util = {
		debugger: true,
		debug: function(msg, type){
			type = type || 'info';

			if(_.util.debugger){
				console[type](msg);
			}
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
