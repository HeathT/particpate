/*

	Description:
	The base file to get our Ext login screen started and running

*/



// create a global variable for our application - this will later need to be minified and obfiscated
var _ = _ || {};



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
	Ext.create('Ext.container.Viewport', {
		id: 'viewport',
		layout: {
			type: 'border',
			padding: 3
		},
		items: [
			{
				region: 'south',
				id: 'southPanel',
				collapsible: false,
				html: 'Information goes here',
				split: true,
				height: 40,
				minHeight: 20
			}, {
				region: 'center',
				xtype: 'panel', // TabPanel itself has no title
				id: 'centerPanel'
			}
		]
	});


	Ext.create('widget.window', {
	// Ext.create('window.Window', {
		id: 'loginWindow',
		title: 'Login Window',
		autoShow: true,
		header: {
			titlePosition: 2,
			titleAlign: 'center'
		},
		closable: false,
		draggable: false,
		closeAction: 'hide',
		maximizable: false,
		resizable: false,
		renderTo: 'centerPanel',
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
				emptyText: 	'required'
			},{
				xtype: 		'textfield',
				padding: 	'5 0 0 15',
				fieldLabel: 'Password',
				id:			'password',
				allowBlank: false,
				inputType: 	'password',
				emptyText: 	'required'
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
								password: Ext.getCmp('password').value,
								method: 'verify'
							},
							success: function(response){
								// process server response here
								var _local = {};

								_local.rt = Ext.JSON.decode(response.responseText);

								_local.keys = _.ajax.getKeys(_local.rt, 'loginInfo', 'login.verify.getLogin');

								_local.recordcount = _local.rt.ROWCOUNT;
								_local.records = _.ajax.getRecords(_local.rt, 'loginInfo', 'login.verify.getLogin');


								_.ajax.getKeys(_local.rt, 'loginInfo', 'login.verify');	

								_.userinfo = _local;

								console.info(_local);
							}
						});
					}
				}
			]

		}
		],
		listeners: {
			// Adding a listener to the loginWindow object to ensure it remains centered upon window resize
			// Later on, we may want to make an action and then call the action with the listener 
			render: function(){
				_.action.centerLogin;
			}
		}
	});

});

