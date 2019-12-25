# Problem with global scope
If we declare variable directly in global scope, anyone can accidentally modify it.
```js
var data = "some data";

function changer(newData) {
  data = newData;
}
```
### Object and Namespace
Move the data inside an object. Now probability of accidental modification is less.
```js
var myObj = {
  data: 'some data',

  changer: function(newData) {
    this.data = newData;
  },

  print: function() {
    console.log(this.data);
  }
}
```
but still the name `myObj` is not unique, some other code can have the same name. To avoid the conflict, we can use **namespace** concept.
```js
var data = data || {};
data.userData = data.userData || {};
data.userData.impData = data.userData.impData || {};

data.userData.impData.myObj = {
  data: 'some data',

  changer: function(newData) {
    this.data = newData;
  },
  
  print: function() {
    console.log(this.data);
  }
}
```
It's protected from accidental modification, but how about intentional. It shouldn't be accessible for those who are not meant to modify it.

### Module
```js
var myObj = (function(){
  var data = "some data";

  function privateFn() {
    console.log("I'm a private function");
  }

  return {
    changer: function (newData) {
      data = newData;
    }
  }
})();

myobj.changer('some new data');    // ✔️
myobj.privateFn()                  // Err: Ref
myobj.data                         // Err: Ref
```
Here we separated private and public methods, public functions are returned from IIFE and private properties and methods live inside function scope, thus not accessible from outside.
But in this design private mehods can't interact with public methods, if we want to do so, it'll be really complex.

### Reveal
```js
var myObj = (function(){
  var _data = "some data";
  var publicProp: "I'm public";

  function _privateFn() {
    console.log("I'm a private function");
  }
  
  function changer (newData) {
      data = newData;
  }

  return {
    changer: changer,
  }
})();

myobj.changer('some new data');    // ✔️
myobj.publicProp                   // ✔️
myobj._privateFn()                 // Err: Ref
myobj._data                        // Err: Ref
```
Hear we defined all the properties and methods at once, and returned references of public properties and methods. Now everything is internally accessible.

But it's not extensible, it's final once it's defined, we can't modify/override anything later, because we have refs to these properties and methods which live inside that function scope only.

# Creational Design Patterns
## 1. Singleton
Only one instance. if instance already exists return the same, else create one and return the instance.
```js
(function() {
  var singletonInstanceGenerator = (function(){
    var instance;
    function init() {
      instance = {
        about: 'may be some service connecting to db';
        pubFn1: function() { /* public function 1*/ }
        pubFn2: function() { /* public function 2*/ }
      }
    }

    return {
      getInstance: function() {
        if (!instance) init();
        return instance;
      }
    }
  })();

  var instance = singletonInstanceGenerator.getInstance();
  instance.pubFn1()       // ✔️

})();    // so that we're not in the global scope
```

## 2. Factory
Define all kinds of constructors and call them inside factory based on condition.

```js
var RedCircle = function () {
  this.item = 'red circle';
}

var BlueCircle = function () {
  this.item = 'blue circle';
}

var CircleFactory = function() {
  this.create = function(color) {
    if (color === 'red') {
      return new RedCircle();
    } else {
      return new BlueCircle();
    }
  }
}


var _cf = new CircleFactory();
var redCircle = _cf.create('red').item;
var redCircle = _cf.create('blue').item;
```

## Abstract Factory
Abstract factory doesn't know the actual implementation of the creator function it just knows the interface.
As in javascript there's no such thing as interface, I've implemented the creator functionality in prototype.

Creator function(registered in factory) is not implemented, it has nothing in it's body.

```js
function RedCircle() {}

RedCircle.prototype.create = function() {
  this.item = 'red circle';
  return this;
}

function BlueCircle() {}

BlueCircle.prototype.create = function() {
  this.item = 'blue circle';
  return this;
}

var CircleFactory = function() {
  this.creators = {};
  this.create = function(type) {
    return new this.creators[type]().create();
  }

  this.register = function(type, creator) {
    // check if creator implements create method
    if (creator.prototype.create) {
      this.creators[type] = creator;
    }
  }
}


var _cf = new CircleFactory();
_cf.register('red', RedCircle);
_cf.register('blue', BlueCircle);
var redCircle = _cf.create('red').item;
var blueCircle = _cf.create('blue').item;
```
## Builder
jQuery $ is a builder, it handles a lot of stuff behind the scene.  
Builder doesn't necessarily create one item, it can create multiple items.

