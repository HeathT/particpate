
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


// Wait for Ext to ready-up
Ext.onReady(function(){

	// Create a listener for all JS errors on the window object and use it to override the default error handler
	// This may allow us to have a psuedo-built-in try-catch handler
	// window.onerror = function (errorMsg, url, lineNumber, column, errorObj) {
	// 	alert('Error: ' + errorMsg + ' Script: ' + url + ' Line: ' + lineNumber
	// 	+ ' Column: ' + column + ' StackTrace: ' +  errorObj);
	// }



	_.errorHandler = {

		status: 'active',			// passive (default), active, displayed		
		init:  function(){
			// this should over-ride the standard javascript error handler

			window.onerror = function (errorMsg, url, lineNumber, column, errorObj) {
				// alert('Error: ' + errorMsg + ' Script: ' + url + ' Line: ' + lineNumber
				// + ' Column: ' + column + ' StackTrace: ' +  errorObj);

				_.errorHandler.trap(errorMsg, url, lineNumber, column, errorObj);
			}

			return true;
		},

			/*	Trap try/catch errors and handle them with a custom error handler
				
				Javascript Object Properties:
					.name
					.message

			*/

		trap: function(e, u, n, c, o) {
			/* prevent JS from throwing error */
			switch(_.errorHandler.status){
				case 'passive':	_.errorHandler.capture(e, u , n, c, o);
				break;

				case 'active': _.errorHandler.active(e, u , n, c, o);
				break;

				case 'displayed': _.errorHandler.displayed(e, u , n, c, o);
				break;

				default: _.errorHandler.capture(e, u , n, c, o);
				break;
			}
		},
		capture: function(e, u , n, c, o) {
			/* record the error behind the scenes for later review */
			_.util.debug('Capturing this error to the database', 'info');
			/* TODO: Capture e in the DB */
			e = '';
			return this;
		},
		active: function(e, u , n, c, o) {
			/* throw the error to the console - basically a bypass */
			
			// Save it to the database first
			_.errorHandler.capture(e, u , n, c, o);


			_.util.debug('running active', 'info');
			console.warn('Error!', o.name + ': ' + e, this);

		},
		displayed: function(e, u , n, c, o) {
			// Save it to the database first
			_.errorHandler.capture(e, u , n, c, o);
			_.util.debug('Alert pop-up', 'info');

			/* display an error message from within the app as a modal window */
			Ext.Msg.alert('Error!', o.name + ':<br />' + e, this);
		}
	}

	_.errorHandler.init();
});
