---
title:      "Selected Exercises from Introduction to Topological Manifolds"
date:       2025-04-15
categories: [Mathematics, Topology]
tag: [topology]
math: true
description: John M. Lee 的 Introduction to Topological Manifolds（拓扑流形引论）习题选做
---

## Ch. 2 Topological Spaces
### Exercises
**Ex. 2.4.**
- **(d)** Let $X$ be any set, and let $d$ be the discrete metric on $X$. Show that $d$ generates the discrete topology.
- **(e)** Show that the discrete metric and the Euclidean metric generate the same topology on the set $\ZZ$ of integers.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
**(d):** 对于任意给定集合 $X$ ，定义离散度量 $d:X\times X\to \mathbb{R}$ 为：

$$
\begin{equation*}
    d(x,y) = \begin{cases}
        0, \quad &\text{if $x=y$}\\[.2cm]
        1, & \text{if $x\neq y$}
    \end{cases}
\end{equation*}
$$

对于任意 $x\in X$，不妨取 $r=1/2$，依据离散度量的上述定义，我们可以知道 $B_{r}^{(d)}(x) = \set{x}$。因此所有单点集 $\set{x}$ 都是开集。

对于任意子集 $A \subseteq X$，我们可以把它写为 $A = \bigcup_{x\in A}\set{x}$。由于拓扑中的开集闭合于任意并，且每个 $\set{x}$ 是开集，所以 $A$ 也是开集。

于是 $X$ 的所有子集都是开集，由离散度量 $d$ 生成的拓扑正是幂集 $\mathcal{P}(x)$，即离散拓扑。 <span style="float: right;">&#x220E;</span>

**(e):** 我们只需证明以下两点：

- 离散度量 $d$ 生成的每个开集，在欧式度量下也是开集；
- 欧式度量 $d'$ 生成的每个开集，在离散度量下也是开集。

