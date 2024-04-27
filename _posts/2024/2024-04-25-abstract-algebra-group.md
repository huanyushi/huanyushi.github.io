---
title:      "Abstract Algebra: A Brief Summary of Group Theory"
date:       2024-04-25
categories: [Mathematics, Abstract Algebra]
tag: [abstract algebra]
img_path : /assets/img/in-post/2024/2024-04-25/
math: true
---

## Basic axioms

**Definition of *binary operation***:

1. A *binary operation* $\star$ on a set $G$ is a function $\star$: $G\times G \to G$. Note that for any $a,b\in G$, we shall write $a\star b $ for $\star(a,b)$.
2. A binary operation $\star$ on a set $G$ is *associative* if $\forall a,b,c \in G$, $a\star(b\star c) = (a\star b) \star c$.
3. If $\star$ is a binary operation on a set $G$,
   -  we say $a,b\in G$ are *commute* if $a\star b =b\star a$;
   -  we say $\star$ (or $G$) is *commutative* if $\forall a,b\in G$, $a\star b = b\star a$.
 
<details markdown="1">
<summary> Examples: </summary>
- $+,\times$ are commutative binary operations on $\mathbb{Z}$ (or $\mathbb{Q}, \mathbb{R},\mathbb{C}$).
- $-$ is a noncommutative binary operation on $\mathbb{Z}$, where $a-b\neq  b-a$.
- $-$ is not a binary operation on $\mathbb{Z}^{+}$ (nor $\mathbb{Q}^{+},\mathbb{R}^{+}$) because for $a,b\in\mathbb{Z}^{+}$, $a-b \notin \mathbb{Z}^{+}$ if $a < b $.
</details>

**Definition of *group***:
1. A *group* is an order pair $(G,\star)$ where $G$ is a set and $\star$ is a binary operation on $G$ satisfying the following axioms:
   1. $\star$ is *associative*, i.e., $\forall a,b,c\in G$,$(a\star b)\star c = a\star (b\star c)$,
   2. $\exists e \in G$ called *identity*, such that $\forall a\in G$, $a\star e =e \star a = a$,
   3. $\forall a \in G$, $\exists a^{-1}\in G$ called *inverse*, such that $a\star a^{-1} = a^{-1}\star a =e$.
2. The group $(G,\star)$ is called *abelian* (or *commutative*) if $\forall a,b\in G$, $a\star b = b\star a$. 
3. The group $(G,\star)$ is called *finite* if in addition $G$ is a finite set. 

<details markdown="1">
<summary> Examples: </summary>
- $\mathbb{Z}, \mathbb{Q}, \mathbb{R}$ and $\mathbb{C}$ are groups under $+$ with $e=0$ and $\forall a, a^{-1}=-a$
- $\mathbb{Q}-\qty{0},\mathbb{R}-\qty{0}, \mathbb{C}-\qty{0}$, $\mathbb{Q}^{+},\mathbb{R}^{+}$ are groups under $\times$ with $e=0$ and $\forall a, a^{-1}=\frac{1}{a}$.
</details>

> For simplicity, we usually say $G$ is a group, but that doesn't imply the set itself is a group, we still need to specify the binary operation $\star$. E.g., $(\mathbb{Z},+)$ is a group, but $(\mathbb{Z},\times)$ is not a group.
{: .prompt-info}

If $(A, \star)$ and $(B,\diamond)$ are groups, their *direct product* $A\times B$ is a new group, which means

$$
\begin{equation}
A \times B = \{(a,b) | a\in A,b\in B\}, \quad (a_1,b_1)(a_2,b_2) = (a_1\star a_2,b_1\diamond b_2).
\end{equation}
$$
 

**Proposition 1.** If $G$ is a group under the operation $\star$, then
1. the identity of $G$ is unique;
2. $\forall a\in G$, $a^{-1}$ is unique;
3. $\forall a \in G$, $(a^{-1})^{-1} = a$;
4. $\forall a,b\in G$, $(a\star b)^{-1} = (b^{-1})\star (a^{-1})$;
5. for any $a_1,a_2,\dots,a_n \in G$, $a_1 \star a_2\star \cdots \star a_n$ is independent of how the expression is bracketed (*generalized associative law*).

**Proposition 2.** Let $G$ (operation $\cdot$ will be omitted) be a group and $a,b\in G$. The equations $ax=b$ and $ya=b$ have unique solutions for $x,y\in G$. In particular,
1. if $au = av$ , then $u=v$;
2. if $ub=vb$, then $u=v$

**Definition of the *order* of an element in group.**  For $G$ a group and $x\in G$, definite the order of $x$ to be the smallest positive integer $n$ such that $x^n=1$ and  denote this integer by $\vert x\vert$, $x$ is said to be of order $n$.

> If no positive power of $x$ is the identity, the order of $x$ is defined to be infinity and $x$ is said to be of infinite order. E.g., in the additive groups $\mathbb{Z},\mathbb{Q},\mathbb{R}$ or $\mathbb{C}$ every nonzero (i.e., nonidentity) element has infinite order.
{: .prompt-info}

**Definition of *group table***. Let $G = \{g_1,g_2,\dots,g_n\}$ be a finite group with $g_1= \mathbf{1}$. The *multiplication table* or *group table* of $G$ is the $n\times n$ matrix whose $i,j$ entry is the group element $g_ig_j$.

