
var assert = function(value, msg){
  if (!value)
    throw(msg || (value + ' does not equal true'));
};

var assertEqual = function(val1, val2, msg){
  if (val1 != val2)
    throw(msg || (val1 + ' does not eqaul ' + val2));
};

var Animal = function(){};
Animal.prototype.breath = function(){
  console.log('breath');
};

var Dog = function(){};
Dog.prototype = new Animal;
Dog.prototype.wag = function(){
  console.log('wag tail');
};
