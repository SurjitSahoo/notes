# Vectors

**Physics**   
A straight line pointing at a direction in space, has a specific length and direction.  
Vector remains the same if you move it around in space as long as length and direction is unchanged  
Vector can be writtern as$\begin{bmatrix}a \\ b\end{bmatrix}$  where a = x-coordinate and b = y-coordinate => (a, b)

**Computer Science**  
It represents some properties a specific product. generally used in analytics.  
e.g. $\begin{bmatrix}a \\ b\end{bmatrix}$ where a might represent price of a house and b size of the house in sq ft.  
Here order is important.

**Mathematics**  
Anything can be a vector as long as it obeys the laws of vector multiplication and addition.  
$\hat{i}$ : unit vector in x-axis  
$\hat{j}$ : unit vector in y-axis  
$\hat{k}$ : unit vector in z-axis  

* $\begin{bmatrix}a \\ b\end{bmatrix}$ = $a\hat{i}+b\hat{j}$
&nbsp;&nbsp;&nbsp;&nbsp;
and
&nbsp;&nbsp;&nbsp;&nbsp;
$\begin{bmatrix}a \\ b \\ c\end{bmatrix}$ = $a\hat{i}+b\hat{j}+c\hat{k}$ 


* $\overrightarrow{A}+\overrightarrow{B}=\overrightarrow{C}$ ==> means if you walk along  $\overrightarrow{A}$ and then along $\overrightarrow{B}$, it’ll be same as walking along $\overrightarrow{C}$ ![](https://mathinsight.org/media/image/image/vector_a_plus_b.png){ width=100px }

  $\begin{bmatrix}a \\ b\end{bmatrix} + \begin{bmatrix}c \\ d\end{bmatrix}=\begin{bmatrix}a+c \\ b+d\end{bmatrix}$  


* $2\times\begin{bmatrix}a \\ b\end{bmatrix}=\begin{bmatrix}2a \\ 2b\end{bmatrix}=2\times(a\hat{i}+b\hat{j})$ ==> It means 2 is scaling the vector, so it’s called a scaler.



## Basis Vector

Every vector is composed by scaling and adding unit vectors. E.g. following two dimensional vector  

$\overrightarrow{A}=3\hat{i}-2\hat{j}=\begin{bmatrix}3 \\ -2\end{bmatrix}$  

-- Assuming $\hat{i}$ and $\hat{j}$ are 1 unit along x-axis and y axis respectively, if you walk 3 units along +ve x axis then 2 units along -ve y-axis, it's same as walking from (0,0) to (3, -2)  
-- $\hat{i}$ and $\hat{j}$ are scaled and added to form $\overrightarrow{A}$

here $\hat{i}$ and $\hat{j}$ are the basis vectors (unit vectors)

**span of basis vectors**   
If you create every possible vector by scaling and adding the unit vectors how much space you can cover ?  
This area is the span of those vectors

2D:  
In 2D there are two basis vectors $\hat{i}$ and $\hat{j}$ by scaling and adding these two vectors if you create every possible vector, you’ll be able to cover entire 2D plane.  
So span of two vectors is a plane.  
-- If both vectors lie on top of each other, scaling and adding them will create vector which will also lie on top of them, so span will become a line (both vectors are linearly dependent)  
-- if both the vectors are zero, then you’re stuck at origin. Span is zero.

$a\overrightarrow{v}+b\overrightarrow{w}$ here by changing $a$ & $b$ (scalers) you can reach every point on a plane. this is called **Linear combination** of $\overrightarrow{v}$ and $\overrightarrow{w}$

3D:  
If you imagine span of two independent vectors as a plane, adding a 3rd vector will move the plane back and forth along it’s direction, so the span is entire 3D space.  
-- 3rd vector shouldn’t be lying on the span of other two vectors, other wise it won’t affect the span at all, it’ll be redundant. (3rd vector is linearly dependent on other two)

$a\overrightarrow{u}+b\overrightarrow{v}+c\overrightarrow{w}$ here by changing $a$, $b$ and $c$ you can grasp all the points in 3D space.

> Technical Definition: The basis of a vector space (2D or 3D) is a set of **linearly independent** vectors that **span** the full space (2D or 3D)



# Linear Transformation

> Transformation is basically a function that takes a vector and spits out another vector  
> Linear Transformation : origin must not change and straight line should output straight line not a curve.

-- As we know every vector is composed by scaling and adding the basis vectors.  
-- So in order to transform (keeping the origin constant) just scale(-ve or +ve) and change the   direction(angle) of basis vectors.  
-- By doing that we get entire new basis vectors.

$\overrightarrow{A}=3\hat{i}+4\hat{j}$

$\overrightarrow{A}$ is a vector of specific length pointing in a direction, It basically means walk 3 units along +ve x-axis then walk 4 units along +ve y-axis.  
What if we change the length and direction of $\hat{i}$ and $\hat{j}$ ? The resulting vector will also change. This is what we call transformation.  
If we want to transform $\overrightarrow{A}$, the idea is to decide where you want the basis vectors to land after transformation and replace the new $\hat{i}$ and $\hat{j}$ in the above equation.

suppose originally $\hat{i}$ and $\hat{j}$ (basis vectors) were at (1,0) and (0, 1) respectively, now after transformation new coordinated of these two are (1, 2) and (-3, 4)  
now replacing the new value of basis vectors in the above equation, we get

$3\times\begin{bmatrix}1 \\ 2\end{bmatrix}+4\times\begin{bmatrix}-3 \\ 4\end{bmatrix} =>\begin{bmatrix}1&-3\\2&4\end{bmatrix}\times\begin{bmatrix}3 \\ 4\end{bmatrix}=>\begin{bmatrix}1(3)+(-3)(4) \\ 2(3)+4(4)\end{bmatrix}=>\begin{bmatrix}-9 \\ 22\end{bmatrix}=-9\hat{i}+22\hat{j}$ 

Here the 2 x 2 matrix $\begin{bmatrix}1&-3\\2&4\end{bmatrix}$ describes a transformation on the vector $\overrightarrow{A}$  
$\hat{i}$ coordinates on 1st column, $\hat{j}$ coordinates on 2nd column

> $$F_{Transform}(\overrightarrow{A})=\overrightarrow{B}=\begin{bmatrix}a & c \\b & d \end{bmatrix}\times\begin{bmatrix}A\hat{i} \\ A\hat{j}\end{bmatrix}=\begin{bmatrix}a(A\hat{i})+c(A\hat{j}) \\ b(A\hat{i})+d(A\hat{j})\end{bmatrix}$$  

**Matrix Multiplication**
As we know multiplying a matrix with a vector transforms it. So multiplying two matrices to that vector means applying two transformations on that vector.  

$\begin{bmatrix}a & c \\b & d \end{bmatrix}\begin{bmatrix}e & g\\f & h \end{bmatrix}\times\begin{bmatrix}x \\ y\end{bmatrix}=\begin{bmatrix}? & ? \\? & ? \end{bmatrix}\times\begin{bmatrix}x \\ y\end{bmatrix}$   

The resultant matrix represents the final transformation after applying both the transformations on $\begin{bmatrix}x \\ y\end{bmatrix}$

Similarly if you take 3 basis vectors in a 3D space $\hat{i}$, $\hat{j}$ and $\hat{k}$, you'll have 3x3 matrix to transform a vector in this 3d space where each column represents coordinates of $\hat{i}$, $\hat{j}$ and $\hat{k}$

$\begin{bmatrix}a & b & c \\d & e & f \\g & h & i \end{bmatrix}\begin{bmatrix}x \\ y \\ z\end{bmatrix}=x\begin{bmatrix}a \\ d \\g \end{bmatrix} + y \begin{bmatrix}b \\ e \\ h\end{bmatrix} + z\begin{bmatrix}e \\ f \\ i\end{bmatrix}=\begin{bmatrix}ax+by+cz \\ dx+ey+fz \\ gx+hy+iz\end{bmatrix}$   

# Determinant

-- We know that a matrix basically means transformation.  
-- Determinant of a matrix tells us by what factor a particular area within basis vectors will be squished down or scaled up if we apply that transformation.  

* +ve whole det -> area will be scaled up
* fraction det -> area will be scaled down
* -ve det -> orientation will be flipped. e.g. if originally $\hat{j}$ was at the left of $\hat{i}$, after transformation $\hat{j}$ will be at the right side of $\hat{i}$.
* 0 -> area becomes zero, $\hat{i}$ and $\hat{j}$ land on top of each other.

-- Determinant of 3x3 matrix will tell us by what factor a particular volume will be squished or scaled if we apply that transformation.

D $\begin{bmatrix}a & b & c \\d & e & f \\g & h & i \end{bmatrix}$

$=a\begin{bmatrix}e & f\\h & i\end{bmatrix}-b\begin{bmatrix}d & f\\g & i\end{bmatrix}+c\begin{bmatrix}d & e\\g & h\end{bmatrix}$
$-d\begin{bmatrix}b & c\\h & i\end{bmatrix}+e\begin{bmatrix}a & c\\g & i\end{bmatrix}-f\begin{bmatrix}a & b\\g & h\end{bmatrix}$
$+g\begin{bmatrix}b & c\\e & f\end{bmatrix}-h\begin{bmatrix}a & c\\d & f\end{bmatrix}+i\begin{bmatrix}a & b\\d & e\end{bmatrix}$

# Inverse Matrix

You might have used matrices to solve linear system of equations. e.g.  
$2x+3y-4z=5$  
$3x+0y+4z=-3$  
$0x-6y+2z=9$  

to solve for x, y and z you'd probably write these as  

$\begin{bmatrix}2 & 3 & -4 \\3 & 0 & 4 \\0 & -6 & 2 \end{bmatrix}\begin{bmatrix}x\\y\\z\end{bmatrix}=\begin{bmatrix}5\\-3\\9\end{bmatrix}$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; => &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
$T\times \overrightarrow{X}=\overrightarrow{A}$

Think about it for a moment, you want to find out $\overrightarrow{X}$, which after transformation $T$, becomes $\overrightarrow{A}$.   

As long as this transformation $T$ doesn't squish all the space to a lower dimension (determinant $\neq0$) there will be a unique vector $\overrightarrow{X}$ which on transformation becomes $\overrightarrow{A}$  
So if you just apply the transformation $T$ in reverse on $\overrightarrow{A}$, you'll get the original vector $\overrightarrow{X}$.

$$\overrightarrow{X}=\overrightarrow{A}\times \overrightarrow{T}^{-1} => \begin{bmatrix}x\\y\\z\end{bmatrix}=\begin{bmatrix}5\\-3\\9\end{bmatrix}\begin{bmatrix}2 & 3 & -4 \\3 & 0 & 4 \\0 & -6 & 2 \end{bmatrix}^{-1}$$


> NOTE: If determinant of a matrix is zero, this transformation squishes the area to a single line or point, or volume to a plane or line or point, That's why applying the reverse transformation is not possible. There's no way to un-squish the line.  
> --Un-squishing a line into a plane will require one function to take that line as input and spit out a lot of lines that will make up the plane, but a function returns only one value. That's why inverse of that matrix doesn't exist.  
> -Because the transformation squishes the vector space to a lower dimension, may be the vector you're looking for doesn't exist  
> -However, it's still possible to find a solution even if the determinant is zero, the vector must live on lower dimension after the transformation  
> -In 2D, if the transformation squishes the vector space to a line, the vector must exist on that line after transformation. In 3D, if the transformation squishes the space to a plane or line, the vector must live on that plane or line after the transformation, then only solution is possible.  


# Identity Matrix

If matrix $A$ represents a transformation $A^{-1}$ will represent reverse of that transformation, so $A\times A^{-1}=I$, where $I$ is the identity matrix.

-- identity matrix does no change to the vector on transformation.

# Rank of Matrix

Rank : Dimension of the output after transformation.  
If transformation squishes the vector space to a line : Rank = 1 (1 dimensional)  
If transformation squishes the vector space to a plane, Rank = 2 (2 dimensional)  

__Column Space__ : if you take each column of a matrix as basis vector, the span of these vectors is called column space.  
__Null Space__ : Set of all vectors that land on zero(null) after the transformation.  

# Non-square Matrix

So far we're transforming vectors from 2D space to 2D space and 3D space to 3D space. What if I want to transform a vector from 3D space to 2D space or from 2D space to 3D space.  

$\begin{bmatrix}5 & 1\\-3 & 2\\9 & 4\end{bmatrix}$ 2 columns (2 basis vectors) and 3 rows

In the above 3x2 matrix each basis vector has 3 coordinates, which means they lands on a 3D space.  
There are 2 basis vectors means it takes a 2D vector as input.


# Dot Product

$\overrightarrow{A} \cdot \overrightarrow{B}=||A||.||B||. \cos\theta= Number$  

$Number > 0 :$ Angle between both vectors is < $90^{\circ}$, they're kind of in the same direction.  
$Number = 0 :$ Both the vectors are perpendicular to each other ($\cos90$).  
$Number < 0 :$ Angle between both vectors is > $90^{\circ}$, they're completely pointing away from each other.  

with this, if we know the coordinates of the vectors, we can find out the angle between them.
$$\cos\theta = \frac{\overrightarrow{A} \cdot \overrightarrow{B}}{||A||.||B||}=\frac{dot\:product\: of\:two\:vectors}{product\:of\:lengths}$$

### Other way is :

$\overrightarrow{A}=2\hat{i}+3\hat{j}$  
$\overrightarrow{B}=5\hat{i}+2\hat{j}$

$\overrightarrow{A} \cdot \overrightarrow{B}=\begin{bmatrix}2 \\ 3\end{bmatrix}\cdot\begin{bmatrix}5 \\ 2\end{bmatrix}=\left(2\times5\right)+\left(3\times2\right)=16$

> Geometrically what it means is.. we're projecting one vector on to another and multiplying length of the projected vector with the length of the other vector. But what does matching coordinates, multiplying them and adding them together $\left(\overrightarrow{A}_x\overrightarrow{B}_x+\overrightarrow{A}_y\overrightarrow{B}_y\right)$ has to do anything with projection ?

If we want to transform a vector to one dimension (1D -> there will be only one coordinate), what will the transformation matrix look like?

$\hat{i}$ and $\hat{j}$ will land on 1D line, so they'll have only one coordinate. $\begin{bmatrix}a & b\end{bmatrix}$ (span = line). As a result the input vector will also land on the same line.

$\begin{bmatrix}a & b\end{bmatrix}\begin{bmatrix}x\\y\end{bmatrix}=ax+by=Constant$  
We've just defined a function which takes a vector and spits out a number.

e.g. $T = \begin{bmatrix}1&-2\end{bmatrix}$, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{i}$ lands on 1 on x-axis and $\hat{j}$ lands on -2 on x-axis.  
let $\overrightarrow{A}=4\hat{i}+3\hat{j}$  
Applying transformation on $\overrightarrow{A}$, $\begin{bmatrix}1&-2\end{bmatrix}\begin{bmatrix}4\\3\end{bmatrix}=\begin{bmatrix}1\\-2\end{bmatrix}\cdot\begin{bmatrix}4\\3\end{bmatrix}=4\cdot1-2\cdot3=-2$

\begin{center}
\end{center}
\tikzset{every picture/.style={line width=0.75pt}}
\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,300); %set diagram left start at 0, and has height of 300

