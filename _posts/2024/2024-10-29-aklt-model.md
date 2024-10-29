---
title:      "Affleck–Kennedy–Lieb–Tasaki Model"
date:       2024-10-29
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
math: true
---
AKLT 模型（Affleck-Kennedy-Lieb-Tasaki 模型）作为量子自旋链中的一个重要模型，不仅在凝聚态物理中为拓扑量子相变的研究开辟了新路径，也为理解量子纠缠、拓扑序与边界效应提供了典型的理论范例。自 1980 年代以来，AKLT 模型在量子信息和量子计算等领域的理论研究中不断显示出其独特的价值，尤其是其基态的 Valence Bond Solid （VBS） 态，为未来拓扑量子态的物理实现提供了基本思路。

我们从最简单的一维自旋链模型出发，也就是自旋-1/2 Heisenberg 模型，它的哈密顿量是

$$
\begin{equation}
    H = J \sum_{i=1}^{N} \vb{S}_i \cdot \vb{S}_{i+1}，
    \label{Heisenberg model}
\end{equation}
$$

这里我们只计及了最近邻格点间的相互作用，且考虑周期性边界条件，即 $\vb{S}\_{N+1} = \vb{S}\_{1}$。我们知道，当 $J<0$ 时，$\eqref{Heisenberg model}$ 的基态为铁磁序；当 $J>0$ 时，$\eqref{Heisenberg model}$ 的基态为反铁磁序，由 Hans Bethe 于 1931 年精确求解，相关资料可以查询 [Bethe ansatz](https://en.wikipedia.org/wiki/Bethe_ansatz)。在热力学极限下，反铁磁 Heisenberg 模型的能谱是无能隙的（gapless），系统的关联函数呈现幂律衰减。

我们现在只考虑 $J>0$ 时的反铁磁自旋 Heisenberg 模型。从上面的结果我们自然而然地有这样一个疑问，对于其他自旋量子数情况下的自旋链，它的能谱是否也是无能隙的？系统的关联函数是否也是幂次衰减的？

对于 $S=1/2$ 的情况可以精确求解，人们相信对于 $S\ge 1$ 的情况也不会有太大改变。但 Haldane 在 1983 年提出了一个猜想（即 **Haldane conjecture**），对于反铁磁自旋 Heisenberg 模型：
- 当自旋 $S$ 是整数时，系统是有能隙的（gapped）；
- 当自旋 $S$ 是半整数时，系统是无能隙的（gapless）。


这一猜想在当时凝聚态物理学界引起了很大的反响。从经典的角度来看，$S$ 仅仅是自旋的大小，为什么 $S$ 是整数还是半整数会引来如此大的差别？对于 $S=1$ 的情况很快就得到了数值（密度矩阵重整化群，DMRG）和实验（$\mathrm{CsNiCl_3}$）上的验证。整数自旋的能隙不受微扰的影响，这个稳定存在的有能隙的量子态构成了一个非平庸的量子相（其基态没有对称性破缺，但因为存在边界态，而与平庸的有能隙的直积态有本质区别），后来被称为 **Haldane phase**，它也是一种**对称性保护拓扑相**（symmetry protected topological phase, SPT phase）。

对于一般情况的自旋 Heisenberg 模型难以求解，Haldane conjecture 也没有得到纯数学意义上的证明，但从数值、场论、实验等多个角度都验证了它的正确性。本节将要介绍的 AKLT 模型就是基于 $S=1$ 的反铁磁 Heisenberg 模型添加了一个修正项得来的，这种精心设计的哈密顿量的基态可以被严格求解，验证了 Haldane conjecture。虽然 AKLT 模型和 $S=1$ 的反铁磁 Heisenberg 模型并不完全一致，但它们的基态都属于 Haldane phase，具有共同的性质，我们会发现，在 AKLT 模型自旋链的边缘会出现无质量的边界模，即零能态的自旋-1/2 自由度。这些边界模的存在为拓扑序的概念奠定了基础，展示了在无磁序情况下存在的量子态保护特性。


## AKLT 模型
1987 年，由 Affleck，Kennedy，Lieb 和 Tasaki 等人提出了 AKLT 模型，

$$
\begin{equation}
    H_{\mathrm{AKLT}} = \sum_i \vb{S}_i\cdot\vb{S}_{i+1} + \frac{1}{3} \left(\vb{S}_i\cdot\vb{S}_{i+1}\right)^2.
\end{equation}
$$




