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

**Given by uncle Bob Martin**

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

e.g. Neurons, we can create layers of neurons, we can connect neuron-neuron, neuron-layer, layer-layer etc.

```py
from abc import ABC
from collections.abc import Iterable

class Connectable(Iterable, ABC):
  def connect_to(self, other):
    if self == other: return
    for s in self:
      for o in other:           # self ---> other
        s.outputs.append(o)     # other.inputs = self(list)
        o.inputs.append(s)      # self.outputs = other(list)

class Neuron(Connectable):
  def __init__(self, name):
    self.name = name
    self.inputs = []
    self.outputs = []

  def __str__(self):
    return f'{name}, {len(self.inputs)} inputs, {len(self.outputs)} outputs'

  def __iter__(self): # To make it iterable
    yield self

  # we don't want to define connect method here,
  # then we've to define it in layer class as well

class NeuronLayer(list, Connectable): # layer is basically a list of neurons
  def __init__(self, name, count):
    super().__init__()
    self.name = name
    for x in range(0, count):
      self.append(Neuron(f'{name}-{x}')) #create list of neurons

  def __str__(self):
    return f'Layer {self.name} with {len(self)} neurons'

if __name__ == '__main__':
  n1 = Neuron('n1')
  n2 = Neuron('n2')
  l1 = NeuronLayer('l1')
  l2 = NeuronLayer('l2')

  n1.connect_to(n2)
  n1.connect_to(l1)
  l1.connect_to(n2)
  l1.connect_to(l2)
```

# Decorator

**Need :** When we need to modify certain code and don't wanna violate `open-close` principle. modify functionality without altering the actual code.

Takes a function as arg and returns modified version of arg

## functional decorator of python

```py
import time

def time_it(fun):
  def wrapper(): # modified function
    start = time.time()
    result = func()
    end = time.time()
    print(f'{func.__name__} took {int((end-start)*100)}ms')
    return result
  return wrapper # return modified function

@time_it
def some_operation():
  print('start op')
  time.sleep(1)
  print('done')
  return 123
```

## Classic Decorator / oop decorator

```py
from abc import ABC

class Shape(ABC):
  def __str__(self): pass

class Circle(Shape):
  def __init__(self, radius=0):
    self.radius = radius

  def resize(self, factor):
    self.radius *= factor

  def __str__(self):
    return f'Circle of radius {self.radius}'

class ColoredShape(Shape):
  def __init__(self, shape, color):
    if isinstance(shape, ColoredShape):
      raise Exception('Cannot apply ColoredDecorator twice')
    self.shape = shape
    self.color = color

  def __str__(self):
    return f'{self.color} colored {self.shape}'

if __name__ = '__main__':
  circle = Circle(5)
  red_circle = ColoredShape(circle, red)
```

# Facade

A facade is an object that serves as a front-facing interface masking more complex underlying or structural code.

e.g. designing a terminal
```py
class Buffer:
  def __init__(self, width=30, height=20):
    self.width = width
    self.height = height
    self.buffer = [' '] * (width*height)

  def __get_item__(self, item):
    return self.buffer.__get_item__(item)

  def write(self, text):
    self.buffer += text

class Viewport:
  def __init__(self, buffer=Buffer()):
    self.buffer = buffer
    self.offset = 0

  def get_char_at(self, index):
    return self.buffer[self.offset+index]

  def append(self, text):
    self.buffer += text

class Console:
  def __init__(self):
    b = Buffer()
    self.current_viewport = Viewport(b)
    self.buffers = [b]
    self.viewports = [self.current_viewport]

  # high-level api (hiding the complex code behind)
  def write(self, text):
    self.current_viewport.buffer.write(text)

if __name__ == '__main__':
  c = Console()
  c.write('hello')
```

# Flyweight

Space optimization technique. Avoid redundancy when storing data. e.g. plenty of users with identical first-name or last-name.

**Idea :** have list of data and just point to the data when needed

