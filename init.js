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
		closable: true,
		closeAction: 'hide',
		maximizable: true,
		width: 600,
		minWidth: 350,
		height: 350,
		centered: true,
		// tools: [{type: 'pin'}],
		layout: {
			type: 'border',
			padding: 5
		},
		items: [
		{
		// 	region: 'west',
		// 	title: 'Navigation',
		// 	width: 200,
		// 	split: true,
		// 	collapsible: true,
		// 	floatable: false
		// }, {
			region: 'center',
			xtype: 'form',
			id:	'loginForm',
			padding: '15 0 0 10',
			items: [{
				xtype: 'textfield',
				fieldLabel: 'Username',
				blankText: '(required)'
			},{
				xtype: 'textfield',
				fieldLabel: 'Password',
				blankText: '(required)'
			}]
		}, {
			region: 'south',
			xtype: 'tabpanel',
			id: 'loginOptions',
			height: 150,
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
		]
	});
});





