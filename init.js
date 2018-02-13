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

	var local = {};

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


	local.username = new Ext.form.field.Text({
		// xtype: 		'textfield',
		padding: 	'20 0 0 15',
		fieldLabel: 'User Name',
		id: 		'username',
		name: 		'username',
		allowBlank:  false,
		labelAlign: 'right',
		emptyText: 	'required',
		focusable:   true,
		enableKeyEvents: true,
		listeners: {
			keyup: function(thisObj, e) {
				// console.info(e.getKey()); //this is work
				if(e.getKey() === 13){
						if(!Ext.getCmp('password').value){
							Ext.getCmp('password').focus(true, 100);
						} else {
							Ext.getCmp('loginForm').submit();
						}
				}
			}
		}
	});


	Ext.create('widget.window', {
		id: 		'loginWindow',
		title: 		'Please login',
		autoShow: 	true,
		header: {
			titlePosition: 2,
			titleAlign: 'center'
		},
		closable: 	false,
		draggable: 	false,
		closeAction: 'hide',
		maximizable: false,
		resizable: 	false,
		renderTo: 	'centerPanel',
		width: 		350,
		height: 	175,
		centered: 	true,
		layout: {
			type: 'border',
			padding: 2
		},
		items: [
		{
			region: 'center',
			xtype:  'form',
			id:		'loginForm',
			name: 	'loginForm',
			style: {
				width: 340
			},
			items: [
				local.username
			,{
				xtype: 		'textfield',
				padding: 	'5 0 0 15',
				fieldLabel: 'Password',
				id:			'password',
				allowBlank:  false,
				inputType: 	'password',
				labelAlign: 'right',
				emptyText: 	'required',
				listeners: {
					keyup: function(thisObj, e) {
						// console.info(e.getKey()); //this is work
						if(e.getKey() === 13){
								if(!Ext.getCmp('username').value){
									Ext.getCmp('username').focus(true, 100);
								} else {
									Ext.getCmp('loginForm').submit();
								}
						}
					}
				}
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

								if(_local.rt.FAILURE){
									// Login failure
									console.warn(_local.rt.FAILURE);
									console.info(_local);
								} else {
									// Valid login
									_local.recordcount = _local.rt.ROWCOUNT;
									_local.records = _.ajax.getRecords(_local.rt, 'loginInfo', 'login.verify.getLogin');

									_.ajax.getKeys(_local.rt, 'loginInfo', 'login.verify');	

									_.userinfo = _local;

									// Hide the window
									Ext.getCmp('loginWindow').hide();
								}
							},
							failure: function(response){
								return false;
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
			afterrender: function(thisObj, e){
				Ext.getCmp('username').focus(true, 50);
				console.info(thisObj);
				console.warn('username rendered');

				// Adjust the visuals - this should be changed at some point
				Ext.get('loginWindow-body').dom.className = Ext.get('loginWindow-body').dom.className + ' x-window-login-body'
				
				// Center the login prompt
				_.action.centerLogin;
			}
		}
	});

});

