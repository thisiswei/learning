Function.prototype.bind = function() {
  var fn = this, args = Array.prototype.slice.call(arguments), object = args.shift();
  return function() {
    return fn.apply(object,
                    args.concat(Array.prototype.slice.call(arguments)));
  };
};

function isNimble() { return true; };
var canFly = function(){ return true; };
window.isDeadly = function(){return true;};

typeof canFly == 'undefined';

function yell(n){
  return n > 0 ? yell(n-1) + "a" : "hiy";
}

var ninja = {
  yell: function(n) {
    return n > 0 ? yell(n-1) + 'a' : 'hiy';
  }
};
ninja.yell(4) == 'hiyaaaa';

var samurai = { yell: ninja.yell };

samurai.yell(4) == 'hiyaaaa';

var ninja = {
  yell: function(n){
    return n > 0 ? arguments.callee(n-1) + 'a' : 'hiy';
  }
};

var obj = {};
var fn = function(){}
obj.wtf = 'wtf';
fn.wtf = 'wtf';
obj.wtf == fn.wtf;

function getElements(name) {
  var results;
  if (getElements.cache[name]) {
    results = getElements.cache[name];
  } else {
    results = document.getElementsByTagName(name);
    getElements.cache[name] = result;
  }
  return results;
};
getElements.cache = {};


function isPrime(num) {
  var prime = num != 1;
  for (var i = 2; i < num; i++) {
    if (num % i == 0) {
      prime = false;
      break;
    }
  }
  return prime;
}


function isPrime(num) {
  if (isPrime.cache[num] != null) 
    return isPrime.cache[num];
  var prime = num != 1;
  for (var i = 2; i < num; i++) {
    if (num % i == 0) {
      prime = false;
      break;
    }
  }
  isPrime.cache[num] = prime;
  return prime;
}

isPrime.cache = {};

var katana = {
  isSharp: true,
  use: function(){
    this.isSharp = !this.isSharp;
  }
};

katana.use();
!katana.isSharp;

function katana(){
  this.isSharp = true;
}
katana();
isSharp == true;

var wtf = {
  toss: function(){
    this.isSharp = true;
  }
};

wtf.isSharp == true;

var object = {};
function fn(){
  return this;
}

fn() == this;
fn.call(object) == object;

function add(a, b) {
  return a + b;
}

add.call(this, 1, 2) == add.apply(this, [1, 2]);


function loop(array, fn) {
  for (var i = 0; i < array.length; i++) {
  }
}

function loop(array, fn) {
  for (var i = 0; i < array.length; i++) 
      fn.call(array, array[i], i);
}
function Ninja(){
  this.name = 'Ninja';
}

var ninjaA = Ninja();
var ninjaB = new Ninja();

!ninjaA;
ninjaB.name == 'Ninja';


function Ninja(){
  this.swung = false;
  this.swingSword = function(){
    this.swung = !this.swung;
    return this.swung;
  };
}

var ninja = new Ninja();
ninja.swingSword();
ninja.swung;


function Ninja(name){
  this.name = name;
  this.changeName = function(name){
    this.name = name;
  }
}

function Ninja(name){
  this.changeName = function(name){
    this.name = name;
  };
  this.chageName(name);
}

function User(first, last){
  this.name = first + ' ' + last;
}
window.name ='Lu';
var user = User('wei', name);
name == 'wei lu';

function User(first, last){
  if (!(this instanceof User))
    return new User(first, last);
  this.name = first + ' ' + last;
}

function User(first, last){
  if (!(this instanceof arguments.callee))
    return new User(first, last);
  this.name = first + ' ' + last;
}
var name = 'wei';
var user = User('lu', name);

name == 'wei';

function merge(root){
  for (var i = 1; i < arguments.length; i++)
    for (var key in arguments[i])
      root[key] = arguments[i][key];
  return root;
}
var merged = merge({name: 'wei'}, {city: 'SF'});
merged.name == 'wei';
merged.city == 'SF';


