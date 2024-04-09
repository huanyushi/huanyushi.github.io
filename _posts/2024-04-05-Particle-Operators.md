---
title:      "&sect;1.2 One- and Two- Particle Operators, Common Representations and Pictures"
date:       2024-04-05
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
math: true
---
In the previous post, we obtained the expression for the field operators,

$$
\hat{\psi}_{\alpha}(\vb{x}) \equiv \sum_{k} \psi_{k}(\vb{x}) \hat{a}_{k\alpha},\quad \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \equiv \sum_{k} \psi_{k}^\dagger(\vb{x}) \hat{a}_{k\alpha}^\dagger,
$$

where $k$ denotes different quantum numbers. This can help us calculate observables in second quantization form. In this post, we will learn how "first-quantized" operators (operators expressed in terms of particle coordinates $\vb{x}_i$, momentum $\hat{\vb{p}}_i$ and spin $\hat{s}_i$) can be translated into their second-quantized versions.

There are two common types of operators, **single-particle operators** and **two-particle operators**. Note that the expressions for operators in second-quantized form can be derived from the requirement that they yield the same result as the first quantized-form in a state with a given particle number.
## Single particle operators
The operators which involve sum over only single particles are known as single particle operators

$$
\begin{equation}
    \hat{F}^{(1)}_{} = \sum_{i=1}^{N}\hat{f}(\vb{x}_i,\hat{\vb{p}}_i,\hat{s}_i).
\end{equation}
$$

This is its expression in first quantization. In second quantization (or occupation number formalism), it can be expressed as

$$
\begin{equation}
\textcolor{Green}{
    \hat{F}^{(1)} = \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \mel{\alpha}{\hat{f}(\vb{x}_i,\hat{\vb{p}}_i,\hat{s}_i)}{\beta} \hat{\psi}_{\beta}(\vb{x}).}
    \label{equ:single-particle operator}
\end{equation}
$$

This can be proven using the method we discussed earlier. Let us choose $\qty{\ket{\tilde{\alpha}}}$ to be the single-particle basis of eigenstates of $\hat{f}$, i.e. $\hat{f}\ket{\tilde{\alpha}} = f_{\tilde{\alpha}} \ket{\tilde{\alpha}}$, where $f_{\tilde{\alpha}}$ is the eigenvalue of $\hat{f}$ associated with the eigenstate $\ket{\tilde{\alpha}}$. Then we claim that the second-quantized representation of $\hat{F}^{(1)}$ can be written as 

$$
\hat{F}^{(1)} = \sum_{\tilde{\alpha}}f_{\tilde{\alpha}} \hat{n}_{\tilde{\alpha}} = \sum_{\tilde{\alpha}} f_{\tilde{\alpha}} \hat{a}_{\tilde{\alpha}}^{\dagger} \hat{a}_{\tilde{\alpha}}.
$$

We can calculate the matrix elements of $\hat{F}^{(1)}$ in both first and second quantization to prove this. Consider $\mel{\Phi'}{\hat{F}^{(1)}}{\Phi}$ where $\ket{\Phi}$ and $\ket{\Phi'}$ are two arbitrary basis states. In second quantization, this is

$$
\begin{align*}
\mel{\Phi'}{\hat{F}^{(1)}}{\Phi} &= \mel{n_1'n_2'\cdots n_\infty'}{\sum_{\tilde{\alpha}}f_{\tilde{\alpha}}\hat{n}_{\tilde{\alpha}}}{n_1n_2\cdots n_{\infty}}\\[.2cm]
&=\sum_{\tilde{\alpha}}f_{\tilde{\alpha}}\braket{n_{1}'n_2'\cdots n_{\infty}'}{n_1n_2\cdots n_{\infty}}=\delta_{\Phi \Phi'} \sum_{\tilde{\alpha}}f_{\tilde{\alpha}}n_{\tilde{\alpha}}.
\end{align*}
$$

In first quantization, this is

$$
\begin{align*}
    \mel{\Phi'}{\hat{F}^{(1)}}{\Phi} &= \int \dd[3]{x_1}\cdots \dd[3]{x_N} \Phi'^{*}(\vb{x}_1\cdots\vb{x}_N)\qty(\sum_{i=1}^{N} \hat{f}) \Phi(\vb{x}_1\cdots \vb{x}_N)\\[.2cm]
    &=\sum_{\tilde{\alpha}}f_{\tilde{\alpha}} n_{\tilde{\alpha}}\int \int \dd[3]{x_1}\cdots \dd[3]{x_N} \Phi'^{*}(\vb{x}_1\cdots\vb{x}_N)\Phi(\vb{x}_1\cdots \vb{x}_N)=\delta_{\Phi\Phi'}\sum_{\tilde{\alpha}} f_{\tilde{\alpha}}n_{\tilde{\alpha}},
