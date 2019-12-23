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


# SOLID principles of programming
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