function smallest(array){
  return Math.min.apply(Math, array);
}
function largest(array){
  return Math.max.apply(Math, array);
}

function smallest(){
  return Math.min.apply(Math. arguments);
}

function highest(){
  return makeArray(arguments).sort(function(a, b){
    return b - a;
  });
}

function makeArray(array){
  return Array().slice.call(array);
}

highest(1, 1, 2, 4)[0] == 4; 
highest(1, 10, 2, 4)[1] == 4;

// slice is epic
function multiMax(multi){
  // Make an array of all but the first argument
  // var allButFirst = arguments.slice(1);
  var allButFirst = Array().slice.call(arguments, 1);

  // Find the largest number in that array of arguments
  var largestAllButFirst = Math.max.apply(Math, allButFirst);

  // Return the multiplied result
  return multi * largestAllButFirst;
}
assert( multiMax(3, 1, 2, 3) == 9, "3*3=9 (First arg, by largest.)" );


var num = 10;
function addNum(myNum){
  return num + myNum;
}
addNum(5) == 15;

var count = 1;
var elem = document.createElement('li');
elem.innerHTML = 'click me';
elem.onclick = function(){
  log( "click #", count++);
};
document.getElementById("results").appendChild(elem);
elem.parentNode == 'clickable element appened';

function Ninja(){
  var slices = 0;
  this.getSlices = function(){
    return slices;
  };
  this.slice = function(){
    slices++;
  };
}
var ninja = new Ninja();
ninja.slice();
ninja.getSlices == 1;
ninja.slices == undefined;

var a = 5;
function runMe(a){
 assert( a == 6, "Check the value of a." );

 function innerRun(){
   assert( b == 7, "Check the value of b." );
   assert( c == undefined, "Check the value of c." );
 }

 var b = 7;
 innerRun();
 var c = 8;
}
runMe(6);

for ( var d = 0; d < 3; d++ ) {
 setTimeout(function(){
   assert( d == 3, "Check the value of d." );
 }, 100);
}

(function(){
  var count = 0;
  var timer = setInterval(function(){
    if (count < 5) {
      log("timer call: ", count);
      count++;
    } else {
      clearInterval(timer);
    }
  }, 100);
})();

typeof count == 'undefined'
typeof timer == 'undefined'

var count = 0;
for ( var i = 0; i < 4; i++ ) (function(i){
  setTimeout(function(){
    assert( i == count++, "Check the value of i." );
  }, i * 200);
})(i);

function Ninja(){};
Ninja.prototype.swingSword = function(){
  return true;
}

var ninjaA = Ninja();
var ninjaB = new Ninja();

!ninjaA;
ninjaB.swingSword();


// properties added in the constructor (or later) override prototytped properties.

function Ninja(){
  this.swingSword = function(){
    return true;
  };
}

Ninja.prototype.swingSword = function(){
  return false;
};

var ninja = new Ninja();
ninja.swingSword() == true;

// prototyped properties affect all objects of the same construtor,
// simultaneously, even if they already exist.

function Ninja(){
  this.swung = true;
}

var ninjaA = new Ninja();
var ninjaB = new Ninja();

Ninja.prototype.swingSword = function(){
  return this.swung;
};

ninjaA.swingSword() == ninjaB.swingSword();

function Ninja(){
  this.swung = true;
}

function Ninja(){
  this.swung = true;
}

var ninjaA = new Ninja();
var ninjaB = new Ninja();

// Add a method to the Ninja prototype which
// returns itself and modifies swung
Ninja.prototype.swing = function(){
  this.swung = false;
  return this;
};

assert( !ninjaA.swing().swung, "Verify that the swing method exists and returns an instance." );
assert( !ninjaB.swing().swung, "and that it works on all Ninja instances." );

var ninja = new Ninja();
typeof ninja == 'object';
ninja instanceof Ninja;
ninja.constructor == Ninja;