```py
# e.g. 1
class User:
  strings = []

  def __init__(self, full_name):
    def get_or_add(s):
      if s in self.strings:
        return self.strings.index(s)
      else:
        self.strings.append(s)
        return len(self.strings)-1
    self.names = [get_or_add(x) for x in full_name.split(' ')]

  def __str__(self):
    return ' '.join([self.strings[x] for x in self.names])

# e.g. 2
class FormattedText:
  def __init__(self, plain_text):
    self.plain_text = plain_text
    self.formatting = []

  class TextRange:
    def __init__(self, start, end, capitalize=False, bold=False, italic=False):
      self.end = end
      self.bold = bold
      self.capitalize = capitalize
      self.italic = italic
      self.start = start

    def covers(self, position):
      return self.start <= position <= self.end

  def get_range(self, start, end):
    range = self.TextRange(start, end)
    self.formatting.append(range)
    return range

  def __str__(self):
    result = []
    for i in range(len(self.plain_text)):
      c = self.plain_text[i]
      for r in self.formatting:
        if r.covers(i) and r.capitalize:
          c = c.upper()
      result.append(c)
    return ''.join(result)
```

# Proxy

A proxy, in its most general form, is a class functioning as an interface to something else.

## Protection Proxy

```py
class Car:
  def __init__(self, driver):
    self.driver = driver
  
  def drive(self):
    print(f'Car is being driven by {self.driver.name}')

class Driver:
  def __init__(self, name, age):
    self.name = name
    self.age = age

# Suppose we don't want to allow drivers younger than 25yrs old
# we can't modify the above drive method, because it violates open-close principle

class CarProxy:
  def __init__(self, driver):
    self.driver = driver
    self.car = Car(driver)

  def drive(self):
    if self.driver.age >= 25:
      self.car.drive()
    else: print('Driver too young')
```

## Virtual Proxy

It can look like underlying object but can be entirely different object having additional functionalities.

```py
# even if we don't draw, it still loads the image every time
class Bitmap:
  def __init__(self, filename):
    self.filename = filename
    print(f'Loading image from {filename}')

  def draw(self):
    print(f'Drawing image {self.filename}')

# doesn't load the image until we draw for the first time.
# it is using original class internally overriding the original object entirely
class LazyBitmap:
  def __init__(self, filename):
  self.filename = filename
  self.bitmap = None

  def draw(self):
    if not self.bitmap:
      self.bitmap = Bitmap(self.filename)
    self.bitmap.draw()

def draw_image(image):
  print('About to draw image')
  image.draw()
  print('Done drawing image')

if __name__ == '__main__':
  bmp = LazyBitmap('facepalm.jpg')  # Bitmap
  draw_image(bmp)
```

## Proxy vs Decorator

Proxy provides identical interface

Decorator provides enhanced interface

<h1 align="center">Behavioral Design Patterns</h1>

# Chain of Responsibility

A chain of functions / methods should be able to solve a particular problem between themselves, one function can either solve the problem or pass it to the next one.

for example, you have three payment methods(A, B and C) setup in your account; each having a different amount in it. A has $100, B has $300 and C has $1000 and the preference for payment is chosen as A then B then C. If you purchase something worth $150, first account A will be checked then B will be checked and because B has enough money to make the transaction, chain will break.

```py
from abc import ABC, abstractmethod

class Account(ABC):
  @abstractmethod
  def __init__(self, balance):
    self._successor = None
    self.balance = balance

  def setNext(self, account):
    self._successor = account

  def canPay(self, amount):
    return self.balance >= amount

  def pay(self, amount_to_pay):
    if self.canPay(amount_to_pay):
      print(f'Paid {amount_to_pay} using {self.__class__.__name__}')
    elif self._successor:
      print(f'Cannot pay using {self.__class__.__name__}. Proceeding...')
      self._successor.pay(amount_to_pay)
    else:
      print("You don't have enough account balance")


class Bank(Account):
  def __init__(self, balance):
    super().__init__(balance)

class Wallet(Account):
  def __init__(self, balance):
    super().__init__(balance)

class Bitcoin(Account):
  def __init__(self, balance):
    super().__init__(balance)

bank = Bank(100)
wallet = Wallet(200)
bitcoin = Bitcoin(500)

bank.setNext(wallet)
wallet.setNext(bitcoin)

bank.pay(210)

# Output
# -------------
# Cannot pay using Bank. Proceeding...
# Cannot pay using Wallet. Proceeding...
# Paid 210 using Bitcoin
```

# Command

Used to decouple client from receiver.

