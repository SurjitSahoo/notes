# CSS

## Box Model

Default is `box-sizing: content-box` 

![Image result for css box model](https://www.washington.edu/accesscomputing/webd2/student/unit3/images/boxmodel.gif)

```css
height: 50px;
width: 50px;
```

* it will set the height and width of the **content box** 
* padding and border will overflow

To fix it use `box-sizing: border-box` . It will set the height and width of the border box. so that the design doesn’t overflow.

#### Important Properties

```css
color: red;																	// content color
background-color: black;										// content background color
display: block/inline/inline-block/none			// display type
padding: 10px																// padding
border: 2px solid/dashed black							// size type color
margin: 20px 40px														// top/bottom 20px  left right 40px
margin: 10px 20px 30px 40px									// top 10, right 20, bottom 30, left 40 (clockwise)
height: 50px;
width: 50px;
verticle-align: centre											// Align vertically
```

## Selector

Type | Syntax
------|-------
element | h1 { property: value } 
class | .classname { property: value } 
universal | * { property: value } 
id | #idname { property: value } 
attribute | [disabled] { property: value } 
:not(selector) | apply style where selector is not selector 

#### Attribute Selector

```css
button[disabled] {
  //if button is disabled
}
div[class*="text"] {     											//[name="someName"], [name*="name"] any attribute
  // if div class name contains "text"
  // class="first_text"
  // class="text_first"
  // class="text"
}
```

#### :not( selector )

```css
:not(p) { color: orange; }									// apply where element is not p
```

#### nth-child()

Apply style to nth child of whatever the parent is ( basically for siblings )

```css
p:nth-child(2) {
  // apply to every p element that is second child of it's parent
}

p:nth-child(odd) {
  // apply style to 1st, 3rd, 5th.. p elements that have common parent
}

p:nth-child(even) {
  // apply style to 2nd, 4th, 6th.. p elements that have common parent
}
```

**Combining Selectors**

```html
<style>
  a:active,
  a:hover {
    color: yellow;						// active and hover pseudo classes will have same style
  }
  
  .ex1 {
    color: yellow;
    background: black;
  }
  a.ex1 {										// Override ex1 class in anchor tags.
    color: orange;
  }
</style>

<body>
  <a class="ex1" href="#">overwritten</a>					// get ex1 class, but override color
  <p class="ex1"> class applied </p>							//get ex1 class
</body>



```



#### Specificity

* inline style > ID > class / pseudo-class / attribute > element / pseudo element
* Directly applied styles win over inheritance

### Inheritance

child elements get the styles of parent elements

```html
<style>
  div {
    color: red;
  }
  p {
    color: green;
  }
  #someId {
    color: inherit;								// Inherit parent style
  }
</style>

<div>
  <div>
    <h1>Inherited</h1>
  </div>
  <p>Overwritten</p>  //because <p> is directly targetted in css
  <article><p>Overwritten</p></article>
</div>
```

#### Combinators

Combinator | Description | Example
----------|-------------|--------------
h2 + p | Adjacent Sibling.<br />h2 k direct bad p | ` <div>`<br />    `<h2>Not Applied</h2>`<br />    <p> **==APPLIED==** </p><br />    `<h2>Not Applied</h2>`<br />    `<h3>Not Applied</h3>`<br />    `<p>Not Applied</p>`<br />    `<h2>Not Applied</h2>`<br />    <p> **==APPLIED==** </p><br />`</div>` 
h2 ~ p | General Sibling<br />h2 k bad on same level, chahe kahi v ho | `<div>`<br />    `<h2>Not Applied</h2>`<br />    <p> **==APPLIED==** </p><br />    `<h2>Not Applied</h2>`<br />    `<h3>Not Applied</h3>`<br />    <p> **==APPLIED==** </p><br />`</div>` 
div > p | Child<br />direct child, not nested | `<div>`<br />    `<div>Not Applied</div>`<br />    <p> **==APPLIED==** </p><br />    `<div>Not Applied</div>`<br />    `<article>`<br />          `<p>Not Applied</p>`<br />    `</article>`<br />    <p> **==APPLIED==** </p><br />`</div>` 
div p | Descendant<br />Any child | `<div>`<br/>     `<div>Not applied</div>`<br/>     <p> **==APPLIED==** </p><br/>     `<div>Not applied</div>`<br/>     `<article>`<br/>            <p> **==APPLIED==** </p><br/>     `</article>`<br/>     <p> **==APPLIED==** </p><br/> `</div>` 



## Positioning 

top, right, bottom, left properties won’t work unless `position` property is set first.

Position | Behaviour 
------------|-----------
static | default 
fixed | out of the document flow<br />top, right, bottom, left are relative to the view-port<br />as it’s related to view-port, it stays at the same position if we scroll the page 
absolute | Out of the document flow<br />if it’s parent have position property defined, height & width are relative to parent<br />it parent doesn’t have position property, position if relative to document body 
relative | In the document flow<br />position is relative to itself 
sticky | In the document flow<br />position is relative to view-port<br />if we apply `top: 0px;` the element will stick at the top(view-port) when we scroll<br />It only sticks till it’s parent is visible in the view-port, once we scroll it’s parent out of the view port, the element disappears. 



## Background

```css
background-color: red;																				// set solid/gradient background
background-image: url("image.jpg");														// set the background image

background-size: widhth height;																// set width and height in px
background-size: 100%;																				// takes full width and crops height to adjust
background-size: cover;																				// crops image in a way it covers properly
background-size: contain;																			// displays whole image
background-size: 100px;																				// one value referes to the widht, it'll repeat

background-repeat: no-repeat / repeat-x / repeat-y						// set repeat

background-position: 10px 20px;																// 10px from left and 20px from top of the container
background-position: 10% 20%;																	// it only works if the image has remaining area
background-position: center;																	// same as 50% 50%
background-position: left top;																// same as 0% 0%

background-origin: border-box / content-box / padding-box			// similar to 'box-sizing
```

`background-position: 10% 20%`

- If the image’s height is 100% then width will be cropped to fit the image in the container. 
  * cropping 10%(of area to be cropped) from left will make the image crop 90%(of area to be cropped) from the right.
  * as only 10% is cropped from the left so the image will move to the right.
- if the image’s width is 100% then the height will be cropped to fit the image in the container.
  - cropping 20%(of the area to be cropped) from the top and 90% from the bottom.
  - it’ll make the image move down as only 10% is being cropped from the top.

## Image

```html
<style>
  .someClass {
    height: 20px;
    width: 30px;
    display: inline-block;
  }
  .someClass img {
    height: 100%;
    width: 100%
  }
</style>

<!--
here <a> is in inline element. So if we apply height/width as 100% to the clild <img> then Image will take it's original size(100%), not it's parent's.

So to use height/width with respect to it's parent change the parent element <a> to a block or inline-block element.
-->

<a href="#" class="someClass">
	<img src="image.jpg" alt="logo" />
</a>
```

==either change parent to inline block and use percentage for image width and height or use absolute pixel values.==

