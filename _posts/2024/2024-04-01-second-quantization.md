---
title:      "&sect;1.1 Second Quantization in Quantum Many-Particle Theory"
date:       2024-04-01
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
math: true
---
## 1. Introduction
First quantization in physics is the process of converting a classical system into a quantum system by assigning a wave function to each particle, which describes its behavior at the quantum level. This wave function is determined by solving the Schr&ouml;dinger equation. But for N-body system, if we construct the N-body wave function, it is impractical to find a direct solution of the Schr&ouml;dinger equation. So we must explore other techniques, we shall rely on **second quantization**, **quantum field theory**, and the use of **Green's functions**. 

The second quantization merely reformulates the original Schr&ouml;dinger equation, so it doesn't mean that we quantize the system twice. Second quantization, simply put, is a method of treating identical particles in a symmetrized Hilbert space using creation and annihilation operators.

## 2. The difficulty of the first quantization
For a general $N$-body system, the Hamiltonian takes the form

$$
\begin{equation}
\hat{H} = \sum_{k=1}^{N} \hat{T}(x_k) + \frac{1}{2} \sum_{\substack{k, l=1\\[.2cm] k\neq l}}^{N} \hat{V}(x_k,x_l),
\end{equation}
$$

where $x_k$ denotes the coordinates of the $k$th particle, including all freedoms. The time-independent Schr&#246;dinger equation for the N-body wave function is

$$
i\hbar \pdv{t} \Psi (x_1\cdots x_N,t) = \hat{H} \Psi(x_1\cdots x_N,t),
$$

together with an appropriate set of boundary conditions. The space of the $N$-body wave function $\Psi$ is just direct product of $N$ Hilbert spaces,

$$
\begin{equation}
    \mathcal{H}^{N} = \underbrace{\mathcal{H}\otimes\cdots\otimes \mathcal{H}}_{\text{N-copies}}.
\end{equation}
$$

So $\Psi$ can be expanded in terms of a complete set of time-independent single-particle wave functions $\qty{\psi_{E_k}}$ that incorporate the boundary conditions,

$$
\begin{equation}
\Psi (x_1\cdots x_N,t) = \sum_{E_1\cdots E_N} C(E_1\cdots E_N,t) \psi_{E_1}(x_1)\cdots \psi_{E_N}(x_N),
\label{equ:N-body wave function}
\end{equation}
$$

where $E_k$ represents a complete set of single-particle quantum numbers, note that they do not necessarily represent energy. And these single-particle wave functions $\qty{\psi_{E_k}}$ are orthonormal complete. Note that all of the time dependence of the wave function are included in the coefficients $C(E_1 \cdots E_N,t)$.

In physics, we are often interested in systems consisting of many identical particles which means that all intrinsic physical properties of the particles are the same, then the quantum indistinguishabilitiy implies that

$$
\begin{equation}
 |\Psi(x_1\cdots x_i \cdots x_j \cdots x_N,t)|^2 = |\Psi(x_1\cdots x_j\cdots x_i\cdots x_N,t)|^2.
\end{equation}
$$

In $3$ spatial dimensions, this can be shown to lead to only two different possibilities under exchange of the coordinates of two particles:

$$
\begin{align}
    &\Psi \Rightarrow + \Psi, \quad \text{i.e. the wave function is symmetric, or}\\[.2cm]
    &\Psi \Rightarrow -\Psi, \quad \text{i.e. the wave function is anti-symmetric.}
\end{align}
$$

Particles with a symmetric wave function are called **bosons**, particles with an antisymmetric wave function are called **fermions**.

<div class="box-info" markdown="1">
<div class="title"> Anyons </div>
For particles restricted to move in 2 spatial dimensions there also turns out to be more exotic possibilities than just bosons and fermions, namely so- called **anyons**.
</div>

> Note that many textbooks tell us that if we exchange two particles of a system twice, the wave function should be equivalent to no exchange at all, so that if  $\eta$ is the phase factor for one exchange, two exchanges give $\eta^2 =1$, which thus only gives the solutions $\eta=\pm 1$ corresponding to bosons and fermions.  
> That approach is indeed **wrong**, because exchanging two particles is not just permuting coordinates for the wave function mathematically, we must consider it physically by moving them in continuous paths around each other.
{: .prompt-warning}

