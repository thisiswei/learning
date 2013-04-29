function isSortable(object) {
  return typeof object.sort == 'function';
}

var returnedNode = someNode.appendChild(newNode);
someNode.lastChild = newNode;

var deepList = myList.cloneNode(true);
alert(deepList.childNodes.length); /* it will copy all the child nodes */

var deepList = myList.cloneNode(false); /* only the first node */

var myImage = images.namedItem('myImage');

div.setAttribute('id', 'wtf');
div.id = 'someId';
var value = div.getAttribute('my_attribute');

div.removeAttribute('class');

var id = element.attributes.getNamedItem('id').nodeValue;
var id = element.attributes['id'].nodeValue;

var div = document.createElement('div');
div.id = 'wtf' ;
div.className = 'hello';

document.body.appendChild(div);

var link = document.createElement('link');
link.href = 'styles.css';
link.tyep = 'text/css';
link.rel = 'stylesheet';
var head = document.getElementsByTagName('head')[0];
head.appendChild(link);