\end{align*}
$$

which is consistent with the result in second quantization. For other basis $\qty{\ket{\alpha}}$, we can find that

$$
\hat{a}_{\alpha}^{\dagger}\ket{0} = \ket{\alpha} = \sum_{\tilde{\alpha}}\ket{\tilde{\alpha}}\braket{\tilde{\alpha}}{\alpha} = \sum_{\tilde{\alpha}}\braket{\tilde{\alpha}}{\alpha}\hat{a}_{\tilde{\alpha}}^\dagger\ket{0}.
$$

So

$$
\begin{align*}
    \hat{a}_{\alpha}^{\dagger} = \sum_{\tilde{\alpha}} \braket{\tilde{\alpha}}{\alpha} a_{\tilde{\alpha}}^{\dagger},\quad \hat{a}_{\alpha} = \sum_{\tilde{\alpha}}\braket{\alpha}{\tilde{\alpha}}a_{\tilde{\alpha}}.
\end{align*}
$$

Then the single-particle operator $\hat{F}^{(1)}$ in other basis $\qty{\ket{\alpha}}$ can be written as

$$
\begin{align*}
    \hat{F}^{(1)} &= \sum_{\tilde{\alpha}} f_{\tilde{\alpha}}\hat{a}_{\tilde{\alpha}}^{\dagger}\hat{a}_{\tilde{\alpha}} = \sum_{\tilde{\alpha}} \qty(\sum_{\alpha}\braket{\alpha}{\tilde{\alpha}} \hat{a}_{\alpha})\qty(\sum_{\beta}\braket{\tilde{\alpha}}{\beta}\hat{a}_{\beta})\\[.2cm]
    &=\sum_{\alpha,\beta} \bra{\alpha} \qty(\sum_{\tilde{\alpha}}\ket{\tilde{\alpha}}f_{\alpha}\bra{\tilde{\alpha}}) \ket{\beta} \hat{a}_{\alpha}^\dagger\hat{a}_{\beta} = \sum_{\alpha,\beta}\mel{\alpha}{\hat{f}}{\beta} \hat{a}_{\alpha}^\dagger\hat{a}_{\beta}.
\end{align*}
$$

So, in other bases, it can also be written in a diagonal form. The matrix element $\mel{\alpha}{\hat{f}}{\beta}$ can be written as

$$
\mel{\alpha}{\hat{f}}{\beta} = \int\dd[3]{x}\dd[3]{x'} \braket{\alpha}{\vb{x}} \mel{\vb{x}}{\hat{f}}{\vb{x}'}\braket{\vb{x}'}{\beta} = \int\dd[3]{x} \braket{\alpha}{\vb{x}}\hat{f} \braket{\vb{x}}{\beta} = \int \dd[3]{x} \psi_{\alpha}^*(\vb{x})\hat{f} \psi_{\beta}(\vb{x}).
$$

By substituting the expression for the field operators, we can finally prove $\eqref{equ:single-particle operator}$. 

Next, we will discuss the second quantization form of some single-particle operators.

### Total kinetic energy operator and total momentum operator
#### Total kinetic energy operator
The **total kinetic energy operator** in first quantization is $\displaystyle{\hat{T} = \sum_{i=1}^{N}-\frac{\hbar^2 \nabla_{i}^2}{2m}}$, and in second quantization, it is

$$
\begin{align}
    \hat{T} &= \sum_{\alpha}\sum_{\beta} \int \dd[3]{x}\hat{\psi}^\dagger_{\alpha}(\vb{x}) \qty(-\frac{\hbar^2\nabla^2}{2m}) \braket{\alpha}{\beta} \hat{\psi}_{\beta}(\vb{x})\notag\\[.2cm]
    &= \sum_\alpha \int \dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \qty(-\frac{\hbar^2 \nabla^2}{2m}) \hat{\psi}_{\alpha}(\vb{x}).
\end{align}
$$

#### Total momentum operator
Similarly, we can obtain the representation of the **total momentum operator**

$$
\begin{equation}
\hat{P}= \sum_{\alpha}\int\dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) (-i\hbar \nabla) \hat{\psi}_{\alpha}(\vb{x}).
\end{equation}
$$

### Density operator
#### Local density operator
**Local density operator** is defined as $\displaystyle{\hat{n}(\vb{y}) = \sum_{i=1}^{N}\delta(\vb{y}-\vb{x}_i)}$. In second quantization, it is