e.g. You(Client) ask the waiter(invoker) to bring the food(command) and waiter simply forwards the request to the Chef(receiver) who has the knowledge of what and how to cook.

```py
from abc import ABC, abstractmethod
# Receiver
class Bulb:
  def turnOn(self):
    print('Let there be light!')
  def turnOff(self):
    print('Andhera Kayam rahe!')

# command interface
class Command(ABC):
  @abstractmethod
  def execute(self): pass
  @abstractmethod
  def undo(self): pass
  @abstractmethod
  def redo(self): pass

class TurnOn(Command):
  def __init__(self, bulb):
    self.bulb = bulb

  def execute(self):
    self.bulb.turnOn()

  def undo(self):
    self.bulb.turnOf()

  def redo(self):
    self.execute()

# Invoker
class RemoteControl:
  def submit(self, command): command.execute()

bulb = Bulb()
turnOn = TurnOn(bulb)
remote = RemoteControl()
remote.submit(turnOn)

```

# Iterator

Represents a way to access the elements of an object without exposing the underlying presentation.

e.g. Radio or MP3 player where we can go to the next or previous channel by pressing a button.

```py
class RadioStation:
  def __init__(self, freq):
    self._frequency = freq
  
  @property
  def frequency(self): return self._frequency
  @frequency.setter
  def frequency(self, freq): self._frequency = freq


# iterator
class StationList:
  def __init__(self):
    self.stations = []
    self.counter = 0

  def addStation(self, station):
    self.stations.append(station)

  def removeStation(self, station):
    self.stations.remove(station)

  def count(self): return len(self.stations)
  def current(self): return self.stations[self.counter]
  def key(self): return self.counter
  def next(self): self.counter += 1
  def prev(self): self.counter -= 1
  def rewind(self): self.counter = 0
```

# Mediator

It adds a third party object to control the interaction between two objects(colleagues). It helps reduce the coupling between classes because now they don't need to know each other's implementation

e.g. If two people are talking to each other in phone, the network provider is the mediator

```py
# Mediator
class ChatRoom:
  def show_message(self, user, msg):
    print(f'{user.name}: {msg}')

class User:
  def __init__(self, name, mediator):
    self.name = name
    self.mediator = mediator
  
  def send(self, msg):
    self.mediator.show_message(self, msg)

chat_room = ChatRoom()
surjit = User('surjit', chat_room)
prachee = User('prachee', chat_room)

surjit.send('Hi prachu')
prachee.send('Hey')
```

# Memento

To store the current state of an object so that it can be restored later on. (undo)

e.g. calculator stores the last result in memory so that you can get back to it using some button(i.e. caretaker)

```py
# Text editor undo
class EditorMemento:
  def __init__(self, content):
    self.content = content

class Editor:
  def __init__(self): self.content = ''
  def type(self, words): self.content = self.content + ' ' + words
  def save(self): return EditorMemento(self.content)
  def restore(self, memento): self.content = memento.content

editor = Editor()
editor.type('sentese one')
editor.type('sentese two')

saved = editor.save()
editor.type('sentese three')

editor.content # sentese one sentese two sentese three

editor.restore(saved)
editor.content # sentese one sentese two
```

# Observer

Defines a dependency between objects so that whenever an object changes its state, all its dependents are notified.

e.g. job seeker subscribes to some job posting site and they're notified whenever there's a matching job opportunity.

```py
class JobPost:
  def __init__(self, title): self.title = title

# Observer
class JobSeeker:
  def __init__(self, name): self.name = name
  def on_job_posted(self, job):
    print(f'Hi {self.name}! New job posted: {job.title}')

class JobSite:
  def __init__(self): self.job_seekers = []
  
  def notify(self, job_posting):
    for job_seeker in self.job_seekers:
      job_seeker.on_job_posted(job_posting)

  def add_job_seeker(self, job_seeker):
    self.job_seekers.append(job_seeker)

  def add_job(self, job_posting):
    self.notify(job_posting)


surjit = JobSeeker('Surjit Sahoo')
prachee = JobSeeker('Prachee Patil')

naukri = JobSite()
naukri.add_job_seeker(surjit)
naukri.add_job_seeker(prachee)
naukri.add_job('Web Developer')

# Output
# Hi Prachee Patil! New job posted: Web Developer
# Hi Surjit Sahoo! New job posted: Web Developer
```

