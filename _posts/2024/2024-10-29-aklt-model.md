---
title:      "Affleck–Kennedy–Lieb–Tasaki Model"
date:       2024-10-29
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
media_subpath : /assets/img/in-post/2024/2024-10-29/
math: true
---
AKLT 模型（Affleck-Kennedy-Lieb-Tasaki 模型）作为量子自旋链中的一个重要模型，不仅为理解 Haldane 相提供了严格的理论实例，也为研究量子纠缠、对称性保护拓扑相与边界效应提供了典型范例。自 1980 年代以来，AKLT 模型在量子信息和量子计算等领域的理论研究中不断显示出其独特的价值，尤其是其基态的 Valence Bond Solid (VBS) 态，为构造和理解量子多体态提供了基本思路。

本文第一节介绍 AKLT 模型的相关背景，它和凝聚态物理中的 Haldane conjecture 有密切联系。第二节介绍了 Majumdar-Ghosh 模型，它和 AKLT 模型一样，基态都可以被精确构造，它的基态被称为二聚体态（dimer state）。第三节具体介绍 AKLT 模型哈密顿量和基态的构造，第四节以隐性反铁磁序、矩阵乘积态、边缘态三个方面分析了 AKLT 模型的性质。

## 1. Haldane 猜想
我们从最简单的一维自旋链模型出发，也就是自旋-1/2 Heisenberg 模型，它的哈密顿量是

$$
\begin{equation}
    H = J \sum_{i=1}^{N} \mathbf{S}_i \cdot \mathbf{S}_{i+1},
    \label{Heisenberg-model}
\end{equation}
$$

