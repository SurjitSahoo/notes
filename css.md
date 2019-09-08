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
shape-outside: circle(radious at center)		// only works when the element is floated
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

[class^="text"] {
  all class names starting with "text"
}
[class$="text"] {
  all class names ending with "text"
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

#### Image

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

#### Gradient

```css
background-image: linear-gradient(30deg, red 50%, blue, green, yellow)
background-image: linear-gradient(to right bottom, red 50%, blue, green, yellow)
background-image: radial-gradient(circle at top, red, blue, green)
background-image: radial-gradient(circle at 20% 50%, red, blue, green)  //20% from left and 50% from right
background-image: radial-gradient(circle 20px at 20% 50%, red, blue, green)
background-image: radial-gradient(ellipse 20px 40px at 20% 50%, red, blue, green)
background-image: radial-gradient(ellipse fartheset-side at 20% 50%, red, blue, green)
background-image: radial-gradient(ellipse closest-side at 20% 50%, red, blue, green)
background-image: radial-gradient(ellipse closest-corner at 20% 50%, red, blue, green)
```

#### Filter

```css
filter: grayscale(40%)
				blur(5px)
				contrast(200%)
```

## Responsive Design

Hardware pixels vs Software pixels [mydevice.io](MyDevice.io)

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0,
                               user-scalable=yes" >
```

```css
@media(condition){
  selector {
    rules;
  }
}

@media(min-width: 40rem) and/or (min-height: 30rem)					// logical operators
(orientation: langscape)
```

## FlexBox

```css
.flex-container {
  display: flex														/* flexBox ->  applies default flex-direction: row, wrap: nowrap */
    			 inline-flex;										/* doesn't take full width, just like inline-block               */
  flex-direction: row											/* put the elements on row                                       */
    							row-reverse							/* put the elements on row in reverse order                      */
    							column									/* put the elements on column                                    */
    							column-reverse;					/* put the elements on column in reverse order                   */
  flex-wrap: nowrap												/* default -> display everything on row or column                */
    				 wrap													/* wrap if necessary -> shifts the elements down on row          */
    				 wrap-reverse;								/* wrap if necessary -> shifts the elements up on row            */
  flex-flow: row wrap;										/* Shorthand for direction and wrap                              */
  justify-content: flex-start							/* stick everything to the left           (main axis)            */
    							 flex-end								/* stick everything to the right					(main axis) 					 */
    							 center									/* place everything at center             (main axis)            */
    							 space-around						/* Distrubute empty space evenly around the elements (main axis) */
    							 space-between;					/* Distribute empty space between the elements  (main axis)      */
  align-items: center											/* Vertically align at the center         (cross axis)           */
    					 flex-start									/* Align at the top                       (cross axis)           */
    					 flex-end										/* Align at the bottom                    (cross axis)           */
    					 stretch										/* Stretch the height                     (cross axis)           */
    				   baseline;									/* align on basis of content base line    (cross axis)           */
}

.flex-items {
  order: 1/2/3...;												/* at what position should item be displayed                     */
  align-self: flex-start;									/* align single element   (cross axis)                           */
  flex-grow: 1/2/3....;										/* empty space is divided by shares and added to the elements    */
  flex-shrink: 1/2/3...;									/* allow element to shrink beyond it's size. by what share -> no */
  flex-basis: 100px / 10%;								/* initial length of item along main axis (%of container)        */
}
```















==#####################################################################################################################==
==##############################################== Advanced CSS ==##########################################################==
==#####################################################################################################################==



#### Important properties

```CSS
clip-path: polygon(coordinate, coordinate, ...);
background-image: image1, image2, image3...;
background-size: cover;
background-position: top;

font-family: sans-serif
font-weight: 400;
font-size: 16px;
line-height: 1.4;
letter-spacing: 10px;                       /* spacing between letters                                        */
```

## Animations

```css
.animated-class {
  animation-name: animationName;
  animation-duration: 5s;
  animation-iteration-count: 3;
  animation-delay: 3s;
  animation-timing-function: ease / ease-out / ease-in / ease-in-out
}

@keyframes animationName {
  0% {
  	opacity: 0;  
    transform: translateX(-100px);
  }
  
  80% {
    tranfsorm: translateX(10px);
  }
  
  100%{
    opacity: 1;
    transform: translate(0);
  }
}
```

@keyframe: Advanced, gives more control to the user
transition: prints the screen slowly, so it looks like printed

## pseudo class | pseudo element

```css
.btn:link,													/* use , to defin styling for multipl selector                             */	
.btn:visited {											/* :pseudo-class -> hover, etc                                             */
  text-transform: uppercase;
  text-decoration: none;
  color: white;
  display: inline-block;
  border-radius: 100px;
  transition: all .2s;						/* ANIMATION                                                                 */
}

.btn:hover {
  transform: translateY(-3px);	/* when hovered -> goes up by 3px                                              */
  box-shadow: 0 10px 20px rgba(0,0,0, .2);
}

.btn:active {
  transform: translateY(-1px); /* when clicked -> goes up by 1px                                               */
  box-shadow: 0 5px 10px rgba(0,0,0, .2s);
}


/*
* Here pseudo element is a semi transparent btn that's behind the main button and comes out and fades away when we hover. It comes back goes behind the main button when we move away from the button
*/

.btn::after {								/* ::pseudo-element -> same config as the main element                             */
  content: ""; 							/* necesary -> if skipped, element won't be there                                  */
  display: inline-block;
  height: 100%;
  width: 100%;
  border-radius: 100ps;
  position: absolute; 		/* reference should be main button .btn { position: relative; }                      */
  top: 0;
  left: 0;
  background-color: white;
  transition: all .2s;    /* animate the pseudo element                                                       */
}

.btn:hover::after {
  transform: scaleX(1.4) scaleY(1.6);
  opacity: 0;
}
```



## SASS

There are two syntax available `sass` and `scss`

```scss
// VARIABLE
$color: reg;																// variable declaration
nav {
  background-color: $color;
}

----------------------------------------------------------------------------------------------------------------
// NESTING
.parentClass {
  background-color: yellow;
  li {
    text-decoration:none;
    &:hover {																// &: pesudo-class
      background-color: green;
    }
  }
}

---------------------------------------------------------------------------------------------------------------
// MIXINS
@mixin myMixin {														// mixin is kinda a function, returns the values written inside it,
  // some style declarations								// it can take arguments as well.
}
.btn-main {
  @include myMixin;
}

@mixin mixin-with-arg($arg){
  color: $arg;
}
$myColor: red;
.btn-main {
  @include mixin-with-arg($myColor)
}

---------------------------------------------------------------------------------------------------------------
// FUNCTIONS
@function divide($a, $b) {
  @return $a / $b;
}
nav {
  margin: divide(60, 2) * 1px;									// function returns a number, so convert it into px
  background-color: darken($myColor, 10%);			// some inbuilt functions
  color: lighten($myColor, 10%);
}

---------------------------------------------------------------------------------------------------------------
// EXTEND
%btn-placeholder {															// think of it like Class
  display: inline-block;
  padding: 15rem;
  border-radius: 10rem;
  @include mixin-with-arg($myColor);
}

.btn-hot {
  @extend %btn-design;
  background-color: red;
}
.btn-not-so-hot {
  @extend %btn-design;
}
    |'''''|
    |     |
----      -----
\            /
  \        /
    \    /
      --
.btn-hot, btn-not-so-hot {									// extend doesn't copy the code to all the places, 
  display: inline-block;										// it takes the selectors and declares a combined selector
  padding: 15rem;														// and applies the styles.
  border-radius: 10rem;
  @include mixin-with-arg($myColor);
}
.btn-hot {
  background-color: red;
}

----------------------------------------------------------------------------------------------------------------
$margin: 2rem;
some-property: calc(2 * #{$margin});			// to use varible in css functions #{var}
```

> MIXIN : declare a mixin and @include somewhere -> copies the mixin code in @include
> EXTEND : declare a placeholder and @extend at multiple selectors -> will create combined selector (won’t copy the code in both places)

#### MultiFile sass

* file structure -> `components/_button.scss`
* import file on another file -> `@import “components/button”`



## Responsive Design

**Media Queries**
0             -    600px       phone
600px     -    900px       tab-port
900px     -    1200px      tab-land
[1200px-1800px]     default design
1800px+             big-desktop

1rem = 1em = 16px (default)
html font-size = 62.5%		1rem = 10px, 10/16=62.5%
now write everything in rem units, so for media queries just change the font size, it’ll affect the whole page.

```scss
@mixin respond($device) {
  @if ($device == phone) {
    @media(max-width: 37.5em) { @content };			// 600px
  }
  @if ($device == tab-port) {
    @media(max-width: 56.25em) { @content };		// 900px
  }
  @if ($device == tab-land) {
    @media(max-width: 75em) { @content };				// 1200px
  }
  @if ($device == big-desktop) {
    @media(min-width: 112.5em) { @content };		// 1800px
  }
}


.selector {
  property: value;
  @include respond(phone){
    property: modified_value;
  }
}
```

**Responsive Images**
HTML images
-- density switching `<img srcset=“img_1x.png 1x, img_2x.png 2x”/>` here first image will be used for lower resolution screen and 2nd image for higher resolution screen

-- Art direction
. different image for different screen size.
. Here if the screen width <= 37.5em, the source image will be applied. where there are two images, which will be decided based on the screen resolution.
. if the media query is unmet, the default <img> will be applied

```html
<picture class="img_class">
  <source srcset="img_sml_1x.png 1x, img_sml_2x.png 2x" media="(max-width: 37.5em)"/>
  <img srcset="img_1x.png 1x, img_2x.png 2x" />
</picture>
```

-- Resolution Switching
. different image for different resolution screen.
. pre-define width of the image in `srcset` => browser know which one to download

```html
<img srcset="img.jpg 300w, img-large.jpg 1000w"
     sizes="(max-width: 900px) 20vw, (max-widht: 600px) 30vw, 300px"
     class="img_class"
     src="img.jpg">
```

srcset: img.jpg -> 300px wide, img-large.jpg -> 1000px wide
sizes: at 900px img takes 20% of view width, 300px at default size (fallback)
src: if the browser doesn’t support srcset, sizes

```scss
.selector {
  background-image: url("img-small.jpg");
  
  @media(min-resolution: 192dpi) and (min-width: 600px) {					// macbook pro ratina display dpi
    background-image: url("img-large.jpg");
  }
}
```









## Grid

```css
.grid-container {
  display: grid;
  grid-template-columns: 100px 2fr 20% 3fr;	/* defined 4 columns 100px, 2/5(100%-20% - 100px) and so on      */
  grid-template-rows: 
}

.grid-element {								              /* define how many blocks element will take                      */
  grid-column-start: 3;
  grid-column-end: 5;
  grid-row-start: line-no;
  grid-row-end: line-no;
}
```

- If we’ve defined 4 columns then the remaining elements will be positioned below the first row.