---
title:      "Reading Shadows of Anyons: Anyon Signatures in PEPS Transfer Matrix Spectra"
date:       2026-06-03
categories: [Condensed Matter Physics, Tensor Network]
tag: [condensed matter physics, tensor network, PEPS]
media_subpath : /img/in-post/2026/2026-06-03/
math: true
---

之前仔细读过 [*Shadows of Anyons and the Entanglement Structure of Topological Phases*](https://www.nature.com/articles/ncomms9284) 这篇 paper[^Haegeman-2015]，但是隔了一段时间之后，再去看相关 paper，还是会发现很多概念、逻辑不甚熟悉，痛定思痛，决定还是认真写一份 note，目的有二：

1. 把 *Shadows of Anyons* 这篇 paper 的图像和逻辑整理成我自己更熟悉的语言；
2. 借这篇 paper 整理一套关于 PEPS transfer matrix spectrum 的基本理解，为之后的工作做准备。

从 tensor network 的角度看，这篇 paper 的核心问题可以粗略地说成（当然这不是 paper 一开始的出发点，至少从摘要上看不是这样）：

**2d topological phase 中的 anyon information，为什么可以从一个 1d transfer matrix spectrum 中看出来？**

这件事并不是显然的。*Shadows of Anyons* 的主要论证其实就在这里：PEPS 的 virtual structure 提供了连接 transfer matrix 和 anyon 的桥梁。

## 1. Motivation: Why Look at Transfer Matrix Spectra?

在传统的 Landau paradigm 中，我们通常通过对称性和 order parameter 来理解不同的物质相。一个相如果破缺了某个 global symmetry，那么往往可以找到相应的 local order parameter。

然而，topologically ordered phases 的出现说明这种图像并不完整。最典型的例子比如 fractional quantum Hall states, toric code 等。它们的不同相并不能简单地通过某个 local order parameter 来区分。与之伴随的是，它们有一系列非局域性质，例如 ground state degeneracy, anyonic excitations, fractional statistics, topological entanglement entropy 等。这些属于老生常谈的内容，就不再过多赘述。

因此，如果我们想理解 topological order，就需要一种能够直接描述多体纠缠结构的语言，这正是 tensor network 能发挥长处的地方，尤其是 PEPS (Projected Entangled Pair States)，它本身就是为描述二维量子多体态而设计的。Tensor network 提供了一种用 local tensors 组装全局波函数的表示方法，在这种框架里，拓扑性质是通过 virtual indices 上的纠缠结构和对称性结构来体现的。

对于 topologically ordered PEPS，local tensor 通常不是普通的 injective tensor，而是带有某种 virtual symmetry，在更一般的情形下，这种结构可以推广为 MPO symmetry。这里的 virtual symmetry 只作用在 virtual indices 上，且由于 pull-through condition，这些 virtual symmetry strings 可以穿过 local tensors 并在网络中移动，而不改变对应的物理波函数。只有当 string 出现端点时，端点才会对应非平凡的 anyonic excitation。

这一点非常关键。换句话说，bulk topological order 的信息可以被编码在 PEPS 的 virtual degrees of freedom 中，这就给了我们一个观察 topological order 的窗口。

**问题是，这些 virtual level 的信息如何在一个具体可计算的对象中体现出来？**

一个自然的对象正是 transfer matrix。它的物理意义本身也很丰富，在 MPS 或者 PEPS 里，计算 norm 或者 correlation function 时，都会遇到某个 transfer matrix 的反复作用。它的 dominant eigenvalue 负责归一化和 fixed point structure，而 subleading eigenvalues 则控制 correlation functions 的衰减形式。除此之外，Zauner et al. 在 [*Transfer Matrices and Excitations with Matrix Product States*](https://iopscience.iop.org/article/10.1088/1367-2630/17/5/053002#back-to-top-target) 中就指出，transfer matrix spectrum 和 低能激发之间存在密切联系，transfer matrix 的本征值可以反映低能激发的 dispersion relation 中极小值的位置和能量尺度等[^Zauner-2015]。

因此，*Shadows of Anyons* 可以看成是将 Zauner et al. 的思路进一步推进到 topologically ordered PEPS 中：既然 MPS transfer matrix spectrum 可以反映常规 low energy excitations 的信息，那么 topological PEPS 的 transfer matrix spectrum 就有可能反映 anyonic excitations 的信息。

**新的问题是，transfer matrix spectrum 和 anyonic excitations 之间具体是如何联系起来的？**

回答这个问题就涉及到 *Shadows of Anyons* 的核心了，这里暂时不打算进入完整的技术细节，只先给出一个直观图像。

对于 injective PEPS 来说，transfer matrix 的 dominant fixed point 通常是唯一的。但对于 topologically ordered PEPS，情况就更丰富。由于 local tensor 具有 virtual symmetry 或更一般的 MPO symmetry，transfer matrix 也会继承相应的 symmetry structure。因此，它的 dominant fixed point space 往往不再是简单的一维空间，而是可以分解成若干个 fixed point sectors。这些 sectors 是由相应的 virtual symmetry structure 或 MPO symmetry structure 来标记的，因而携带了 PEPS 的 topological information。

Anyon 的信息正是出现在这些 fixed point sectors 以及它们之间的转换中。

在 PEPS 中，anyonic exctation 通常可以通过 open virtual string 的 endpoint 来构造。由于 pull-through condition，string 主体可以在张量网络中移动而不改变局域物理态；真正不可消去的是 open string 的 endpoint，它对应一个 localized anyon，具体的 anyon type 取决于插入的 string type 和 endpoint 的 transformation property。

当我们把这个图像投影到 transfer matrix 上时，anyon 的不同 topological labels 会以不同方式体现出来：flux-like label 对应 half-infinite string、twisted sector 或 domain-wall structure；charge-like label 则体现为局域 excitation tensor 在 virtual symmetry 下的非平凡 quantum number。

因此，physical anyon 在 transfer matrix spectrum 中留下的痕迹，就是带有 topological labels 的 transfer-matrix excitations，这也正是标题中“shadow”这个词的含义。

## 2. General Framework: From Anyon Excitations to Transfer Matrix Spectra

在上一节里，我们已经讨论了 motivation 和整篇 paper 的核心框架。在本
节中，我们从理论上把这个框架具体细化一下。

### 2.1. Virtual symmetry and $G$-injective PEPS

我们从一个无限大、平移不变的 PEPS 出发，设每个格点上的 local tensor 为 $A^{s}_{\alpha\beta\gamma\delta}$，其中 $s=1,\dots,d$ 为 physical index，而 $\alpha,\beta,\gamma,\delta=1,\dots,D$ 是 virtual indices，整个系统放置在 square lattice 上。如 Fig. 1 所示，我们可以用图形化的方式表示该 PEPS：

![PEPS](PEPS.png){: .rounded width="700"}
_Fig. 1. 定义在 square lattice 上的无限大、平移不变的 PEPS，整个系统的量子态 $\ket{\Psi}$ 由 local tensor $A$ 收缩得到。_

不过，一个完全一般的 PEPS 并不一定描述 topologically ordered phase，我们还需要对 PEPS 进一步施加限制条件。粗略地说，对于一个有限区域 $R$， PEPS tensor network 可以看成一个从该区域边界的 virtual indices 到区域内部 physical indices 的线性映射，

$$
\Gamma_{R}: \mathcal{H}_{\partial R}^{\mathrm{virtual}} \longrightarrow \mathcal{H}_{R}^{\mathrm{phys}}.
$$

如果在一个足够大的区域上（或者经过 blocking 之后），这个映射是 injective 的，那我们称这个 PEPS 是 **injective PEPS**。这里的 injective 可以理解为：边界 virtual degrees of freedom 中的信息可以被唯一地编码到区域内部的 physical wavefunction 中。换句话说，这意味着可以只通过 physical degrees of freedom 来访问边界 virtual degrees of freedom。

对于 injective PEPS 来说，它的 parent Hamiltonian 通常有唯一的 ground state。相应地，如果我们通过局域地修改某个 tensor 来构造 excitation，那么这类 excitation 通常只能描述 topologically trivial excitation。

然而，这和 topologically ordered phase 的物理图像是不一样的。Topological order 的一个基本特征是系统中存在 topologically nontrivial excitations。这类 excitation 不能仅仅通过局域地修改某个 tensor 来完整描述，因为它们携带非平凡的 topological charge 或 flux。它们无法被 local operators 单独创建，在有限系统中，通常只能成对产生，并由一条 string operator 连接。比如在 toric code 中，绕 torus 的 non-contractible Wilson loops 可以标记不同的 ground states；而 open string 的 endpoints 则对应 anyon excitations。

如果 PEPS 要描述这种结构，那么 virtual indices 上必须存在某些非平凡操作在 physical level 上不可见。也就是说，需要存在一些 virtual transformations，它们作用在 virtual legs 上，却不会改变 local tensor 所表示的 physical state。这正是 virtual symmetry 或 IGG (Invariant Gauge Group) 的来源。因此，如果 PEPS 要描述 topologically nontrivial excitations，就不能只依赖普通的 local tensor defect，而需要在 virtual level 上保留某种可以支持 string-like operators 的 symmetry structure。

在最简单的情形下，假设存在一个 finite abelian group $G$，以及它在 virtual Hilbert space 上的 unitary representation $U_g$。对于某个 blocked tensor （以 $A$ 为例）的 PEPS map，我们可以定义 virtual boundary 上的 group action，使得 local tensor 在此作用下保持不变，也即

$$
\begin{equation}
    A = A(U_g \otimes U_g \otimes \bar{U}_g \otimes \bar{U}_g),
    \label{sym-condition}
\end{equation}
$$

其中 $g\in G$。我们称这样的 PEPS 是 **G-injective PEPS**，它虽然并不是说 $\Gamma_R$ 在整个 virtual boundary Hilbert space 上都是 injective，但它却是在 $G$-invariant subspace 上 injective。

<div class="box-info" markdown="1">
<div class="box-title"> Injective PEPS vs. $G$-injective PEPS </div>

- *Injective PEPS*: $\Gamma_R$ 在整个 virtual boundary space 上 injective；
- *$G$-injective PEPS*: $\Gamma_R$ 只在 $G$-invariant subspace 上 injective。

</div>

这正是 topological order 在 PEPS 中出现的关键。Ordinary injective PEPS 没有非平凡 virtual redundancy，而 $G$-injective PEPS 在 virtual level 上保留了一个 gauge-like symmetry，正是这种 virtual symmetry 允许我们在 tensor network 中引入 string-like operators，并用它们描述 topologically nontrivial excitations。

以 $\mathbb{Z}_2$ topological order 为例，最简单的情形是每个 tensor 都满足一个非平凡的 $\mathbb{Z}_2$ virtual symmetry 条件（也即 $\eqref{sym-condition}$），这意味着在 virtual bonds 上插入一串闭合的 $\mathbb{Z}_2$ 对称算符时，可以利用 $\eqref{sym-condition}$ 将这条 string 在网络中连续地变形或移动，而不改变整体态，这其实就是 topological PEPS 中重要的图像，Fig. 2 给出了相应的 pull-through condition：

![pull-through condition](pull-through.png){: .rounded width="500"}
_Fig. 2. Local tensor 满足的 virtual symmetry condition 和 pull-through condition。_

### 2.2. Anyon excitations from virtual strings

## 3. Example: Filtered Toric Code

## 4. Reading the Spectrum Figures

## 5. References

[^Haegeman-2015]:Haegeman, J., Zauner, V., Schuch, N. et al. *Shadows of anyons and the entanglement structure of topological phases*. Nat Commun 6, 8284 (2015).
[^Zauner-2015]:Zauner, V., Draxler, D., Vanderstraeten, L., Degroote, M., Haegeman, J., Rams, M. M., Stojevic, V., Schuch, N., & Verstraete, F. *Transfer matrices and excitations with matrix product states*. New Journal of Physics 17, 053002 (2015).