$$
\begin{align}
\hat{n}(\vb{y}) &= \sum_{\alpha}\sum_{\beta}\int\dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \qty[\delta(\vb{y}-\vb{x})\delta_{\alpha\beta}]\hat{\psi}_{\beta}(\vb{x})\notag\\[.2cm]
&=\sum_{\alpha} \int \dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \delta(\vb{y}-\vb{x})\hat{\psi}_{\alpha}(\vb{x}) = \sum_{\alpha} \hat{\psi}_{\alpha}^{\dagger}(\vb{y})\hat{\psi}_{\alpha}(\vb{y}).
\end{align}
$$

And **total particle number operator** is

$$
\begin{equation}
    \hat{N} = \int \dd[3]{y} \hat{n}(\vb{y}) = \sum_{\alpha} \int \dd[3]{y} \hat{\psi}_{\alpha}^{\dagger}(\vb{y})\hat{\psi}_{\alpha}(\vb{y}).
\end{equation}
$$

#### Spin density operator
Spin density operator is defined as $\displaystyle{\hat{S}(\vb{y})} = \sum_{i=1}^{N} \hat{s}_i \delta(\vb{y}-\vb{x}_i)$. In second quantization, it is

$$
\begin{align}
    \hat{S}(y)&= \sum_{\alpha}\sum_{\beta} \int\dd[3]{x} \hat{\psi}_{\alpha}^{\dagger}(\vb{x})\mel{\alpha}{\delta(\vb{y}-\vb{x})\hat{s}}{\beta} \hat{\psi}_{\beta}(\vb{x})\notag\\[.2cm]
    &=\sum_{\alpha}\sum_{\beta}\int \dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \delta(\vb{y}-\vb{x})\mel{\alpha}{\hat{s}}{\beta}\hat{\psi}_{\beta}(\vb{x})\notag
    \\[.2cm]
    &=\sum_{\alpha}\sum_{\beta} \hat{\psi}_{\alpha}^{\dagger} \mel{\alpha}{\hat{s}}{\beta}\hat{\psi}_{\beta}(\vb{y}).
\end{align}
$$

Similarly, the **total spin operator** is

$$
\begin{equation}
    \hat{S} = \int\dd[3]{y} \hat{S}(\vb{y}) = \sum_{\alpha}\sum_{\beta}\int\dd[3]{y} \hat{\psi}^{\dagger}_{\alpha}(\vb{y}) \mel{\alpha}{\hat{s}}{\beta}\hat{\psi}_{\beta}(\vb{y}).
\end{equation}
$$

#### Electrical current density operator
Suppose that all identical particles have the same charge $e$. In classical case, we know that electrical current is $$\displaystyle{\vb{J} (\vb{y}) = e \sum_{i=1}^{N} \vb{v}_i\delta(\vb{y}-\vb{x}_i)}$$. If we switch to quantum case, we will find $$[\vb{v}_i,\delta(\vb{y}-\vb{x}_i)] \neq 0$$, therefore $$e \sum_{i} \vb{v}_i \delta(\vb{y} - \vb{x}_i)$$ is not a Hermitian operator, so we defined **electrical current density operator** as

$$
\begin{align}
    \hat{\vb{J}}(\vb{y}) &= \frac{e}{2} \sum_{i=1}^{N} [\vb{v}_i \delta(\vb{y}-\vb{x}_i) + \delta(\vb{y}-\vb{x}_i)\vb{v}_i]\notag\\[.2cm]
    &= \frac{e}{2} \sum_{i=1}^{N} \qty[\qty(-\frac{i\hbar}{m}\nabla)\delta(\vb{y}-\vb{x}_i) + \delta(\vb{y}-\vb{x}_i)\qty(-\frac{i\hbar}{m}\nabla)].
\end{align}
$$

The corresponding second-quantized form is

$$
\begin{align}
    \hat{\vb{J}}(\vb{y}) &= \frac{e}{2} \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \hat{\psi}^\dagger_{\alpha}(\vb{x}) \qty[\bra{\alpha}\qty{-\frac{i\hbar\nabla}{m}\delta(\vb{y}-\vb{x}) + \delta(\vb{y}-\vb{x}) \frac{-i\hbar\nabla}{m}}\ket{\beta}]\hat{\psi}_{\beta}(\vb{x})\notag\\[.2cm]
    &=\frac{e}{2} \sum_\alpha\sum_\beta \int\dd[3]{x} \hat{\psi}_\alpha^\dagger (\vb{x}) \braket{\alpha}{\beta} \qty[- \frac{i\hbar\nabla}{m}\delta(\vb{y}-\vb{x}) + \delta(\vb{y}-\vb{x}) \frac{-i\hbar \nabla}{m}] \hat{\psi}_{\beta}(\vb{x})\notag\\[.2cm]
    &=-\frac{i\hbar e}{2m}\sum_{\alpha}\Bigg\{ \underbrace{\int \dd[3]{x} \hat{\psi}^\dagger_\alpha(\vb{x})\nabla_{x}\qty[\delta(\vb{y}-\vb{x})\hat{\psi}_\alpha(\vb{x})]}_{\mathrm{IBP}} + \int\dd[3]{x} \hat{\psi}^\dagger_\alpha(\vb{x}) \delta(\vb{y}-\vb{x})\nabla_{x} \hat{\psi}_{\alpha}(\vb{x})\Bigg\}\notag\\[.2cm]
    &=-\frac{i\hbar e}{2m} \sum_{\alpha}\qty[\hat{\psi}_{\alpha}^{\dagger}(\vb{y})\nabla_y \hat{\psi}_{\alpha}(\vb{y}) - (\nabla_y \hat{\psi}_{\alpha}^\dagger(\vb{y})) \hat{\psi}_{\alpha}(\vb{y})].