it only makes sense when the creation process is complex and takes a lot of steps
```js
function Circle() {   // create circle
  this.item = { name: 'circle' };
}

// property modifiers for circle
Circle.prototype.color = function(clr) {
  this.item.color = clr;
}

Circle.prototype.move = function(left, right) {
  this.item.css = {left: left, right: right};
}

---------------------------------------------------------

// Builders will use the above functions
function RedCircleBuilder() {
  this.item = new Circle();
  this.init();
}

RedCircleBuilder.prototype.init() = function {
  this.item.color('red');
}

RedCircleBuilder.prototype.get() = function {
  return this.item;
}

function BlueCircleBuilder() {
  this.item = new Circle();
  this.init();
}

BlueCircleBuilder.prototype.init() = function {
  this.item.color('blue');
}

BlueCircleBuilder.prototype.get() = function {
  return this.item;
}

--------------------------------------------------------

var CircleFactory = function() {
  this.creators = {};
  this.create = function(type) {
    return new this.creators[type]().get();
  }

  this.register = function(type, creator) {
    // check if creator implements create method
    if (creator.prototype.init && creator.prototype.get) {
      this.creators[type] = creator;
    }
  }
}

var _cf = new CircleFactory();
_cf.register('red', RedCircleBuilder);
_cf.register('blue', BlueCircleBuilder);
var redCircle = _cf.create('red').item;
var blueCircle = _cf.create('blue');
// _cf.create returns new Circle
blueCircle.move(5,5);
```

## Prototype
It's memory efficient, because methods never get copied on inherited object/class they only get ref of the method.



# Structural Design Patterns
Always design in such a way it must be extensible without modifying existing code.  
E.g. visual objects creation on web relies on document. No it can be jQuery object, canvas anything. Don't hard-code it define a function to set the stage, make it flexible.

## 1. Adapter


<hr>
<hr>


<h1 align="center"> SOLID principles of programming</h1>
Given by uncle Bob Martin

## Single Responsibility
One class should only care about one thing. e.g

```js
class Journal {
  constructor() {
    this.entries = {};
  }

  addEntry(txt) {
    let c = ++Journal.count;
    let entry = `${c}: ${txt}`;
    this.entries[c] = entry;
    return c;
  }

  removeEntry(index) {
    delete this.entries[index];
  }
  toString() {
    return Object.values(this.entries).join('\n');
  }
}

Journal.count = 0;
```

If we want to add save to file/server functionality to the journal, it's better to do that in a separate class in such a way that it's flexible and usable by other stuff as well.

```js
class SaveLoad {
  saveToFile(journal, filename) {
    fs.writeFileSync(filename, journal.toString());
  }

  saveToServer(journal, url) {
    // post the journal to url
  }
}
```

## Open-Close
**Open for extension, but closed for modification.**  
e.g. product search

```js
let Color = Object.freeze({
  red: 'red',
  green: 'green',
  blue: 'blue',
});

let Size = Object.freeze({
  small: 'small',
  medium: 'medium',
  large: 'large'
});

class Product {
  constructor(name, color, size) {
    this.name = name;
    this.color = color;
    this.size = size;
  }
}

// search
class ProductFilter {
  filterByColor(products, color) {
    return products.filter(p => p.color === color);
  }
}
```

If we're asked to add more search functionality like `filterBySize`, `filterByColorAndSize`, we'll have to modify above class adding more functions. Imagine, if we had 3 specs, then we'll have to write 7 filter functions, what if we had more specs..🙁 (**State space explosion**).

Bad practice, because it might have been well tested and deployed, we need to extend without modifying.

Ans:

```js
class ColorSpecification {
  constructor(color) {
    this.color = color;
  }

  isSatisfied(item) {
    return item.color === this.color;
  }
}

class SizeSpecification {
  constructor(size) {
    this.size = size;
  }

  isSatisfied(item) {
    return item.size === this.size;
  }
}

// handling multiple specifications
class AndSpecification {
  constructor(...specs) {
    this.specs = specs;
  }

  isSatisfied(item) {
    return this.specs.every(spec => spec.isSatisfied(item));
  }
}

class OrSpecification {
  //
}

class BetterFilter {
  filter(items, spec) {
    return items.filter(item => spec.isSatisfied(item));
  }
}


// usage
const bf = new BetterFilter();

let spec = new SizeSpecification(Size.large);
let filteredItems = bf.filter(products, spec);

spec = new AndSpecification(
  new ColorSpecification(Color.green),
  new SizeSpecification(Size.large)
);
filteredItems = bf.filter(products, spec);
```

If more specifications are needed, just define new spec.

