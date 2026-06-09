---
title:      "Reading Shadows of Anyons: Anyon Signatures in PEPS Transfer Matrix Spectra"
date:       2026-06-03
categories: [Condensed Matter Physics, Tensor Network]
tag: [condensed matter physics, tensor network, PEPS]
media_subpath : /img/in-post/2026/2026-06-03/
math: true
---

之前大概读懂过 *Shadows of Anyons* 这篇 paper[^Haegeman-2015]，但是隔了一段时间之后，再去看相关 paper，还是会发现很多概念、逻辑不甚熟悉，痛定思痛，决定还是认真写一份 note，目的有二：

1. 把 *Shadows of Anyons* 这篇 paper 的图像和逻辑整理成我自己更熟悉的语言；
2. 借这篇 paper 整理一套关于 PEPS transfer matrix spectrum 的基本理解，为之后的工作做准备。

从 tensor network 的角度看，这篇 paper 的核心问题可以粗略地说成（当然这不是 paper 一开始的出发点，至少从摘要上看不是这样）：

**2d topological phase 中的 anyon information，为什么可以从一个 1d transfer matrix spectrum 中看出来？**

这件事并不是显然的。*Shadows of Anyons* 的主要论证其实就在这里：topological PEPS 的 virtual structure 提供了连接 transfer matrix 和 topological phase elementary excitations（也就是 anyons）的桥梁。

如果用我自己的话来总结，那就是：2d bulk 的拓扑信息并不是直接出现在 local tensor 的 physical degrees of freedom 上，而是编码在 PEPS 的 virtual symmetry 里。当我们构造 transfer matrix 时，这些 virtual symmetries 会诱导出不同的 transfer matrix sectors。不同 sector 里的谱，就可以被解释为 2d anyon excitations 在 1d transfer matrix 上留下的 "shadow"。这里的 "shadow" 其实很形象，真正的 anyon 是 2d bulk 里的 topological excitation，但 transfer matrix 是 1d boundary 上的对象，它看到的只是 anyon 在一维对象上的影子，这个影子当然不是完整的二维物理图像，但它仍然保留了很多重要信息，比如不同 anyon sector，topological phase transition，以及 condensation 或 confinement 的信号。

以上只是笼统的概述，更细节的内容请参见后文。

## 为什么需要这篇文章？




## 参考文献

[^Haegeman-2015]:Haegeman, J., Zauner, V., Schuch, N. et al. Shadows of anyons and the entanglement structure of topological phases. Nat Commun 6, 8284 (2015).