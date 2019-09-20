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


* $\overrightarrow{A}+\overrightarrow{B}=\overrightarrow{C}$ ==> means if you walk along  $\overrightarrow{A}$ and then along $\overrightarrow{B}$, it’ll be same as walking along $\overrightarrow{C}$  

\tikzset{every picture/.style={line width=0.75pt}}
\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,801); %set diagram left start at 0, and has height of 801
%Straight Lines [id:da8985349911248783] 
\draw [color={rgb, 255:red, 201; green, 177; blue, 177 }  ,draw opacity=1 ][line width=1.5]    (146,158) -- (192.26,120.23) ;
\draw [shift={(194.58,118.33)}, rotate = 500.77] [fill={rgb, 255:red, 201; green, 177; blue, 177 }  ,fill opacity=1 ][line width=1.5]  [draw opacity=0] (13.4,-6.43) -- (0,0) -- (13.4,6.44) -- (8.9,0) -- cycle    ;
%Straight Lines [id:da9239430887139868] 
\draw [color={rgb, 255:red, 204; green, 200; blue, 0 }  ,draw opacity=1 ][line width=1.5]    (194.58,118.33) -- (251.46,140.89) ;
\draw [shift={(254.25,142)}, rotate = 201.64] [fill={rgb, 255:red, 204; green, 200; blue, 0 }  ,fill opacity=1 ][line width=1.5]  [draw opacity=0] (13.4,-6.43) -- (0,0) -- (13.4,6.44) -- (8.9,0) -- cycle    ;
%Straight Lines [id:da9163364623185699] 
\draw [color={rgb, 255:red, 25; green, 255; blue, 0 }  ,draw opacity=1 ][line width=1.5]    (146,158) -- (251.28,142.44) ;
\draw [shift={(254.25,142)}, rotate = 531.5899999999999] [fill={rgb, 255:red, 25; green, 255; blue, 0 }  ,fill opacity=1 ][line width=1.5]  [draw opacity=0] (13.4,-6.43) -- (0,0) -- (13.4,6.44) -- (8.9,0) -- cycle    ;
% Text Node
\draw (163.33,133.33) node [scale=0.5,color={rgb, 255:red, 201; green, 177; blue, 177 }  ,opacity=1 ] [align=left] {A};
% Text Node
\draw (223.33,121) node [scale=0.5,color={rgb, 255:red, 204; green, 200; blue, 0 }  ,opacity=1 ] [align=left] {B};
% Text Node
\draw (199.33,158.67) node [scale=0.5,color={rgb, 255:red, 25; green, 255; blue, 0 }  ,opacity=1 ] [align=left] {C};
\end{tikzpicture}

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

# Change of Basis

**Basis** : As we know, basis is the base vectors / unit vectors in terms of which we describe all the vectors. For e.g. $\overrightarrow{A}=2\hat{i}+3\hat{j}$ here $\hat{i}$ and $\hat{j}$ are the basis vectors in our coordinate system.

In our coordinate system, $\hat{i}=(1,0)$ and is pointing to the right, $\hat{j}=(0,1)$ which is pointing up. $\hat{i}$ and $\hat{j}$ are perpendicular to each other and their length is 1 unit.



\tikzset{every picture/.style={line width=0.75pt}}

\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,753); %set diagram left start at 0, and has height of 753

