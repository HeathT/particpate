// init the global variable if it doesn't exist
var _ = _ || {};


// Create an Action object
_.action = {
	centerLogin: new Ext.Action({
		text:	'Center',
		desc:	'Centering the login window - id: loginWindow',
		handler: function(){
			_.util.debug(this);
			_.util.debug(_.action.centerLogin.desc, 'warn');
			Ext.getWin().on("resize", Ext.getCmp('loginWindow').center(), this);
		}
	})
} 
