# Problem with global scope
if we declare variable directly in global scope, anyone can accidentally modify it.
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
  }
}
```
but still the name `myObj` is not unique, some other code can have the same name. To avoid the conflict, we can use namespace concept.
```js
var data = data || {};
data.userData = data.userData || {};
data.userData.impData = data.userData.impData || {};

data.userData.impData.myObj = {
  data: 'some data',
  changer: function(newData) {
    this.data = newData;
  }
}