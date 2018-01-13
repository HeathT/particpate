/*

	Description:
	The base file to get our Ext login screen started and running

*/



// create a global variable for our application - this will later need to be minified and obfiscated
var _ = _ || {};

_.scheme = {
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


// specify which libraries to load as part of this init
Ext.require([
	'Ext.tab.*',
	'Ext.form.Panel',
	'Ext.button.Button',
	'Ext.Action',
	'Ext.window.*',
	'Ext.tip.*',
	'Ext.layout.container.Border'
]);



// once Ext is ready do all the things - ALL THE THINGS
Ext.onReady(function(){
	Ext.create('widget.window', {
		id: 'loginWindow',
		title: 'Login Window',
		autoShow: true,
		header: {
			titlePosition: 2,
			titleAlign: 'center'
		},
		closable: false,
		closeAction: 'hide',
		maximizable: false,
		resizable: false,
		width: 400,
		height: 200,
		centered: true,
		layout: {
			type: 'border',
			padding: 3
		},
		items: [
		{
			region: 'center',
			xtype: 'form',
			id:	'loginForm',
			items: [{
				xtype: 		'textfield',
				padding: 	'20 0 0 15',
				fieldLabel: 'Username',
				id: 		'username',
				allowBlank: false,
				emptyText: 	'(required)'
			},{
				xtype: 		'textfield',
				padding: 	'5 0 0 15',
				fieldLabel: 'Password',
				id:			'password',
				allowBlank: false,
				emptyText: 	'(required)'
			}],
			buttons:[
				{
					text: 'Sign-up'
				},
				'->',
				{
					text: 'Login',
					handler: function() {
						Ext.Ajax.request({
							url: 'app/model/login.cfc',
							method: 'POST',
							params: {
								username: Ext.getCmp('username').value,
								password: Ext.getCmp('password').value
							},
							success: function(response){
								// process server response here
								console.info(response.responseText);
							}
						});
					}
				}
			]

		}
		],
		listeners: [{

		}]
	});
});