# Visitor

Allows to add further operations to objects without having to modify them.

e.g. Consider someone visiting a zoo, they just need a way(i.e. ticket) to enter the zoo. After that they can visit any place they want inside the zoo without having to ask for any additional permission.

```py
from abc import ABC, abstractmethod

# To be visited
class Animal(ABC):
  def accept(self, operation): pass

# Visitor
class AnimalOperation(ABC):
  @abstractmethod
  def visit_monkey(self, monkey): pass
  @abstractmethod
  def visit_lion(self, lion): pass
  @abstractmethod
  def visit_dolphin(self, lion): pass

class Monkey(Animal):
  def accept(self, operation):
    operation.visit_monkey(self)

class Lion(Animal):
  def accept(self, operation):
    operation.visit_lion(self)

class Dolphin(Animal):
  def accept(self, operation):
    operation.visit_dolphin(self)

# Implementing Visitor
class Speak(AnimalOperation):
  def visit_monkey(self, monkey): print('Tuut tuttu tuutt!'))
  def visit_lion(self, lion): print('Roaaar!')
  def visit_dolphin(self, dolphin): print('Ooo oo aa aa!')


monkey = Monkey()
lion = Lion()
dolphin = Dolphin()

speak = Speak()

monkey.accept(speak)   # Ooo oo aa aa!
lion.accept(speak)     # Roaaar!
dolphin.accept(speak)  # Tuut tuttu tuutt!
```

We could have done this by having inheritance hierarchy for the animals but then we world have to modify the animals whenever we'd have to add new actions to the animals. But now we don't have to change them. Let's add jump behavior.

```py
class Jump(AnimalOperation):
  def visit_monkey(self, monkey): print('Jumped 20 feet high! on to the tree!')
  def visit_lion(self, lion): print('Jumped 7 feet! Back on the ground!')
  def visit_dolphin(self, dolphin): print('Walked on water a little and disappeared')


jump = Jump()

monkey.accept(jump)   # Jumped 20 feet high! on to the tree!
lion.accept(jump)     # Jumped 7 feet! Back on the ground!
dolphin.accept(jump)  # Walked on water a little and disappeared
```

# Strategy

Allows to switch algorithm or strategy based upon the situation

e.g. bubble sort is faster for small data set but slow for large data set and quick sort is faster for larger data set and slow for small data set. With strategy pattern we can switch algorithm based on requirement.

```py
from abc import ABC, abstractmethod

class SortStrategy(ABC):
  @abstractmethod
  def sort(self, dataset): pass

class BubbleSort(SortStrategy):
  def sort(self, dataset):
    print('Sorting using buble sort')
    return dataset

class QuickSort(SortStrategy):
  def sort(self, dataset):
    print('Sorting using quick sort')
    return dataset

class Sorter:
  def __init__(self, sorter):
    self.sorter = sorter

  def sort(self, dataset):
    return self.sorter(dataset)

dataset = [ 'array' ]
sorter = Sorter(BubbleSort())
sorter.sort(dataset)
```

# State

Change the behavior of a class when the state changes.

e.g. In drawing application, the pain brush changes it's behavior based on it's selected color(state).  
In text editor, it types in bold if bold is selected.

```py
from abc import ABC, abstractmethod

class WritingState(ABC):
  @abstractmethod
  def write(self, words): pass

class UpperCase(WritingState):
  def write(self, words): print(words.upper())

class LowerCase(WritingState):
  def write(self, words): print(words.lower())

class DefaultText(WritingState):
  def write(self, words): print(words)

class TextEditor:
  def __init__(self, state): self.state = state
  def write(self, words):
    self.state.write(words)


editor = TextEditor(DefaultText())
editor.write('First Line')

editor.state = UpperCase()
editor.write('Second Line')

editor.state = LowerCase()
editor.write('Third Line')

# Output
# First Line
# SECOND LINE
# third line
```

# Template Method

Defines a skeleton of how a certain algorithm could be performed, but might defer in the implementation of those steps to the children classes

e.g. To build a house we need following steps  
1. Prepare the base
2. Build the walls
3. Add roof
4. Add other floors

The order of these steps could never be changed, but the steps can be alterd like floors can me made up of marble or cement.

```py

```