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

因此，如果我们想理解 topological order，就需要一种能够直接描述多体纠缠结构的语言，这正是 tensor network 能发挥长处的地方，尤其是 PEPS （Projected Entangled Pair States），它本身就是为描述二维量子多体态而设计的。Tensor network 提供了一种用 local tensors 组装全局波函数的表示方法，在这种框架里，拓扑性质是通过 virtual indices 上的纠缠结构和对称性结构来体现的。

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

## 3. Example: Filtered Toric Code

## 4. Reading the Spectrum Figures

## 5. References

[^Haegeman-2015]:Haegeman, J., Zauner, V., Schuch, N. et al. *Shadows of anyons and the entanglement structure of topological phases*. Nat Commun 6, 8284 (2015).
[^Zauner-2015]:Zauner, V., Draxler, D., Vanderstraeten, L., Degroote, M., Haegeman, J., Rams, M. M., Stojevic, V., Schuch, N., & Verstraete, F. *Transfer matrices and excitations with matrix product states*. New Journal of Physics 17, 053002 (2015).