\end{align}
$$

#### Free electrons in a magnetic field
Suppose we have $N$ electrons (with a charge of $-e$) in a magnetic field. The system's Hamiltonian (neglecting their Coulomb interactions) is

$$
H = \sum_{i=1}^{N} \frac{1}{2m} \qty(\vb{p}_i + e \mathbf{A}(\vb{x}_i))^2 + \frac{g\mu_B}{\hbar} \sum_{i=1}^{N} \vb{S}_i\cdot \vb{B}(\vb{x}_i),
$$

where $g$ is the Land&eacute; g-factor, $\mu_B$ is the Bohr magneton and $\vb{S}$ is the spin of the electron. Then its second-quantized form is

$$
\begin{equation}
\hat{H} = \sum_{\alpha}\int\dd[3]{x} \hat{\psi}^\dagger_{\alpha}(\vb{x}) \frac{(-i\hbar \nabla + e \vb{A})^2}{2m}\hat{\psi}_{\alpha}(\vb{x}) + \frac{g\mu_B}{\hbar} \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x})\mel{\alpha}{\vb{S}\cdot \vb{B}}{\beta} \hat{\psi}_{\beta}(\vb{x}).
\end{equation}
$$

## Two particle operators
The operators which involve sum over two particles are known as two particle operators

$$
\begin{equation}
    \hat{F}^{(2)} = \frac{1}{2} \sum_{\substack{i,j=1\\[.2cm] i\neq j}}^{N} \hat{f}(\vb{x}_i,\vb{x}_j;\hat{\vb{p}}_i,\hat{\vb{p}}_j;\hat{s}_i,\hat{s}_j).
\end{equation}
$$

For simplicity, we will omit the summation over indices $i$ and $j$ in the future, only keep $i\neq j$. In second quantization, it is

$$
\begin{equation}
\textcolor{green}{
\hat{F}^{(2)} = \frac{1}{2}\sum_{\alpha}\sum_{\alpha'}\sum_\beta\sum_{\beta'} \int\dd[3]{x} \int\dd[3]{x'} \hat{\psi}^{\dagger}(\vb{x}) \hat{\psi}^{\dagger}_{\beta}(\vb{x}') \hat{f}_{\alpha\alpha',\beta\beta'}(\vb{x},\vb{x}')\hat{\psi}_{\beta'}(\vb{x}')\hat{\psi}_{\alpha'}(\vb{x}),}
\end{equation}
$$

where $\hat{f}_{\alpha\alpha',\beta\beta'}(\vb{x},\vb{x}') = \bra{\alpha}\otimes \bra{\beta}\hat{f}(\vb{x},\vb{x}';\hat{\vb{p}},\hat{\vb{p}}';\hat{s},\hat{s}')\ket{\alpha'}\otimes \ket{\beta'}$.

If the two particle operator is independent of spin, we can find

