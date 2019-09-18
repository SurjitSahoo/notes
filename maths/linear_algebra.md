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

\begin{center}
\end{center}
\tikzset{every picture/.style={line width=0.75pt}} 
\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,751); %set diagram left start at 0, and has height of 751
%Shape: Axis 2D [id:dp6294983872096584] 
\draw [color={rgb, 255:red, 0; green, 0; blue, 0 }  ,draw opacity=0.14 ] (178.39,200.34) -- (295.56,200.34)(200.6,159.05) -- (200.6,269.36) (288.56,195.34) -- (295.56,200.34) -- (288.56,205.34) (195.6,166.05) -- (200.6,159.05) -- (205.6,166.05) (220.6,195.34) -- (220.6,205.34)(240.6,195.34) -- (240.6,205.34)(260.6,195.34) -- (260.6,205.34)(195.6,180.34) -- (205.6,180.34)(195.6,220.34) -- (205.6,220.34)(195.6,240.34) -- (205.6,240.34)(195.6,260.34) -- (205.6,260.34) ;
\draw   (227.6,212.34) node[anchor=east, scale=0.75]{1} (247.6,212.34) node[anchor=east, scale=0.75]{2} (267.6,212.34) node[anchor=east, scale=0.75]{3} (197.6,180.34) node[anchor=east, scale=0.75]{1} (197.6,220.34) node[anchor=east, scale=0.75]{-1} (197.6,240.34) node[anchor=east, scale=0.75]{-2} (197.6,260.34) node[anchor=east, scale=0.75]{-3} ;
%Straight Lines [id:da37770371345411813] 
\draw [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,draw opacity=1 ]   (200.6,200.34) -- (219,200.48) ;
\draw [shift={(221,200.5)}, rotate = 180.46] [fill={rgb, 255:red, 89; green, 255; blue, 3 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da9231168926538362] 
\draw [color={rgb, 255:red, 248; green, 231; blue, 28 }  ,draw opacity=1 ]   (200.6,200.34) -- (200.06,182.5) ;
\draw [shift={(200,180.5)}, rotate = 448.27] [fill={rgb, 255:red, 248; green, 231; blue, 28 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da17459381910040217] 
\draw [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,draw opacity=1 ] [dash pattern={on 4.5pt off 4.5pt}]  (200.6,200.34) -- (261,200.5) ;
%Straight Lines [id:da9445935516930124] 
\draw [color={rgb, 255:red, 248; green, 231; blue, 28 }  ,draw opacity=1 ] [dash pattern={on 4.5pt off 4.5pt}]  (200.5,241) -- (200.6,200.34) ;
%Straight Lines [id:da544117701577987] 
\draw [color={rgb, 255:red, 248; green, 231; blue, 28 }  ,draw opacity=1 ] [dash pattern={on 4.5pt off 4.5pt}]  (260.25,240.25) -- (200.5,241) ;
%Straight Lines [id:da12924608803754212] 
\draw [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,draw opacity=1 ] [dash pattern={on 4.5pt off 4.5pt}]  (260.25,240.25) -- (261,200.5) ;
%Straight Lines [id:da11735188864638157] 
\draw [color={rgb, 255:red, 139; green, 87; blue, 42 }  ,draw opacity=1 ]   (200.6,200.34) -- (258.59,239.14) ;
\draw [shift={(260.25,240.25)}, rotate = 213.79] [color={rgb, 255:red, 139; green, 87; blue, 42 }  ,draw opacity=1 ][line width=0.75]    (10.93,-3.29) .. controls (6.95,-1.4) and (3.31,-0.3) .. (0,0) .. controls (3.31,0.3) and (6.95,1.4) .. (10.93,3.29)   ;
% Text Node
\draw (214,187.5) node [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,opacity=1 ] [align=left] {$i$};
% Text Node
\draw (192.5,186.5) node [scale=0.5,color={rgb, 255:red, 248; green, 231; blue, 28 }  ,opacity=1 ] [align=left] {$j$};
\end{tikzpicture}
\begin{center}
\end{center}

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
-- 3rd vector shouldn’t be lying on the span of other two vectors, other wise it won’t affect the span at all, it’ll be redundant. (3rd vector will be linearly dependent on other two)

$a\overrightarrow{u}+b\overrightarrow{v}+c\overrightarrow{w}$ here by changing $a$, $b$ and $c$ you can grasp all the points in 3D space.

> Technical Definition: The basis of a vector space (2D or 3D) is a set of **linearly independent** vectors that **span** the full space (2D or 3D)



# Linear Transformation

> Transformation is basically a function that takes a vector and spits out another vector  
> Linear Transformation : origin must not change and straight line should output straight line not a curve.

-- As we know every vector is composed by scaling and adding the basis vectors.  
-- So if we just change the basis vectors themselves, resulting vector will also be changed. So in order to transform (keeping the origin constant) just scale and change the direction of basis vectors.  
-- By doing that we get entire new basis vectors (new coordinates).

Let $\overrightarrow{A}=3\hat{i}+4\hat{j}$

$\overrightarrow{A}$ is a vector of specific length pointing in a direction, It basically means walk 3 units along +ve x-axis then walk 4 units along +ve y-axis.  
If we change the length and direction of $\hat{i}$ and $\hat{j}$, the resulting vector will also change. This is what we call transformation.  
If we want to transform $\overrightarrow{A}$, the idea is to decide where you want the basis vectors to land after transformation and replace the new $\hat{i}$ and $\hat{j}$ in the above equation.

suppose originally $\hat{i}$ and $\hat{j}$ (basis vectors) were at (1,0) and (0, 1) respectively, now after transformation new coordinated of these two are (1, 2) and (-3, 4)  

\begin{center}
\end{center}
\tikzset{every picture/.style={line width=0.75pt}}

\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,751); %set diagram left start at 0, and has height of 751

%Shape: Axis 2D [id:dp6294983872096584] 
\draw [color={rgb, 255:red, 0; green, 0; blue, 0 }  ,draw opacity=0.14 ] (178.39,200.34) -- (295.56,200.34)(200.6,159.05) -- (200.6,269.36) (288.56,195.34) -- (295.56,200.34) -- (288.56,205.34) (195.6,166.05) -- (200.6,159.05) -- (205.6,166.05) (220.6,195.34) -- (220.6,205.34)(240.6,195.34) -- (240.6,205.34)(260.6,195.34) -- (260.6,205.34)(195.6,180.34) -- (205.6,180.34)(195.6,220.34) -- (205.6,220.34)(195.6,240.34) -- (205.6,240.34)(195.6,260.34) -- (205.6,260.34) ;
\draw   ;
%Straight Lines [id:da37770371345411813] 
\draw [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,draw opacity=1 ]   (200.6,200.34) -- (219,200.48) ;
\draw [shift={(221,200.5)}, rotate = 180.46] [fill={rgb, 255:red, 89; green, 255; blue, 3 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da9231168926538362] 
\draw [color={rgb, 255:red, 248; green, 231; blue, 28 }  ,draw opacity=1 ]   (200.6,200.34) -- (200.06,182.5) ;
\draw [shift={(200,180.5)}, rotate = 448.27] [fill={rgb, 255:red, 248; green, 231; blue, 28 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Shape: Axis 2D [id:dp396484071077005] 
\draw [color={rgb, 255:red, 0; green, 0; blue, 0 }  ,draw opacity=0.14 ] (318.89,259.88) -- (447.88,259.88)(400.88,158.86) -- (400.88,278.86) (440.88,254.88) -- (447.88,259.88) -- (440.88,264.88) (395.88,165.86) -- (400.88,158.86) -- (405.88,165.86) (420.88,254.88) -- (420.88,264.88)(380.88,254.88) -- (380.88,264.88)(360.88,254.88) -- (360.88,264.88)(340.88,254.88) -- (340.88,264.88)(395.88,239.88) -- (405.88,239.88)(395.88,219.88) -- (405.88,219.88)(395.88,199.88) -- (405.88,199.88)(395.88,179.88) -- (405.88,179.88) ;
\draw   ;
%Straight Lines [id:da5789571958688016] 
\draw [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,draw opacity=1 ]   (400.88,259.88) -- (419.25,221.93) ;
\draw [shift={(420.13,220.13)}, rotate = 475.84] [fill={rgb, 255:red, 89; green, 255; blue, 3 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da43298686902097105] 
\draw [color={rgb, 255:red, 248; green, 231; blue, 28 }  ,draw opacity=1 ]   (400.88,259.88) -- (341.34,181.96) ;
\draw [shift={(340.13,180.38)}, rotate = 412.61] [fill={rgb, 255:red, 248; green, 231; blue, 28 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Shape: Grid [id:dp27757572463974634] 
\draw  [draw opacity=0][dash pattern={on 4.5pt off 4.5pt}] (160,140.5) -- (460.29,140.5) -- (460.29,280.64) -- (160,280.64) -- cycle ; \draw  [color={rgb, 255:red, 0; green, 0; blue, 0 }  ,draw opacity=0.06 ][dash pattern={on 4.5pt off 4.5pt}] (160,140.5) -- (160,280.64)(180,140.5) -- (180,280.64)(200,140.5) -- (200,280.64)(220,140.5) -- (220,280.64)(240,140.5) -- (240,280.64)(260,140.5) -- (260,280.64)(280,140.5) -- (280,280.64)(300,140.5) -- (300,280.64)(320,140.5) -- (320,280.64)(340,140.5) -- (340,280.64)(360,140.5) -- (360,280.64)(380,140.5) -- (380,280.64)(400,140.5) -- (400,280.64)(420,140.5) -- (420,280.64)(440,140.5) -- (440,280.64)(460,140.5) -- (460,280.64) ; \draw  [color={rgb, 255:red, 0; green, 0; blue, 0 }  ,draw opacity=0.06 ][dash pattern={on 4.5pt off 4.5pt}] (160,140.5) -- (460.29,140.5)(160,160.5) -- (460.29,160.5)(160,180.5) -- (460.29,180.5)(160,200.5) -- (460.29,200.5)(160,220.5) -- (460.29,220.5)(160,240.5) -- (460.29,240.5)(160,260.5) -- (460.29,260.5)(160,280.5) -- (460.29,280.5) ; \draw  [color={rgb, 255:red, 0; green, 0; blue, 0 }  ,draw opacity=0.06 ][dash pattern={on 4.5pt off 4.5pt}]  ;
% Text Node
\draw (214,187.5) node [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,opacity=1 ] [align=left] {$i$};
% Text Node
\draw (192.5,186.5) node [scale=0.5,color={rgb, 255:red, 248; green, 231; blue, 28 }  ,opacity=1 ] [align=left] {$j$};
\end{tikzpicture}
\begin{center}
\end{center}

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
-- Determinant of a matrix tells us how does a unit area enclosed by the basis vectors will change if we apply that transformation.  

* +ve whole det -> area will be scaled up
* fraction det -> area will be scaled down
* -ve det -> orientation will be flipped. e.g. if originally $\hat{j}$ was at the left of $\hat{i}$, after transformation $\hat{j}$ will be at the right side of $\hat{i}$.
* 0 -> area becomes zero, $\hat{i}$ and $\hat{j}$ land on top of each other.

$det(T) = 3$ => the area will be 3A after transformation  
$det(T) = -3$ => the area will be 3A after transformation, but flipped  
$det(T) = .5$ => the area will be $\frac{A}{2}$ after transformation

-- Determinant of 3x3 matrix will tell us by what factor a unit volume enclosed by 3 basis vectors will be squished or scaled or flipped if we apply that transformation.

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
Because if the transformation squishes the space to lower dimension e.g. 3D->2D->1D, the output vector will have lesser coordinates.  
So assuming determinant $\neq0$, if you just apply the transformation $T$ in reverse on $\overrightarrow{A}$, you'll get the original vector $\overrightarrow{X}$.

$$\overrightarrow{X}=\overrightarrow{A}\times \overrightarrow{T}^{-1} => \begin{bmatrix}x\\y\\z\end{bmatrix}=\begin{bmatrix}5\\-3\\9\end{bmatrix}\begin{bmatrix}2 & 3 & -4 \\3 & 0 & 4 \\0 & -6 & 2 \end{bmatrix}^{-1}$$


> NOTE: If determinant of a matrix is zero, this transformation squishes the area to a single line or point, or volume to a plane or line or point, That's why applying the reverse transformation is not possible. There's no way to un-squish the space.  
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

In the above 3x2 matrix each basis vector $\hat{i}$ and $\hat{j}$ has 3 coordinates, which means they land on a 3D space.  
There are 2 basis vectors, which means input is in 2D.


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

$\hat{i}$ and $\hat{j}$ will land on 1D line, so they'll have only one coordinate. $\begin{bmatrix}a & b\end{bmatrix}$ (span = line). So after applying this transformation on any vector, the vector will land on the same line(span).

$\begin{bmatrix}a & b\end{bmatrix}\begin{bmatrix}x\\y\end{bmatrix}=ax+by=Constant$ - - - - - which is the single coordinate on 1D span.  
We've just defined a function which takes a vector and spits out a number.

e.g. $T = \begin{bmatrix}1&-2\end{bmatrix}$, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{i}$ lands on 1 on x-axis and $\hat{j}$ lands on -2 on x-axis.  
let $\overrightarrow{A}=4\hat{i}+3\hat{j}$  
Applying transformation on $\overrightarrow{A}$, $\begin{bmatrix}1&-2\end{bmatrix}\begin{bmatrix}4\\3\end{bmatrix}=\begin{bmatrix}1\\-2\end{bmatrix}\cdot\begin{bmatrix}4\\3\end{bmatrix}=4\cdot1-2\cdot3=-2$

-2 is the coordinate/length of the input vector after transformation in the span of $\hat{i}$ and $\hat{j}$ which is x-axis in this case.

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

Now read carefully, if we want to project any vector on to this number line $N$, we just have to project $i$ and $j$ on to this number line $N$. Then take the new coordinates of $\hat{i}$ and $\hat{j}$ to transform(project) any given vector.

now lets find out what will be the coordinates of $\hat{i}$ and $\hat{j}$ after this transformation.  

Let $u$ be the unit vector in $N$ direction. $u=\begin{bmatrix}u_x\\u_y\end{bmatrix}$  
As $i$ and $u$ both are unit vectors, projecting $i$ on $u$ will be same as projecting $u$ on $i$  
$u$'s projection on $i$ = x-coordinate of $u$ = $u_x$

taking the same reasons, $u$'s projection on $j$ = y-coordinate of $u$ = $u_y$


So, $i$ lands at $u_x$ and $j$ lands at $u_y$. The transformation matrix $T=\begin{bmatrix}u_x&u_y\end{bmatrix}$  

hmmm... so it means, in order to project $i$ on $u$, $i\times\begin{bmatrix}u_x&u_y\end{bmatrix}=i\cdot\begin{bmatrix}u_x\\u_y\end{bmatrix}=i\cdot u$

=> Taking dot product with a unit vector($u$ in this case) = projecting that vector on the span of that unit vector and taking the length.  
=> But, what about non-unit vectors ? let $u = \begin{bmatrix}3u_x\\3u_y\end{bmatrix}$, &nbsp; $T=\begin{bmatrix}3u_x&3u_y\end{bmatrix}$ now after projecting $i$ and $j$ on $u$, we've to scale them by $3$. So dot product will be, project the vector on $u$ and scale it by the length of the vector($3$ in this case).  

> Which vector is projected on which vector ? It doesn't matter, either way result will be same,

> For any linear transformation $T$ that transforms any vector to a 1D value, there will be a unique vector $\overrightarrow{V}$ corresponding to that transformation. In the sense that applying the transformation is the same thing as taking a dot product with that vector.  
> $\begin{bmatrix}a&b\end{bmatrix}\begin{bmatrix}x\\y\end{bmatrix}=\begin{bmatrix}a\\b\end{bmatrix}\cdot\begin{bmatrix}x\\y\end{bmatrix}$  
>
> This is called **duallity**. (one thing signifies two things)

# Cross Product

We learn on school...  
In 2D, cross product gives the area of the parallelepiped created by the vectors.  
$\overrightarrow{A}=2\hat{i}+3\hat{j}$, &nbsp; &nbsp; &nbsp; $\overrightarrow{B}=-2\hat{i}+2\hat{j}$  
$\overrightarrow{A}\times\overrightarrow{B}=det\left(\begin{bmatrix}2&-2\\3&2\end{bmatrix}\right)=4+6=10$ units  
But if you flip the order, $\overrightarrow{B}\times\overrightarrow{A}=det\left(\begin{bmatrix}-2&2\\2&3\end{bmatrix}\right)=-6-4=-10$ units. Area is same, but orientation is flipped.

\tikzset{every picture/.style={line width=0.75pt}} 

\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,751); %set diagram left start at 0, and has height of 751

%Shape: Axis 2D [id:dp396484071077005] 
\draw [color={rgb, 255:red, 0; green, 0; blue, 0 }  ,draw opacity=0.14 ] (360,259.76) -- (480,259.76)(419.9,160) -- (419.9,280) (473,254.76) -- (480,259.76) -- (473,264.76) (414.9,167) -- (419.9,160) -- (424.9,167) (439.9,254.76) -- (439.9,264.76)(459.9,254.76) -- (459.9,264.76)(399.9,254.76) -- (399.9,264.76)(379.9,254.76) -- (379.9,264.76)(414.9,239.76) -- (424.9,239.76)(414.9,219.76) -- (424.9,219.76)(414.9,199.76) -- (424.9,199.76)(414.9,179.76) -- (424.9,179.76) ;
\draw   ;
%Straight Lines [id:da5789571958688016] 
\draw [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,draw opacity=1 ]   (420,260) -- (458.89,201.66) ;
\draw [shift={(460,200)}, rotate = 483.69] [fill={rgb, 255:red, 89; green, 255; blue, 3 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da43298686902097105] 
\draw [color={rgb, 255:red, 248; green, 231; blue, 28 }  ,draw opacity=1 ]   (420,260) -- (381.41,221.41) ;
\draw [shift={(380,220)}, rotate = 405] [fill={rgb, 255:red, 248; green, 231; blue, 28 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da5179585251065182] 
\draw [color={rgb, 255:red, 89; green, 255; blue, 3 }  ,draw opacity=1 ]   (380,220) -- (418.89,161.66) ;
\draw [shift={(420,160)}, rotate = 483.69] [fill={rgb, 255:red, 89; green, 255; blue, 3 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da26754266726665876] 
\draw [color={rgb, 255:red, 248; green, 231; blue, 28 }  ,draw opacity=1 ][fill={rgb, 255:red, 228; green, 210; blue, 210 }  ,fill opacity=1 ]   (460,200) -- (421.41,161.41) ;
\draw [shift={(420,160)}, rotate = 405] [fill={rgb, 255:red, 248; green, 231; blue, 28 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
% Text Node
\draw (446.1,233.9) node [scale=0.5,color={rgb, 255:red, 89; green, 255; blue, 3 }  ,opacity=1 ] [align=left] {A};
% Text Node
\draw (399,246.4) node [scale=0.5,color={rgb, 255:red, 248; green, 231; blue, 28 }  ,opacity=1 ] [align=left] {B};
\end{tikzpicture}

More the vectors are close to perpendicular with each other, area will be greater.

But why are we taking determinant ?  
Determinant tell us how an area changes after transformation. So assume, $\hat{i}$ became $\overrightarrow{A}$ and $\hat{j}$ became $\overrightarrow{B}$ after transformation. Initially area enclosed by $\hat{i}$ and $\hat{j}$ was 1 unit, after transformation it became $1\times det(T)=10$ units. If you consider other way around, such as $\hat{i}$ became $\overrightarrow{B}$ and $\hat{j}$ became $\overrightarrow{A}$ after transformation, the result will be negative, because input is same but output is flipped.   

Wait, but we've learnt in school that cross product gives another vector which is perpendicular to the span of input vectors. Yes, but that's for 3D.

let $\overrightarrow{A}=a_1\hat{i}+a_2\hat{j}+a_3\hat{k}$ &nbsp; &nbsp; &nbsp; and &nbsp; &nbsp; &nbsp; $\overrightarrow{B}=b_1\hat{i}+b_2\hat{j}+b_3\hat{k}$  

$\overrightarrow{A}\times\overrightarrow{B}=\begin{bmatrix}\hat{i}&a_1&b_1\\\hat{j}&a_2&b_2\\\hat{k}&a_3&b_3\end{bmatrix}=\hat{i}(a_2b_3-b_2a_3)+\hat{j}(b_1a_3-a_1b_3)+\hat{k}(a_1b_2-b_1a_2)$  
The result vector's length is same as the area of parallelepiped enclosed by $\overrightarrow{A}$ and $\overrightarrow{B}$ and is perpendicular to the parallelepiped. But in what direction ? There are 2 possible direction right!

There comes the right hand thumb rule. If $\overrightarrow{A}$ is in the direction of forefinger and $\overrightarrow{B}$ is in the direction of middle finger, the cross product will be in the direction of thumb.  

But wait a min, this formula looks a bit fishy. Where did this $\hat{i}$, $\hat{j}$ and $\hat{k}$ in the first column of the matrix come from ? what is it doing there ? We just pretend like there're number for the sake of computation and compute the determinant of the matrix. But why?

Ok, now concentrate...  
let $\overrightarrow{X}=x\hat{i}+y\hat{j}+z\hat{k}$  
&nbsp; &nbsp; $\overrightarrow{A}=a_1\hat{i}+a_2\hat{j}+a_3\hat{k}$,  
&nbsp; &nbsp; $\overrightarrow{B}=b_1\hat{i}+b_2\hat{j}+b_3\hat{k}$  

$\overrightarrow{X}\times\overrightarrow{A}\times\overrightarrow{B}=det\left(\begin{bmatrix}x&a_1&b_1\\y&a_2&b_2\\z&a_3&b_3\end{bmatrix}\right)=Const$ (Volume of the space enclosed by the vectors)

here $\overrightarrow{A}$ and $\overrightarrow{B}$ are fixed, but $\overrightarrow{X}$ is variable.

$fn\left(\begin{bmatrix}x\\y\\z\end{bmatrix}\right)=det\left(\begin{bmatrix}x&a_1&b_1\\y&a_2&b_2\\z&a_3&b_3\end{bmatrix}\right)=Const$

We just defined a function that takes a 3D vector and spits out a number (3D -> 1D transformation)  
If $T=\begin{bmatrix}v_1&v_2&v_3\end{bmatrix}$ transforms $\begin{bmatrix}x\\y\\z\end{bmatrix}$ to 1D number, there must exist a unique vector $\overrightarrow{V}=\begin{bmatrix}v_1\\v_2\\v_3\end{bmatrix}$, such that applying transformation $T$ is same as taking dot product with $\overrightarrow{V}$ (Remember duality)

=> $\begin{bmatrix}v_1\\v_2\\v_3\end{bmatrix}\cdot\begin{bmatrix}x\\y\\z\end{bmatrix}=det\left(\begin{bmatrix}x&a_1&b_1\\y&a_2&b_2\\z&a_3&b_3\end{bmatrix}\right)$  
=> $v_1x+v_2y+v_3z=x(a_2b_3-b_2a_3)+y(b_1a_3-a_1b_3)+z(a_1b_3-b_1a_3)$  
=> $v_1 = a_2b_3-b_2a_3$  
=> $v_2 = b_1a_3-a_1b_3$  
=> $v_3 = a_1b_3-b_1a_3$  

Thease are the coordinates of $\overrightarrow{V}$, which is the cross product of $\overrightarrow{A}$ and $\overrightarrow{B}$, which is the same as that funky solution we study at school.