var ninjaB = new ninja.constructor();
ninjaB instanceof Ninja;

var ninja = (function(){
 function Ninja(){}
 return new Ninja();
})();

// Make another instance of Ninja
var ninjaB = new ninja.constructor() ; 

assert( ninja.constructor == ninjaB.constructor, "The ninjas come from the same source." );


function Person(){}
Person.prototype.dance = function(){};

function Ninja(){}

Ninja.prototype = new Person();
var ninja = new Ninja();

ninja instanceof Ninja;
ninja instanceof Person;
ninja instanceof Object;


function Person(){}
Person.prototype.getName = function(){
  return this.name;
};

function Me(){
  this.name = "wei lu";
}
Me.prototype = new Person();

var me = new Me();
assert( me.getName(), "A name was set." );

Object.prototype.keys = function(){
  var keys = [];
  for (var i in this)
    keys.push(i);
  return keys;
};

var obj = {a: 1, b: 2, c: 3};
delete Object.prototype.keys;

//context whatever

var Button = {
  click: function(){
    this.clicked = true;
  }
};

var elem = document.createElement('li');
elem.innerHTML = 'click me!';
elem.onclick = Button.click;
document.getElementById('result').appendChild(elem);
elem.onclick();
elem.clicked; // the clicked property was accidentally set on the element


function bind(context, name){
  return function(){
    return context[name].apply(context, arguments);
  };
}

var elem = document.createElement('li');
elem.innerHTML = 'click me';
elem.onclick = bind(Button, 'click'); 
document.getElementById('result').appendChild(elem);
elem.onclick();
Button.clicked; // the clicked property was correctly set on the onbject

//
Function.prototype.bind = function(object){
  var fn = this;
  return function(){
    return fn.apply(object, arguments);
  };
};

var Button = {
  click: function(){
    this.clicked = true;
  }
};

var elem = document.createElement('li');
elem.innerHTML = 'click me';
elem.onclick = Button.click.bind(Button);
document.getElementsById('results').appendChild(elem);

elem.onclick();
Button.clicked;

Function.prototype.bind = function(){
  var fn = this, args == Array.prototype.slice.call(arguments), object = args.shift();
  return function(){
    return fn.apply(object,
                    args.concat(Array.prototype.slice.call(arguments)));
  };
};

var Button = {
  click: function(value){
    this.clicked = value;
  }
};

var elem = document.createElement('li');
elem.innerHTML = 'click me';
elem.onclick = Button.click.bind(Button, false);
document.getElementsById('results').appendChild(elem);

elem.onclick();
Button.clicked == false;

//

function makeNinja(name){}
function makeSamurai(name, rank){}
makeNinja.length == 1;
makeSamurai.length == 2;


function addMethod(object, name, fn){
  var old = object[name];
  object[name] = function(){
    if (fn.length == arguments.length)
      return fn.apply(this, arguments)
    else if (typeof old == 'function')
      return old.apply(this, arguments);
  };
}

function Ninja(){
  var ninjas = [ "Dean Edwards", "Sam Stephenson", "Alex Russell" ]; 
  addMethod(this, 'find', function(){
    return ninjas;
  });
  addMethod(this, 'find', function(name){
    var ret = [];
    for (var i = 0; i < ninjas.length; i++)
      if (ninjas[i].indexOf(name) == 0)
        ret.push(ninjas[i]);
    return ret;
  });
  addMethod(this, 'find', function(first, last){
    var ret = [];
    for (var i = 0; i < ninjas.length; i++)
      if (ninjas[i] == (first + ' ' + last))
        ret.push(ninjas[i]);
    return ret;
  });
}

var ninjas = new Ninja();
ninjas.find().length == 3;
ninjas.find('Sam').length == 1;
ninjas.find('Dean', 'Edwards').length == 1;
ninjas.find('Alex', 'X', 'Russell') == null;