%Shape: Grid [id:dp7078039306015416] 
\draw  [draw opacity=0] (20.6,90.4) -- (521.5,90.4) -- (521.5,231.5) -- (20.6,231.5) -- cycle ; \draw  [color={rgb, 255:red, 221; green, 209; blue, 209 }  ,draw opacity=1 ] (20.6,90.4) -- (20.6,231.5)(40.6,90.4) -- (40.6,231.5)(60.6,90.4) -- (60.6,231.5)(80.6,90.4) -- (80.6,231.5)(100.6,90.4) -- (100.6,231.5)(120.6,90.4) -- (120.6,231.5)(140.6,90.4) -- (140.6,231.5)(160.6,90.4) -- (160.6,231.5)(180.6,90.4) -- (180.6,231.5)(200.6,90.4) -- (200.6,231.5)(220.6,90.4) -- (220.6,231.5)(240.6,90.4) -- (240.6,231.5)(260.6,90.4) -- (260.6,231.5)(280.6,90.4) -- (280.6,231.5)(300.6,90.4) -- (300.6,231.5)(320.6,90.4) -- (320.6,231.5)(340.6,90.4) -- (340.6,231.5)(360.6,90.4) -- (360.6,231.5)(380.6,90.4) -- (380.6,231.5)(400.6,90.4) -- (400.6,231.5)(420.6,90.4) -- (420.6,231.5)(440.6,90.4) -- (440.6,231.5)(460.6,90.4) -- (460.6,231.5)(480.6,90.4) -- (480.6,231.5)(500.6,90.4) -- (500.6,231.5)(520.6,90.4) -- (520.6,231.5) ; \draw  [color={rgb, 255:red, 221; green, 209; blue, 209 }  ,draw opacity=1 ] (20.6,90.4) -- (521.5,90.4)(20.6,110.4) -- (521.5,110.4)(20.6,130.4) -- (521.5,130.4)(20.6,150.4) -- (521.5,150.4)(20.6,170.4) -- (521.5,170.4)(20.6,190.4) -- (521.5,190.4)(20.6,210.4) -- (521.5,210.4)(20.6,230.4) -- (521.5,230.4) ; \draw  [color={rgb, 255:red, 221; green, 209; blue, 209 }  ,draw opacity=1 ]  ;
%Shape: Axis 2D [id:dp8612793485147252] 
\draw [color={rgb, 255:red, 109; green, 108; blue, 108 }  ,draw opacity=1 ] (41.46,190.4) -- (211.78,190.4)(100.6,100.43) -- (100.6,199.63) (204.78,185.4) -- (211.78,190.4) -- (204.78,195.4) (95.6,107.43) -- (100.6,100.43) -- (105.6,107.43) (120.6,185.4) -- (120.6,195.4)(140.6,185.4) -- (140.6,195.4)(160.6,185.4) -- (160.6,195.4)(180.6,185.4) -- (180.6,195.4)(80.6,185.4) -- (80.6,195.4)(60.6,185.4) -- (60.6,195.4)(95.6,170.4) -- (105.6,170.4)(95.6,150.4) -- (105.6,150.4)(95.6,130.4) -- (105.6,130.4) ;
\draw   (127.6,202.4) node[anchor=east, scale=0.75]{1} (147.6,202.4) node[anchor=east, scale=0.75]{2} (167.6,202.4) node[anchor=east, scale=0.75]{3} (187.6,202.4) node[anchor=east, scale=0.75]{4} (87.6,202.4) node[anchor=east, scale=0.75]{-1} (67.6,202.4) node[anchor=east, scale=0.75]{-2} (97.6,170.4) node[anchor=east, scale=0.75]{1} (97.6,150.4) node[anchor=east, scale=0.75]{2} (97.6,130.4) node[anchor=east, scale=0.75]{3} ;
%Straight Lines [id:da7171373061038726] 
\draw [color={rgb, 255:red, 0; green, 255; blue, 225 }  ,draw opacity=1 ]   (100.75,191) -- (118.6,190.46) ;
\draw [shift={(120.6,190.4)}, rotate = 538.27] [color={rgb, 255:red, 0; green, 255; blue, 225 }  ,draw opacity=1 ][line width=0.75]    (10.93,-3.29) .. controls (6.95,-1.4) and (3.31,-0.3) .. (0,0) .. controls (3.31,0.3) and (6.95,1.4) .. (10.93,3.29)   ;

