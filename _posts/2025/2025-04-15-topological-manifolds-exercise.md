---
title:      "Selected Exercises from <i>Introduction to Topological Manifolds</i>"
date:       2025-04-15
categories: [Mathematics, Topology]
tag: [topology]
math: true
description: John M. Lee 的 Introduction to Topological Manifolds（拓扑流形引论）习题选做
---

## Ch.2 Topological Spaces
**Ex. 2.4.** 
- (d) Let $X$ be any set, and let $d$ be the discrete metric on $X$. Show that $d$ generates the discrete topology.
- (e) Show that the discrete metric and the Euclidean metric generate the same topology on the set $\ZZ$ of integers.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
(d): 对于任意给定集合 $X$ ，定义离散度量 $d:X\times X\to \mathbb{R}$ 为：

$$
\begin{equation*}
    d(x,y) = \begin{cases}
        0, \quad &\text{if $x=y$}\\[.2cm]
        1, & \text{if $x\neq y$}
    \end{cases}
\end{equation*}
$$

对于任意 $x\in X$，不妨取 $r=1/2$，依据离散度量的上述定义，我们可以知道 $B_{r}^{(d)}(x) = \set{x}$。因此所有单点集 $\set{x}$ 都是开集。

对于任意子集 $A \subseteq X$，我们可以把它写为 $A = \bigcup\limits_{x\in A}\set{x}$。由于拓扑中的开集闭合于任意并，且每个 $\set{x}$ 是开集，所以 $A$ 也是开集。

于是 $X$ 的所有子集都是开集，由离散度量 $d$ 生成的拓扑正是幂集 $\mathcal{P}(x)$，即离散拓扑。

<p style="text-align: right;"> &#x220E; </p>

(e): 我们只需证明以下两点：

- 离散度量 $d$ 生成的每个开集，在欧式度量下也是开集；
- 欧式度量 $d'$ 生成的每个开集，在离散度量下也是开集。

考虑任意 $x\in\mathbb{Z}$，在 (d) 中我们已经证明了离散度量下 $\set{x}$ 是开集。在欧式度量下，同样取 $r=1/2$，我们有 $B_{r}^{(d')}(x) =\set{x}$，所以单点集 $\set{x}$ 也是开集。

考虑到 $\mathbb{Z}$ 的任意子集都可以写成单点集 $\set{x}$ 的并，所以在两个度量生成的拓扑中都属于开集。于是它们在 $\mathbb{Z}$ 上生成同一个拓扑（也是离散拓扑）。

<p style="text-align: right;"> &#x220E; </p>

</details>