%Shape: Grid [id:dp615562244133943] 
\draw  [draw opacity=0][dash pattern={on 4.5pt off 4.5pt}] (30,30) -- (151,30) -- (151,131) -- (30,131) -- cycle ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (30,30) -- (30,131)(50,30) -- (50,131)(70,30) -- (70,131)(90,30) -- (90,131)(110,30) -- (110,131)(130,30) -- (130,131)(150,30) -- (150,131) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (30,30) -- (151,30)(30,50) -- (151,50)(30,70) -- (151,70)(30,90) -- (151,90)(30,110) -- (151,110)(30,130) -- (151,130) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}]  ;
%Shape: Axis 2D [id:dp5289923327303094] 
\draw [color={rgb, 255:red, 150; green, 148; blue, 148 }  ,draw opacity=1 ] (40.6,110) -- (134.6,110)(50,47.3) -- (50,116.97) (127.6,105) -- (134.6,110) -- (127.6,115) (45,54.3) -- (50,47.3) -- (55,54.3) (70,105) -- (70,115)(90,105) -- (90,115)(110,105) -- (110,115)(45,90) -- (55,90)(45,70) -- (55,70) ;
\draw [color={rgb, 255:red, 99; green, 99; blue, 99 }  ,opacity=1 ]  (77,122) node[anchor=east, scale=0.75]{1} (97,122) node[anchor=east, scale=0.75]{2} (117,122) node[anchor=east, scale=0.75]{3} (47,90) node[anchor=east, scale=0.75]{1} (47,70) node[anchor=east, scale=0.75]{2} ;
%Straight Lines [id:da7907191510979541] 
\draw [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,draw opacity=1 ]   (50,110) -- (68,110) ;
\draw [shift={(70,110)}, rotate = 180] [fill={rgb, 255:red, 68; green, 187; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da08591236108943567] 
\draw [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,draw opacity=1 ]   (50,110) -- (50,92) ;
\draw [shift={(50,90)}, rotate = 450] [fill={rgb, 255:red, 236; green, 215; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da8604970476920195] 
\draw [color={rgb, 255:red, 196; green, 120; blue, 52 }  ,draw opacity=1 ]   (50,110) -- (108.34,71.11) ;
\draw [shift={(110,70)}, rotate = 506.31] [fill={rgb, 255:red, 196; green, 120; blue, 52 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Shape: Grid [id:dp42484990994868554] 
\draw  [draw opacity=0][dash pattern={on 4.5pt off 4.5pt}] (167.37,67.02) -- (278.79,19.84) -- (364.3,93.31) -- (252.88,140.49) -- cycle ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (167.37,67.02) -- (252.88,140.49)(185.79,59.22) -- (271.29,132.7)(204.2,51.42) -- (289.71,124.9)(222.62,43.62) -- (308.13,117.1)(241.04,35.83) -- (326.54,109.3)(259.45,28.03) -- (344.96,101.5)(277.87,20.23) -- (363.38,93.7) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (167.37,67.02) -- (278.79,19.84)(184.3,81.57) -- (295.72,34.39)(201.23,96.12) -- (312.66,48.94)(218.16,110.67) -- (329.59,63.49)(235.1,125.22) -- (346.52,78.04)(252.03,139.77) -- (363.45,92.59) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}]  ;
%Shape: Axis 2D [id:dp9311114480875433] 
\draw [color={rgb, 255:red, 150; green, 148; blue, 148 }  ,draw opacity=1 ] (244.85,121.07) -- (331.49,84.59)(200.48,71.72) -- (259.41,122.5) (320.81,83.67) -- (331.49,84.59) -- (329.26,90.95) (201.79,78.76) -- (200.48,71.72) -- (211.01,74.88) (267.72,106.01) -- (276.18,113.3)(286.15,98.25) -- (294.61,105.54)(304.58,90.49) -- (313.04,97.78)(231.99,104.78) -- (241.21,100.9)(215.07,90.2) -- (224.29,86.32) ;
\draw [color={rgb, 255:red, 99; green, 99; blue, 99 }  ,opacity=1 ]  (291.4,116.43) node[anchor=east, scale=0.75]{1} (309.83,108.67) node[anchor=east, scale=0.75]{2} (328.27,100.91) node[anchor=east, scale=0.75]{3} (236.68,104.74) node[anchor=east, scale=0.75]{1} (219.77,90.17) node[anchor=east, scale=0.75]{2} ;
%Straight Lines [id:da11304125073566951] 
\draw [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,draw opacity=1 ]   (253.51,117.42) -- (270.09,110.4) ;
\draw [shift={(271.93,109.62)}, rotate = 517.05] [fill={rgb, 255:red, 68; green, 187; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da6687830595734379] 
\draw [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,draw opacity=1 ]   (253.51,117.42) -- (238.1,104.17) ;
\draw [shift={(236.58,102.87)}, rotate = 400.66999999999996] [fill={rgb, 255:red, 236; green, 215; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da2683385139716927] 
\draw [color={rgb, 255:red, 196; green, 120; blue, 52 }  ,draw opacity=1 ]   (253.51,117.42) -- (311.85,78.53) ;
\draw [shift={(313.51,77.42)}, rotate = 506.31] [fill={rgb, 255:red, 196; green, 120; blue, 52 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Shape: Grid [id:dp7681422337699955] 
\draw  [draw opacity=0][dash pattern={on 4.5pt off 4.5pt}] (409.49,31.43) -- (522.34,31.43) -- (522.34,132.2) -- (409.49,132.2) -- cycle ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (409.49,31.43) -- (409.49,132.2)(429.49,31.43) -- (429.49,132.2)(449.49,31.43) -- (449.49,132.2)(469.49,31.43) -- (469.49,132.2)(489.49,31.43) -- (489.49,132.2)(509.49,31.43) -- (509.49,132.2) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (409.49,31.43) -- (522.34,31.43)(409.49,51.43) -- (522.34,51.43)(409.49,71.43) -- (522.34,71.43)(409.49,91.43) -- (522.34,91.43)(409.49,111.43) -- (522.34,111.43)(409.49,131.43) -- (522.34,131.43) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}]  ;
%Shape: Axis 2D [id:dp6852106606144879] 
\draw [color={rgb, 255:red, 150; green, 148; blue, 148 }  ,draw opacity=1 ] (420.2,111.14) -- (514.2,111.14)(449.49,48.5) -- (449.49,118.17) (507.2,106.14) -- (514.2,111.14) -- (507.2,116.14) (444.49,55.5) -- (449.49,48.5) -- (454.49,55.5) (469.49,106.14) -- (469.49,116.14)(489.49,106.14) -- (489.49,116.14)(429.49,106.14) -- (429.49,116.14)(444.49,91.14) -- (454.49,91.14)(444.49,71.14) -- (454.49,71.14) ;
\draw [color={rgb, 255:red, 99; green, 99; blue, 99 }  ,opacity=1 ]  (476.49,123.14) node[anchor=east, scale=0.75]{1} (496.49,123.14) node[anchor=east, scale=0.75]{2} (436.49,123.14) node[anchor=east, scale=0.75]{-1} (446.49,91.14) node[anchor=east, scale=0.75]{1} (446.49,71.14) node[anchor=east, scale=0.75]{2} ;
%Straight Lines [id:da5380542207591497] 
\draw [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,draw opacity=1 ]   (449.6,111.2) -- (487.81,92.09) ;
\draw [shift={(489.6,91.2)}, rotate = 513.4300000000001] [fill={rgb, 255:red, 68; green, 187; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da3969076031550316] 
\draw [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,draw opacity=1 ]   (449.6,111.2) -- (431.01,92.61) ;
\draw [shift={(429.6,91.2)}, rotate = 405] [fill={rgb, 255:red, 236; green, 215; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;


% Text Node
\draw (77.67,81.67) node [color={rgb, 255:red, 196; green, 120; blue, 52 }  ,opacity=1 ] [align=left] {A};
% Text Node
\draw (58.33,120.33) node [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,opacity=1 ] [align=left] {i};
% Text Node
\draw (39.33,103.33) node [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,opacity=1 ] [align=left] {j};
% Text Node
\draw (264.33,123.58) node [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,opacity=1 ] [align=left] {i};
% Text Node
\draw (236.83,113.08) node [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,opacity=1 ] [align=left] {j};
% Text Node
\draw (278.67,88.17) node [color={rgb, 255:red, 196; green, 120; blue, 52 }  ,opacity=1 ] [align=left] {A};
% Text Node
\draw (475.48,107.86) node [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,opacity=1 ] [align=left] {i};
% Text Node
\draw (439.79,108.14) node [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,opacity=1 ] [align=left] {j};
% Text Node
\draw (86,157) node [color={rgb, 255:red, 117; green, 107; blue, 107 }  ,opacity=1 ] [align=left] {Surjit's Grid};
% Text Node
\draw (264,155) node [color={rgb, 255:red, 117; green, 107; blue, 107 }  ,opacity=1 ] [align=left] {Prachee's Grid};
% Text Node
\draw (462.67,159) node [color={rgb, 255:red, 117; green, 107; blue, 107 }  ,opacity=1 ] [align=left] {Translation from\\Prachee's Grid To\\Surjit's Grid };


\end{tikzpicture}



when I say $\overrightarrow{A}=3\hat{i}+2\hat{j}$, what I mean is walk $3\times length(\hat{i})$ in $\hat{i}$ direction then $2\times length(\hat{j})$ in $\hat{j}$ direction.(Here length of $\hat{i}$ and $\hat{j}$ are 1 unit each)

Our vector entirely depends on the choice of grid system (angle, spacing between grid lines) and length, directions of basis vectors. That's a free choice we could have chosen any thing.

Suppose I have a friend Prachee, who decided to chose her coordinate system and her basis vectors entirely different from ours as shown in the above picture.

In her coordinate system, $\overrightarrow{A}=3\hat{i}+2\hat{j}$ would mean entirely different vector, because her $\hat{i}$ and $\hat{j}$ are different. To understand what she means by $\overrightarrow{A}$, we've to know what her basis vectors are.

In terms of our coordinate system, Prachee's basis vectors are, $\hat{i}=\begin{bmatrix}2\\1\end{bmatrix}$ and $\hat{j}=\begin{bmatrix}-1\\1\end{bmatrix}$ as shown in the above picture

So when she says, $\overrightarrow{A}=3\hat{i}+2\hat{j}$ &nbsp; what she means in our coordinate system is, &nbsp; $3\begin{bmatrix}2\\1\end{bmatrix}+2\begin{bmatrix}-1\\1\end{bmatrix}=\begin{bmatrix}4\\5\end{bmatrix}$

It looks familiar.. it's matrix-vector multiplication / transformation $\begin{bmatrix}2&-1\\1&1\end{bmatrix}\begin{bmatrix}3\\2\end{bmatrix}=\begin{bmatrix}4\\5\end{bmatrix}$

> Transformation matrix $T=\begin{bmatrix}2&-1\\1&1\end{bmatrix}$  translates her vector into our language i.e. when she says $\begin{bmatrix}3\\2\end{bmatrix}$ it means $\begin{bmatrix}4\\5\end{bmatrix}$. Similarly, to translate a vector from our coordinate system to her coordinate system, we've to apply that transformation in reverse, i.e. $\begin{bmatrix}2&-1\\1&1\end{bmatrix}^{-1}\begin{bmatrix}4\\5\end{bmatrix}=\begin{bmatrix}3\\2\end{bmatrix}$

Hmmm... so now we know how to translate one vector from one base system to another base system.. But how about translating transformations from one base system to another base system ?

&nbsp;

In our grid system if we want to rotate the space $90^{\circ}$ counter-clockwise, our transformation matrix will look like $\begin{bmatrix}0&-1\\1&0\end{bmatrix}$, but what will Prachee's transformation matrix look like ?

\tikzset{every picture/.style={line width=0.75pt}} 

\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,753); %set diagram left start at 0, and has height of 753

%Shape: Grid [id:dp615562244133943] 
\draw  [draw opacity=0][dash pattern={on 4.5pt off 4.5pt}] (30,30) -- (184.33,30) -- (184.33,131) -- (30,131) -- cycle ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (30,30) -- (30,131)(50,30) -- (50,131)(70,30) -- (70,131)(90,30) -- (90,131)(110,30) -- (110,131)(130,30) -- (130,131)(150,30) -- (150,131)(170,30) -- (170,131) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (30,30) -- (184.33,30)(30,50) -- (184.33,50)(30,70) -- (184.33,70)(30,90) -- (184.33,90)(30,110) -- (184.33,110)(30,130) -- (184.33,130) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}]  ;
%Shape: Axis 2D [id:dp5289923327303094] 
\draw [color={rgb, 255:red, 150; green, 148; blue, 148 }  ,draw opacity=1 ] (29.13,90) -- (85.13,90)(50,47.1) -- (50,94.4) (78.13,85) -- (85.13,90) -- (78.13,95) (45,54.1) -- (50,47.1) -- (55,54.1) (70,85) -- (70,95)(45,70) -- (55,70) ;
\draw [color={rgb, 255:red, 99; green, 99; blue, 99 }  ,opacity=1 ]  (77,102) node[anchor=east, scale=0.75]{1} (47,70) node[anchor=east, scale=0.75]{1} ;
%Straight Lines [id:da7907191510979541] 
\draw [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,draw opacity=1 ]   (50,90) -- (68,90) ;
\draw [shift={(70,90)}, rotate = 180] [fill={rgb, 255:red, 68; green, 187; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da08591236108943567] 
\draw [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,draw opacity=1 ]   (50,90) -- (50,72) ;
\draw [shift={(50,70)}, rotate = 450] [fill={rgb, 255:red, 236; green, 215; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Shape: Grid [id:dp42484990994868554] 
\draw  [draw opacity=0][dash pattern={on 4.5pt off 4.5pt}] (224.04,59.35) -- (335.46,12.17) -- (420.96,85.65) -- (309.54,132.83) -- cycle ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (224.04,59.35) -- (309.54,132.83)(242.45,51.56) -- (327.96,125.03)(260.87,43.76) -- (346.38,117.23)(279.29,35.96) -- (364.79,109.43)(297.7,28.16) -- (383.21,101.63)(316.12,20.36) -- (401.63,93.83)(334.54,12.56) -- (420.04,86.04) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (224.04,59.35) -- (335.46,12.17)(240.97,73.9) -- (352.39,26.72)(257.9,88.45) -- (369.32,41.27)(274.83,103) -- (386.25,55.82)(291.76,117.55) -- (403.19,70.37)(308.7,132.1) -- (420.12,84.92) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}]  ;
%Shape: Axis 2D [id:dp9311114480875433] 
\draw [color={rgb, 255:red, 150; green, 148; blue, 148 }  ,draw opacity=1 ] (301.52,113.4) -- (388.15,76.93)(257.15,64.05) -- (316.07,114.83) (377.47,76) -- (388.15,76.93) -- (385.93,83.29) (258.46,71.09) -- (257.15,64.05) -- (267.67,67.21) (324.38,98.35) -- (332.84,105.64)(342.82,90.59) -- (351.28,97.88)(361.25,82.83) -- (369.71,90.12)(288.66,97.11) -- (297.87,93.23)(271.74,82.54) -- (280.95,78.66) ;
\draw [color={rgb, 255:red, 99; green, 99; blue, 99 }  ,opacity=1 ]  (348.07,108.76) node[anchor=east, scale=0.75]{1} (366.5,101) node[anchor=east, scale=0.75]{2} (384.93,93.24) node[anchor=east, scale=0.75]{3} (293.35,97.08) node[anchor=east, scale=0.75]{1} (276.43,82.5) node[anchor=east, scale=0.75]{2} ;
%Straight Lines [id:da11304125073566951] 
\draw [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,draw opacity=1 ]   (310.18,109.75) -- (326.76,102.73) ;
\draw [shift={(328.6,101.95)}, rotate = 517.05] [fill={rgb, 255:red, 68; green, 187; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da6687830595734379] 
\draw [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,draw opacity=1 ]   (310.18,109.75) -- (294.77,96.51) ;
\draw [shift={(293.25,95.2)}, rotate = 400.66999999999996] [fill={rgb, 255:red, 236; green, 215; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Shape: Axis 2D [id:dp29005070582983494] 
\draw [color={rgb, 255:red, 150; green, 148; blue, 148 }  ,draw opacity=1 ] (89.13,90) -- (169.33,90)(130,47.1) -- (130,94.4) (162.33,85) -- (169.33,90) -- (162.33,95) (125,54.1) -- (130,47.1) -- (135,54.1) (150,85) -- (150,95)(110,85) -- (110,95)(125,70) -- (135,70) ;
\draw [color={rgb, 255:red, 99; green, 99; blue, 99 }  ,opacity=1 ]  (157,102) node[anchor=east, scale=0.75]{1} (117,102) node[anchor=east, scale=0.75]{-1} (127,70) node[anchor=east, scale=0.75]{1} ;
%Straight Lines [id:da4080200943130452] 
\draw [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,draw opacity=1 ]   (130,90) -- (130,72) ;
\draw [shift={(130,70)}, rotate = 450] [fill={rgb, 255:red, 68; green, 187; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da2013429893506682] 
\draw [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,draw opacity=1 ]   (130,90) -- (112,90) ;
\draw [shift={(110,90)}, rotate = 360] [fill={rgb, 255:red, 236; green, 215; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Shape: Grid [id:dp03722792108984363] 
\draw  [draw opacity=0][dash pattern={on 4.5pt off 4.5pt}] (405.24,52.95) -- (516.66,5.77) -- (602.16,79.25) -- (490.74,126.43) -- cycle ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (405.24,52.95) -- (490.74,126.43)(423.65,45.16) -- (509.16,118.63)(442.07,37.36) -- (527.58,110.83)(460.49,29.56) -- (545.99,103.03)(478.9,21.76) -- (564.41,95.23)(497.32,13.96) -- (582.83,87.43)(515.74,6.16) -- (601.24,79.64) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (405.24,52.95) -- (516.66,5.77)(422.17,67.5) -- (533.59,20.32)(439.1,82.05) -- (550.52,34.87)(456.03,96.6) -- (567.45,49.42)(472.96,111.15) -- (584.39,63.97)(489.9,125.7) -- (601.32,78.52) ; \draw  [color={rgb, 255:red, 204; green, 204; blue, 204 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}]  ;
%Shape: Axis 2D [id:dp994841806392778] 
\draw [color={rgb, 255:red, 150; green, 148; blue, 148 }  ,draw opacity=1 ] (534.43,72.82) -- (508.38,11.46)(495.77,108.78) -- (535.83,62.01) (507.48,22.15) -- (508.38,11.46) -- (514.75,13.67) (502.81,107.45) -- (495.77,108.78) -- (498.9,98.24) (520.37,52.52) -- (527.64,44.04)(512.56,34.11) -- (519.82,25.63)(519.25,88.25) -- (515.34,79.05) ;
\draw [color={rgb, 255:red, 99; green, 99; blue, 99 }  ,opacity=1 ]  (537.73,29.8) node[anchor=east, scale=0.75]{1} (529.91,11.39) node[anchor=east, scale=0.75]{2} (526.21,84.55) node[anchor=east, scale=0.75]{1} ;
%Straight Lines [id:da42278134995744465] 
\draw [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,draw opacity=1 ]   (531.82,66.69) -- (525.37,50.15) ;
\draw [shift={(524.65,48.29)}, rotate = 428.7] [fill={rgb, 255:red, 68; green, 187; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da8118993721001211] 
\draw [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,draw opacity=1 ]   (531.82,66.69) -- (518.82,81.63) ;
\draw [shift={(517.5,83.14)}, rotate = 311.03] [fill={rgb, 255:red, 236; green, 215; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;


% Text Node
\draw (141.58,83.33) node [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,opacity=1 ] [align=left] {i};
% Text Node
\draw (45,82) node [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,opacity=1 ] [align=left] {j};
% Text Node
\draw (320.67,115.92) node [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,opacity=1 ] [align=left] {i};
% Text Node
\draw (298.83,109.08) node [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,opacity=1 ] [align=left] {j};
% Text Node
\draw (103.75,149.25) node [color={rgb, 255:red, 117; green, 107; blue, 107 }  ,opacity=1 ] [align=left] {Surjit's Grid};
% Text Node
\draw (404.47,143.8) node [color={rgb, 255:red, 117; green, 107; blue, 107 }  ,opacity=1 ] [align=left] {Prachee's Grid};
% Text Node
\draw (126,98) node [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,opacity=1 ] [align=left] {j};
% Text Node
\draw (539.81,52.2) node [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,opacity=1 ] [align=left] {i};
% Text Node
\draw (535.12,80.51) node [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,opacity=1 ] [align=left] {j};


\end{tikzpicture}

You might think, huh easy.. just translate each column of our matrix to her language. simple right! No, because our matrix describes where our basis vectors land after transformation, if we translate each column of our matrix to her language, she'll get where our basis vectors will land after transformation but in her language. But that's wrong. She wants to know where her basis vectors will land after transformation, not ours.. and of course she wants it in her language.

&nbsp;

One way to think about it is...  
 1. Take any vector $\overrightarrow{V}$ in her language  
 2. Translate it to our language.  
 3. Apply transformation  
 4. Translate back to her language.  

$\textcolor[rgb]{0,0.73,0.74}{\begin{bmatrix}
2 & -1\\
1 & 1
\end{bmatrix}^{-1}}\textcolor[rgb]{0.21,0.5,0}{\begin{bmatrix}
0 & -1\\
1 & 0
\end{bmatrix}}\textcolor[rgb]{0,0.73,0.74}{\begin{bmatrix}
2 & -1\\
1 & 1
\end{bmatrix}}\textcolor[rgb]{0.76,0.7,0.09}{\vec{V}}$
&nbsp; &nbsp; &nbsp; Applied from right to left one by one...

&nbsp;  
Expressions like $A^{-1}MA$ represents, $A$ and $A^{-1}$ : translation from one base system to another and vice versa and $M$ : some kind of transformation.


# Igenvectors and Igenvalues

After a transformation most of the vectors will move away from it's original span(rotate with some angle), but there'll be some special vectors which will only scale by a factor but not rotate.

In the following transformation $T=\begin{bmatrix}3&1\\0&2\end{bmatrix}$, $\hat{i}$ is just scaled by 3, so all the vectors in the span of $\hat{i}$ will stay in that span after transformation, it is highlighted in green color in the following image, and other set of vectors which were in the span of yellow line, will stay in the yellow line after transformation. 

> These set of vectors which stay in their original span after transformation are called eigenvectos and by what factors they are scaled / squished are called igenvalues of the transformation.



\tikzset{every picture/.style={line width=0.75pt}} 
\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,604); %set diagram left start at 0, and has height of 604

%Shape: Grid [id:dp9125856180416749] 
\draw  [draw opacity=0][dash pattern={on 4.5pt off 4.5pt}] (60,60) -- (331.5,60) -- (331.5,241.5) -- (60,241.5) -- cycle ; \draw  [color={rgb, 255:red, 201; green, 201; blue, 201 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (60,60) -- (60,241.5)(90,60) -- (90,241.5)(120,60) -- (120,241.5)(150,60) -- (150,241.5)(180,60) -- (180,241.5)(210,60) -- (210,241.5)(240,60) -- (240,241.5)(270,60) -- (270,241.5)(300,60) -- (300,241.5)(330,60) -- (330,241.5) ; \draw  [color={rgb, 255:red, 201; green, 201; blue, 201 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}] (60,60) -- (331.5,60)(60,90) -- (331.5,90)(60,120) -- (331.5,120)(60,150) -- (331.5,150)(60,180) -- (331.5,180)(60,210) -- (331.5,210)(60,240) -- (331.5,240) ; \draw  [color={rgb, 255:red, 201; green, 201; blue, 201 }  ,draw opacity=1 ][dash pattern={on 4.5pt off 4.5pt}]  ;
%Straight Lines [id:da6741773164712463] 
\draw [color={rgb, 255:red, 171; green, 240; blue, 148 }  ,draw opacity=1 ]   (62,150) -- (328,150) ;
\draw [shift={(330,150)}, rotate = 180] [fill={rgb, 255:red, 171; green, 240; blue, 148 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
\draw [shift={(60,150)}, rotate = 0] [fill={rgb, 255:red, 171; green, 240; blue, 148 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da38396878925028455] 
\draw [color={rgb, 255:red, 171; green, 240; blue, 148 }  ,draw opacity=1 ]   (92,150) -- (298,150) ;
\draw [shift={(300,150)}, rotate = 180] [fill={rgb, 255:red, 171; green, 240; blue, 148 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
\draw [shift={(90,150)}, rotate = 0] [fill={rgb, 255:red, 171; green, 240; blue, 148 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da20716200635727033] 
\draw [color={rgb, 255:red, 171; green, 240; blue, 148 }  ,draw opacity=1 ]   (122,150) -- (268,150) ;
\draw [shift={(270,150)}, rotate = 180] [fill={rgb, 255:red, 171; green, 240; blue, 148 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
\draw [shift={(120,150)}, rotate = 0] [fill={rgb, 255:red, 171; green, 240; blue, 148 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da7991585243687713] 
\draw [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,draw opacity=1 ]   (180,150) -- (268,150) ;
\draw [shift={(270,150)}, rotate = 180] [fill={rgb, 255:red, 68; green, 187; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da5349784052088964] 
\draw [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,draw opacity=1 ]   (180,150) -- (209.11,91.79) ;
\draw [shift={(210,90)}, rotate = 476.57] [fill={rgb, 255:red, 236; green, 215; blue, 0 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

%Straight Lines [id:da06890502254323683] 
\draw [color={rgb, 255:red, 211; green, 209; blue, 93 }  ,draw opacity=1 ]   (91.41,61.41) -- (268.59,238.59) ;
\draw [shift={(270,240)}, rotate = 225] [fill={rgb, 255:red, 211; green, 209; blue, 93 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
\draw [shift={(90,60)}, rotate = 45] [fill={rgb, 255:red, 211; green, 209; blue, 93 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da827135506353204] 
\draw [color={rgb, 255:red, 211; green, 209; blue, 93 }  ,draw opacity=1 ]   (121.41,91.41) -- (238.59,208.59) ;
\draw [shift={(240,210)}, rotate = 225] [fill={rgb, 255:red, 211; green, 209; blue, 93 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
\draw [shift={(120,90)}, rotate = 45] [fill={rgb, 255:red, 211; green, 209; blue, 93 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da4391292845783974] 
\draw [color={rgb, 255:red, 211; green, 209; blue, 93 }  ,draw opacity=1 ]   (151.41,121.41) -- (208.59,178.59) ;
\draw [shift={(210,180)}, rotate = 225] [fill={rgb, 255:red, 211; green, 209; blue, 93 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
\draw [shift={(150,120)}, rotate = 45] [fill={rgb, 255:red, 211; green, 209; blue, 93 }  ,fill opacity=1 ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;

% Text Node
\draw (191.83,111.67) node [color={rgb, 255:red, 236; green, 215; blue, 0 }  ,opacity=1 ] [align=left] {j};
% Text Node
\draw (205.5,160.33) node [color={rgb, 255:red, 68; green, 187; blue, 0 }  ,opacity=1 ] [align=left] {i};
% Text Node
\draw (113.83,99) node [color={rgb, 255:red, 211; green, 209; blue, 93 }  ,opacity=1 ] [align=left] {2};
% Text Node
\draw (106.5,164.67) node [color={rgb, 255:red, 171; green, 240; blue, 148 }  ,opacity=1 ] [align=left] {3};


\end{tikzpicture}

In the avbove example, there are two sets of igen vectors having igenvalue = 2 for yellow, and igenvalue = 3 for green vectors. I means, after transformation, the yellow vectors will be scaled by 2 and green vectors will be scaled by 3, they'll not change directions.

Alright but what is the use of it ?  
Take for example a 3D object's rotation, if you can find it's igenvector, you've found it's axis of rotation, igenvalue will be 1, because it's rotation only. It's much easier to think about rotation in terms of axis of rotation and by what angle it rotates, rather than thinking about 3x3 matrix associated with this transformation.

