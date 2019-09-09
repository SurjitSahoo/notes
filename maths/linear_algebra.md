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
$\overrightarrow{A}=\begin{bmatrix}3 \\ -2\end{bmatrix}=>(3\times\hat{i})+(-2
\times\hat{j})$ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $\hat{i}$ and $\hat{j}$ are scaled and added to form $\overrightarrow{A}$

here $\hat{i}$ and $\hat{j}$ are the basis vectors (unit vectors)

**span of basis vectors**   
Area of space you can cover by scaling and adding vectors is the span of those vectors

2D:  
In 2D there are two basis vectors $\hat{i}$ and $\hat{j}$ by scaling and adding these two vectors if you create every possible vector, you’ll be able to cover entire 2D plane.  
So span of two vectors is a plane.  
-- If both vectors lie on top of each other, scaling and adding them will create vector which will also lie on top of them, so span will become a line (both vectors are linearly dependent)  
-- if both the vectors are zero, then you’re stuck at origin.

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
-- So in order to transform (keeping the origin constant) just scale(-ve or +ve) and changing the   direction(angle) of basis vectors.  
-- By doing that we get entire new basis vectors.

$\overrightarrow{A}=3\hat{i}+4\hat{j}$ &nbsp;&nbsp; is a vector of specific length pointing in a direction, we've to transform it.  
So the idea is to decide where you want the basis vectors to land after transformation and replace the new $\hat{i},\hat{j}$ in the above equation.

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