%Straight Lines [id:da8145294987524829] 
\draw [color={rgb, 255:red, 202; green, 120; blue, 9 }  ,draw opacity=1 ]   (100.6,190.4) -- (100.6,172.4) ;
\draw [shift={(100.6,170.4)}, rotate = 450] [color={rgb, 255:red, 202; green, 120; blue, 9 }  ,draw opacity=1 ][line width=0.75]    (10.93,-3.29) .. controls (6.95,-1.4) and (3.31,-0.3) .. (0,0) .. controls (3.31,0.3) and (6.95,1.4) .. (10.93,3.29)   ;

%Straight Lines [id:da8681471396384621] 
\draw [color={rgb, 255:red, 255; green, 200; blue, 0 }  ,draw opacity=1 ]   (100.6,190.4) -- (179,131.6) ;
\draw [shift={(180.6,130.4)}, rotate = 503.13] [color={rgb, 255:red, 255; green, 200; blue, 0 }  ,draw opacity=1 ][line width=0.75]    (10.93,-3.29) .. controls (6.95,-1.4) and (3.31,-0.3) .. (0,0) .. controls (3.31,0.3) and (6.95,1.4) .. (10.93,3.29)   ;

%Shape: Axis 2D [id:dp9507479795081675] 
\draw [color={rgb, 255:red, 109; green, 108; blue, 108 }  ,draw opacity=1 ] (261.46,191.03) -- (500.6,191.03)(380.28,100.43) -- (380.28,199.63) (493.6,186.03) -- (500.6,191.03) -- (493.6,196.03) (375.28,107.43) -- (380.28,100.43) -- (385.28,107.43) (400.28,186.03) -- (400.28,196.03)(420.28,186.03) -- (420.28,196.03)(440.28,186.03) -- (440.28,196.03)(460.28,186.03) -- (460.28,196.03)(480.28,186.03) -- (480.28,196.03)(360.28,186.03) -- (360.28,196.03)(340.28,186.03) -- (340.28,196.03)(320.28,186.03) -- (320.28,196.03)(300.28,186.03) -- (300.28,196.03)(280.28,186.03) -- (280.28,196.03)(375.28,171.03) -- (385.28,171.03)(375.28,151.03) -- (385.28,151.03)(375.28,131.03) -- (385.28,131.03) ;
\draw   (407.28,203.03) node[anchor=east, scale=0.75]{1} (427.28,203.03) node[anchor=east, scale=0.75]{2} (447.28,203.03) node[anchor=east, scale=0.75]{3} (467.28,203.03) node[anchor=east, scale=0.75]{4} (487.28,203.03) node[anchor=east, scale=0.75]{5} (367.28,203.03) node[anchor=east, scale=0.75]{-1} (347.28,203.03) node[anchor=east, scale=0.75]{-2} (327.28,203.03) node[anchor=east, scale=0.75]{-3} (307.28,203.03) node[anchor=east, scale=0.75]{-4} (287.28,203.03) node[anchor=east, scale=0.75]{-5} (377.28,171.03) node[anchor=east, scale=0.75]{1} (377.28,151.03) node[anchor=east, scale=0.75]{2} (377.28,131.03) node[anchor=east, scale=0.75]{3} ;
%Straight Lines [id:da0633538625208081] 
\draw [color={rgb, 255:red, 0; green, 255; blue, 225 }  ,draw opacity=1 ]   (380.6,190.4) -- (398.45,189.86) ;
\draw [shift={(400.45,189.8)}, rotate = 538.27] [color={rgb, 255:red, 0; green, 255; blue, 225 }  ,draw opacity=1 ][line width=0.75]    (10.93,-3.29) .. controls (6.95,-1.4) and (3.31,-0.3) .. (0,0) .. controls (3.31,0.3) and (6.95,1.4) .. (10.93,3.29)   ;

