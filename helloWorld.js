// Hello World

// Here's a template for how objects should be created and the basic structure they should have

var _obj = {
	id:			'thisObj',
	name:		'genericObj',
	type:		'thing'
};


// Console allows us to see what the object looks like in the browser - I'll use this throughout to dump the contents at each step
console.log(_obj);


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

_obj.output = function(thingIn){
	// 'thingIn' is a dynamic variable that we are sending to the function when we call the function
	console.log(thingIn);
};

console.log(_obj);

// Now we see that _obj has a function in it that can product console logs for us like this

_obj.output(_obj);





