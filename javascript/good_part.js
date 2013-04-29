var flight = {

         airline: "Oceanic",
         number: 815,
         departure: {
             IATA: "SYD",
             time: "2004-09-22 14:55",
             city: "Sydney"
         },
         arrival: {
             IATA: "LAX",
             time: "2004-09-23 10:42",
             city: "Los Angeles"
         } 
};
var myObject = {
         value: 0,
         increment: function (inc) {
             this.value += typeof inc === 'number' ? inc : 1;
} };

var myObject = function () { 
    var value = 0;
    return {
      increment: function (inc) {
        value += typeof inc === 'number' ? inc : 1;
      },
      getValue: function () { return value;
      } };
}( );

var quo = function (status) {
  return {
    get_status: function () { return status;
    } };
};
// Make an instance of quo.
var myQuo = quo("amazed");
document.writeln(myQuo.get_status( ));


var memoizer = function (memo, fundamental) {
  var shell = function (n) {
    var result = memo[n];
    if (typeof result !== 'number') {
      result = fundamental(shell, n);
      memo[n] = result;
    }
    return result;
  };
  return shell;
};


var fibonacci = memoizer([0, 1], function (shell, n) {
  return shell(n - 1) + shell(n - 2);
});