%Straight Lines [id:da21414376338700802] 
\draw [color={rgb, 255:red, 202; green, 120; blue, 9 }  ,draw opacity=1 ]   (380.6,190.4) -- (342.6,190.4) ;
\draw [shift={(340.6,190.4)}, rotate = 360] [color={rgb, 255:red, 202; green, 120; blue, 9 }  ,draw opacity=1 ][line width=0.75]    (10.93,-3.29) .. controls (6.95,-1.4) and (3.31,-0.3) .. (0,0) .. controls (3.31,0.3) and (6.95,1.4) .. (10.93,3.29)   ;

%Straight Lines [id:da1543943005709849] 
\draw [color={rgb, 255:red, 255; green, 200; blue, 0 }  ,draw opacity=1 ]   (380.6,190.4) -- (342.6,190.4) ;
\draw [shift={(340.6,190.4)}, rotate = 360] [color={rgb, 255:red, 255; green, 200; blue, 0 }  ,draw opacity=1 ][line width=0.75]    (10.93,-3.29) .. controls (6.95,-1.4) and (3.31,-0.3) .. (0,0) .. controls (3.31,0.3) and (6.95,1.4) .. (10.93,3.29)   ;

% Text Node
\draw (109.8,202.8) node [scale=0.9,color={rgb, 255:red, 0; green, 255; blue, 225 }  ,opacity=1 ] [align=left] {$i$};
% Text Node
\draw (86.2,178) node [scale=0.9,color={rgb, 255:red, 202; green, 120; blue, 9 }  ,opacity=1 ] [align=left] {$j$};
% Text Node
\draw (369,201.2) node [scale=0.9,color={rgb, 255:red, 202; green, 120; blue, 9 }  ,opacity=1 ] [align=left] {$j$};
% Text Node
\draw (389.8,201.2) node [scale=0.9,color={rgb, 255:red, 0; green, 255; blue, 225 }  ,opacity=1 ] [align=left] {$i$};
% Text Node
\draw (145,143) node [scale=0.9,color={rgb, 255:red, 255; green, 200; blue, 0 }  ,opacity=1 ] [align=left] {A};
% Text Node
\draw (349.5,176.5) node [scale=0.9,color={rgb, 255:red, 255; green, 200; blue, 0 }  ,opacity=1 ] [align=left] {A};
\end{tikzpicture}
\begin{center}

