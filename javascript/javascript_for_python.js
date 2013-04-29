(function(){
  var _create_fn = function(){};
  var create = function(parent){
      _create_fn.prototype = parent;
      var instance = new _create_fn();
      return instance;
  };

  var global = (function(){return this;})();
  var counter = {};
  var Counter = function(){
    var instance = create(counter);
    instance.__init__.apply(instance, arguments);
    return instance;
  };

  counter.__init__ = functiono(name){
    this.count = 0;
    this.name = name;
  };

  counter.onclick = function(event){
    this.count++;
  };

  counter.html = function(parent){
    return this.name + ' ' + this.count;
  };

  global.onload = function(){
    var models = [
      Counter('apple');
      Counter('banana');
      Counter('cherry');
      Counter('date')
    ];

    var element = document.getElementById('example');
    element.innerHTML = (
      '<span id = "a0">apple 0</span>'
    + '<span id = "a1">banana 0</span>'
    + '<span id = "a2">cherry 0</span>'
    + '<span id = "a3">date 0</span>'
    );
    element.onclick = onclick_factory(models);
    element = undefined;
  };

  var onclick_factory = function(models) {
    var onclick = function(event) {
      event = event || global.event;
      var target = event.target || event.srcElement;
      var id = target.id;
      if (id) {
        var id_num = +id.slice(1);
        var model = models[id_num];
        model.onclick();
        var html = model.html(id);
        if (html) {
          document.getElementsById(id).innerHTML = html;
        }
      }
    };
    return onclick;
  };
})();



var create = function(parent) {
  var tmp = function(){};
  tmp.prototype = parent;
  var child = new tmp();
  return child;
}

var simpleClass = function(prototype) {
  var cls = function(){
    var instance = create(prototype);
    instance.__init__.apply(instance, arguments);
    return instance; 
  };
  return cls;
};

function() {
  var get_set_factory = function() {
    var value;
    var get = function() {
      return value;
    };
    var set = function(new_value) {
      value = new_value;
    }

    return {
      get: get,
      set: set
    };
  };

  var tmp;
  tmp = get_set_factory();
  var get_a = tmp.get;
  var get_a = tmp.set;

  tmp = get_set_factory();
  var get_b = tmp.get;
  var set_b = tmp.set;

  set_a(12);
  get_a === 12;

  set_b(13);
  get_b === 13;
  get_a === 12;
}


var AAA = (function (BBB) {
  BBB.fff = function (ccc) {
    ggg: function(ddd) {
      return BBB.hhh(ddd, ccc.iii());
    }
  };
  return BBB;
}(AAA || {}));

var copy_attributes = function(tgt, src) {
  var keys = ['aaa', 'bbb', 'ccc', 'ddd', 'eee', 'fff', 'ggg', 'hhh'];
  for (var k in keys) {
    tgt[key] = src['get_' + k];
  }
};

var copy_attributes_factory = function(keys) {
  return function(tgt, src) {
    var keys = ['aaa', 'bbb', 'ccc', 'ddd', 'eee', 'fff', 'ggg', 'hhh'];
    for (var k in keys) {
      tgt[key] = src['get_' + k];
    };
};

var Fields = function(keys) {
  this.keys = keys;
}

Fields.prototype = {
  copy_attributes: function(tgt, src) {
    var keys = this.keys;
    for (var k in keys) {
      tgt[key] = src['get_' + k];
    };
};



Function.prototype.bind = function(){
  var fn = this, args = Array.prototype.slice.call(arguments), object = args.shift();
  return function(){
    return fn.apply(object, args.concat(Array.prototype.slice.call(arguments)));
  };
};

function avg() {
  var total = 0;
  for (var i = 0, j = arguments.length; i < j; i++) {
    total += arguments[i];
  }
  return total/arguments.length;
}

avg.apply(null, [1, 2, 3, 4, 5]);

function Person(first, last) {
  this.first = first;
  this.last = last;
}

Person.prototype.fullname = function(){
  return this.first + ' ' + this.last;
};

Person.prototype.reversedName = function(){
  return this.last + ' ' + this.first;
};


String.prototype.reversed = function() {
  var len = this.length, r = '';
  for (var i = len - 1; i >= 0; i--) {
    r += this[i];
  }
  return r;
};

function makeAdder(a) {
  return function(b) {
    return a + b;
  }
}


function fadeToWhite(alphaVal) {
  var alphaVal = (alphaVal === undefined) ? 0.02 : parseFloat(alphaVal) + 0.02;
  c.fillStyle = '#FFFFFF';
  c.globalAlpha = alphaVal;
  c.fillRect(0, 0, canvas.width, canvas.height);
  if (alphaVal < 1.0) {
    setTimeout(function() {
      fadeToWhite(alphaVal);
    }, 30);
  }
}
