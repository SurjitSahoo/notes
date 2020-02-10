* [JavaScript](#javaScipt)
* [Python](#Python)

<p id="javaScipt"></p>

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
<p id="Python"></p>
<pre>
          🐍🐍    🐍    🐍  🐍🐍🐍🐍🐍  🐍    🐍    🐍🐍🐍    🐍      🐍
          🐍  🐍   🐍  🐍       🐍      🐍    🐍   🐍     🐍  🐍🐍    🐍
          🐍🐍      🐍🐍        🐍      🐍🐍🐍🐍  🐍      🐍  🐍  🐍  🐍
          🐍         🐍         🐍      🐍    🐍   🐍     🐍  🐍    🐍🐍
          🐍         🐍         🐍      🐍    🐍    🐍🐍🐍    🐍      🐍
</pre>
<hr>
<hr>

<h1 align="center"> SOLID principles of programming</h1>

Given by uncle Bob Martin

## Single Responsibility
One class should only care about one thing. e.g

```python
class Journal:
  def __init__(self):
    self.entries = []
    self.count = 0

  def add_entry(self, txt)
    self.count += 1
    self.entries.append(f'{self.count}:{text}')

  def remove_entry(self, index):
    del this.entries[index]

  def __str__(self):
    return '\n'.join(self.entries)

```

If we want to add save to file/server functionality to the journal, it's better to do that in a separate class in such a way that it's flexible and usable by other classes/stuff as well.

**NOTE:** Don't add unnecessary functionality to `Journal` class

```python
class SaveLoad:
  def save_to_file(filename, journal):
    with open(filename, 'w') as f:
      file.write(str(journal))


  def save_to_url(url, journal):
    pass
}
```

## Open-Close
**Open for extension, but closed for modification.**  
e.g. product search

```python
from enum import Enum

class Color(Enum):
  RED = 1
  GREEN = 2
  BLUE = 3

class Size(Enum):
  SMALL = 1
  MEDIUM = 2
  LARGE = 3

class Product:
  def __init__(self, name, color, size):
    self.name = name
    self.color = color
    self.size = size


# search
class ProductFilter:
  def filter_by_color(self, products, color):
    for p in products:
      if p.color == color:
        yield p
```

If we're asked to add more search functionality like `filterBySize`, `filterByColorAndSize`, we'll have to modify above class adding more functions. Imagine, if we had 3 specs, then we'll have to write 7 filter functions, what if we had more specs..🙁 (**State space explosion**).

Bad practice, because it might have been well tested and deployed, we need to extend, but without modifying.

Ans:

```python
from abc import ABCMeta, abstractmethod

class Specification(metaclass=ABCMeta):
  def __and__(self, other):
    return AndSpecification(self, other)
  
  def __or__(self, other):
    return OrSpecification(self, other)

  @abstractmethod
  def is_satisfied(self, item):
    pass

class Filter(metaclass=ABCMeta):
  @abstractmethod
  def filter(self, items, spec):
    pass

# Class implementations
class ColorSpecification(Specification):
  def __init__(self, color):
    self.color = color

  def is_satisfied(self, item):
    return item.color == self.color


class SizeSpecification(Specification):
  def __init__(self, size):
    self.size = size

  def is_satisfied(self, item):
    return item.size == self.size

# handling multiple specifications
class AndSpecification(Specification):
  def __init__(self, specs1, spec2):
    self.spec1 = spec1
    self.spec2 = spec2

  def is_satisfied(item):
    return self.spec1.is_satisfied(item) and \
           self.spec2.is_satisfied(item)


class OrSpecification:
  def __init__(self, specs1, spec2):
    self.spec1 = spec1
    self.spec2 = spec2

  def is_satisfied(item):
    return self.spec1.is_satisfied(item) or \
           self.spec2.is_satisfied(item)

# Filter
class BetterFilter(Filter):
  def filter(self, items, spec):
    for item in items:
      if spec.is_satisfied(item):
        yield item

# usage
bf = BetterFilter()

large = SizeSpecification(Size.LARGE)
for item in bf.filter(products, spec):
  print(item)

large_green = AndSpecification(large, ColorSpecification(Color.GREEN))
large_green = large and ColorSpecification(color.GREEN)
for item in bf.filter(products, spec):
  print(item)
```

If more specifications are needed, just define new spec.

**Note:** It'd be better to use inheritance(base specification having `isSatisfied` interface, which should be implemented by derived class) but in javaScript it's messy to implement.

## Liskov Substitution
Function that works with object of base class must be able to work with object of derived class.

```python
class Rectangle:
  def __init__(self, width, height):
    self._width = width
    self._height = height

  @property
  def width(self): return self._width
  @width.setter
  def width(self, width): self._width = width

  @property
  def height(self): return self._height
  @height.setter
  def height(self, height): self._height = height
  
  @property
  def area(self): return self._width * self._height

  def __str__(self):
    return f'Rectangle: {self.width}x{self.height}'


# following function uses the above class
def user_function(rect):
  width = rect.width
  rect.height = 10
  print(f'Expected area: {10*width}, but got: {rect.area}')

---------------------------------------
rc = Rectangle(3, 4)
user_function(rc)
# >>> Expected area: 30, but got 30 😃
---------------------------------------

class Square(Rectangle):
  def __init__(self, size):
    super().__init__(size, size)

  @Rectangle.width.setter
  def width(self, size):
    self._width = self._height = size

  @Rectangle.height.setter
  def height(self, size):
    self._width = self._height = size

---------------------------------------
sq = Square(5)
user_function(sq)
# >>> Expected area: 50, but got: 100 💩
# Failed because function changes height,
# which alters both height and width internally
---------------------------------------
```

**SOLUTION:** We can make the function dynamic by removing the hard coded values or we can entirely remove square class and add a method in rectangle class `isSquare()` to handle special case.

## Interface Segregation

```py
from abc import ABCMeta, abstractmethod

class Machine(metaclass=ABCMeta):
  '''Abstract class'''
  @abstractmethod
  def print(self, doc):
    pass
  @abstractmethod
  def fax(doc):
    pass
  @abstractmethod
  def scan(doc):
    pass

# can print, fax and scan
class MultiFunctionPrinter(Machine):
  def print(self, doc):
    print(f'Printed {doc}')

  def fax(self, doc):
    print(f'Faxed {doc}')
  
  def scan(self, doc):
    print(f'Scanned {doc}')


# can't scan or fax
class OldFashionedPrinter(Machine):
  def print(self, doc):
    print(f'Printed {doc}')

  # We can't define the rest of the functions,
  # because this printer is not capable of those,
  # if we define the function leaving it empty,
  # it'll be a surprise, user will have no idea what's going on

  # But interface exits
  # When someone tries to scan / fax,
  # he'll get not implemented error 💩
```

This is where **Interface Segregation** comes into play. This basically means Interfaces should be separate.

```py
from abc import ABCMeta, abstractmethod

class Printer(metaclass=ABCMeta):
  @abstractmethod
  def print(self, doc): pass

class Scanner(metaclass=ABCMeta):
  @abstractmethod
  def scan(self, doc): pass

class Fax(metaclass=ABCMeta):
  @abstractmethod
  def fax(self, doc): pass

# Usage
class Photocopier(Printer, Scanner)
  def print(self, doc):
    print(f'Printed {doc}')

  def scan(self, doc):
    print(f'scanned {doc}')
```

## Dependency Inversion
High level modules shouldn't depend directly on low level modules, it should depend on abstractions instead.

Usually our higher level classes / functions depend on mid-level and mid-level depends on low level. If we need to change low-level stuff, we shouldn't need to modify high level stuff.

```py
class Relationship(Enum):
  PARENT = 0
  CHILD = 1
  SIBLING = 2

class Person:
  def __init__(self, name):
    self.name = name

# Low-Level (Storage)
class Relation:
  def __init__(self, name):
    self.relations = []

  def add_parent_and_child(self, parent, child):
    self.relations.append(
      (parent, Relationship.PARENT, child)
      (child, Relationship.CHILD, parent))

# High-Level (Research)
class Research:
  def __init__(self, relations, parent):
    relations = relations.relations;     # directly related 💩💩💩
    for r in relations:
      if r[0].name == parent and r[1] == Relationship.PARENT:
        print(f'{parent} has a child {r[2].name}')


parent = Person('John')
child1 = Person('Chris')
child2 = Person('Matt')

relations = Relation()
relations.addParentAndChild(parent, child1)
relations.addParentAndChild(parent, child2)
Research(relations)
```

In `class Research` we're directly depending on low level data and assuming it's an array, if the data structure for storage changed from array to something else, our high level function won't work.

To solve this, we can inverse the dependency. add the search functionality to the storage class itself, if storage mechanism changes, it should handle search mechanism as well.

```py
from abc import ABCMeta, abstractmethod

class RelationShipBrowser(metaclass=ABCMeta):
  @abstractmethod  
  def findAllChildrenOf(name): pass

# Low-Level (Storage)
class Relationship(RelationShipBrowser)
  def __init__(self):
    self.relations = []

  def add_parent_and_child(self, parent, child):
    self.relations.append(
      (parent, Relationship.PARENT, child)
      (child, Relationship.CHILD, parent))

  def find_all_children_of(self, name) {
    for r in self.relations:
      if r[0].name == parent and r[1] == Relationship.PARENT:
        yield r[2].name

# High-Level (Research)
class Research:
  def __init__(self, browser, parent):
    for child in browser.find_all_children_of(parent):
      print(f'{parent} has a child called {child}')
```

**<h1 align="center">Creational Patterns</h1>**

# Builder

* Simplifies/provides flexible solution for building complex objects.  
* Creates complex objects using simple objects providing step by step approach.  
* Builder uses actual construction methods to build the objects, it's like a wrapper around actual construction methods which simplifies building.
* Builder can use multiple classes / building blocks to build complex objects.

**e.g. HTML builder**

```py
# This is where actual HTML is constructed
class HtmlElement:
  indent_size = 2
  def __init__(self, name='', text=''):
    self.name = name
    self.text = text
    self.children = []

  def __str(self, indent):
    lines = []
    i = ' ' * (indent * self.indent_size)
    lines.append(f'{i}<{self.name}>')

    if self.text:
      i1 = ' ' * ((indent + 1) * self.indent_size)
      lines.append(f'{i1}{self.text}')

    for e in self.elements:
      lines.append(e.__str(indent + 1))

    lines.append(f'{i}</{self.name}>')
    return '\n'.join(lines)


  def __str__():
    return self.__str(0)

  @staticmethod
  def create(name):
    return HtmlBuilder(name)


# help simplify building. Uses Tag class
class HtmlBuilder:
  __root = HtmlElement()
  def __init__(self, root_name):
    self.root_name = root_name
    self.__root_name = root_name

  def add_child(self, childName, childText):
    self.__root.elements.append(
      HtmlElement(childName, childText)
    )
  
  def add_child_fluent(self, childName, childText):
    self.__root.elements.append(
      HtmlElement(childName, childText)
    )
    return self

  def __str__():
    return str(self.__root)

  def clear(self) # remove all the children
    self.root = HtmlElement(name=self.root_name)

# USAGE
builder = HtmlEBuilder('ul')
# or
builder = HtmlElement.create('ul')

builder.add_child('li', 'hello')
builder.add_child('li', 'world')
print(builder)

# fluent builder
builder.clear()
builder
  .add_child_fluent('li', 'foo')
  .add_child_fluent('li', 'bar')
  .add_child_fluent('li', 'baz')
print(builder)
```

## Interaction between builders
To build complicated objects which require more than one builder

```py
class Person:
  def __init__(self):
    # address
    self.streetAddress = None
    self.postcode = None
    self.city = None

    # employment info
    self.companyName = None
    self.position = None
    self.annualIncome = None

  def __str__(self) -> str:
    return f'Person lives at {self.streetAddress}, {self.city}, {self.postcode}\n'
      + f'and works at {self.companyName} as a {self.position} earning {self.annualIncome}'

class PersonBuilder:
  def __init__(self, person=None)
    if person is None:
      self.person = Person()
    else: self.person = person

  @property
  def lives(self):
    return PersonAddressBuilder(self.person)

  @property
  def works(self):
    return PersonJobBuilder(self.person)

  def build(self):
    return self.person


class PersonJobBuilder(PersonBuilder):
  def __init__(self, person):
    super().__init__(person)

  def at(self, company_name):
    self.person.company_name = company_name
    return self

  def as_a(self, position):
    self.person.position = position
    return self

  def earning(self, annual_income):
    self.person.annual_income = annual_income
    return self

class PersonAddressBuilder(PersonBuilder):
  def __init__(self, person):
    super().__init__(person)

  def at(self, street_address):
    self.person.street_address = street_address
    return self

  def with_postcode(self, postcode):
    self.person.postcode = postcode
    return self

  def in_city(self, city):
    self.person.city = city
    return self


pb = PersonBuilder()
person = pb\
          .lives\
            .at('123 London Road')\
            .in_city('London')\
            .with_postcode('SW12BC')
          .works\
            .at('Fabrikam')
            .as_a('Engineer')
            .earning(123000)
          .build()
print(person)
```

**NOTE :** This violates open close principle, as more builders are added we'll have to add it to the main builder.  
solution

```py
class Person:
  @staticmethod
  def new():
    return PersonBuilder()

  def __str__(self):
    return f'{self.name} works at {self.organization} as {self.position}'

class BasePersonBuilder:
  def __init__(self):
    self.person = Person()
  def build(self): return self.person

class PersonInfoBuilder(BasePersonBuilder):
  def named(self, name):
    self.person.name = name
    return self

class PersonJobBuilder(PersonInfoBuilder):
  def works_at(self, org):
    self.person.organization = org
    return self
  def as_a(self, pos):
    self.person.position = pos
    return self

class PersonBuilder(PersonJobBuilder):
  pass

me = Person.new()\
      .named('sujit')\
      .works_at('infosys')\
      .as_a('consultant')\
      .build()
print(me)
```

# Factory

Alternative to initializer, can provide better name, descriptive arguments. That's it.. noting special here.

```py
from enum import Enum
from math import *
class System(Enum):
  CARTESIAN = 1
  POLAR = 2

class Point():
  def __init__(self, a, b, system=System.CARTESIAN):
    if system == System.CARTESIAN:
      self.x = a
      self.y = b
    elif system == System.POLAR:
      self.x = a * cos(b)
      self.y = a * sin(b)
```

Here args are not descriptive and has lot more arguments than needed, imagine if we had more required arguments.. 💩

```py
# Solution
from math import *

class Point():
  def __init__(self, x, y):
    self.x = x
    self.y = y
  
  @staticmethod
  def create_cartesian_point(x, y):
    return Point(x, y)

  @staticmethod
  def create_polar_point(rho, theta):
    return Point(rho * cos(theta), rho * sin(theta))
```

When we have a lot of factories, it's better to export those to external class.

```py
from math import *

class Point():
  def __init__(self, x=0, y=0):
    self.x = x
    self.y = y

class PointFactory:
  @staticmethod
  def create_cartesian_point(x, y):
    return Point(x, y)

  @staticmethod
  def create_polar_point(rho, theta):
    return Point(rho * cos(theta), rho * sin(theta))
```

**IMP :** How is the user going go know there's a factory for points?  
He won't know.. we've to document it properly  
or  
We can just stick the factory class inside `Point`

## Abstract Factory

Abstract factory defines the interfaces, that's it. interfaces will be implemented in Concrete factory.  
Useful when object is so complex so we'd want to define different factories for different objects of same family.  
e.g. diff factories for Jaguar and Mercedes of Car family. where car will define interfaces and Jaguar and Mercedes will implement the methods.

```py
from abc import ABC, abstractmethod

class HotDrink(ABC):
  @abstractmethod
  def consume(self):
    pass

class Tea(HotDrink):
  def consume(self):
    print('This tea is nice')

class Coffee(HotDrink):
  def consume(self):
    print('This coffee is delicious')


class HotDrinkFactory(ABC):
  @abstractmethod
  def prepare(self, amount):
    pass

class TeaFactory(HotDrinkFactory):
  def prepare(self, amount=10):
    print(f'{amount}ml, tea prepared')
    return Tea()

class CoffeeFactory(HotDrinkFactory):
  def prepare(self, amount=10):
    print(f'{amount}ml, coffee prepared')
    return Coffee()

def make_drink(type):
  if type == 'tea':
    return TeaFactory().prepare()
  elif type == 'coffee':
    return CoffeeFactory().prepare()

tea = make_drink('tea')
tea.consume()
```

# Prototype

If we have a prototype object (template), we can just perform deep copy on prototype and change properties appropriately.

```py
class Address:
  def __init__(self, street, city, country):
    self.street = street
    self.city = city
    self.country = country

  def __str__(self):
    return f'{self.street}, {self.city}, {self.country}'

class Person:
  def __init__(self, name, address):
    self.name = name
    self.address = address

  def __str__(self):
    return f'{self.name} lives at {self.address}'

surjit = Person('Surjit', Address('sailashree vihar', 'Bhubaneswar', 'India'))


from copy import deepcopy
prachee = deepcopy(surjit)
prachee.name = 'Prachu'
prachee.address.street = 'phi robotics'
prachee.address.city = 'Thane'
```

**Note :** We can't just assign `surjit` to `prachee`, because objects holds reference, if we modify `prachee`, `surjit` will be modified as well.

But creating copy and changing values by hand is not good..

## Prototype Factory

```py
from copy import deepcopy

class Address:
  def __init__(self, street, city, country):
    self.street = street
    self.city = city
    self.country = country

  def __str__(self):
    return f'{self.street}, {self.city}, {self.country}'

class Employee:
  def __init__(self, name, id, address):
    self.name = name
    self.id = id
    self.address = address

  def __str__(self):
    return f'{self.name}, Emp ID {self.id} works at {self.address}'

# there are two ofc addresses
class EmployeeFactory:
  stp_employee = Employee("", 0, Address('STPI', 'Bhubaneswar', 'India'))
  sez_employee = Employee("", 0, Address('SEZ', 'Bhubaneswar', 'India'))

  @staticmethod
  def __new_employee(proto, name, id):
    result = deepcopy(proto)
    result.name = name
    result.id = id
    return result

  @staticmethod
  def new_stp_employee(name, id):
    return EmployeeFactory.__new_employee(
      EmployeeFactory.stp_employee, name, id)

  @staticmethod
  def new_sez_employee(name, id):
    return EmployeeFactory.__new_employee(
      EmployeeFactory.sez_employee, name, id)

surjit = EmployeeFactory.new_stp_employee('surjit', 22)
prachu = EmployeeFactory.new_sez_employee('prachu', 23)
```

# Singleton

```py
class Database:
  _instance = None
  def __init__(self): pass

  def __new__(cls, *args, **kwargs):
    if not cls._instance:
      cls._instance = super().__new__(cls, *args, **kwargs)

    return cls._instance

d1 = Database()
d2 = Database()
print(d1 is d2)
```

### decorator

```py
def singleton(class_):
  instances = {}

  def get_instance(*args, **kwargs):
    if class_ not in instances:
      instances[class_] = class_(*args, **kwargs)
    return instances[class_]

  return get_instance

@singleton
class Database:
  def __init__(self): pass

d1 = Database()
d2 = Database()
print(d1 is d2)
```

### metaclass

```py
class Singleton(type):
  _instances = {}

  def __call__(cls, *args, **kwargs):
    if cls not in cls._instances:
      cls._instances[cls] = super().__call__(*args, **kwargs)
    return cls._instances[cls]

class Database(metaclass=Singleton):
  def __init__(self): pass

d1 = Database()
d2 = Database()
print(d1 is d2)
```

### mono-state

```py
class Base:
  __template_data = {
    'name': 'surjit',
    'age', 24
  }

  def __init__(self):
    self.__dict__ = self.__template_data

# ====== OR ========

class Monostate:
  _shared_state = {}  # define shared data here

  def __new__(cls, *args, **kwargs):
    obj = super().__new__(cls, *args, **kwargs)
    obj.__dict__ = cls._shared_state
    return obj

class Base(Monostate):
  def __init__(self): pass
```

**NOTE :** Never hard code database connections or such things, it might mess with the live data when running unit tests. It must be always configurable.

```py
# metaclass example
class Database(metaclass=Singleton):
  def __init__(self, db=liveDB): pass
```

**<h1 align="center">Structural Patterns</h1>**

# Adapter
Adapter is a pice of code which is lets us use two incompatible apis together. like USB to Type-C adapter for example 😃

for repetitive conversion, we can use caching system.

```py
# API 1
class Point:
  def __init__(self, x, y): pass
  def draw(self): pass

# API 2
class Line:
  '''Takes coordinates of start and end'''
  def __init__(self, start, end): pass

# adapter to convert line to points
def lineToPointsAdapter(list):
  pass
```

# Bridge

Bridge is meant to decouple abstraction from it's implementation, so that both can vary independently.

```py
# circle can be rendered in vector or raster form
from abc import ABC
class Renderer(ABC):
  @abstractmethod
  def render_circle(self, radius): pass

class VectorRenderer(Renderer):
  def render_circle(self, radius):
    print(f'Drawing a circle of radius {radius} in VECTOR')

class RasterRenderer(Renderer):
  def render_circle(self, radius):
    print(f'Drawing pixels for circle of radius {radius}')

# How to connect renderer to shape?
# Ans: pass it as argument

class Shape:
  def __init__(self, renderer):
    self.renderer = renderer

  def draw(self): pass
  def resize(self, factor): pass

class Circle(Shape):
  def __init__(self, renderer, radius):
    super().__init__(renderer)
    self.radius = radius

  def draw(self):
    self.renderer.render_circle(self.radius) # call respective renderer

  def resize(self, factor):
    self.radius *= factor

vector = VectorRenderer()
circle = Circle(vector, 5)
circle.draw()
```

# Composit

Composite pattern is a partitioning design pattern and describes a group of objects that is treated the same way as a single instance of the same type of object. The intent of a composite is to “compose” objects into tree structures to represent part-whole hierarchies.

it can act like a single object or a group of objects

e.g. graphic object is a collection of graphic objects.

```py
class GraphicObject:
  def __init__(self, color=None):
    self.color = color
    self.children = []
    self._name = 'Group'

  @property
  def name(self):
    return self._name

  def _print(self, items, depth):
    items.append('*' * depth)
    if self.color:
      items.append(self.color)
    items.append(f'{self.name}\n')
    for child in self.children:
      child._print(items, depth + 1)
  
  def __str__(self):
    items = []
    self._print(items, 0)
    return ''.join(items)

class Circle(GraphicObject):
  @property
  def name(self): return 'Circle'

class Square(GraphicObject):
  @property
  def name(self): return 'Square'


# create drawing obj having square and circle as children
drawing = GraphicObject()
drawing.name = 'My Drawing'
drawing.children.append(Square('Red'))
drawing.children.append(Circle('Yellow'))

# drawing obj can also have group of objects as it's children
group = GraphicObject()
group.children.append(Circle('Blue'))
group.children.append(Circle('Green'))

drawing.children.append(group)
```