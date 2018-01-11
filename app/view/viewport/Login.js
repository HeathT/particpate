var _ = _ || {};

if(Ext.getCmp('test')){
    Ext.getCmp('test').destroy();
}



var loginPrompt = Ext.widget('panel', {
	title:			'Login',
	id:				'loginPrompt',
	collapsible:	false,
	height:			300,
	width:			600,
	html: 			'works',
	centered:		true,
	bodyPadding: 	7,
	items: [{
			
	}]
});



Ext.create('Ext.container.Viewport', {
	layout: 'border',
	id: 	'test',
    hidden: false,
	items: [{
		region: 		'center',
		collapsible: 	false,

		border:			0,
		id:				'loginCenter'
	}, {
		region: 		'south',
		xtype: 			'tabpanel', // TabPanel itself has no title
		activeTab: 		0,      	// First tab active by default
		border:			0,
		split: 			false,
		height: 		75,
		minHeight: 		75,
		id:				'loginSouth',
		items: [{
			title: 		'Sign-up!',
			html: 		'Here a volunteer could sign up'
		},{
			title:		'Sponsor Sign-up',
			html:		'Sponsors sign up here...'
		},{
			title:		'Contact Us',
			html:		'Coordinators and Monitors can request stoof here'
		}]
	}],
	listeners: {
		resize: {
// 			element: 	'body',
			fn: 		function() {
				console.info('resized');
			}
		}
	}
});

// Ext.create('Ext.panel.Panel', {
// 	title:			'Login',
// 	id:				'loginPrompt',
// 	collapsible:	false,
// 	modal:			true,
// 	height:			300,
// 	width:			600,
// 	html: 			'works',
// 	centered:		true,
//     renderTo:		'loginCenter',
// 	bodyPadding: 	7
// });





Ext.getCmp('loginCenter').add(loginPrompt);
Ext.getCmp('loginPrompt').center();
// Ext.getCmp('test').addListener({
// 	render: console.info('resized'),
// 	resize: console.info('resized'),
// });

// Ext.getCmp('test').show();






/*
Exception: SyntaxError: missing : after property id
@Scratchpad/2:55
*/
/*
Exception: SyntaxError: missing : after property id
@Scratchpad/2:56
*/