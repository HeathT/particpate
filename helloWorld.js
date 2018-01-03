
// Hello World

// Here's a template for how objects should be created and the basic structure they should have

	var _obj = {
		id:			'thisObj',
		name:		'genericObj',
		austin:		'rocks',
		type:		'thing'
	};


// Console allows us to do some really cool stuff
	console.clear();	// Let's clear it first
	console.log(_obj);	// Now we can dump our entire object out to the console


// You can also add things to an object like this

	_obj.active = 1;

	console.log(_obj);


// or change an existing value, by overwriting it, like this

	_obj.name = 'newName';

	console.log(_obj);


// or change the existing value, via concatination, like this

	_obj.name = _obj.name + '_13';

	console.log(_obj);


// we can also add function to our object (function are objects themselve btw)

	_obj.output = function(thingIn){	// 'thingIn' is a dynamic variable that we are sending to the function when we call the function
		console.log(thingIn);
	};

	console.log(_obj);

// Now we see that _obj has a function in it that can product console logs for us like this

	_obj.output(_obj);


// Now that we have that done, we can do some other cool things

	_obj.active = _obj.active + 1; // Here we set active to it's own value plus one

	_obj.output(_obj);

	_obj.active++; // This is shorthand for make _obj.active equal _obj.active plus one

	_obj.output(_obj);

// Now let's try a "for loop" but we'll make it a function with a return value

	_obj.counter = function(inValue, maxValue) {
		for(i=inValue;i < maxValue; i++){
			_obj.output(i);
		}
		return i;
	};

	_obj.active = _obj.counter(_obj.active, 15);

	_obj.output(_obj);
