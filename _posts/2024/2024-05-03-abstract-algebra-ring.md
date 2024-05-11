---
title:      "Abstract Algebra: A Brief Summary of Ring Theory"
date:       2024-05-03
categories: [Mathematics, Abstract Algebra]
tag: [abstract algebra, ring theory]
math: true
description: My ring theory notes while studying abstract algebra. Ring theory explores various properties and structures within rings, such as subrings, ideals, homomorphisms, quotient rings, and the structure of polynomial rings.
---
## Introduction to rings
<div class="box-info" markdown="1">
<div class="title"> Definition: ring </div>
A **ring** $R$ is a set together with two binary operations $+$ and $\times$ (called addition and multiplication) satisfying the following axioms:
1. $(R,+)$ is an abelian group,
2. $\times$ is *associative*: $(a\times b) \times c = a\times (b\times c)$, for all $a,b,c\in R$,
3. the *distributive laws* hold in $R$: for all $a,b,c\in R$

$$
\begin{equation}
(a+b)\times c = (a\times c) + (b\times c), \quad \text{and}  \quad a\times (b+c) = (a\times b) + (a\times c)
\end{equation}
$$

</div>

- The ring is *commutative* if multiplication is commutative.
- The ring $R$ is said to have an *identity* (or *contain* a $1$) if there is an element $1\in R$ with 

$$
\begin{equation}
    1\times a = a\times 1, \quad \text{for all $a\in R$}.
\end{equation}
$$

A ring $R$ with identity $1$, where $1 \neq 0$, is called a **division ring** (or **skew field**) if every nonzero element $a\in R$ has a multiplicative inverse, i.e., there exists $b \in R$ such that $ab=ba=1$. A commutative division ring is called a **field**.

<div class="box-warning" markdown="1">
<div class="title"> Proposition </div>
Let $R$ be a ring. Then
1. $0a=a0=0$ for all $a\in R$.
2. $(-a)b = a(-b) = -(ab)$ for all $a,b\in R$ (recall $-a$ is the additive inverse of $a$).
3. $(-a)(-b) = ab$ for all $a,b\in R$.
4. if $R$ has an identity $1$, then the identity is unique and $-a = (-1)a$. 
</div>

## Unique factorization domains

Chain of class inclusions:

rngs $\supset$ rings $\supset$ commutative rings $\supset$ integral domains $\supset$ integrally closed domains $\supset$ GCD domains $\supset$ unique factorization domains $\supset$ principal ideal domains $\supset$ Euclidean domains $\supset$ fields $\supset$ algebraically closed fields

## Polynomial rings

> to be continued ...
{: .prompt-tip}

## References
1. Dummit, D. S., and Foote, R. M. *Abstract Algebra*, 3rd ed. John Wiley & Sons, Inc. (2004).
2. Artin, M. *Algebra*, 2nd ed. Pearson Education. (2011).
3. Judson, T. M. *Abstract Algebra: Theory and Application*. Orthogonal Publishing L3c. (2022).
