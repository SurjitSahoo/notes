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
h2 + p | Adjacent Sibling.<br />h2 k direct bad p | ![1564387310247](/home/ad.msystechnologies.com/ssahoo/.config/Typora/typora-user-images/1564387310247.png) 
h2 ~ p | General Sibling<br />h2 k bad on same level, chahe kahi v ho | ![1564387493428](/home/ad.msystechnologies.com/ssahoo/.config/Typora/typora-user-images/1564387493428.png) 
div > p | Child<br />direct child, not nested | ![1564387562604](/home/ad.msystechnologies.com/ssahoo/.config/Typora/typora-user-images/1564387562604.png) 
div p | Descendant<br />Any child | ![1564387626986](/home/ad.msystechnologies.com/ssahoo/.config/Typora/typora-user-images/1564387626986.png) 



## Positioning 

Position | Behaviour 
------------|-----------
static | default 
fixed | out of the document flow<br />height and width are relative to the view-port 
absolute | Out of the document flow<br />if it’s parent have position property defined, height & width are relative to parent<br />it parent doesn’t have position property, height & width are relative to document body 
relative | In the document flow<br />height and width relative to itself 

