## Vectors

**Physics** 
a straight line pointing at a direction in space,
has a specific length and direction.
vector is same if you move it around in space as long as length and direction is unchanged
$\begin{bmatrix}a \\ b\end{bmatrix}$  where a represents x-coordinate and b represents y-coordinate 

**Computer Science**
it represents some properties a specific product
used in analytics
$\begin{bmatrix}a \\ b\end{bmatrix}$ where a might represent price of a house and b size of the house in sq ft. here order is important.

**Maths**
anything can be a vector as long as it obeys the laws of vector multiplication and addition. 
$\hat{\imath}$ is unit vector in x direction
$\hat{\jmath}$ is unit vector in y direction
$\hat{k}$ is unit vector in z direction
$\begin{bmatrix}a \\ b\end{bmatrix}$ =  $a\hat{i}+b\hat{j}$         and        $\begin{bmatrix}a \\ b \\ c\end{bmatrix}$ =  $a\hat{i}+b\hat{j}+c\hat{k}$ 


$\overrightarrow{A}+\overrightarrow{B}=\overrightarrow{C}$ means if you walk along the $\overrightarrow{A}$ and then along $\overrightarrow{B}$ it’ll be same as walking along $\overrightarrow{C}$ 

$\begin{bmatrix}a \\ b\end{bmatrix} + \begin{bmatrix}c \\ d\end{bmatrix}=\begin{bmatrix}a+c \\ b+d\end{bmatrix}$ 

$2\times\begin{bmatrix}a \\ b\end{bmatrix}=\begin{bmatrix}2a \\ 2b\end{bmatrix}=2\times(a\hat{i}+b\hat{j})$ ==> it means 2 is scaling the vector, so it’s called scaler.



## Basis Vector

$\overrightarrow{A}=\begin{bmatrix}3 \\ -2\end{bmatrix}=3(\hat{i})-2(\hat{j})$  is a sum of two scaled vectors

here $\hat{i}$ and $\hat{j}$ are the basis vectors where they’re unit vectors in x and y direction respectively.

**span of basis vectors** 
Area of space you can cover by scaling and adding vectors is the span of those vectors

2D: 
-- using two vectors if you scale and add those and create every possible vector, you’ll cover entire 2D plane. So span of two vectors is a plane.          --- two vectors shouldn’t lie on top of each other, that way scaling and adding them will create vector which will also lie on top of them, so span will become a line (both vectors are linearly dependent)
-- if both the vectors are zero, then you’re stuck at origin.

$a\overrightarrow{v}+b\overrightarrow{w}$ here by changing $a$ & $b$ (scalers) you can reach every point on a plane. this is called **Linear combination** of $\overrightarrow{v}$ and $\overrightarrow{w}$

3D
-- if you imagine span of two independent vectors as a plane, adding a 3rd vector will move the plane back and forth along it’s direction, so the span is entire 3D space.
-- 3rd vector shouldn’t be lying on the span of other two vectors, other wise it won’t affect the span at all, it’ll be redundant. (3rd vector is linearly dependent on other two)

$a\overrightarrow{u}+b\overrightarrow{v}+c\overrightarrow{w}$ here by changing $a$, $b$ and $c$ you can grasp all the points in 3D space.

> Technical Definition: The basis of a vector space (2D or 3D) is a set of **linearly independent** vectors that **span** the full space (2D or 3D)



## Linear Transformation

> Transformation is basically a function that takes a vector and spits out another vector
> Linear Transformation : origin must not change and straight line should output straight line not a curve.

Every vector is made by scaling and adding the basis vectors. So in order to transform (keeping the origin constant scaling and changing the direction of the vector) can be done by scaling and changing the direction of basis vectors. 

$\overrightarrow{A}=3\hat{i}+4\hat{j}$
So the idea is decide where you want basis vectors to land after transformation and replace the new $\hat{i},\hat{j}$ vectors in the above equation.

suppose $\hat{i}$ and $\hat{j}$ are basis vectors and their coordinates are (1,0) and (0, 1), now after transforming these two their new coordinates are (1, 2) and (-3, 4) 

$3\times\begin{bmatrix}1 \\ 2\end{bmatrix}+4\times\begin{bmatrix}-3 \\ 4\end{bmatrix} =>\begin{bmatrix}1&-3\\2&4\end{bmatrix}\times\begin{bmatrix}3 \\ 4\end{bmatrix}=>\begin{bmatrix}1(3)+(-3)(4) \\ 2(3)+4(4)\end{bmatrix}=>\begin{bmatrix}-9 \\ 22\end{bmatrix}=-9\hat{i}+22\hat{j}$ 



$\hat{i}$ coordinates on 1st column, $\hat{j}$ coordinates on 2nd column

$$F_{Transform}(\overrightarrow{A})=\overrightarrow{B}=\begin{bmatrix}a & c \\b & d \end{bmatrix}\times\begin{bmatrix}A\hat{i} \\ A\hat{j}\end{bmatrix}=\begin{bmatrix}a(A\hat{i})+c(A\hat{j}) \\ b(A\hat{i})+d(A\hat{j})\end{bmatrix}$$ 

**Matrix Multiplication**
multiplying a matrix with a vector transforms it. So multiplying two matrices to that vector means applying two transformations.
$\begin{bmatrix}a & c \\b & d \end{bmatrix}\begin{bmatrix}e & g\\f & h \end{bmatrix}\begin{bmatrix}x \\ y\end{bmatrix}=\begin{bmatrix}? & ? \\? & ? \end{bmatrix}\begin{bmatrix}x \\ y\end{bmatrix}$      the resultant matrix represents the final transformation after applying both the transformations on $\begin{bmatrix}x \\ y\end{bmatrix}$

