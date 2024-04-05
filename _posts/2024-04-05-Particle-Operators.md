---
title:      "&sect;1.2 One- and Two- Particle Operators"
date:       2024-04-05
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
math: true
---
In the previous post, we obtained the expression for the field operators,

$$
    \hat{\psi}_{\alpha}(\vb{x}) \equiv \sum_{k} \psi_{k}(\vb{x}) \hat{a}_{k\alpha},\quad \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \equiv \sum_{k} \psi_{k}^\dagger(\vb{x}) \hat{a}_{k\alpha}^\dagger,
$$

which can help us calculate observables in second quantization form. In this post, we will learn how "first-quantized" operators (operators expressed in terms of particle coordinates $\vb{x}_i$, momentum $\hat{\vb{p}}_i$ and spin $\hat{s}_i$) can be translated into their second-quantized versions. There are two common types of operators, **single-particle operators** and **two-particle operators**. Note that the expressions for operators in second quantized form can be derived from the requirement that they yield the same result as the first quantized form in a state with a given particle number.
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
    \hat{F}^{(1)} = \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \mel{\alpha}{\hat{f}(\vb{x}_i,\vb{p}_i,\hat{s}_i)}{\beta} \hat{\psi}_{\beta}(\vb{x}).}
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
\mel{\Phi'}{\hat{F}^{(1)}}{\Phi} &= \mel{n_1'n_2'\cdots n_\infty'}{\sum_{\tilde{\alpha}}f_{\tilde{\alpha}}\hat{n}_{\tilde{\alpha}}}{n_1n_2\cdots n_{\infty}}\\
&=\sum_{\tilde{\alpha}}f_{\tilde{\alpha}}\braket{n_{1}'n_2'\cdots n_{\infty}'}{n_1n_2\cdots n_{\infty}}\\
&=\delta_{\Phi \Phi'} \sum_{\tilde{\alpha}}f_{\tilde{\alpha}}n_{\tilde{\alpha}}.
\end{align*}
$$

In first quantization, this is

$$
\begin{align*}
    \mel{\Phi'}{\hat{F}^{(1)}}{\Phi} &= \int \dd[3]{x_1}\cdots \dd[3]{x_N} \Phi'^{*}(\vb{x}_1\cdots\vb{x}_N)\qty(\sum_{i=1}^{N} \hat{f}) \Phi(\vb{x}_1\cdots \vb{x}_N)\\
    &=\sum_{\tilde{\alpha}}f_{\tilde{\alpha}} n_{\tilde{\alpha}}\int \int \dd[3]{x_1}\cdots \dd[3]{x_N} \Phi'^{*}(\vb{x}_1\cdots\vb{x}_N)\Phi(\vb{x}_1\cdots \vb{x}_N)\\
    &=\delta_{\Phi\Phi'}\sum_{\tilde{\alpha}} f_{\tilde{\alpha}}n_{\tilde{\alpha}},
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
    \hat{F}^{(1)} &= \sum_{\tilde{\alpha}} f_{\tilde{\alpha}}\hat{a}_{\tilde{\alpha}}^{\dagger}\hat{a}_{\tilde{\alpha}} = \sum_{\tilde{\alpha}} \qty(\sum_{\alpha}\braket{\alpha}{\tilde{\alpha}} \hat{a}_{\alpha})\qty(\sum_{\beta}\braket{\tilde{\alpha}}{\beta}\hat{a}_{\beta})\\
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
    \hat{T} &= \sum_{\alpha}\sum_{\beta} \int \dd[3]{x}\hat{\psi}^\dagger_{\alpha}(\vb{x}) \qty(-\frac{\hbar^2\nabla^2}{2m}) \braket{\alpha}{\beta} \hat{\psi}_{\beta}(\vb{x})\notag\\
    &= \sum_\alpha \int \dd[3]{x} \hat{\psi}^{\dagger}(\vb{x}) \qty(-\frac{\hbar^2 \nabla^2}{2m}) \hat{\psi}_{\alpha}(\vb{x}).
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
\hat{n}(\vb{y}) &= \sum_{\alpha}\sum_{\beta}\int\dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \qty[\delta(\vb{y}-\vb{x})\delta_{\alpha\beta}]\hat{\psi}_{\beta}(\vb{x})\notag\\
&=\sum_{\alpha} \int \dd[3]{x} \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) \delta(\vb{y}-\vb{x})\hat{\psi}_{\alpha}(\vb{x}) = \sum_{\alpha} \hat{\psi}_{\alpha}^{\dagger}(\vb{y})\hat{\psi}_{\alpha}(\vb{y}).
\end{align}
$$

And **Total particle number operator** is

$$
\begin{equation}
    \hat{N} = \int \dd[3]{y} \hat{n}(\vb{y}) = \sum_{\alpha} \int \dd[3]{y} \hat{\psi}_{\alpha}^{\dagger}(\vb{y})\hat{\psi}_{\alpha}(\vb{y}).
\end{equation}
$$

#### Spin density operator
#### Current density operator
> To be continued...
{: .prompt-danger}





