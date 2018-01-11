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
		title: 'Layout Window with title <em>after</em> tools',
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
			xtype: 'formpanel',
			id:	'loginForm',
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
			items: [{
				// LTR even when example is RTL so that the code can be read
				rtl: false,
				title: 'Sponsor Sign-up',
				html: '<p>Window configured with:</p><pre style="margin-left:20px"><code>header: {\n    titlePosition: 2,\n    titleAlign: "center"\n},\nmaximizable: true,\ntools: [{type: "pin"}],\nclosable: true</code></pre>',
				closable: false
			}, {
				title: '',
				html: 'Hello world 2',
				closable: false
			}, {
				title: 'Contact Us',
				html: 'Hello world 3',
				closable: false
			}]
		}
		]
	});
});