$$
\begin{align*}
    \hat{f}_{\alpha\alpha',\beta\beta'}(\vb{x},\vb{x}') = \hat{f}(\vb{x},\vb{x}')\qty(\bra{\alpha}\otimes\bra{\beta})\qty(\ket{\alpha'}\otimes\ket{\beta'}) = \hat{f}(\vb{x},\vb{x}') \delta_{\alpha\alpha'}\delta_{\beta\beta'},
\end{align*}
$$

and the two particle operator can be simplified as

$$
\hat{F}^{(2)} = \frac{1}{2}\sum_{\alpha}\sum_{\beta} \int\dd[3]x \int\dd[3]{x'} \hat{\psi}_{\alpha}^\dagger(\vb{x})\hat{\psi}_{\beta}^\dagger(\vb{x}')\hat{f}(\vb{x},\vb{x}') \hat{\psi}_{\beta}(\vb{x}')\hat{\psi}_{\alpha}(\vb{x}).
$$

> **Example: Jellium Model** (we will talk about it in detail later.)
> 
> The Hamiltonian is
> 
> $$   
> \begin{align*}
> \hat{H} &= \sum_{i=1}^{N} \qty(-\frac{\nabla_i^2}{2m})  + \frac{1}{2}\sum_{i\neq j} \hat{V}(\vb{x}_i,\vb{x}_j)  \\[.2cm]
> &=\sum_{i=1}^{N}\qty(-\frac{\nabla_i^2}{2m}) + \frac{1}{2V}\sum_{i\neq j} \sum_{\vb{q}\neq 0} \frac{4\pi e^2}{q^2} \mathrm{e}^{i\vb{q}\cdot(\vb{x}_i - \vb{x}_j)}.
>\end{align*}
> $$
>
> The second-quantized form of the interaction is
> 
> $$
> \hat{H}^{(2)} = \frac{1}{2}\sum_{\alpha}\sum_{\beta} \int\dd[3]{x}\int\dd[3]{x'} \hat{\psi}^\dagger_{\alpha}(\vb{x})\hat{\psi}_{\beta}^\dagger(\vb{x}') \qty[\frac{1}{V}\sum_{\vb{q}\neq 0} \frac{4\pi e^2}{q^2}\mathrm{e}^{i\vb{q}\cdot(\vb{x}-\vb{x}')}] \hat{\psi}_{\beta}(\vb{x}')\hat{\psi}_{\alpha}(\vb{x}).
> $$
{: .prompt-tip}

## Common representations
So far, we have provided the second-quantized form for one- and two-particle operators without giving specific forms. Next, we will introduce three commonly used representations in many-body theory.

### Plane wave representation
Consider box normalization and periodic boundary condition, the plane wave solution of Schr&ouml;dinger equation is $\psi_{\vb{k}}(\vb{x}) = \frac{1}{\sqrt{V}}\mathrm{e}^{i\vb{k}\cdot\vb{x}}$, where $V$ is volume of the box and $\vb{k}$ is wave vector of particle.  $\qty{\psi_{\vb{k}}(\vb{x})}$ is a set of orthonormal and complete functions, which means

$$
\begin{equation}
\begin{cases}
    \displaystyle{\int\dd[3]{x}\psi^*_{\vb{k}}(\vb{x})\psi_{\vb{k}'}(\vb{x}) = \delta_{\vb{k}\vb{k}'}, \quad {\text{Orthonormalization,}}}\\[.2cm]
    \displaystyle{\sum_{\vb{k}}\psi_{\vb{k}}^*(\vb{x}')\psi_\vb{k}(\vb{x}) = \delta(\vb{x}-\vb{x}'), \quad {\text{Completeness.}}}
\end{cases}
\end{equation}
$$

We can introduce creation and annihilation operators for electron in $\ket{\vb{k},\alpha}$ state, so

$$
\begin{equation}
    [\hat{C}_{\vb{k}\alpha},\hat{C}^\dagger_{\vb{k}'\alpha'}]_+ = \delta_{\vb{k}\vb{k}'}\delta_{\alpha\alpha'}, \quad [\hat{C}_{\vb{k}\alpha},\hat{C}_{\vb{k}'\alpha'}]_+ = [\hat{C}_{\vb{k}\alpha}^\dagger,\hat{C}^{\dagger}_{\vb{k}'\alpha'}]_+=0.
\end{equation}
$$

Then the field operators can be written as

$$
\begin{equation}
\hat{\psi}_{\alpha}(\vb{x}) = \frac{1}{\sqrt{V}}\sum_{\vb{k}} \hat{C}_{\vb{k}\alpha}\mathrm{e}^{i\vb{k}\cdot\vb{x}}, \quad \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) = \frac{1}{\sqrt{V}}\sum_{\vb{k}} \hat{C}_{\vb{k}\alpha}^\dagger \mathrm{e}^{-i\vb{k}\cdot\vb{x}}.
\end{equation}
$$

#### Example
Total kinetic energy operator:

$$
\begin{equation}
\hat{T} = \sum_{\alpha} \int\dd[3]{x} \hat{\psi}_{\alpha}^\dagger(\vb{x}) \qty(-\frac{\hbar^2\nabla^2}{2m})\hat{\psi}_{\alpha}(\vb{x}) = \sum_{\vb{k}}\sum_{\alpha} \frac{\hbar^2 k^2}{2m} \hat{C}_{\vb{k}\alpha}^\dagger \hat{C}_{\vb{k}\alpha}. 
\end{equation}
$$

Total momentum operator:

$$
\begin{equation}
    \hat{P} = \sum_{\vb{k}}\sum_{\alpha} \hbar \vb{k} \hat{C}_{k\alpha}^\dagger \hat{C}_{k\alpha}.
\end{equation}
$$

For local density operator, we consider its Fourier transform and inverse Fourier transform,

$$
\begin{gather}
    \hat{n}(\vb{y}) = \frac{1}{V}\sum_\vb{q} \hat{n}(\vb{q}) \mathrm{e}^{i\vb{q}\cdot\vb{y}},\\[.2cm]
    \hat{n}(\vb{q}) = \int\hat{n}(\vb{y})\mathrm{e}^{-i\vb{q}\cdot\vb{y}}\dd[3]{y} = \sum_{\vb{k}}\sum_{\alpha}\hat{C}_{\vb{k}\alpha}^{\dagger}\hat{C}_{\vb{k}+\vb{q},\alpha}.
\end{gather}
$$

Similarly for spin density operator:

$$
\begin{gather}
    \hat{S}(\vb{y}) = \frac{1}{V}\sum_\vb{q} \hat{S}(\vb{q})\mathrm{e}^{i\vb{q}\cdot\vb{y}},\\[.2cm]
    \hat{S}(\vb{q}) = \int \dd[3]{y} \hat{S}(\vb{y}) \mathrm{e}^{-i\vb{q}\cdot\vb{y}} = \sum_\vb{k}\sum_\alpha\sum_\beta \hat{C}_{\vb{k}\alpha}^\dagger \mel{\alpha}{\hat{s}}{\beta}\hat{C}_{\vb{k}+\vb{q},\beta}.
\end{gather}
$$

> **Example**: to be continued ...
{: .prompt-tip}

And electrical current density operator:

$$
\begin{gather}
    \hat{J}(\vb{y}) = \frac{1}{V}\sum_\vb{q} \hat{J}(\vb{q}) \mathrm{e}^{i\vb{q}\cdot\vb{y}},\\[.2cm]
    \hat{J}(\vb{q}) = \int\dd[3]{y} \hat{J}(\vb{y})\mathrm{e}^{-i\vb{q}\cdot\vb{y}} = -\frac{e}{m} \sum_{\vb{k}}\sum_{\alpha}\qty(\vb{k}+\frac{\vb{q}}{2}) \hat{C}_{\vb{k}\alpha}^\dagger \hat{C}_{\vb{k}+\vb{q},\alpha}.
\end{gather}
$$

As an example for two particle operator, the interaction of the jellium model in plane wave representation is

$$
\begin{align}
    \hat{H}^{(2)} &= \frac{1}{2}\sum_{\alpha}\sum_{\beta}\int \dd[3]{x}\dd[3]{x'} \hat{\psi}^\dagger_\alpha(\vb{x})\hat{\psi}_\beta^\dagger(\vb{x}')\qty[\sum_{\vb{q}\neq 0} \frac{4\pi e^2}{q^2}\mathrm{e}^{i\vb{q}\cdot(\vb{x}-\vb{x}')}]\hat{\psi}_{\beta}(\vb{x}')\hat{\psi}_\alpha(\vb{x})\notag\\[.2cm]
    &=\frac{1}{2V}\sum_{\vb{k}}\sum_{\vb{k}'}\sum_{\vb{q}\neq 0}\sum_{\alpha}\sum_{\beta}\qty(\frac{4\pi e^2}{q^2})\hat{C}_{\vb{k}+\vb{q},\alpha}^\dagger\hat{C}_{\vb{k}'-\vb{q},\beta}^\dagger\hat{C}_{\vb{k}'\beta}\hat{C}_{\vb{k}\alpha}.
\end{align}
$$
### Bloch representation
Bloch's theorem tell us that solutions to the Schr&ouml;dinger equation in a periodic potential can be expressed as plane waves modulated by periodic functions. The **Bloch function** is defined as $\psi_{\vb{k}}^{B}(\vb{x}) = \mathrm{e}^{i\vb{k}\cdot\vb{x}}u_{\vb{k}}(\vb{x})$, where $$u_{\vb{k}}(\vb{x}) = u_{\vb{k}}(\vb{x}+\vb{R}_{l})$$, $$\vb{R}_{l}$$ is lattice vector. $$\qty{\psi_{\vb{k}}^{B}(\vb{x})}$$ is also a set of orthonormal and complete functions,

$$
\begin{equation}
    \begin{cases}
        \displaystyle{\int\dd[3]{x} \psi_{\vb{k}'}^{B*}(\vb{x})\psi_{\vb{k}}^{B}(\vb{x}) = \delta_{\vb{k}\vb{k}'},\quad \text{Orthonormalization,}}\\[.2cm]
        \displaystyle{\sum_{\vb{k}}\psi_{\vb{k}}^{B*}(\vb{x}')\psi_{\vb{k}}^{B}(\vb{x}) = \delta(\vb{x}-\vb{x}'), \quad \text{Completeness.}}
    \end{cases}
\end{equation}
$$

Introduce creation and annihilation operators for $\ket{\vb{k},\sigma}$ which satisfies

$$
\begin{equation}
    [\hat{b}_{\vb{k}\sigma},\hat{b}_{\vb{k}'\sigma'}]_+ = \delta_{\vb{k}\vb{k}'}\delta_{\sigma\sigma'}, \quad [\hat{b}_{\vb{k}\sigma},\hat{b}_{\vb{k}'\sigma'}]_+ = [\hat{b}_{\vb{k}\sigma}^\dagger,\hat{b}^\dagger_{\vb{k}'\sigma'}]_+ =0.
\end{equation}
$$

The field operators in this representation are

$$
\begin{equation}
    \hat{\psi}_{\sigma}(\vb{x}) = \sum_\vb{k} \hat{b}_{\vb{k}\sigma}\psi_{k}^{B}(\vb{x}),\quad \hat{\psi}^{\dagger}_{\sigma}(\vb{x}) = \sum_{\vb{k}}\hat{b}_{\vb{k}\sigma}^\dagger \psi_{\vb{x}}^{B*}(\vb{x}).
\end{equation}
$$

#### Example
Total kinetic energy operator in Bloch representation is

$$
\begin{equation}
    \hat{T} = \sum_{\sigma} \int\dd[3]{x} \hat{\psi}_{\sigma}(\vb{x}) \qty(-\frac{\nabla^2}{2m}) \hat{\psi}_{\sigma}(\vb{x}) = \sum_{\sigma}\sum_{\vb{k}}\sum_{\vb{k}'}\hat{b}_{\vb{k}\sigma}^\dagger\hat{b}_{\vb{k}'\sigma}V_{\vb{k}\vb{k}'},
\end{equation}
$$

where $\displaystyle{V_{\vb{k}\vb{k}'} = \int\dd[3]x \psi_{\vb{k}}^{B*}(\vb{x})\qty[-\frac{\nabla^2}{2m}]\psi_{\vb{k'}\sigma}^{B}(\vb{x})}$.

### Wannier representation
We can expand Bloch function with lattice vector $\vb{R}_l$,

$$
\begin{equation}
    \hat{\psi}_{\vb{k}}^{B}(\vb{x}) = \frac{1}{\sqrt{N}} \sum_{\vb{R}_l} \mathrm{e}^{i\vb{k}\cdot\vb{R}_l} a(\vb{x} - \vb{R}_{l}).
\end{equation}
$$

This is also a Fourier transform. The coefficient $a(\vb{x}-\vb{R}_l)$ is **Wannier function**. $\qty{a(\vb{x}-\vb{R}_l)}$ is also a set of orthonormal and complete functions, so

$$
\begin{equation}
    \begin{cases}
        \displaystyle{\int\dd[3]{x} a^{*}(\vb{x}-\vb{R}_l)a({\vb{k}-\vb{R}_{l'}}) = \delta_{ll'},\quad \text{Orthonormalization,}}\\[.2cm]
        \displaystyle{\sum_{\vb{R}_l}a^*(\vb{x}'-\vb{R}_l)a(\vb{x}-\vb{R}_l) = \delta(\vb{x}-\vb{x}'), \quad \text{Completeness.}}
    \end{cases}
\end{equation}
$$

For field operator $\hat{\psi}_{\alpha}(\vb{x})$ in Bloch representation, we can derive that

$$
\begin{align*}
    \hat{\psi}_{\sigma}(\vb{x}) &= \sum_{\vb{k}} \hat{b}_{\vb{k}\sigma}\psi^{B}(\vb{x}) = \sum_{k} \hat{b}_{\vb{k}\sigma}\qty[\frac{1}{\sqrt{N}} \sum_{\vb{R}_l} \mathrm{e}^{i\vb{k}\cdot\vb{R}_l} a(\vb{x} - \vb{R}_{l}) ]\\[.2cm]
    &=\sum_{\vb{R}_l} a(\vb{x}-\vb{R}_l) \Big[\underbrace{\frac{1}{\sqrt{N}}\sum_{\vb{k}}\mathrm{e}^{i\vb{k}\cdot\vb{R}_l}\hat{b}_{\vb{k}\sigma}}_{\hat{a}_{l\sigma}}\Big].
\end{align*}
$$

So we can define a new creation operator $$\hat{a}_{l\sigma}$$ (the same as annihilation operator $$\hat{a}_{l\sigma}^{\dagger}$$). Thus the field operators in Wannier representation are:

$$
\begin{equation}
    \hat{\psi}_{\sigma}(\vb{x}) = \sum_{\vb{R}_{l}} \hat{a}_{l\sigma} a(\vb{x} - \vb{R}_l) , \quad \hat{\psi}^{\dagger}_{\sigma}(\vb{x}) = \sum_{\vb{R}_l} \hat{a}_{l\sigma}^\dagger a^*(\vb{x}-\vb{R}_l).
\end{equation}
$$

#### Example
Total kinetic energy operator in Wannier representation is
$$
\begin{align}
\hat{T} &= \sum_\alpha \int \dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \qty(-\frac{\nabla^2}{2m}) \hat{\psi}_{\alpha}(\vb{x})\notag\\[.2cm] 
&= \sum_{\alpha}\sum_{\vb{R}_l}\sum_{\vb{R}_{l'}} \hat{a}_{l'\alpha}^{\dagger}\hat{a}_{l\alpha} \underbrace{\int\dd[3]{x} a^*(\vb{x}-\vb{R}_{l'})\qty(-\frac{\nabla^2}{2m}) a(\vb{x}-\vb{R}_l)}_{T_{l'l}} \\[.2cm]
&= \sum_{\alpha}\sum_{l}\sum_{l'}T_{l'l}\hat{a}_{l'\alpha}^{\dagger}\hat{a}_{l\alpha}.
\end{align}
$$

## Pictures
All our previous discussions have been in the Schr&ouml;dinger picture, but employing different pictures such as the Heisenberg picture and the interaction picture might yield remarkable results when dealing with other problems. Here, we briefly introduce the Heisenberg picture and the interaction picture.

### Heisenberg picture
In the case where $\hat{H}$ is independent of $t$, the time evolution operator is $\hat{U}(t,t_0) = \mathrm{e}^{-i\hat{H}(t-t_0)/\hbar}$. And the field operators in Heisenberg picture are

$$
\begin{equation}
    \hat{\psi}_{H\alpha} (\vb{x},t) = \mathrm{e}^{i\hat{H}(t-t_0)/\hbar}\hat{\psi}_{\alpha}(\vb{x})\mathrm{e}^{-i\hat{H}(t-t_0)/\hbar}, \quad 
    \hat{\psi}_{H\alpha}^\dagger (\vb{x},t) = \mathrm{e}^{i\hat{H}(t-t_0)/\hbar}\hat{\psi}_{\alpha}^{\dagger}(\vb{x})\mathrm{e}^{-i\hat{H}(t-t_0)/\hbar}.
\end{equation}
$$

The commutation (or anticommutation) relations are still true,

$$
\begin{gather}
[\hat{\psi}_{H\alpha}(\vb{x},t),\hat{\psi}_{H\beta}^{\dagger}(\vb{x}',t)]_{\mp} = \delta_{\alpha\beta}\delta(\vb{x}-\vb{x}'),\\[.2cm]

[\hat{\psi}_{H\alpha}(\vb{x},t),\hat{\psi}_{H\beta}(\vb{x}',t)]_{\mp} = [\hat{\psi}_{H\alpha}^\dagger(\vb{x},t),\hat{\psi}_{H\beta}^{\dagger}(\vb{x}',t)]_{\mp}=0.
\end{gather}
$$

This can be demonstrated using the commutation (or anticommutation) relations in the Schrödinger picture.

### Interaction picture
The Hamiltonian is $\hat{H} = \hat{H}_0 + \hat{V}$ where $\hat{V}$ is interaction operator. We can solve Schr&ouml;dinger equation exactly when $\hat{V} =0$. And $\hat{H}_0\ket{\phi^0} = E_g^0 \ket{\phi^0}$. Then the field operators in interaction picture  are

$$
\begin{equation}
    \hat{\psi}_{I\alpha}(\vb{x},t) = \mathrm{e}^{i\hat{H}_0(t-t_0)/\hbar} \hat{\psi}_{\alpha}(\vb{x}) \mathrm{e}^{-i\hat{H}_0(t-t_0)/\hbar},\quad
    \hat{\psi}_{I\alpha}^\dagger(\vb{x},t) = \mathrm{e}^{i\hat{H}_0(t-t_0)/\hbar} \hat{\psi}_{\alpha}^\dagger(\vb{x}) \mathrm{e}^{-i\hat{H}_0(t-t_0)/\hbar}.
\end{equation}
$$

The commutation (or anticommutation) relations are

$$
\begin{gather}
[\hat{\psi}_{I\alpha}(\vb{x},t),\hat{\psi}_{I\beta}^{\dagger}(\vb{x}',t)]_{\mp} = \delta_{\alpha\beta}\delta(\vb{x}-\vb{x}'), \\[.2cm]
[\hat{\psi}_{I\alpha}(\vb{x},t),\hat{\psi}_{I\beta}(\vb{x}',t)]_{\mp} = [\hat{\psi}_{I\alpha}^\dagger(\vb{x},t),\hat{\psi}_{I\beta}^{\dagger}(\vb{x}',t)]_{\mp}=0.
\end{gather}
$$