
/*
	Description
	Error handler for the entire application, allowing the application to handle errors in our
	own custom way and without the javascript runtime engine crashing.  

	Possible ways of handling errors include:
		- Passive Mode: 
			the error is trapped but completely not reported to the client
			but instead only captured in the database allowing admin staff 
			to react to and correct the error.
		- Active Mode:
			the error is trapped and only thrown to the console, if the 
			console is available, preventing the end user from seeing the
			actual error
		- Alert Mode:
			the error is reported to the user via a custom alerting system,
			thus allowing them to enter a trouble ticket with our helpdesk
		**  ALL ERRORS ARE CAPTURED IN THE DATABASE REGARDLESS OF MODE **


*/


// init the global variable
var _ = _ || {};


_.errorHandler = {

	status: 'passive',			// passive (default), active, displayed		
	init:  function(){
		// this should over-ride the standard javascript error handler

		return this;
	},

		/*	Trap try/catch errors and handle them with a custom error handler
			
			Javascript Object Properties:
				.name
				.message

		*/

	trap: function(e) {
		/* prevent JS from throwing error */
		switch(_.errorHandler.status){
			case 'passive':	this.capture(e);
			break;

			case 'active': this.active(e);
			break;

			case 'displayed': this.displayed(e);
			break;

			default: this.normal(e);
			break;
		}
	},
	capture: function(e) {
		/* record the error behind the scenes for later review */
		console.warn('Capturing this error to the database');
		/* TODO: Capture e in the DB */
		e = '';
	},
	normal: function(e) {
		/* throw the error to the console - basically a bypass */
		console.info(e);

		// also save it in the database
		this.capture(e);
	},
	display: function(e) {
		/* display an error message from within the app as a modal window */
		Ext.Msg.alert('Error!', e.name + ':<br />' + e.message, this);

		// also save it in the database
		this.capture(e);
	}



}