**Note:** It'd be better to use inheritance(base specification having `isSatisfied` interface, which should be implemented by derived class) but in javaScript it's messy to implement.

## Liskov Substitution
Function that works with object of base class must be able to work with object of derived class.

```js
class Rectangle {
  constructor(width, height) {
    this._width = width;
    this._height = height;
  }

  get width() { return this._width; }
  set width(width) { this._width = width; }

  get height() { return this._height; }
  set height(height) { this._height = height; }
  
  get area() {
    return this._width * this._height;
  }

  toString() {
    return `${this._width}x${this._height}`;
  }
}

class Square extends Rectangle {
  constructor(size) {
    super(size, size);
  }

  set width(size) {
    this._width = this._height = size;
  }

  set height(size) {
    this._width = this._height = size;
  }

  set size(size) {
    this._width = this._height = size;
  }
}


function Tester(rect) {
  const width = rect._width;
  rect.height = 10;
  console.log(`Expected area: ${10*width}, got: ${rect.area}`);
}

let rc = new Rectangle(3,4);
console.log(rc.toString());

let sq = new Square(5);
sq.width = 5;
console.log(sq.toString());
Tester(rc);
Tester(sq); //it'll fail
```

Here tester function will fail for **square**.  
In this case we can make the function dynamic or we can entirely remove square class and add a method in rectangle class `isSquare()` to handle special case.

## Interface Segregation

```js
class Machine {
  constructor() {
    if (this.constructor.name === 'Machine') {
      throw new Error('Abstract Class');
    }
  }

  // Interfaces
  print(doc) {}
  fax(doc) {}
  scan(doc) {}
}

class MultiFunctionPrinter extends Machine {
  print(doc) {
    // ok
  }
  fax(doc) {
    // ok
  }
  scan(doc) {
    // ok
  }
}

class NotImplementedError extends Error {
  constructor(name) {
    const msg = `${name} not implemented`;
    super(msg);
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, NotImplementedError);
    }
  }
}

// can't scan or fax
class OldFashionedPrinter extends Machine {
  print(doc) {
    // ok
  }

  // we can totally remove the function
  /*
  fax(doc) {
    // not gonna work
  }
  */

  // or

  // we can display an error
  scan(doc) {
    throw new NotImplementedError('scan');
  }
}
```

Either way it's not good practice.  
If we don't implement the function, it'll show no results, which is confusing for user.  
We're left with no choice than throwing an error.

The programmer shouldn't be forced to implement the method, whether it's required or not.

This is where **Interface Segregation** comes into play.

**Note:** Interfaces should be separate.

```js
class Printer {
  constructor() {
    if (this.constructor.name === 'Printer') {
      throw new Error('Abstract Class');
    }
  }

  // Interface
  print(doc) {}
}

class Scanner {
  constructor() {
    if (this.constructor.name === 'Scanner') {
      throw new Error('Abstract Class');
    }
  }

  // Interface
  scan(doc) {}
}

// Usage
class Photocopier extends Printer, Scanner { // not possible in JS
  print(doc) {
    //
  }
  scan(doc) {
    //
  }
}

// workaround to combine classes
var aggregation = (baseClass, ...mixins) => {
  class base extends baseClass {
    constructor (...args) {
      super(...args);
      mixins.forEach((mixin) => {
        copyProps(this,(new mixin));
      });
    }
  }
  let copyProps = (target, source) => {  // this function copies all properties and symbols, filtering out some special ones
    Object.getOwnPropertyNames(source)
      .concat(Object.getOwnPropertySymbols(source))
      .forEach((prop) => {
        if (!prop.match(/^(?:constructor|prototype|arguments|caller|name|bind|call|apply|toString|length)$/))
          Object.defineProperty(target, prop, Object.getOwnPropertyDescriptor(source, prop));
      })
  };
  mixins.forEach((mixin) => {
    // outside constructor() to allow aggregation(A,B,C).staticFunction() to be called etc.
    copyProps(base.prototype, mixin.prototype);
    copyProps(base, mixin);
  });
  return base;
};

class Photocopier extends aggregation(Printer, Scanner) {
  print(doc) {
    //
  }
  scan(doc) {
    //
  }
}
```

## Dependency Inversion
Usually our higher level classes / functions depend on mid-level and mid-level depends on low level. If we need to change low-level stuff, we shouldn't need to change high level stuff. e.g.  