The expansion coefficients reflect the identity of particles,

$$
\begin{align}
    &C \Rightarrow + C, \quad \text{i.e. Bosons, or}\\[.2cm]
    &C \Rightarrow -C, \quad \text{i.e. Fermions.}
\end{align}
$$

If we substitute $\eqref{equ:N-body wave function}$ into the Schr&#246;dinger equation, we can derive a differential equation for these coefficients

$$
\begin{align*}
    &i\hbar \pdv{t} C(E_1\cdots E_N,t) \\[.2cm]
    ={}& \sum_{k=1}^{N}\sum_{W} \int\dd{x_k}\psi_{E_k}^{\dagger}(x_k) T(x_k)\psi_{W}(x_k) C(E_1 \cdots  E_{k-1}W E_k \cdots E_N,t)\\[.2cm]
    +{}\ &\frac{1}{2}\sum_{\substack{k,l=1\\[.2cm]k\neq l}}^N \sum_{W}\sum_{W'}\iint\dd{x_k}\dd{x_l}\psi_{E_k}^{\dagger}(x_k) \psi_{E_l}^{\dagger}(x_l) V(x_k,x_l)\psi_W(x_k)\psi_{W'}(x_l)\\[.2cm]
    \times \ & C(E_1 \cdots E_{k-1} W E_{k+1} \cdots E_{l-1}W' E_{l+1}\cdots E_N,t).
\end{align*}
$$

This equation is extremely complex, and seeking a solution for it is impractical, which essentially encapsulates the challenge of the first quantization when dealing with $N$-body problems. 

We don't need to expend too much effort on it. We only need to know that it's very, very, very difficult.

## 3. Second quantization
### 3.1. Bosons
For bosons, out of the given set of quantum numbers $E_1,\cdots,E_N$, suppose that the state $1$ occurs $n_1$ times, the state 2 occurs $n_2$ times, and so on. We can defined a special wave function

$$
\begin{equation}
    \Phi_{n_1n_2\cdots n_{\infty}}(x_1\cdots x_N) \equiv \sqrt{\frac{n_1!n_2!\cdots n_{\infty}!}{N!}} \sum_{\substack{E_1\cdots E_N\\[.2cm](n_1 \cdots n_\infty)}}\psi_{E_1}(x_1)\cdots \psi_{E_N}(x_N).
\end{equation}
$$

The most general $N$-body wave function can be expanded in terms of these completely symmetrized wave functions $\Phi_{n_1\cdots n_\infty}(x_1,\cdots,x_N)$

$$
\begin{equation}
    \Psi(x_1\cdots x_N,t) = \sum_{\substack{n_1n_2\cdots n_{\infty}\\[.2cm] \sum_i n_i = N}} f(n_1n_2\cdots n_{\infty},t) \Phi_{n_1n_2\cdots n_{\infty}}(x_1 x_2\cdots x_N).
\end{equation}
$$


This because $\{\Phi\}$ forms a complete orthonormal basis which means

$$
\begin{gather}
    \Phi(\cdots x_i \cdots x_j\cdots) = \Phi(\cdots x_j \cdots x_i \cdots),\\[.2cm]
    \int \dd{x_1}\cdots\dd{x_N} \Phi_{n_1'\cdots n_{\infty}'}^{\dagger}(x_1\cdots x_N) \Phi_{n_1\cdots n_{\infty}}(x_1\cdots x_N) = \delta_{n_1'n_1}\cdots \delta_{n_\infty' n_\infty},
\end{gather}
$$

These properties are easily proven and will be omitted here.

<div class="box-tip" markdown="1">
<div class="title"> Example </div>

Considering a bosonic system where two particles are in state $1$ and one particle is in state $2$, its wave function can be written as

$$
\Phi_{210\cdots 0}(x_1x_2x_3) = \frac{1}{\sqrt{3}}[\psi_1(x_1)\psi_1(x_2)\psi_2(x_3)+\psi_1(x_1)\psi_2(x_2)\psi_1(x_3) + \psi_2(x_1)\psi_1(x_2)\psi_1(x_3)].
$$

</div>

### 3.2. Fermions
For fermions, the occupation number $n_i$ must be either zero or one because of the Pauli exclusion principle. In the context of considering the antisymmetry of $\Psi$, we can write normalized basis wave functions

$$
\begin{equation}
    \Phi_{n_1\cdots n_{\infty}}(x_1\cdots x_N) = \sqrt{\frac{n_1! n_2!\cdots n_{\infty}!}{N!}} \mdet{\psi_{E_1}(x_1)& \cdots & \psi_{E_1}(x_N)\\[.2cm]
    \vdots& &\vdots \\[.2cm]
    \psi_{E_N}(x_1) & \cdots & \psi_{E_N}(x_N)}.
\end{equation}
$$

These functions form a complete set of orthonormal antisymmetric time-independent many-particle wave functions and are usually referred to as the **Slater determinant**, then

$$
\begin{gather}
    \Phi(\cdots x_i \cdots x_j\cdots) = -\Phi(\cdots x_j \cdots x_i \cdots),\\[.2cm]
    \int \dd{x_1}\cdots\dd{x_N} \Phi_{n_1'\cdots n_{\infty}'}^{\dagger}(x_1\cdots x_N) \Phi_{n_1\cdots n_{\infty}}(x_1\cdots x_N) = \delta_{n_1'n_1}\cdots \delta_{n_\infty' n_\infty}.
\end{gather}
$$

The $N$-body wave function $\Psi$ can be expanded as

$$
\begin{equation}
    \Psi(x_1\cdots x_N,t) = \sum_{n_1\cdots n_\infty=0}^{1} f(n_1\cdots n_{\infty},t )\Phi_{n_1\cdots n_{\infty}}(x_1\cdots x_N).
\end{equation}
$$

<div class="box-tip" markdown="1">
<div class="title"> Example </div>

Considering a fermionic system where one particle is in state $1$ and another particle is in state $2$, the wave function of the system can be expressed as:

$$
\Phi_{110\cdots 0}(x_1x_2) = \frac{1}{\sqrt{2}}[\psi_1(x_1)\psi_2(x_2) - \psi_2(x_1)\psi_1(x_2)].
$$

</div>


### 3.3. Occupation number formalism
Instead of using the previous results, we typically address many-particle problem in occupation number formalism, as determining the coefficients in those cases is impractical. We introduce the time-independent abstract state vectors

$$
\ket{n_1 n_2 \cdots n_{\infty}} = \ket{n_1}\otimes\ket{n_2}\otimes\cdots \otimes \ket{n_{\infty}},
$$

where the notation means that there are $n_1$ particles in the eigenstate $1$, $n_2$ particles in the eigenstate $2$, and so on. We want this basis to be complete and orthonormal, which requires that these states satisfy the conditions

$$
\begin{align}
    &\braket{n_1'n_2'\cdots n_\infty'}{n_1n_2\cdots n_{\infty}} = \delta_{n_1'n_1}\delta_{n_2'n_2}\cdots \delta_{n_{\infty}'n_{\infty}}, \quad \text{orthogonality},\\[.2cm]
    &\sum_{n_1n_2\cdots n_{\infty}}\ket{n_1n_2\cdots n_{\infty}}\bra{n_1n_2\cdots n_{\infty}} = 1, \quad \text{completeness}.
\end{align}
$$

The general $N$-body state can also be expanded in terms of these abstract state.

#### 3.3.1. Bosons
We can introduce time-independent creation and annihilation operators $\hat{b}_k^\dagger,\hat{b}_k$ which satisfy the following commutation relations

$$
\begin{equation}
    [\hat{b}_k,\hat{b}_{k'}^\dagger] = \delta_{kk'}, \quad [\hat{b}_k,\hat{b}_k'] = [\hat{b}_{k}^\dagger,\hat{b}_{k'}^{\dagger}] =0.
\end{equation}
$$

This leads to all the properties of bosons, in particular,

$$
\begin{align}
    \hat{b}_k \ket{n_1\cdots n_k\cdots} &= \sqrt{n_k}\ket{n_1\cdots n_k-1\cdots},\\[.2cm]
    \hat{b}_k^{\dagger}\ket{n_1\cdots n_k\cdots} &=\sqrt{n_k+1}\ket{n_1\cdots n_k+1\cdots}.
\end{align}
$$

Any given state can be generated from the vacuum state $\ket{0}\equiv \ket{0\cdots n_k=0\cdots}$

$$
\begin{equation}
    \ket{n_1\cdots n_k} = \frac{(\hat{b}_1^\dagger)^{n_1}}{\sqrt{n_1!}}\cdots \frac{(\hat{b}_k^\dagger)^{n_k}}{\sqrt{n_k!}}\cdots \ket{0}.
\end{equation}
$$

#### 3.3.2. Fermions

Similarly, we introduce time-independent creation and annihilation operators $\hat{c}_k,\hat{c}_k^\dagger$, but they obey the following anticommutation relations

$$
\begin{equation}
    \{\hat{c}_k,\hat{c}_k'^\dagger\} =\delta_{k,k'},\quad \{\hat{c}_k,\hat{c}_{k'}\} = \{\hat{c}_k^\dagger,\hat{c}_{k'}^\dagger\} = 0.
\end{equation}
$$

The occupation of any state $k$ can only be $n_k=0$ or $n_k=1$. With definition 

$$
\begin{equation}
\ket{n_1\cdots n_k \cdots} = (\hat{c}_1^\dagger)^{n_1}\cdots (\hat{c}_k^\dagger)^{n_k}\cdots \ket{0},
\end{equation}
$$

we can derive that

$$
\begin{equation}
    \hat{c}_k\ket{n_1\cdots n_k \cdots} = 
    \begin{cases}
        (-1)^{S_k}\ket{n_1\cdots n_{k-1}\cdots}, \quad &n_k=1,\\[.2cm]
        0, &n_k=0,
    \end{cases}
\end{equation}
$$

and

$$
\begin{equation}
    \hat{c}_k^\dagger \ket{n_1 \cdots n_k \cdots} =
    \begin{cases}
        (-1)^{S_k} \ket{n_1\cdots n_{k+1}\cdots}, \quad &n_k=0,\\[.2cm]
        0, & n_k=1 ,
    \end{cases}
\end{equation}
$$

where the phase factor $S_k$ is defined by $S_{k} = n_1+n_2 +\cdots n_{k-1}$.

## 4. Field operators
It is often convenient to form the linear combinations of the creation and destruction operators (denoted $$\hat{a}_{k\alpha}^\dagger$$ and $$\hat{a}_{k\alpha}$$ for generality),

<div class="box-danger" markdown="1">
<div class="title"> Field operators </div>

$$
\begin{equation}
    \hat{\psi}_{\alpha}(\vb{x}) := \sum_{k} \psi_{k}(\vb{x}) \hat{a}_{k\alpha},\quad \hat{\psi}^{\dagger}_{\alpha}(\vb{x}) := \sum_{k} \psi_{k}^\dagger(\vb{x}) \hat{a}_{k\alpha}^\dagger,
\end{equation}
$$

where $\alpha$ is an index used to distinguish different spin component. $$\hat{\psi}_{\alpha}$$ and $$\hat{\psi}^\dagger_{\alpha}$$ are called **field operators** that satisfy the following commutation or anticommutation relations

$$
\begin{equation}
[\hat{\psi}_{\alpha}(\vb{x}),\hat{\psi}_{\beta}^{\dagger}(\vb{x}')]_{\mp} = \delta_{\alpha\beta} \delta(\vb{x}-\vb{x}'), \quad [\hat{\psi}_{\alpha}(\vb{x}),\hat{\psi}_{\beta}(\vb{x}')]_{\mp} = [\hat{\psi}_{\alpha}^\dagger(\vb{x}),\hat{\psi}_{\beta}^\dagger(\vb{x}')]_{\mp} = 0.
\end{equation}
$$

where the upper (lower) sign refers to bosons (fermions).

</div>



In the next section, we will discuss the second quantization representation of some observables (one- and two- particle operators).

## 5. References
1. Fetter, A. L., Walecka, J. D., *Quantum Theory of Many-Particle Systems*. Courier Corporation. (2002)
2. Mahan, G. D., *Many-Particle Physics*. Springer Science+Business Media, LLC. (2000).
3. Altland, A., Simons, B. D., *Condensed Matter Field Theory*. Cambridge University Press. (2010)
4. 金彪. 量子多体理论. 2024年春