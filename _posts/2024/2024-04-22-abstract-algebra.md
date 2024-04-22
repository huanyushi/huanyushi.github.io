---
title:      "Abstract Algebra: A Brief Summary of Group Theory"
date:       2024-04-23
categories: [Mathematics, Abstract Algebra]
tag: [abstract algebra]
math: true
---

## Basic axioms

Definition of **binary operation**:

1. A *binary operation* $\star$ on a set G is a function $\star$: $G\times G \to G$.
2. A binary operation $\star$ on a set G is *associative* if $\forall a,b,c \in G$, $a\star(b\star c) = (a\star b) \star c$.
3. If $\star$ is a binary operation on a set $G$, we say $a,b\in G$ are *commute* if $a\star b =b\star a$. We say $\star$ (or G) is *commutative* if $\forall a,b\in G$, $a\star b = b\star a$


Definition of **group**:
1. A *group* is an order pair $(G,\star)$ where $G$ is a set and $\star$ is a binary operation on $G$ satisfying the following axioms:
   1. $\star$ is *associative*, ie.e., $\forall a,b,c\in G$,$(a\star b)\star c = a\star (b\star c)$,
   2. Exist an *identity* $e\in G$, such that $\forall a\in G$, $a\star e =e \star a = a$,
   3. $\forall a \in G$, it has an *inverse* $a^{-1}$, such that $a\star a^{-1} = a^{-1}\star a =e$.
2. The group $(G,\star)$ is called *abelian* (or *commutative*) if $\forall a,b\in G$, $a\star b = b\star a$. 

Proposition 1. If $G$ is a group under the operation $\star$, then
1. the identity of $G$ is unique
2. $\forall a\in G$, $a^{-1}$ is unique
3. $\forall a \in G$, $(a^{-1})^{-1} = a$
4. $\forall a,b\in G$, $(a\star b)^{-1} = (b^{-1})\star (a^{-1})$
5. for any $a_1,a_2,\dots,a_n \in G$, $a_1 \star a_2\star \cdots \star a_n$ is independent of how the expression is bracketed (*generalized associative law*).


## References
1. Dummit, D. S., and Foote, R. M. Abstract Algebra, 3rd ed. John Wiley & Sons, Inc. (2004).