考虑任意 $x\in\mathbb{Z}$，在 (d) 中我们已经证明了离散度量下 $\set{x}$ 是开集。在欧式度量下，同样取 $r=1/2$，我们有 $B_{r}^{(d')}(x) =\set{x}$，所以单点集 $\set{x}$ 也是开集。

考虑到 $\mathbb{Z}$ 的任意子集都可以写成单点集 $\set{x}$ 的并，所以在两个度量生成的拓扑中都属于开集。于是它们在 $\mathbb{Z}$ 上生成同一个拓扑（也是离散拓扑）。 <span style="float: right;">&#x220E;</span>

</details>

**Ex. 2.10.** Show that a subset of a topological space is closed iff it contains all of its limit points.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
分两步进行证明。

- **(⇒) 方向：** 如果 $A⊆ X$ 是闭集，则 $A$ 包含它的所有极限点。由于 $A$ 是闭集，则 $X\setminus A$ 是开集。取 $p\in X \setminus X$，那么存在一个开邻域 $U \ni p$，使得 $U \subseteq X-A$，于是 $U \cap A = \emptyset$，即 $U \cap (A\setminus \set{p}) = \emptyset$，这就说明 $p$ 不是 $A$ 的极限点。于是 $A$ 的所有极限点都在 $A$ 内。如果 $A$ 包含它的所有极限点，则 $A$ 是闭集
- **(⇐) 方向：** 我们只需证明 $X \setminus A$ 是开集。考虑任意的 $p \in X\setminus A$，则 $p$ 不是 $A$ 的极限点。那么就存在一个开邻域 $U \ni p$，使得 $U \cap(A \setminus \set{p}) = \emptyset$。又由于 $p \notin A$，则 $U \cap A = \emptyset$，即 $U \subseteq X \setminus A$。这就说明  $X\setminus A$ 是开集。 <span style="float: right;">&#x220E;</span>

</details>

**Ex. 2.11.** Show that a subset $A\subseteq X$ is dense iff every nonempty open subset of $X$ contains a point of $A$.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
分两步进行证明。

- **(⇒) 方向：** 如果 $A \subseteq X$ 是稠密的，则 $X$ 的任意非空开集都与 $A$ 相交。考虑任意的 $p \in X$，都有 $p \in \overline{A}$。根据闭包的定义，对任意开集 $U\ni p$，都有 $U \cap A \neq \emptyset$。这就说明了对任意非空开集 $U\subseteq X$，都有 $A \cap U \neq \emptyset$。
- **(⇐) 方向：**如果 $X$ 的任意非空开集 $U$ 都满足 $U \cap A \neq \emptyset$，则 $A$ 在 $X$ 中是稠密的。我们采用反证法。假设 $\exists p \in X$ 满足 $p \notin \overline{A}$，那么存在一个开集 $U \ni p$，有 $U \cap A = \emptyset$，这与已知条件矛盾。因此假设不成立，所以对任意的 $p\in X$ 都必须有 $p\in \overline{A}$，于是 $\overline{A} = X$。 <span style="float: right;">&#x220E;</span>

</details>


**Ex. 2.32.** **(b)** Every local homeomorphism is continuous and open.

<details class="details-inline" markdown="1">
<summary>Proof</summary>

若 $f\colon X\to Y$ 是一个局部同胚，我们希望证明 $f$ 是连续且开的映射。

首先，我们可以从局部连续推广到整体连续。对于任意 $x\in X$，我们由假设可知存在一个开邻域 $U_x\subseteq X$，使得 $f\vert_{U_x}\colon U_x \to f(U_x)$ 是同胚。这就说明 $f\vert_{U_x}$ 是连续的，所以 $f$ 在每个点 $x$ 的一个邻域上连续，从而 $f$ 在每个点连续，所以 $f$ 是连续映射。

同样，我们也可以由局部开性覆盖任意开集 $U$，再推出整体开性。对任意 $x\in U \subseteq X$，我们可以找到一个开邻域 $V_x \subseteq X$，使得 $x\in V_x \subseteq U$（可以缩小到 $V_x \subseteq U$），且 $f\vert_{V_x}\colon V_x \to f(V_x)$ 是同胚，所以 $f(V_x)\subseteq Y$ 是开集。于是，

$$
f(U) = f\qty(\bigcup_{x\in U} V_x) = \bigcup_{x\in U}f(W_x)
$$

是开集的并，因此是开集。<span style="float: right;">&#x220E;</span>

</details>

**Ex. 2.35.** Suppose $X$ is a topological space, and for every $p\in X$ there exists a continuous function $f\colon X\to\RR$ such that $f^{-1}(0)=\set{p}$. Show that $X$ is Hausdorff.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
考虑任意的 $p_1,p_2\in X$，且 $p_1\neq p_2$，我们希望找到开集 $U_1\ni p_1$ 和 $ U_2\ni p_2$，且 $U_1 \cap U_2=\emptyset$。

由题设可知，存在连续函数 $f_1\colon X\to \RR$ 使得 $f_{1}^{-1}(0) = \set{p_1}$。由于 $p_1\neq p_2$，所以 $f_{1}(p_2) \neq 0$。设 $\epsilon = \abs{f_{1}(p_2)}/2$，由 $f_1$ 的连续性可知 $U_1:= f_1^{-1}[(-\epsilon,\epsilon)]$ 是一个开集，且 $p_1\in U_1$。又因为 $\abs{f_1(p_2)} > \epsilon$，所以 $p_2\notin U_1$。

同理，我们也可以构造出开集 $U_2$，使得 $p_2\in U_2$ 且 $p_1 \notin U_2$。因此，我们就构造出了两个不相交的开集 $U_1,U_2$，于是 $X$ 是 Hausdorff。 <span style="float: right;">&#x220E;</span>
</details>

**Ex. 2.51.** Suppose $X$ is a second countable space. Show that $X$ contains a countable dense subset.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
由于 $X$ 是第二可数的，则 $X$ 有一个可数的拓扑基 $\mathcal{B} = \set{B_1,B_2,B_3,\dots}$。我们要证明 $X$ 至少包含一个可数的稠密子集，这可以通过直接构造得出来。

在 $\mathcal{B}$ 中任取一个元素 $B_n$，其中 $n\in \mathbb{N}$，因为它是非空开集，我们可以任选一个点 $x_n \in B_n$，构造集合 $A = \set{x\in B_n \mid B_n \neq \emptyset}$。由于 $\mathcal{B}$ 是可数的，所以 $A$ 也是可数的。现在我们验证它在 $X$ 中是稠密的。

任取非空开集 $U\subseteq X$，那么存在某个 $B_n \in \mathcal{B}$ 使得 $B_n \subseteq U$。由于我们在构造集合 $A$ 时已经选取某个 $x_n\in B_n$，因此 $A \cap U \ni x_n \neq \emptyset$。所以 $A$ 与任意非空开集有非空交，说明 $A$ 在 $X$ 中是稠密的。 <span style="float: right;">&#x220E;</span>


</details>


### Problems
**Prob. 2-5.** For each of the following properties, give an example consisting of two subsets $X, Y\subseteq\RR^2$, both considered as topological spaces with their Euclidean topologies, together with a map $f\colon X\to Y$ that has the indicated property.
- **(a)** $f$ is open but neither closed nor continuous.
- **(b)** $f$ is closed but neither open nor continuous.
- **(c)** $f$ is continuous but neither open nor closed.
- **(d)** $f$ is continuous and open but not closed.
- **(e)** $f$ is continuous and closed but not open.
- **(f)** $f$ is open and closed but not continuous.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
**(a):** 取 $X = Y = \RR^2$，定义映射 $f\colon X\to Y$ 为:

$$
f((x,y)) = 
\begin{cases}
    (1,0), \quad &\text{if $(x,y) = (0,0)$,}\\[.2cm]
    (x,y), & \text{otherwise}.
\end{cases}
$$

取 $X$ 的一个开子集 $U$，如果 $(0,0)\notin U$ 则 $f(U) = U$。如果 $(0,0)\in U$ 则 $f(U) = U\setminus\set{(0,0)}$。这两种情况下 $f(U)$ 都是开集，因此 $f$ 是开映射。 再取 $X$ 的一个闭子集 $C$，如果 $(0,0)\in C$，则 $f(C) = C \setminus \set{(0,0)}$，它不是 $Y$ 中的闭子集（因为它的补集是 $(X\setminus C)\cup\set{(0,0)}$，这不是一个开集），因此 $f$ 不是闭映射。显然 $f$ 在 $(0,0)$ 处不连续，因此 $f$ 不是连续映射。

**(b):** 取 $X=Y=\RR$，定义映射 $f\colon X\to Y$ 为:

$$
f(x) = 
\begin{cases}
    0, \quad &\text{if $x\in \mathbb{Q}$,}\\[.2cm]
    1, & \text{if $x\in \RR\setminus\mathbb{Q}$}.
\end{cases}
$$

这实际上就是 Dirichlet 函数。显然它不是连续映射。取 $U = (0,1) \subseteq X$ 是开集，而 $f(U) = \set{0,1}$，这在 $Y$ 中是闭集，因此 $f$ 不是开映射。再取 $C \subseteq X$ 是闭集，则 $f(C)$ 只可能是 $\emptyset$, $\set{0}$, $\set{1}$, $\set{0,1}$，显然它们都是闭集，因此 $f$ 是闭映射。

**(c):** 取 $X = Y = \RR^2$，定义映射 $f\colon X\to Y$ 为 $f((x,y)) = (x,0)$。显然它是连续映射。取 $U = \mathbb{B}^2\subseteq X$ 是开集，则 $f(U) =\set{(x,0)\mid x\in (-1,1)}$ 是 $x$ 轴上的开区间，但它并不是 $Y$ 中的开集（但是它是 $\RR$ 中的开集），因此 $f$ 不是开映射。取 $C = \set{(x,y)\in\RR^2 \mid xy =1}$ 是 $X$ 中的闭集，则 $f(C) = \set{(x,0)\mid x\neq 0}$，即 $x$ 轴去掉原点的集合，它不是 $Y$ 中的闭集（因为它的补集是 $\set{(0,0)}\cup \set{(x,y)\mid y\neq 0}$，它是上半平面、下半平面与原点的并集，但原点没有一个小邻域完全包含在此补集中，所以该补集不是开集），因此 $f$ 不是闭映射。

**(d):** 取 $X = \RR^2\setminus\set{(0,y)\mid y\in \RR}, Y = \RR$，定义 $f((x,y)) = x$。显然 $f$ 是开映射和连续映射。取 $C = \set{(x,y) \in X \mid xy=1}$，它是 $X$ 中的闭集，但 $f(C) = \RR \setminus\set{0}$ 不是 $Y$ 中的闭集，因此 $f$ 不是闭映射。

**(e):** 取 $X = Y = \RR^2$，定义 $f(X) = (0,0)$，这是一个常值映射，显然它是连续映射和闭映射（因为 $\set{(0,0)}$ 是 $Y$ 中的闭集）。任取 $X$ 中的一个开集，它也都映射到 $\set{(0,0)}$ 上，因此它不是开映射。

**(f):** 取 $X = \RR^2, Y = \set{(0,0),(1,0)}$，定义映射 $f$ 为

$$
f((x,y)) = 
\begin{cases}
    (0,0), \quad & x\ge 0,\\[.2cm]
    (1,0), & x<0.
\end{cases}
$$

显然 $f$ 不是连续映射。任取 $X$ 中的一个子集 $U$（不管它是开集还是闭集），$f(U)$ 同时是 $A$ 的开集和闭集。因此 $f$ 是开映射和闭映射。

<p style="text-align: right;">&#x220E;</p>
</details>

**Prob. 2-7.** Prove Proposition 2.39 (in a Hausdorff space, every neighborhood of a limit point contains infinitely many points of the set).
<details class="details-inline" markdown="1">
<summary>Proof</summary>
我们采用反证法。已知 $p$ 是 $A$ 的极限点，则任意开邻域 $U\ni p$，都有 $(U\setminus\set{p})\cap A \neq \emptyset$。假设存在某个开邻域 $U \ni p$，使得 $U\cap A$ 是有限的，记作

$$
U \cap A = \set{a_1,a_2,\dots,a_n},
$$

其中 $a_i\neq p$（因为 $p$ 是 $A$ 的极限点，所以 $p\notin A$ 或不考虑 $p$ 本身）。由于 $X$ 是 Hausdorff 空间，我们可以对每个 $a_i$ 找到互不相交的开集 $V_i \ni a_i$，以及开集 $W_i\ni p$，使得 $V_i \cap W_i = \emptyset$。 我们取这些 $W_i$ 的交集 $W = U \cap \bigcap\limits_{i=1}^n W_i$，显然它是 $p$ 的开邻域（有限个开集交仍然是开集，且 $p\in U$ 与所有 $W_i$ 中）。

但是，对于每个 $i$，$W\subseteq W_i \Rightarrow W \cap V_i = \emptyset$。因此 $W \cap \set{a_1,\dots,a_n} = \emptyset$。即 $W \cap A = \emptyset$，这和 $p$ 是 $A$ 的极限点矛盾。于是假设不成立，故每个 $p$ 的开邻域都包含 $A$ 中的无穷多个点。 <span style="float: right;">&#x220E;</span>

</details>

**Prob. 2-10.** Suppose $f, g\colon X\to Y$ are continuous maps and $Y$ is Hausdorff. Show that the set $\set{x\in X:f(x) = g(x)}$ is closed in $X$. Give a counterexample if $Y$ is not Hausdorff.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
要证明 $A = \set{x\in X:f(x)=g(x)}$ 是 $X$ 中的闭集，也即证明 $A$ 的补集 $X\setminus A$ 是 $X$ 中的开集。任取 $p\in X\setminus A$，则 $f(p)\neq g(p)$，说明它们是 $Y$ 中不同的点。由 $Y$ 是 Hausdorff 空间，则存在不相交的开集 $U,V \in Y$ 使得 $f(x)\in U, g(x)\in V$， 且 $U\cap V = \emptyset$。又因为 $f,g$ 是连续映射，则 $f^{-1}(U), g^{-1}(V)$ 是 $X$ 中的开集，因此交集 $W = f^{-1}(U) \cap g^{-1}(V)$ 是 $X$ 中的开集，且 $p\in  W$。考虑任意 $x\in W$，有 $f(x)\in U, g(x) \in V$，所以 $f(x) \neq g(x)$，因此 $W\subseteq X\setminus A$。所以我们对每个 $x\in X\setminus A$ 找到了一个包含它的开集 $W$，从而 $X\setminus A$ 是开集，$A$ 是闭集。 <span style="float: right;">&#x220E;</span>

接下来我们需要找到一个不是 Hausdorff 空间的 $Y$，以及两个连续映射 $f,g \colon X\to Y$，使得 $\set{x\in X : f(x) = g(x)}$ 不是闭集。

取 $X = \RR$，具有欧式拓扑。而 $Y = \set{a,b}$，拓扑定义为 $\mathcal{T}_y = \set{\emptyset,\set{a}, Y}$，显然 $Y$ 不是 Hausdorff space，因为 $a,b$ 无法用不相交的开集分开。定义 $f(x) =a$，且

$$
g(x)=
\begin{cases}
a, \quad & x\neq 0,\\[.2cm]
b,& x=0. 
\end{cases}
$$

$f$ 显然连续（因为它是常值映射）。而 $g$ 也是连续的（只需检查任意开集的原像是否是 $X$ 中的开集即可）。现在考虑 $A = \set{x\in X: f(x)=g(x)} = \RR \setminus \set{0}$，这个集合在 $\RR$ 中不是闭集（因为它的补集 $\set{0}$ 不是 $\RR$ 中的开集）。因此，这个例子说明如果 $Y$ 不是 Hausdorff，则结论不成立。

</details>


**Prob. 2-14.** Prove Lemma 2.48 (the sequence lemma). Suppose $X$ is a first countable space, $A$ is any subset of $X$ and $x$ is any point of $X$.
- **(a)** $x\in \overline{A}$ iff $x$ is a limit of a sequence of points in $A$.
- **(b)** $x \in \mathrm{Int}(A)$ iff every sequence in $X$ converging to $x$ is eventually in $A$.
- **(c)** $A$ is closed in $X$ iff $A$ contains every limit of every convergent sequence of points in $A$.
- **(d)** $A$ is open in $X$ iff every sequence in $X$ converging to a point of $A$ is eventually in $A$.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
**(a):** 
- **(⇒) 方向：**假设 $x \in \overline{A}$。因为 $X$ 是第一可数空间，可以取一个嵌套邻域基 $\set{U_n} _{n\in\mathbb{N}}$ 使得每个 $U_n$ 是 $x$ 的邻域，且 $U _{n+1} \subseteq U_n$。由于 $x \in \overline{A}$，即 $x$ 的每个邻域都与 $A$ 有非空交集。所以每个 $U_n$ 中都存在 $x_n \in A \cap U_n$。于是我们构造了 $A$ 中的一个序列 $(x_n)$，使得 $x_n \in U_n$。由于 $U_n$ 越来越小，$x_n \to x$。
- **(⇐) 方向：** 假设存在 $A$ 中的一个序列 $(x_n)$，使得 $x_n \to x$。那么对于 $x$ 的任意邻域 $U$，存在某个 $N$ 使得 $n \geq N$ 时 $x_n \in U$。而这些 $x_n \in A$，所以 $U \cap A \ne \emptyset$。所以 $x \in \overline{A}$。 <span style="float: right;">&#x220E;</span>

**(b):**
- **(⇒) 方向：** 假设 $x \in \mathrm{Int}(A)$，则存在开集 $U$ 使得 $x \in U \subseteq A$。若 $\set{x_n}$ 是收敛到 $x$ 的任意序列，则存在 $N$ 使得 $n \geq N$ 时 $x_n \in U \subseteq A$，所以该序列最终在 $A$ 内。
- **(⇐) 方向：** 假设每个收敛到 $x$ 的序列都最终在 $A$ 中。我们采用反证法。假设 $x \notin \mathrm{Int}(A)$，那么对于 $x$ 的任意邻域 $U$，都有 $U \nsubseteq A$，即 $U \cap (X \setminus A) \ne \emptyset$。由于 $X$ 是第一可数空间，取一个邻域基 $\set{U_n}$。从每个 $U_n$ 中取一个点 $x_n \in U_n \setminus A$，构造序列 $\set{x_n}$。那么 $x_n \to x$，但是 $x_n \notin A$，与假设矛盾。因此 $x \in \mathrm{Int}(A)$。 <span style="float: right;">&#x220E;</span>

**(c):**
- **(⇒) 方向：** 已知 $A = \overline{A}$，由闭集的性质可知，它包含所有极限点，即如果 $x_n \to x$，且 $x_n\in A$，则 $x \in \overline{A} = A$。
- **(⇐) 方向：** 由 (a) 可知，对于任意 $x\in \overline{A}$，存在 $A$ 中的序列 $(x_n)$ 使得 $x_n \to x$。由于 $A$ 包含了它所有收敛序列的极限点，则 $x$ 也必然在 $A$ 中，所以 $\overline{A} \subseteq A$，即得 $A = \overline{A}$。 <span style="float: right;">&#x220E;</span>

**(d):**
- **(⇒) 方向：** 设 $A$ 是开集，$x_n\to x \in A$，所以存在一个邻域 $U \subseteq A$ 包含 $x$。因为 $x_n \to x$，所以存在 $N$ 使得对所有 $n\geq N$，$x_n \in U \subseteq A$，故序列最终在 $A$ 内。
- **(⇐) 方向：** 反证法。假设 $A$ 不是开集，则存在一个点 $x\in A$，对任意邻域 $U$ 都有 $U \nsubseteq A$，即 $U \cap (X \setminus A) \neq \emptyset$。因为 $X$ 是第一可数空间，存在一个邻域基 $\set{U_n}$ 递减于 $x$。从每个 $U_n \cap (X\setminus A)$ 中选一个点 $x_n$，则 $x_n \in X\setminus A$，而 $x_n\to x \in A$。但是根据假设，所有收敛到 $A$ 中点的序列都最终进入 $A$，矛盾！所以 $A$ 必须是开集。 <span style="float: right;">&#x220E;</span>

</details>


**Prob. 2-19.** Let $X$ be a topological space and let $\mathcal{U}$ be an open cover of $X$.
- **(a)** Suppose we are given a basis for each $U\in\mathcal{U}$ (when considered as a topological space in its own right). Show that the union of  all those bases is a basis for $X$.
- **(b)** Show that if $\mathcal{U}$ is countable and each $U\in\mathcal{U}$ is second countable, then $X$ is second countable.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
**(a):** 设 $\mathcal{U}$ 是 $X$ 的一个开覆盖，对每个 $U \in \mathcal{U}$，我们给定一个在 $U$ 中（作为子空间拓扑）的基底 $\mathcal{B} _U$，我们要证明 $\bigcup _{U\in\mathcal{U}} \mathcal{B} _U$ 是 $X$ 的一个基底，只需验证这个集合满足拓扑空间基底的判别标准： 对任意开集 $V \subseteq X$ 和任意点 $x\in V$，存在 $B\in \bigcup _{U\in\mathcal{U}}\mathcal{B} _U$ 使得 $x\in B \subseteq V$。

给定开集 $V \subseteq X$，以及 $x\in V$。由于 $\mathcal{U}$ 是开覆盖，存在某个 $U \in \mathcal{U}$ 使得 $x\in U$。又因为 $V$ 是开集，所以 $V \cap U$ 也是 $U$ 中的开集 （子空间拓扑）。由于 $\mathcal{B} _U$ 是 $U$ 中的一个基底，则存在 $B\in\mathcal{B} _{U}$ 使得 $x\in B \subseteq V\cap U \subseteq V$。注意到 $B \subseteq  U \subseteq X$，且 $B \in \bigcup _{U\in\mathcal{U}} \mathcal{B} _U$。那么我们就找到了这样的 $B$，满足 $x\in B \subseteq V$，因此 $\bigcup _{U\in\mathcal{U}} \mathcal{B} _U$ 是 $X$ 的一个基底。 <span style="float: right;">&#x220E;</span>

**(b):** 因为每个 $U\in \mathcal{U}$ 是第二可数的，所以存在一个可数基底 $\mathcal{B}_{U}$。又因为 $\mathcal{U}$ 是可数的，记为 $\mathcal{U} = \set{U_1,U_2,U_3,\dotsb}$。那么我们可以构造一个集合

$$
\mathcal{B}:= \bigcup_{n=1}^{\infty}\mathcal{B}_{U_n},
$$

这是可数个可数集合的并，因此它是可数的几何。根据 (a) 可知，这个集合是 $X$ 的一个基底。所以 $X$ 有一个可数基底，即 $X$ 是第二可数空间。 <span style="float: right;">&#x220E;</span>
</details>

## Ch. 3 New Spaces from Old
### Exercises

**Ex. 3.7.** Suppose $X$ is a topological space and $U\subseteq S\subseteq X$.
- **(a)** Show that the closure of $U$ in $S$ is equal to $\overline{U}\cap S$.
- **(b)** Show that the interior of $U$ in $S$ contains $\operatorname{Int} U\cap S$; give an example to show that they might not be equal.

<details class="details-inline" markdown="1">
<summary>Proof</summary>
**(a):** 已知 $\overline{U}$ 是 $U$ 在 $X$ 中的闭包，我们需要证明 $U$ 在子空间 $S$ 中的闭包 $\overline{U}^{S}$ 等于 $\overline{U} \cap S$，这只需要证明两个集合双向包含即可。

先证明 $\overline{U}^S \subseteq \overline{U}\cap S$。设 $x\in \overline{U}^{S}$，则对于 $S$ 中的任意开集 $V \subseteq S$，只要 $x\in V$，则 $V\cap U \neq \emptyset$。由于 $S\subseteq X$，子空间拓扑的开集 $V\subseteq S$ 形如 $V = W\cap S$，其中 $W\subseteq X$ 是 $X$ 中的开集。因此对于任意 $X$ 中的开集 $W$，若 $x \in W\cap S$，则 $(W\cap S) \cap U \neq \emptyset$，即 $W\cap U \cap S \neq \emptyset$，则 $W \cap U \neq \emptyset$，这说明 $x\in \overline{U}$。又因为 $x\in S$ （这是显然的），则 $x\in \overline{U}\cap S$。

再证明 $\overline{U}\cap S \subseteq \overline{U}^S$。设 $x \in \overline{U}\cap S$，则 $x\in \overline{U}$ 且 $x \in S$。我们要证明 $x\in \overline{U}^{S}$，即对于任意 $S$ 中的开集 $V\ni x$，有 $V \cap U \neq \emptyset$。由于 $V\subseteq S \subseteq X$，且 $V$ 是 $S$ 中的开集，则存在 $X$ 中开集 $W \subseteq X$ 使得 $V = W \cap S$。又因为 $x\in \overline{U}$，所以 $W \cap U \neq \emptyset$，这就意味着 $V \cap U = (W \cap S) \cap U = W \cap U \cap S \neq \emptyset$，因此 $x\in \overline{U}^S$。

综上，我们便证明了 $\overline{U}^S = \overline{U} \cap S$。 <span style="float: right;">&#x220E;</span>

**(b):** 我们需要证明 $\operatorname{Int} U \cap S \subseteq \operatorname{Int} _{S} U$。设 $x\in \operatorname{Int} U \cap S$，则 $x \in \operatorname{Int} U$，即存在 $X$ 中的开集 $V \subseteq X$，使得 $x\in V\subseteq U$。且 $x\in S$，因此 $x\in V \cap S \subseteq U \cap S = U$（因为 $U \subseteq S$）。注意 $V \cap S$ 是 $S$ 中的开集，则立即得到 $x\in \operatorname{Int} _{S} U$，于是 $\operatorname{Int} U \cap S \subseteq \operatorname{Int} _{S} U$。 <span style="float: right;">&#x220E;</span>

尽管上面我们证明了 $\operatorname{Int} U \cap S \subseteq \operatorname{Int} _{S} U$，这两者并不一定相等（和 (a) 中不同），这里我们找一个例子使得 $\operatorname{Int} _{S}(U) \supsetneq \operatorname{Int} U \cap S$。

设 $X = \RR$，带有欧式拓扑。$S = [0,1] \subseteq \RR$，$U = [0,1) \subseteq S$。显然 $\operatorname{Int} U = (0,1)$，则 $\operatorname{Int}(U) \cap S = (0,1)$，而 $\operatorname{Int} _{S}(U) = [0,1)$。显然这两个集合并不相等，于是 $\operatorname{Int} U \cap S \subsetneq \operatorname{Int} _{S} U$。
</details>


### Problems