这里我们只计及了最近邻格点间的相互作用，且考虑周期性边界条件，即 $\mathbf{S}\_{N+1} = \mathbf{S}\_{1}$。我们知道，当 $J<0$ 时，$\eqref{Heisenberg-model}$ 的基态为铁磁序；当 $J>0$ 时，$\eqref{Heisenberg-model}$ 的基态具有反铁磁关联，但不存在 Néel 长程序。该模型由 Hans Bethe 于 1931 年精确求解[^Bethe-1931]，相关资料可以查询 [Bethe ansatz](https://en.wikipedia.org/wiki/Bethe_ansatz)。在热力学极限下，反铁磁 Heisenberg 模型的能谱是无能隙的（gapless），系统的关联函数呈现幂律衰减。

我们现在只考虑 $J>0$ 时的反铁磁自旋 Heisenberg 模型。从上面的结果我们自然而然地有这样一个疑问，对于其他自旋量子数情况下的自旋链，它的能谱是否也是无能隙的？系统的关联函数是否也是幂次衰减的？

对于 $s=1/2$ 的情况可以精确求解，人们相信对于 $s\ge 1$ 的情况也不会有太大改变。但 Haldane 在 1983 年提出了一个猜想[^Haldane-1983]（即 **Haldane conjecture**），对于反铁磁自旋 Heisenberg 模型：
- 当自旋 $s$ 是整数时，系统是有能隙的（gapped），关联函数呈指数衰减；
- 当自旋 $s$ 是半整数时，系统是无能隙的（gapless），关联函数呈幂律衰减。


这一猜想在当时凝聚态物理学界引起了很大的反响。从经典的角度来看，$s$ 仅仅是自旋的大小，为什么 $s$ 是整数还是半整数会引来如此大的差别？对于 $s=1$ 的情况，后续的数值研究（包括密度矩阵重整化群，DMRG）和准一维材料（如 $\mathrm{CsNiCl_3}$）的实验结果都支持了 Haldane 猜想。

对于自旋-1 链，这个有能隙、没有对称性破缺的量子相被称为 **Haldane phase**，它也是一种**对称性保护拓扑相**[^Gu-Wen-2009]（symmetry protected topological phase, SPT phase）。只要保持适当的保护对称性，在不闭合体能隙的情况下，不能它连续变成平庸的直积态。

对于一般情况的自旋 Heisenberg 模型，严格求解仍然很困难。截至本文最初写作时（2024 年），纯自旋-1 Heisenberg 链的 Haldane 能隙还没有严格证明，但已经得到数值、场论和实验等多方面的支持。关于自旋-1 周期链在 2026 年提出的计算机辅助证明，可参考 [Tasaki 的介绍](https://haltasaki.github.io/writings/AI/OpenAI_Haldane.html)。

本文将要介绍的 AKLT 模型就是基于 $s=1$ 的反铁磁 Heisenberg 模型添加了一个修正项得来的，这种精心设计的哈密顿量的基态可以被精确构造，体能隙也可以严格证明，为 Haldane 猜想所描述的物理图像提供了一个具体实例。虽然 AKLT 模型和 $s=1$ 的反铁磁 Heisenberg 模型并不完全一致，但它们的基态都属于 Haldane phase，具有共同的性质。我们会发现，在开边界 AKLT 自旋链的两端会出现未配对的自旋-1/2 自由度，这正是它的**边缘态**。

## 2. Majumdar-Ghosh 模型
推广自旋-1/2 Heisenberg 模型的一个自然想法就是引入次近邻相互作用，也即 $J_1$-$J_2$ 模型，

$$
\begin{equation}
    H = J_1 \sum_{i=1}^{N} \mathbf{S}_i \cdot \mathbf{S}_{i+1} + J_2 \sum_{i=1}^{N} \mathbf{S}_i\cdot \mathbf{S}_{i+2}.
\end{equation}
$$

次近邻相互作用实际上会引入阻挫（frustration），这就是另外的故事了，暂且不表。我们考虑一个特殊情况，即 $J_1= 2 J_2 =J$，这就是 Majumdar-Ghosh 模型[^Majumdar-Ghosh-1969]，

$$
\begin{equation}
    H_{\mathrm{MG}} = \sum_{i=1}^{2N}\left(\mathbf{S}_i \cdot \mathbf{S}_{i+1} + \frac{1}{2} \mathbf{S}_{i}\cdot \mathbf{S}_{i+2}\right),
    \label{Majumdar-Ghosh-model}
\end{equation}
$$

其中 $s_i=1/2$，且引入了周期性边界条件，自旋链的长度为偶数 $2N$。为简便起见，已经令上式中的 $J=1$。当然我们也可以进一步把 Majumdar-Ghosh 模型的哈密顿量改写为：

$$
\begin{align*}
    H_{\mathrm{MG}} = \frac{1}{2}\sum_{i=1}^{2N}\qty(\mathbf{S}_i\cdot \mathbf{S}_{i+1} + \mathbf{S}_{i+1}\cdot \mathbf{S}_{i+2} + \mathbf{S}_{i}\cdot \mathbf{S}_{i+2})= \frac{1}{4}\sum_{i=1}^{2N}\qty[\qty(\mathbf{S}_i+\mathbf{S}_{i+1} + \mathbf{S}_{i+2})^2 - \frac{9}{4}],
\end{align*}
$$

我们知道三个自旋-1/2 粒子耦合后的总自旋可以是 $s=1/2$, $3/2$，总自旋平方的本征值分别是 $3/4$, $15/4$。因此，投影到 site $i$, $i+1$, $i+2$ 总自旋 $s=3/2$ 子空间的投影算符是

$$
\begin{equation*}
    P_{3/2}^{(i)} = \frac{1}{3}\qty[\qty(\mathbf{S}_i+\mathbf{S}_{i+1}+\mathbf{S}_{i+2})^2-\frac{3}{4}],\qquad
    H_{\mathrm{MG}} = \frac{3}{4}\sum_{i=1}^{2N}P_{3/2}^{(i)}-\frac{3N}{4}.
\end{equation*}
$$

对于总自旋 $s=1/2$ 的态，经 $P_{3/2}^{(i)}$ 作用后为零，而总自旋 $s=3/2$ 的态则保持不变。那么如果我们能设法使得每一组相邻三个粒子耦合后的总自旋为 $1/2$，就找到了系统的基态，能量为 $E_0=-3N/4$。

这种构造显然是可以的，我们以前三个粒子为例，若它们的态矢量可以写为：

$$
\begin{equation*}
    \ket{\phi_{123}} = (\ket{\uparrow_1\downarrow_2}-\ket{\downarrow_1\uparrow_2})\otimes\ket{\uparrow_3},
\end{equation*}
$$

由于前两个粒子耦合成了自旋单态，所以三个粒子组成的整体总自旋是 $1/2$。我们把这种构造不断复制，就可以得到 Majumdar-Ghosh 模型的一个基态（补上了归一化系数）：

$$
\begin{align}
    \ket{\Phi_{\mathrm{MG}}^{(1)}} &= \frac{\ket{\uparrow\downarrow}-\ket{\downarrow\uparrow}}{\sqrt{2}} \cdots\frac{\ket{\uparrow\downarrow}-\ket{\downarrow\uparrow}}{\sqrt{2}} = \bigotimes_{i=1}^{N} \frac{1}{\sqrt{2}}\qty(\ket{\uparrow_{2i-1}\downarrow_{2i}} - \ket{\downarrow_{2i-1}\uparrow_{2i}}).
\end{align}
$$

由于系统具有平移不变性，我们把上述基态整体平移一个格点，就得到了另一种单态配对方式，它仍然是系统的基态，也即

$$
\begin{align}
    \ket{\Phi_{\mathrm{MG}}^{(2)}}  = \bigotimes_{i=1}^{N} \frac{1}{\sqrt{2}}\qty(\ket{\uparrow_{2i}\downarrow_{2i+1}} - \ket{\downarrow_{2i}\uparrow_{2i+1}}).
\end{align}
$$

可以证明 Majumdar-Ghosh 模型的基态是二重简并的[^Caspers-Emmett-Magnus-1984]，我们找到的这两个态就是系统线性独立的两个基态。我们可以用图像来形象地描述这两个基态 $\vert\Phi_{\mathrm{MG}}^{(1)}\rangle$, $\vert\Phi_{\mathrm{MG}}^{(2)}\rangle$，

![](MG-gs.png){: width="550"}
_Majumdar-Ghosh 模型的基态，其中 $\ket{\psi\_+}$, $\ket{\psi\_-}$ 就是 $\vert\Phi\_{\mathrm{MG}}^{(1)}\rangle$, $\vert\Phi\_{\mathrm{MG}}^{(2)}\rangle$，图源 [Milez](https://commons.wikimedia.org/wiki/File:Majumdar-ghosh_gs.png)。_

其中每一条蓝色线段都代表连接相邻 site 自旋-1/2 粒子构成的自旋单态，这其实就有点类似于化学里的化学键，每个自旋单态被称为 valence bond。对于上面两个二聚体态中的任意一个，不同的 valence bond 之间没有关联，整个态就是这些 valence bond 的直积。

Majumdar-Ghosh 模型在热力学极限下具有非零能隙，但它的激发态并不能简单地由一个单态替换为三重态得到。一个更有用的图像是把上述两种二聚体态的 domain wall 看作携带自旋-1/2 的 spinon，周期链中的这类激发成对出现。关于激发谱的变分分析，可以参考 Caspers 等人的工作[^Caspers-Emmett-Magnus-1984]。有隙并不违反 Lieb-Schultz-Mattis 定理，因为这里的基态是二重简并的。

<div class="statement" markdown="1">
<div class="statement-title">Majumdar–Ghosh 模型的基态</div>

Majumdar-Ghosh 模型二重简并的基态是（周期性边界条件）：

$$
\begin{align*}
  \ket{\Phi_{\mathrm{MG}}^{(1)}}& =\bigotimes_{i=1}^{N} \frac{1}{\sqrt{2}}\qty(\ket{\uparrow_{2i-1}\downarrow_{2i}} - \ket{\downarrow_{2i-1}\uparrow_{2i}}), \\
    \ket{\Phi_{\mathrm{MG}}^{(2)}}  &= \bigotimes_{i=1}^{N} \frac{1}{\sqrt{2}}\qty(\ket{\uparrow_{2i}\downarrow_{2i+1}} - \ket{\downarrow_{2i}\uparrow_{2i+1}}).
\end{align*}
$$

并且注意到 $\braket*{\Phi_{\mathrm{MG}}^{(1)}}{\Phi_{MG}^{(2)}} = 2(-1/2)^N$，如果自旋链长度 $2N\to\infty$，那么这两个基态就是正交的。

</div>

## 3. AKLT 模型
受到 Majumdar-Ghosh 模型的启发，如果我们希望找到以某个态为基态的哈密顿量，一种简单而有效的方法是构造一组局域投影算符，使它们分别湮灭这个态。把这些投影算符以正系数相加，就得到了一个正半定的哈密顿量，而这个态的能量为零，自然就是基态。整体加减一个常数不会改变基态，只会改变能量零点。

我们可以把这种套路用到更高自旋量子数的情况，在 1987 年， Affleck, Kennedy, Lieb 和 Tasaki 就提出了 AKLT 模型[^Affleck-Kennedy-Lieb-Tasaki-1987]，

$$
\begin{equation}
    H_{\mathrm{AKLT}} = \sum_{i=1}^{N}\qty[ \mathbf{S}_i\cdot\mathbf{S}_{i+1} + \frac{1}{3} \left(\mathbf{S}_i\cdot\mathbf{S}_{i+1}\right)^2].
    \label{AKLT-model}
\end{equation}
$$

其中 $s_i = 1$，且考虑了周期性边界条件。它的局域项与两个自旋-1 粒子耦合后投影到总自旋 $s=2$ 子空间的投影算符只相差比例系数和常数项。注意 $\eqref{AKLT-model}$ 有着丰富的对称性，除了时间反演对称性（$\mathbf{S}\to  - \mathbf{S}$）之外，还有 $\mathrm{SU}(2)$ 自旋旋转对称性。

![AKLT](AKLT.png){: width="600"}
_从左至右分别是 Ian Affleck, Tom Kennedy, Elliott H. Lieb, 和 Hal Tasaki，令人遗憾的是 Ian Affleck 已于本月初离世。_

在这里我们做一个简短的说明。考虑两个自旋-1 粒子耦合后的投影算符 $P_0$, $P_1$, $P_2$，分别代表投影到总自旋 $s=0,1,2$ 的子空间，而总自旋算符的平方 $\mathbf{S}^2 = (\mathbf{S}\_i+\mathbf{S}\_{i+1})^2$（其实就是 Casimir 算符）和投影算符是对易的，它们有共同的本征态 $\ket{s=0,m}$,$\ket{s=1,m}$, $\ket{s=2,m}$，我们可以依此列一个本征值表格：

$$
\begin{array}{c||c|c|c|c}
    \ket{s,m} & \mathbf{S}^2 & P_0 & P_1 &P_2\\
    \hline
    s=0 & 0 & 1 & 0 & 0 \\
    \hline
    s=1 & 2 & 0 & 1 & 0 \\
    \hline
    s=2 & 6 &0 &0 & 1
\end{array}
$$

依据这个表格，我们就可以直接写出投影算符的表达式：

$$
\begin{align}
    P_0 &= \frac{1}{12}(\mathbf{S}^2 -2)(\mathbf{S}^2 -6) = \frac{1}{3}(\mathbf{S}_i\cdot\mathbf{S}_{i+1})^2 - \frac{1}{3},\\
    P_1 &= -\frac{1}{8} \mathbf{S}^2(\mathbf{S}^2-6) = -\frac{1}{2} (\mathbf{S}_i\cdot\mathbf{S}_{i+1})^2 - \frac{1}{2}\mathbf{S}_i\cdot\mathbf{S}_{i+1} + 1,\\
    P_2 & = \frac{1}{24}\mathbf{S}^2(\mathbf{S}^2-2) = \frac{1}{6}(\mathbf{S}_i\cdot\mathbf{S}_{i+1})^2 + \frac{1}{2} \mathbf{S}_i\cdot\mathbf{S}_{i+1} + \frac{1}{3}. 
    \label{projector of AKLT}
\end{align}
$$

由 $\eqref{projector of AKLT}$ 可知，

$$
\begin{equation*}
    H_{\mathrm{AKLT}} = 2\sum_{i=1}^{N}P_2^{(i,i+1)}-\frac{2N}{3}.
\end{equation*}
$$

如果每对相邻自旋都只有 $s=0,1$ 分量，没有 $s=2$ 分量，那么所有 $P_2^{(i,i+1)}$ 都会湮灭这个态，它就是基态，能量为 $E_0=-2N/3$。关于这部分内容的解释，也可以参考 [AKLT 模型的哈密顿量是怎么得出的](https://www.zhihu.com/question/396879646/answer/22073260576)。

这种方法和传统凝聚态的套路是反过来的，一般我们是先写下一个模型的哈密顿量，然后进行一通暴算得到模型的各种性质，比如基态、激发态、关联函数等。但在这里我们其实是先确定一个特定的态，
再基于这个态构造以它为基态的 parent Hamiltonian。

出于以上想法，我们可以将每个 site 的自旋-1 粒子视作两个自旋-1/2 粒子耦合成的自旋三重态，再令相邻 site 的自旋-1/2 粒子耦合成自旋单态。这样任意两个相邻 site 的两个自旋-1 粒子（或者说四个自旋-1/2 粒子）耦合后的总自旋是 $s=0,1$，我们便得到了 AKLT 模型的基态，

$$
\begin{equation}
    \ket{\Phi_{\mathrm{AKLT}}} = \bigotimes_{j=1}^{N} \mathcal{P}_j \bigotimes_{i=1}^{N}\frac{1}{\sqrt{2}}(\ket{\uparrow_{i}^{r}\downarrow_{i+1}^{l}}  - \ket{\downarrow_{i}^{r}\uparrow_{i+1}^{l}}).
    \label{AKLT-gs}
\end{equation}
$$

其中 $\mathcal{P}\_j = \ket{1} \bra{\uparrow_{j}^{l}\uparrow_j^{r}} +\ket{0}\qty(\bra{\uparrow_{j}^{l}\downarrow_{j}^{r}} +\bra{\downarrow_{j}^{l}\uparrow_{j}^{r}})/\sqrt{2} + \ket{-1}\bra{\downarrow_{j}^{l}\downarrow_{j}^{r}}$ 把同一个 site 的两个虚拟自旋-1/2 的三重态映射到物理自旋-1 空间，并去掉单态分量。上式暂未归一化。AKLT 模型的基态被称为 VBS (valence-bond solid) state，其中一组自旋单态也被称为 valence bond，通过 $\mathcal{P}\_j$ 把相邻的 valence bond 耦合到了一起，这一点与 Majumdar-Ghosh 模型是不同的。

如下图所示：

![](AKLT-gs.png){: width="550"}
_AKLT 模型的基态，每个 site 处的自旋-1 粒子可以分解为两个自旋-1/2 粒子耦合成的自旋三重态。相邻 site 的自旋-1/2 粒子耦合成自旋单态，用蓝色线段表示。图中的圆圈代表两个自旋-1/2 粒子投影到 $s=1$ 的投影算符。图源 [Milez](https://commons.wikimedia.org/wiki/File:AKLT_GroundState.png)。_

可以证明[^Affleck-Kennedy-Lieb-Tasaki-1988]，在周期性边界条件下（$N\geq 3$），AKLT 模型的基态是非简并的，系统的激发态和基态之间有非零的能隙 $\Delta E_0$，不同格点 $i\ne j$ 之间的基态关联函数满足：

$$
\begin{equation}
    \lim_{N\to\infty} \frac{\expval{\mathbf{S}_i\cdot\mathbf{S}_j}{\Phi_{\mathrm{AKLT}}}}{\braket{\Phi_{\mathrm{AKLT}}}} = 4 (-3)^{-|i-j|} = 4(-1)^{i-j} \mathrm{e}^{-|i-j|/\xi},
    \label{correlation-function}
\end{equation}
$$

其中关联长度 $\xi = 1/\ln 3 \simeq 0.91$，符合 Haldane conjecture 的指数衰减。Knabe 在 1988 年给出了热力学能隙的下界[^Knabe-1988]：对 $\sum_i P_2^{(i,i+1)}$ 的约定，下界约为 $0.24806$；换成本文 $\eqref{AKLT-model}$ 的约定，就得到 $\Delta E_0\geq 0.496$。

另外，在周期链上施加足够弱的局域扰动，基态仍然唯一，体能隙也保持非零，尽管能隙的具体数值会改变[^Michalakis-Zwolak-2013]。如果扰动还保持保护对称性，例如时间反演对称性或绕正交轴旋转 $\pi$ 的 $D_2$ 自旋旋转对称性，系统就仍处于非平庸的 Haldane SPT 相[^Pollmann-2012]。

<div class="statement" markdown="1">
<div class="statement-title">AKLT 模型的唯一基态</div>

AKLT 模型唯一的基态是（周期性边界条件，$N\geq 3$，未归一化）：

$$
\begin{equation*}
    \ket{\Phi_{\mathrm{AKLT}}} = \bigotimes_{j=1}^{N} \mathcal{P}_j \bigotimes_{i=1}^{N}\frac{1}{\sqrt{2}}(\ket{\uparrow_{i}^{r}\downarrow_{i+1}^{l}}  - \ket{\downarrow_{i}^{r}\uparrow_{i+1}^{l}}).
\end{equation*}
$$

其中 $\mathcal{P}\_j = \ket{1} \bra{\uparrow_{j}^{l}\uparrow_j^{r}} +\ket{0}\qty(\bra{\uparrow_{j}^{l}\downarrow_{j}^{r}} +\bra{\downarrow_{j}^{l}\uparrow_{j}^{r}})/\sqrt{2} + \ket{-1}\bra{\downarrow_{j}^{l}\downarrow_{j}^{r}}$。

</div>



## 4. AKLT 模型的性质
AKLT 模型除了为 Haldane 猜想的物理图像提供一个基态精确可解的实例之外，还蕴藏了非常多的奇妙性质，我们这里具体探讨其中几个[^Tasaki-2020]。

### 4.1. 隐性反铁磁序
在最简单的经典反铁磁图像中，相邻自旋朝向相反，形成交替排列的 Néel 序。用上下箭头表示，就是：

$$
\begin{equation*}
    \cdots \uparrow\downarrow\uparrow\downarrow \cdots
\end{equation*}
$$

隐性反铁磁序并不像上面传统的反铁磁序那样可以通过直接观察自旋的空间排列来发现。在 AKLT 模型中，我们从基态 $\eqref{AKLT-gs}$ 中没有直接看到自旋“朝上和朝下交替排列”，但它其实仍然表现出反铁磁性，我们称它为**隐性反铁磁序**（hidden antiferromagnetic order）。

我们可以这样分析，把 site $i$ 和 $i+1$ 之间的 valence bond 展开为两个分量，并用 $\alpha_{i+1}=1,2$ 标记：$\ket{\uparrow_{i}^{r}\downarrow_{i+1}^{l}}$ 对应 $\alpha_{i+1}=1$，$\ket{\downarrow_{i}^{r}\uparrow_{i+1}^{l}}$ 对应 $\alpha_{i+1}=2$，它们的振幅分别是 $1/\sqrt{2}$ 和 $-1/\sqrt{2}$。如下图所示，具体展示了 $\eqref{AKLT-gs}$ 中展开后的其中一项。

![AKLT-hidden-antiferromagnetic-oredr](AKLT-hidden-antiferromagnetic-order.png){: width="650"}
_(a) 一个 valence bond 对应一个自旋单态，我们将 $\ket{\uparrow\_{i}^{r}\downarrow\_{i+1}^{l}}/\sqrt{2}$, $\ket{\downarrow\_{i}^{r}\uparrow\_{i+1}^{l}}/\sqrt{2}$ 分别用 $\alpha\_{i+1}=1,2$ 来进行区分。 (b) AKLT 模型基态展开后是特定自旋配置的组合，这里展示的是其中一项。_

这里用 $m_i$ 表示物理自旋的 $S_i^z$ 本征值。如果把配置中的 $m_i=0$ 全部删去，剩下的就是 $m_i=1,-1$ 交替排列的序列，这正是隐性反铁磁序的图像。

> 上述交替排列是对基态在 $S^z$ 基底中有非零振幅的配置而言的。完整基态是这些配置的量子叠加，普通自旋关联仍呈指数衰减，并不存在 Néel 长程序。
{: .prompt-warning}

对于一般自旋配置情况，我们也可以从延长自旋链的角度一步步考虑来说明。假设 site 1 处的两个虚拟自旋是 $\cdots\uparrow\uparrow\cdots$，它对应的是 $m_1=1$。由于单态展开中的两个虚拟自旋方向相反，下一个连接的就必须是 $\downarrow$，也即 $\cdots\uparrow\uparrow\cdots\downarrow?$。这里的 $?$ 表示待定：

- 它可以取 $\uparrow$，那么 site 2 处就对应 $m_2=0$，即 $\cdots\uparrow\uparrow\cdots\downarrow\uparrow\cdots\downarrow?$;
- 也可以取 $\downarrow$，那么 site 2 处就对应 $m_2=-1$，即 $\cdots\uparrow\uparrow\cdots\downarrow\downarrow\cdots\uparrow?$。

依次不断连接下去，我们就会发现，跳过所有 $m=0$ 的 site 后，$1,-1$ 必定交错出现。不论中间穿插多少个 $0$，下一个非零的 $m$ 都必须反号。


值得一提的是，VBS 名字里的 solid 并不意味着每个 site 的自旋方向都固定不动。AKLT 基态充满了量子涨落，但并不破坏平移对称性；它是一个**具有隐性反铁磁序的短程纠缠 Haldane SPT 态**。

### 4.2. 矩阵乘积表示
张量网络是一类用于处理量子多体系统复杂问题的强有力工具，最近一二十年在凝聚态物理和量子信息领域取得了显著的进展[^Orus-2013]。它的核心思想是将量子态的系数张量分解为多个低阶张量的缩并。对于具有适当纠缠结构的态，这能显著减少所需的参数量，同时保持高精度近似；一般的高纠缠态则仍可能需要指数增长的键维数。

![tensor-network](tensor-network.png){: width="700"}
_几类常见的张量网络，分别是矩阵乘积态（MPS）、投影纠缠对态（PEPS）、树状张量网络（TTN）、多尺度纠缠重整化（MERA），图源 [Tensor Network](https://tensornetwork.org/)_

而矩阵乘积态（matrix product state, MPS）是最常见的张量网络，尤其适用于刻画一维量子多体系统，比如描述自旋链的基态和低能激发态等。另外 MPS 最成功的例子就是密度矩阵重整化群方法（Density Matrix Renormalization Group, DMRG），它是一维情况里非常精准的数值算法。

我们可以先考虑一个更一般的自旋链，如下图所示：

![spin-chain](spin-chain.png){: width="600"}
_更一般的自旋链，每个 site 处的自旋用 $s\_i$ 来表示，它可以被看作是两个自旋 $\alpha\_i,\beta\_i$ 耦合后投影得到的，相邻 site 的自旋形成 entangled bond。图源 Honghao Tu's Lectures。_

我们把每个 site 上的物理基底用 $s_i=1,\dots,d$ 来标记，引入两个虚拟自由度 $\alpha_i,\beta_i$，通过局域线性映射 $\mathcal{P}\_i$ 回到物理空间，其中

$$
\begin{equation}
    \mathcal{P}_i = \sum_{s_i=1}^{d}\sum_{\alpha_i,\beta_i=1}^{D} B_{\alpha_i\beta_i}^{s_i}\ket{s_i}\bra{\alpha_i,\beta_i},
\end{equation} 
$$

其中 $B_{\alpha_i\beta_i}^{s_i}$ 是展开系数，而 entangled bond 可以表示成：

$$
\begin{equation}
    \ket{I}_{i,i+1} = \sum_{\beta_i,\alpha_{i+1}=1}^{D} R_{\beta_i\alpha_{i+1}}\ket{\beta_i,\alpha_{i+1}},
\end{equation}
$$

这里的 $R_{\beta_i,\alpha_{i+1}}$ 也表示展开系数。那么上图表示的态矢量可以写成：
 
$$
\begin{equation}
    \ket{\psi_{\mathrm{PBC}}} = \Big(\bigotimes_{j=1}^{N} \mathcal{P_j}\Big)\Big(\bigotimes_{i=1}^{N}\ket{I}_{i,i+1}\Big).
\end{equation}
$$

经过一些并不复杂的运算，我们可以得到：

$$
\begin{align*}
    \ket{\psi_{\mathrm{PBC}}} &= \Big(\bigotimes_{j=1}^{N} \mathcal{P_j}\Big)\Big(\bigotimes_{i=1}^{N}\ket{I}_{i,i+1}\Big)\\
    & = \sum_{s_1,\dots, s_N=1}^{d} \sum_{\alpha_1,\beta_1,\dots,\alpha_{N},\beta_{N}=1}^{D} \qty(B_{\alpha_1\beta_1}^{s_1}\cdots B_{\alpha_{N}\beta_N}^{s_N}) \ket{s_1,\dots, s_N} \bra{\alpha_1,\beta_1,\dots,\alpha_N,\beta_N}\\
    &\qquad \times \sum_{\alpha_1',\beta_1',\dots,\alpha_{N}',\beta_{N}'=1}^{D}\qty(R_{\beta_1'\alpha_2'}\cdots R_{\beta_N'\alpha_1'}) \ket{\alpha_1',\beta_1',\dots,\alpha_N',\beta_N'}\\
    &=\sum_{s_1,\dots,s_N=1}^{d} \sum_{\alpha_1,\beta_1,\dots,\alpha_N,\beta_N=1}^{D}\qty(B_{\alpha_1\beta_1}^{s_1}R_{\beta_1\alpha_2}\cdots B_{\alpha_N\beta_N}^{s_N} R_{\beta_N\alpha_1}) \ket{s_1,\dots,s_N}\\
    &=\sum_{s_1,\dots,s_N=1}^{d} \mathrm{Tr}(B^{s_1}R\cdots B^{s_N}R)\ket{s_1,\dots,s_N}.
\end{align*}
$$

我们可以定义 $A^{s_i}:= B^{s_i}R$，可以将上式简化为：

$$
\begin{equation}
    \ket{\psi_{\mathrm{PBC}}} = \sum_{s_1,\dots,s_N=1}^{d} \mathrm{Tr}(A^{s_1} A^{s_2}\cdots A^{s_N})\ket{s_1,s_2,\dots,s_N}.
    \label{PBC}
\end{equation}
$$

如果我们考虑的是开边界条件，那么同理也可以得到：

$$
\begin{equation}
    \ket{\psi_{\mathrm{OBC}}(\alpha_1\beta_N)} = \sum_{s_1,\dots,s_N=1}^{d} (A^{s_1} A^{s_2}\cdots \tilde{A}^{s_N})_{\alpha_1\beta_N}\ket{s_1,s_2,\dots,s_N}, \quad \text{where $\tilde{A}^{s_N} = B^{s_N}$}
    \label{OBC}
\end{equation}
$$

我们可以对每个矩阵 $A$ 用图像的形式表示，水平伸出去的两条腿代表 virtual freedom，竖直向上的一条腿代表 physical freedom。不同 $A$ 连接的两条腿代表缩并。那么我们可以将量子态 $\ket{\psi}$ 用图像的形式表示：

![MPS](MPS.png){: width="600"}
_MPS 示意图：(a) 代表周期性边界条件。(b) 代表开边界条件。图源 Honghao Tu's Lectures。_

从上面的分析中我们可以看出来 AKLT 模型的基态 $\eqref{AKLT-gs}$ 是一个典型的 MPS，其中

$$
\begin{align*}
    \mathcal{P}_i &= \ket{1} \bra{\uparrow_{i}^{l}\uparrow_i^{r}} +\ket{0}\frac{\bra{\uparrow_{i}^{l}\downarrow_{i}^{r}} +\bra{\downarrow_{i}^{l}\uparrow_{i}^{r}}}{\sqrt{2}} + \ket{-1}\bra{\downarrow_{i}^{l}\downarrow_{i}^{r}},\\
    \ket{I}_{i,i+1} &= \frac{1}{\sqrt{2}}\qty(\ket{\uparrow_{i}^{r}\downarrow_{i+1}^{l}} - \ket{\downarrow_{i}^{r}\uparrow_{i+1}^{l}}).
\end{align*}
$$

于是

$$
\begin{equation*}
    R = \frac{1}{\sqrt{2}}\begin{pmatrix}
        0 & 1 \\
        -1 &0
    \end{pmatrix}, \quad B^{s=1} = \begin{pmatrix}
        1& 0 \\ 0 &0
    \end{pmatrix}, \quad
      B^{s=0} = \frac{1}{\sqrt{2}}\begin{pmatrix}
          0&1 \\ 1&0
      \end{pmatrix},\quad
      B^{s=-1}=
    \begin{pmatrix}
        0& 0 \\ 0& 1
    \end{pmatrix}.
\end{equation*}
$$

由此得到

$$
\begin{equation}
A^{s=1} = \frac{1}{\sqrt{2}}\begin{pmatrix}
        0 & 1 \\
        0 &0
    \end{pmatrix}, \quad
    A^{s=0} = \frac{1}{2}
    \begin{pmatrix}
        -1&0\\ 0&1
    \end{pmatrix},\quad
    A^{s=-1} = \frac{1}{\sqrt{2}}\begin{pmatrix}
        0& 0 \\ -1 &0
    \end{pmatrix}.
\end{equation}
$$

AKLT 模型的基态 $\eqref{AKLT-gs}$ 就可以表示成：

$$
\begin{equation}
    \begin{split}
        \ket{\Phi_{\mathrm{AKLT}}} &= \sum_{s_1,\dots,s_N} \mathrm{Tr}(A^{s_1}A^{s_2} \cdots A^{s_N}) \ket{s_1,s_2,\dots,s_N}\\
        & = \mathrm{Tr}(g_1g_2\cdots g_N).
    \end{split}
\end{equation}
$$

其中

$$
\begin{equation}
    g_i = \sum_{s_i=-1,0,1} A^{s_i}\ket{s_i} = \frac{1}{2} \begin{pmatrix}
        -\ket{0}_i & \sqrt{2}\ket{1}_i \\ 
        -\sqrt{2}\ket{-1}_i & \ket{0}_i
    \end{pmatrix}.
\end{equation}
$$

利用 MPS 表示，我们也可以方便地计算出基态 $\eqref{AKLT-gs}$ 的归一化系数以及关联函数，如下图所示

![correlation-function](correlation-function.png){: width="650"}
_利用 MPS 表示计算关联函数，图源 Honghao Tu's Lectures。_

通过一些计算就可以得到[^Tasaki-2020]：

$$
\begin{equation}
    \lim_{N\to\infty} \frac{\expval{\mathbf{S}_{i}\cdot\mathbf{S}_{i+r}}{\Phi_{\mathrm{AKLT}}}}{\braket{\Phi_{\mathrm{AKLT}}}} = 4 \qty(-\frac{1}{3})^{r},\qquad r\geq 1,
\end{equation}
$$

这与之前提到的 $\eqref{correlation-function}$ 是一致的。

<div class="statement" markdown="1">
<div class="statement-title">AKLT 模型的矩阵乘积态表示</div>

AKLT 模型的基态可以用 MPS 表示：

$$
\begin{equation*}
    \begin{split}
        \ket{\Phi_{\mathrm{AKLT}}} &= \sum_{s_1,\dots,s_N} \mathrm{Tr}(A^{s_1}A^{s_2} \cdots A^{s_N}) \ket{s_1,s_2,\dots,s_N}\\
        & = \mathrm{Tr}(g_1g_2\cdots g_N).
    \end{split}
\end{equation*}
$$

其中

$$
\begin{gather*}
    A^{s=1} = \frac{1}{\sqrt{2}}\begin{pmatrix}
        0 & 1 \\
        0 &0
    \end{pmatrix}, \quad
    A^{s=0} = \frac{1}{2}
    \begin{pmatrix}
        -1&0\\ 0&1
    \end{pmatrix},\quad
    A^{s=-1} = \frac{1}{\sqrt{2}}\begin{pmatrix}
        0& 0 \\ -1 &0
    \end{pmatrix},\\
    g_i = \sum_{s_i=-1,0,1} A^{s_i}\ket{s_i} = \frac{1}{2} \begin{pmatrix}
        -\ket{0}_i & \sqrt{2}\ket{1}_i \\ 
        -\sqrt{2}\ket{-1}_i & \ket{0}_i
    \end{pmatrix}.
\end{gather*}
$$

</div>

### 4.3. 边缘态
之前我们的讨论都是基于周期性边界条件。如果考虑开边界条件下的 AKLT 模型（$N\geq 2$），并且不额外加入边界项，首尾两端各留下一个未配对的虚拟自旋-1/2，因此基态是四重简并的。

这一点从 $\eqref{OBC}$ 我们也可以具体看出来，其中 $\alpha_1,\beta_N$ 都是不固定的，而

$$
\begin{equation}
    \ket{\Phi_{\mathrm{AKLT}}^{\mathrm{OBC}}(\uparrow\uparrow)}, \quad \ket{\Phi_{\mathrm{AKLT}}^{\mathrm{OBC}}(\uparrow\downarrow)},\quad \ket{\Phi_{\mathrm{AKLT}}^{\mathrm{OBC}}(\downarrow\uparrow)},\quad \ket{\Phi_{\mathrm{AKLT}}^{\mathrm{OBC}}(\downarrow\downarrow)}
\end{equation}
$$

是线性独立的四个基态，基态子空间的简并度其实就是由边界两个自旋-1/2 自由度来决定的。这也是 AKLT 模型所体现出的新奇性质——整数自旋 $s=1$ 的自旋链，在边界处会出现半整数自旋 $s=1/2$ 的自由度，它是**边缘态**的一个典型例子。

在一般的有限长度 Haldane 链中，两端自旋之间可以存在随链长指数衰减的有效耦合，使边缘单态和三重态发生微小劈裂；AKLT 点则具有精确的四重简并。保持保护对称性时，单个边缘的自旋-1/2 自由度不能被局域扰动单独劈裂，这体现了 Haldane 相的 SPT 性质[^Pollmann-2012]。




## 5. 参考文献

[^Bethe-1931]: Bethe H. Zur Theorie der Metalle. Z. Physik 71, 205–226 (1931).
[^Haldane-1983]: F. D. M. Haldane. Continuum dynamics of the 1-D Heisenberg antiferromagnet: Identification with the O(3) nonlinear sigma model. Physics Letters A, 93(9): 464-468 (1983).
[^Gu-Wen-2009]: Z.-C. Gu, and X.-G. Wen. Tensor-entanglement-filtering renormalization approach and symmetry-protected topological order. Phys. Rev.B, (80):155131 (2009).
[^Pollmann-2012]: F. Pollmann, E. Berg, A. M. Turner, and M. Oshikawa. Symmetry protection of topological order in one-dimensional quantum spin systems. Phys. Rev. B 85, 075125 (2012).
[^Affleck-Kennedy-Lieb-Tasaki-1987]: I. Affleck, T. Kennedy, E. H. Lieb, and H. Tasaki. Rigorous results on valence-bond ground states in antiferromagnets. Phys. Rev.Lett., (59):799 (1987).
[^Affleck-Kennedy-Lieb-Tasaki-1988]: I. Affleck, T. Kennedy, E. H. Lieb, H. Tasaki, Valence bond ground states in isotropic quantum antiferromagnets. Commun. Math. Phys. 115,477–528 (1988).
[^Majumdar-Ghosh-1969]: C. K. Majumdar, D. K. Ghosh. On next nearest-neighbor interaction in linear chain. I, II. J. Math. Phys. 10, 1388–1402 (1969).
[^Caspers-Emmett-Magnus-1984]: W.J. Caspers, K.M. Emmett, W. Magnus, The Majumdar-Ghosh chain. Twofold ground state and elementary excitations. J. Phys. A: Math. Gen. 17, 2687 (1984).
[^Knabe-1988]: S. Knabe, Energy gaps and elementary excitations for certain VBS-quantum antiferromagnets. J. Stat. Phys. 52, 627–638 (1988).
[^Michalakis-Zwolak-2013]: S. Michalakis, J.P. Zwolak, Stability of frustration-free hamiltonians. Commun. Math. Phys. 322, 277–302 (2013).
[^Tasaki-2020]: H. Tasaki. Physics and mathematics of quantum many-body systems. Berlin: Springer, (2020).
[^Orus-2013]: R. Orus. A Practical Introduction to Tensor Networks: Matrix Product States and Projected Entangled Pair States. 	arXiv:1306.2164 [cond-mat.str-el] (2013).
