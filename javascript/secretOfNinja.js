function junggle() {
  var result=0;
  for (var i=0; i<arguments.length; i++) {
    result += arguments[i];
  }
  this.result = result;
}

ninja = {};
ninja2 = {};

junggle.apply(ninja, [1, 2, 3, 4])
junggle.call(ninja2, 1, 2, 3, 4)


function forEach(list, callback) {
  for (var i=0; i<list.length; i++) {
    callback.call(list[i], i);
  }
}

var weapons = ['shuriken','katana','nunchucks'];

forEach(weapons, function(index) {
  return this === weapons[index]
})


function isPalindrome(text) {
  if (text==="") {
    return true;
  } 
  if (text.charAt(0) !== text.charAt(text.length-1)) {
    return false
  } 
  return isPalindrome(text.substr(1, text.length-2)); 
}

function chirp(n) {
  return n > 1 ? chirp(n-1) + '-chirp' : 'chirp';
}

var ninja = {
  chirp: function(n) {
    return n > 1 ? ninja.chirp(n-1) + '-chirp' : 'chirp';
  }
};

var samurai = {chirp: ninja.chirp};
       //

var store = {
  nextId: 1,
  cache: {},
  add: function(fn) {
    if (!fn.id) {
      fn.id = store.nextId ++ ;
      return !!(cache[fn.id] = fn)
    }
  }
};

function ninja(){}
store.add(ninja);
// add only once
!store.add(ninja);

function isPrime(n) {
  if (!isPrime.answer) { isPrime.answer = {}; }
  if (isPrime.answer[n]) { return isPrime.answer[n]; }
  var prime = n !== 1;
  for (var i=2; i<n; i++) {
    if (n % i ===0) { 
      prime = false;
      break;
    }
  }
  return isPrime.answer[n] = prime;
}

function getElements(name) {
  if (!getElements.cache) getElements.cache = {};
  return getElements.cache[name] = getElements.cache[name] ||
         document.getElementsByTagName(name);
}

var elems = {
  length: 0,
  add: function(elem) {
    Array.prototype.push.call(this, elem);
  },
  gather: function(id) {
    this.add(document.getElementById(id));
  }
};


function largest(array) {
  return Math.max.apply(Math, array);
}

function merge(root) {
  for (var i=1; i<arguments.length; i++) {
    for (var key in arguments[i]) {
      root[key] = arguments[i][key];
    }
  }
  return root;
}

function multiMax(multi) {
  return multi * Math.max.apply(Math,
    Array.prototype.slice.call(arguments, 1));
}
          
//
function makeNinja(name) {}
makeNinja.length === 1;


function addMethod(object, name, fn) {
  var old = object[name];
  object[name] = function() {
    if (fn.length === arguments.length) {
      return fn.apply(this, arguments);
    }
    else if (typeof old === 'function') {
      return old.apply(this,arguments);
    }
  };
}

// addMethod epic
var ninjas = {
  values: ['wei lu ', 'bitch lu', 'son bitch']
};

addMethod(ninjas, 'find', function() {
  return this.values;
});

addMethod(ninjas, 'find', function(firstName) {
  var ret = [];
  for (var i = 0; i < this.values.length; i++) {
    if (this.values[i].indexOf(firstName) === 0) {
      ret.push(this.values[i]);
    }
  }
  return ret;
});

addMethod(ninjas, 'find', function(first, last) {
  var ret = [];
  for (var i = 0; i < this.values.length; i++) {
    if (this.values[i] === (first + ' ' + last)) {
      ret.push(this.values[i]);
    }
  }
  return ret;
});

function isFunction(fn) {
  return Object.prototype.toString.call(fn) === '[object Function]';
}

function Ninja() {
  var feints = 0;
  this.getFeints = function() {
    return feints;
  };
  this.feint = function() {
    feints ++;
  };
}

function bind(context, name) {
  return function() {
    return context[name].apply(context, arguments);
  };
}


//memoized
Function.prototype.memoized = function(key) {
    this._value = this._value || {};
    return this._value[key] !== undefined ? 
           this._value[key] : this._value[key] = this.apply(this, arguments);
};

Function.prototype.memoize = function(){
  var fn = this;
  return function() {
    return fn.memozied.apply(fn, arguments);
  }
}

var isPrime = (function(n){
  var prime = n !== 1;
  for (var i = 2; i < n; i++) {
    if (n % i === 0) {
      prime = false;
      break;
    }
  }
  return prime;
}).memoize();

(function() {
  var clicked = 0;
  document.addEventListener('click', function() {
    alert(++clicked);
  }, false);
})();

document.addEventListener('click', (function(){
  var clicked = 0;
  return function(){
    alert( ++clicked );
  };
})(), false);


for (var i = 0; i < div.length; i++) (function(n){
  div[n].addEventListener('click', function(){
    alert('div #' + n + ' was clicked');
  }, false);
})(i);

function Person(){}
Person.prototype.dance = function(){};
function Ninja(){}
Ninja.prototype = new Person();
ninja = new Ninja();
ninja instanceof Person;

// 
HTMLElement.prototype.remove = function(){
  if (this.parentNode) {
    this.parentNode.removeChild(this);
  }
};

var a = document.getElementById('a');
a.parentNode.removeChild(a); // old fashion way

document.getElementById('a').remove(); // new way

// dealing with calling instructor mistaken Function
function User(first, last) {
  if (!this instanceof arguments.callee) {
    return new User(first, last);
  }
  this.name = first + ' ' + last;
}