```js
let relationship = Object.freeze({
  parent: 0,
  child: 1,
  sibling: 2
});

class Person {
  constructor(name) {
    this.name = name;
  }
}

// Low-Level (Storage)
class Relationship {
  constructor() {
    this.data = [];
  }

  addParentAndChild(parent, child) {
    this.data.push({
      from: parent,
      type: relationship.parent,
      to: child
    });
    this.data.push({
      from: child,
      type: relationship.child,
      to: parent
    });
  }
}

// High-Level (Research)
class Research {
  constructor(relationships, parent) {
    let relations = relationships.data; //💩💩💩
    relations = relations.filter(rel => rel.from == parent && rel.type == relationships.parent);
    for (let rel of relations) {
      console.log(`${parent} has a child named ${rel.to.name}`);
    }
  }
}

let parent = new Person('John');
let child1 = new Person('Chris');
let child2 = new Person('Matt');

// low-level module
let rels = new Relationships();
rels.addParentAndChild(parent, child1);
rels.addParentAndChild(parent, child2);
new Research(rels);
```

In `Research` we're using low level data directly assuming it's an array, if the data storage structure changed, our high level function won't work.

**Note:** Higher level stuff shouldn't depend directly on low level stuff, instead it should depend on abstract/interface.


To solve this, we can inverse the dependency. add the search functionality to the storage class itself, if storage mechanism changes, it should handle search mechanism as well.

```js
class RelationShipBrowser {
  constructor() {
    if (this.constructor.name === 'RelationShipBrowser') {
      throw new Error('RelationShipBrowser is abstract');
    }
  }
  
  findAllChildrenOf(name) {
    throw new Error('Not implemented') // Extend and override
  }
}

// Low-Level (Storage)
class Relationship extends RelationShipBrowser {
  constructor() {
    this.data = [];
  }

  addParentAndChild(parent, child) {
    this.data.push({
      from: parent,
      type: relationship.parent,
      to: child
    });
    this.data.push({
      from: child,
      type: relationship.child,
      to: parent
    });
  }

  findAllChildrenOf(name) {
    return this.data.filter(rel =>
      rel.from.name === name &&
      rel.type === relationship.parent
    ).map(rel => rel.to);
  }
}

// High-Level (Research)
class Research {
  constructor(browser, parent) {
    for (let child of browser.findAllChildrenOf(parent)) {
      console.log(`${parent} has a child name ${child.name}`);
    }
  }
}
```

<h1 align="center">Structural</h1>

Simplifies/provides flexible solution for building complex objects.  
Creates complex objects using simple objects providing step by step approach.  
Builder uses actual construction methods to build the objects, it's like a wrapper around actual construction methods which simplifies building.

e.g. HTML builder

```js
// This is where actual HTML is constructed
class Tag
{
  static get indentSize() { return 2; }

  constructor(name='', text='')
  {
    this.name = name;
    this.text = text;
    this.children = [];
  }

  toStringImpl(indent)  // traverse the tree and convert to string
  {
    let html = [];
    let i = ' '.repeat(indent * Tag.indentSize);
    html.push(`${i}<${this.name}>\n`);
    if (this.text.length > 0)
    {
      html.push(' '.repeat(Tag.indentSize * (indent+1)));
      html.push(this.text);
      html.push('\n');
    }

    for (let child of this.children)
      html.push(child.toStringImpl(indent+1));

    html.push(`${i}</${this.name}>\n`);
    return html.join();
  }

  toString()
  {
    return this.toStringImpl(0);
  }

  static create(name)
  {
    return new HtmlBuilder(name);
  }
}

// help simplify building. Uses Tag class
class HtmlBuilder
{
  constructor(rootName)
  {
    this.root = new Tag(rootName);
    this.rootName = rootName;
  }

  // non-fluent
  addChild(childName, childText)
  {
    let child = new Tag(childName, childText);
    this.root.children.push(child);
  }

  // fluent
  addChildFluent(childName, childText)
  {
    let child = new Tag(childName, childText);
    this.root.children.push(child);
    return this;
  }

  toString()
  {
    return this.root.toString();
  }

  clear() // remove all the children
  {
    this.root = new Tag(this.rootName);
  }

  build() // get tag along with all the children
  {
    return this.root;
  }
}

// USAGE

const words = ['hello', 'world'];

let builder = new HtmlBuilder('ul');
// or
let builder = Tag.create('ul');

for (let word of words) // non-fluent builder
  builder.addChild('li', word);

console.log(builder.toString());
// or
console.log( builder.build().toString());

// fluent builder
builder.clear();
builder
  .addChildFluent('li', 'foo')
  .addChildFluent('li', 'bar')
  .addChildFluent('li', 'baz');
console.log(builder.toString());
```

**Note:** Instead of using `Tag` directly, builder should be used.