\end{center}



So applying transformation (matrix vector multiplication) and dot product of two vectors (vector multiplication) are the same thing ? Nonsense! how can they be same ?

Well, lets explore that..

\begin{center}
\end{center}
\tikzset{every picture/.style={line width=0.75pt}}

\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,497); %set diagram left start at 0, and has height of 497

%Shape: Grid [id:dp7078039306015416] 
\draw  [draw opacity=0] (101.28,0) -- (602.18,0) -- (602.18,302) -- (101.28,302) -- cycle ; \draw  [color={rgb, 255:red, 221; green, 209; blue, 209 }  ,draw opacity=1 ] (101.28,0) -- (101.28,302)(201.28,0) -- (201.28,302)(301.28,0) -- (301.28,302)(401.28,0) -- (401.28,302)(501.28,0) -- (501.28,302)(601.28,0) -- (601.28,302) ; \draw  [color={rgb, 255:red, 221; green, 209; blue, 209 }  ,draw opacity=1 ] (101.28,0) -- (602.18,0)(101.28,100) -- (602.18,100)(101.28,200) -- (602.18,200)(101.28,300) -- (602.18,300) ; \draw  [color={rgb, 255:red, 221; green, 209; blue, 209 }  ,draw opacity=1 ]  ;
%Shape: Axis 2D [id:dp9507479795081675] 
\draw [color={rgb, 255:red, 109; green, 108; blue, 108 }  ,draw opacity=1 ] (155.07,200) -- (448.76,200)(301.28,58.03) -- (301.28,215.21) (441.76,195) -- (448.76,200) -- (441.76,205) (296.28,65.03) -- (301.28,58.03) -- (306.28,65.03) (401.28,195) -- (401.28,205)(201.28,195) -- (201.28,205)(296.28,100) -- (306.28,100) ;
\draw   (408.28,212) node[anchor=east, scale=0.75]{1} (208.28,212) node[anchor=east, scale=0.75]{-1} (298.28,100) node[anchor=east, scale=0.75]{1} ;
%Straight Lines [id:da0633538625208081] 
\draw [color={rgb, 255:red, 0; green, 255; blue, 225 }  ,draw opacity=1 ]   (301.28,200) -- (399.28,200) ;
\draw [shift={(401.28,200)}, rotate = 180] [fill={rgb, 255:red, 0; green, 255; blue, 225 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da21414376338700802] 
\draw [color={rgb, 255:red, 202; green, 120; blue, 9 }  ,draw opacity=1 ]   (301.28,200) -- (301.28,102) ;
\draw [shift={(301.28,100)}, rotate = 450] [fill={rgb, 255:red, 202; green, 120; blue, 9 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da31713825924395955] 
\draw [color={rgb, 255:red, 146; green, 146; blue, 146 }  ,draw opacity=1 ]   (541.5,21.37) -- (238,247.37) (464.28,85.1) -- (458.31,77.08)(384.07,144.83) -- (378.1,136.81)(303.87,204.55) -- (297.9,196.53) ;


%Straight Lines [id:da37483588104348] 
\draw [color={rgb, 255:red, 248; green, 201; blue, 28 }  ,draw opacity=1 ]   (301.28,200) -- (380.17,141.78) ;
\draw [shift={(381.78,140.59)}, rotate = 503.57] [fill={rgb, 255:red, 248; green, 201; blue, 28 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da5348827539196188] 
\draw [color={rgb, 255:red, 219; green, 219; blue, 219 }  ,draw opacity=1 ][line width=0.75]  [dash pattern={on 4.5pt off 4.5pt}]  (453.78,149.39) -- (182.18,238.99) ;


%Straight Lines [id:da6234910767242934] 
\draw [color={rgb, 255:red, 248; green, 201; blue, 28 }  ,draw opacity=1 ][line width=0.75]  [dash pattern={on 0.84pt off 2.51pt}]  (381.99,199.49) -- (381.78,140.59) ;


%Straight Lines [id:da32941207450390886] 
\draw [color={rgb, 255:red, 0; green, 255; blue, 225 }  ,draw opacity=1 ][line width=0.75]  [dash pattern={on 0.84pt off 2.51pt}]  (401.28,200) -- (366.83,152.07) ;


%Straight Lines [id:da9899925716248883] 
\draw [color={rgb, 255:red, 148; green, 189; blue, 189 }  ,draw opacity=1 ] [dash pattern={on 4.5pt off 4.5pt}]  (301.28,200) -- (365.22,153.25) ;
\draw [shift={(366.83,152.07)}, rotate = 503.83] [fill={rgb, 255:red, 148; green, 189; blue, 189 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;


% Text Node
\draw (285,175.7) node [scale=0.9,color={rgb, 255:red, 202; green, 120; blue, 9 }  ,opacity=1 ] [align=left] {$j$};
% Text Node
\draw (320.3,210.7) node [scale=0.9,color={rgb, 255:red, 0; green, 255; blue, 225 }  ,opacity=1 ] [align=left] {$i$};
% Text Node
\draw (380.43,128.9) node [scale=0.9,color={rgb, 255:red, 248; green, 201; blue, 28 }  ,opacity=1 ] [align=left] {$u$};
% Text Node
\draw (381.33,204.57) node [scale=1.2,color={rgb, 255:red, 248; green, 201; blue, 28 }  ,opacity=1 ] [align=left] {$u_{x}$};
% Text Node
\draw (358.19,142) node [scale=1.2,color={rgb, 255:red, 248; green, 201; blue, 28 }  ,opacity=1 ] [align=left] {$u_{x}$};
% Text Node
\draw (468.5,62.5) node [color={rgb, 255:red, 146; green, 146; blue, 146 }  ,opacity=1 ] [align=left] {N};


\end{tikzpicture}
\begin{center}

\end{center}

Here $i$ and $j$ are unit vectors in $x$ and $y$ directions respectively and $N$ us just a number line place diagonally.

Now read carefully, if we want to project any vector on to this number line, we just have to transform it such that $i$ and $j$ land on to this number line.

for this transformation we've to project $i$ and $j$ on to this number line.  

Let $u$ be the unit vector in $N$ direction. $u=\begin{bmatrix}u_x\\u_y\end{bmatrix}$  
As $i$ and $u$ both are unit vectors, projecting $i$ on $u$ will be same as projecting $u$ on $i$  
$u$'s projection on $i$ = x-coordinate of $u$ = $u_x$

taking the same reasons, $u$'s projection on $j$ = y-coordinate of $u$ = $u_y$


So, $i$ lands at $u_x$ and $j$ lands at $u_y$. The transformation matrix $T=\begin{bmatrix}u_x&u_y\end{bmatrix}$  

hmmm... so it means, in order to project $i$ on $u$, $i\times\begin{bmatrix}u_x&u_y\end{bmatrix}=i\cdot\begin{bmatrix}u_x\\u_y\end{bmatrix}$

=> Taking dot product with a unit vector($u$ in this case) = projecting that vector on the span of that unit vector and taking the length.  
=> But, what about non-unit vectors ? let $u = \begin{bmatrix}3u_x\\3u_y\end{bmatrix}$, &nbsp; $T=\begin{bmatrix}3u_x&3u_y\end{bmatrix}$ now after projecting $i$ and $j$ on $u$, we've to scale them by $3$. So dot product will be, project the vector on $u$ and scale it by the length of the vector($3$ in this case).  

> Which vector is projected on which vector ? It doesn't matter, either way result value will be the same,

> For any linear transformation $T=\begin{bmatrix}x&y\end{bmatrix}$ that transforms any vector to a 1D value, there will be a unique vector $\overrightarrow{V}=\begin{bmatrix}x\\y\end{bmatrix}$ corresponding to that transformation. In the sense that applying the transformation is the same thng as taking a dot product with that vector.