$$
\begin{array}{c|cccc}
G & g_1 & g_2 & \cdots & g_i & \cdots & g_j & \cdots & g_n \\
\hline
g_1 & g_1 g_1 & g_1g_2 & \cdots & g_1g_i &\cdots & g_1g_j & \cdots & g_1g_n  \\
g_2 & g_2g_1 & g_2g_2 & \cdots & g_2g_i & \cdots & g_2 g_j & \cdots & g_2 g_n \\
\vdots & \vdots & \vdots & \ddots & \vdots & \ddots & \vdots & \ddots & \cdots\\
g_i & g_ig_1 & g_ig_2 & \cdots & g_ig_i & \cdots & g_i g_j& \cdots & g_ig_n \\
\vdots & \vdots & \vdots & \ddots & \vdots & \ddots & \vdots & \ddots & \cdots\\
g_j & g_jg_1& g_jg_2& \cdots & g_jg_i & \cdots & g_jg_j& \cdots & g_jg_n\\
\vdots & \vdots & \vdots & \ddots & \vdots & \ddots & \vdots & \ddots & \cdots\\
g_n & g_n g_1 & g_n g_2 & \cdots & g_n g_i & \cdots & g_n g_j & \cdots & g_n g_n
\end{array}
$$


## Dihedral groups
**Definition of *dihedral groups***. For $n\in\mathbb{Z}^{+}, n\geq 3$, the *dihedral group* $D_n$ is defined to be the group consisting of the symmetry actions of a regular $n$-gon, where the operation is composition of actions.

> The group $D_n$ is a non-abelian group of order $2n$ ($n$ reflections and $n$ rotations totally).
{:.prompt-info}

![D6 group](dihedral-group-d6.png){: width="600"}
_The symmetry group of a regular hexagon consists of six rotations and six reflections. The six reflections consist of three reflections along the axes between vertices, and three reflections along the axes between edges. From [hexnet](https://hexnet.org/content/symmetry-group-regular-hexagon)_

Let $r$ be the rotation clockwise about the origin through $2\pi/n$ radian, $s$ be the reflection about the line of symmetry through vertex $1$ and the origin. Then

$$
\begin{equation}
D_{n} = \braket{r,s}{ r^n = s^2 = \mathbf{1}, rs = sr^{-1}},
\end{equation}
$$

where $r$ and $s$ are a set of *generators* of $D_{n}$.

## Symmetric groups

**Definition of symmetric groups**: 
1. For $\Omega \neq \emptyset$, $S_{\Omega}$ is defined to be the set of all bijections from $\Omega$ to itself (i.e., the set of all permutations of $\Omega$). The set of $S_{\Omega}$ is a group under function composition, and $S_{\Omega}$ is called the *symmetric group on the set* $\Omega$.
2. In the special case when $\Omega = \qty{1,2,\dots,n}$, the symmetric group on $\Omega$ is denoted $S_n$, the *symmetric group of degree* $n$, and $\abs{S_n} = n!$.

## Matrix groups
**Definition of *field***:
1. A *field* is a set $F$ together with two binary operations $+$ and $\cdot$ on $F$ such that $(F,+)$ is an abelian group (call its identity $0$) and ($F - \qty{0},\cdot$) is also an abelian group, and the following *distributive* law holds:

$$
\begin{equation}
a\cdot(b+c) = (a\cdot b) + (a\cdot c) , \quad \forall a,b,c \in F.
\end{equation}
$$

2. For any field $F$ let $F^{\times} = F- \{0\}$. 

**Definition of the *general linear group of degree $n$***. Let $F$ be a field, then the *general linear group* $GL_n(f)$ is the group of invertible $n\times n$ with entries in $F$ under matrix multiplication.

If $F$ is a finite field, then $GL_n(F)$ has only finitely many elements:
- if $F$ is a field and $\vert F \vert <\infty$, then $\abs{F} = p^{m}$ for some prime $p$ and integer $m$;
- if $F = q <\infty$, then $\abs{GL_n(F)} = \prod_{k=0}^{n-1}(q^n - q^k)$. 

## The quaternion group
The **quaternion group**, $Q_8$ is defined by

$$
\begin{equation}
    Q_8 = \{\mathbf{1},-\mathbf{1},i,-i,j,-j,k,-k\},\quad \text{where $i^2 = j^2 = k^2=ijk=-\mathbf{1}$}.
\end{equation}
$$

Note that $Q_8$ is a non-abelian group of order $8$.

## Homomorphisms and isomorphisms
**Definition of *homomorphism***. Let $(G,\star)$ and $(H,\diamond)$ be groups. A map $\varphi:G\to H$ such that

$$
\begin{equation}
   \varphi(x\star y) = \varphi(x) \diamond \varphi(y) ,\quad \forall x,y,\in G
\end{equation}
$$

is called a *homomorphism*

**Definition of *isomorphism***. Let $(G,\star)$ and $(H,\diamond)$ be groups. A map $\varphi:G\to H$ is called an *isomorphism* and $G$ and $H$ are said to be *isomorphic* or of the same *isomorphism type*, written $G \cong H$, if
1. $\varPhi$ is a homomorphism (i.e., $\varphi(x,y) = \varphi(x)\varphi(y)$ where the group operations are not explicitly written), and
2. $\varphi$ is a bijection.



## References
1. Dummit, D. S., and Foote, R. M. Abstract Algebra, 3rd ed. John Wiley & Sons, Inc. (2004).