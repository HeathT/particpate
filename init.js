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
		height: 275,
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
				xtype: 'textfield',
				padding: '20 0 0 15',
				fieldLabel: 'Username',
				blankText: '(required)'
			},{
				xtype: 'textfield',
				padding: '5 0 0 15',
				fieldLabel: 'Password',
				blankText: '(required)'
			}],
			buttons:[{
				text: 'Login'
			}]

		}, {
			region: 'south',
			xtype: 'tabpanel',
			id: 'loginOptions',
			height: 100,
			resizable: false,
			items: [{
				title: 'Sign-up Here',
				html: 'Sign-up here blah blah blah',
				closable: false
			}, {
				title: 'Information',
				html: 'Explain what the application is, what it does, and maybe a brief pop-out video',
				closable: false
			}, {
				title: 'Contact Us',
				html: 'Contact information, etc, etc',
				closable: false
			}]
		}
		],
		listeners: [{

		}]
	});
});





