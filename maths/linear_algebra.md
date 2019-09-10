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
-- So in order to transform (keeping the origin constant) just scale(-ve or +ve) and change the   direction(angle) of basis vectors.  
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

Similarly if you take 3 basis vectors in a 3D space $\hat{i}$, $\hat{j}$ and $\hat{k}$, you'll have 3x3 matrix to transform a vector in this 3d space where each column represents coordinates of $\hat{i}$, $\hat{j}$ and $\hat{k}$

$\begin{bmatrix}a & b & c \\d & e & f \\g & h & i \end{bmatrix}\begin{bmatrix}x \\ y \\ z\end{bmatrix}=x\begin{bmatrix}a \\ d \\g \end{bmatrix} + y \begin{bmatrix}b \\ e \\ h\end{bmatrix} + z\begin{bmatrix}e \\ f \\ i\end{bmatrix}=\begin{bmatrix}ax+by+cz \\ dx+ey+fz \\ gx+hy+iz\end{bmatrix}$   

# Determinant

-- We know that a matrix basically means transformation.  
-- Determinant of a matrix tells us by what factor a particular area will be squished down or scaled up if we apply that transformation.  

* +ve whole det -> area will be scaled up
* fraction det -> area will be scaled down
* -ve det -> orientation will be flipped. e.g. if originally $\hat{j}$ was at the left of $\hat{i}$, after transformation $\hat{j}$ will be at the right side of $\hat{i}$.
* 0 -> area becomes zero, which means $\hat{i}$ and $\hat{j}$ land on top of each other.

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

Think about it for a moment, you want to find out $\begin{bmatrix}x\\y\\z\end{bmatrix}$ vector, which after transformation becomes $\begin{bmatrix}5\\-3\\9\end{bmatrix}$. So if you just apply the transformation in reverse on $\begin{bmatrix}5\\-3\\9\end{bmatrix}$, you'll get the original vector.

$$\begin{bmatrix}x\\y\\z\end{bmatrix}=\begin{bmatrix}5\\-3\\9\end{bmatrix}\begin{bmatrix}2 & 3 & -4 \\3 & 0 & 4 \\0 & -6 & 2 \end{bmatrix}^{-1}$$

> NOTE: If determinant of a matrix is zero, this transformation squishes the area to a single line(area=0, for 3D volume=0), That's why applying the reverse transformation is not possible. There's no way to un-squish the line.  
> -After transformation the vector will most probably end up at zero(length=0), there's no un-squishing the vector.  
> -However, it's still possible to find a solution even if the determinant is zero, the vector must land on top of $\hat{i}$ and $\hat{j}$.  
> -In 2D transformation the probability to find solution is more as compared to 3D, because, 2D plane will be squished to a line, but in 3D entire 3D space will be squished to a single line.

# Identity Matrix

If matrix $A$ represents a transformation $A^{-1}$ will represent reverse of that transformation, so $A\times A^{-1}=I$, where $I$ is the identity matrix.

-- identity matrix does no change to the vector on transformation.

# Rank of Matrix

Rank : Dimension of the output after transformation.  
If transformation squishes the area to a line : Rank = 1 (1 dimensional)  
If transformation squishes the area to a plane, Rank = 2 (2 dimensional)  
