---
title:      "&sect;2.2 The Analytic Properties of Single-Particle Green's functions (fermions)"
date:       2024-05-22
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
media_subpath : /assets/img/in-post/many-particle-physics/
math: true
---

In this post, we discuss more analytic properties of single-particle Green's functions. Moreover, we will derive the **Lehmann representation** of single particle Green's functions in detail. Although our final expressions are *formally* applicable to both bosons and fermions, the existence of Bose condensation at $T=0$ introduces additional complications, and we shall consider only fermions in next sections. 

## 1. The Lehmann representation
The Hamiltonian $\hat{H}$, total momentum operator $\hat{P}$ and total particle number operator are commute with each other, so they have common eigenstates which form a complete orthonormal basis. We define a set of common eigenstates as $\qty{N,E_n(N),\mathbf{P}(N)}$ which satisfies

$$
\begin{equation}
\begin{cases}
\displaystyle{\braket{N',E_{n'}(N'),\mathbf{P}'(N')}{N,E_n(N),\mathbf{P}(N)}  = \delta_{N'N}\delta_{n'n}\delta_{\mathbf{P}'\mathbf{P}}}, \quad \text{Orthonormalization},\\[.3cm]
\displaystyle{\sum_{N}\sum_{n}\sum_{\mathbf{P}} \ket{N,E_n(N),\mathbf{P}}\bra{N,E_n(N),\mathbf{P}(N)} = \mathbb{1}}, \quad \text{completeness},    
\end{cases}
\end{equation}
$$

where $E_n(N)$ represents the $n$-th excited energy when the number of particles is $N$. The ground state is defined as $\ket{N\_g,E\_g(N_g),\mathbf{P}\_g(N\_g)}$, its energy is $E\_{n=0}=E\_g$. Now we assume that $\hat{H}$ is time independent and the system is translational invariance (i.e. $[\hat{H},\hat{\mathbf{P}}] =0 $). Then the Green's function can be rewritten as

$$
\begin{align*}
    i G_{\alpha\beta}(\mathbf{x}-\mathbf{x}',t-t') &= \ev{\hat{\mathsf{T}}\qty[\hat{\psi}_{H\alpha}(\vb{x},t)\hat{\psi}_{H\beta}^\dagger(\vb{x}',t')]}{\psi_{H}^0}\\[.2cm]
     &=\theta(t-t')\underbrace{\ev{\hat{\psi}_{\alpha}(0)\e^{i\hat{\mathbf{P}}\cdot(\mathbf{x}-\mathbf{x}')/\hbar}\textcolor{crimson}{\mathbb{1}}\e^{-i\hat{H}(t-t')/\hbar}\hat{\psi}_{\beta}^\dagger(0)}{\psi_H^0}}_{\mathrm{I}}\e^{-i\mathbf{P}\cdot(\mathbf{x}-\mathbf{x}')/\hbar}\e^{iE_{g}(t-t')/\hbar}\\[.2cm]
   &\quad - \theta(t'-t)\underbrace{\ev{\hat{\psi}_{\beta}^\dagger(0)\e^{-i\hat{\mathbf{P}}\cdot(\mathbf{x}-\mathbf{x}')/\hbar}\textcolor{crimson}{\mathbb{1}}\e^{i\hat{H}(t-t')/\hbar}\hat{\psi}_{\alpha}^(0)}{\psi_H^0}}_{\mathrm{II}}\e^{i\mathbf{P}\cdot(\mathbf{x}-\mathbf{x}')/\hbar}\e^{iE_{g}(t-t')/\hbar}\\[.2cm]
\end{align*}
$$

where we have used derivation results in the previous section in second equals. Then we find

$$
\begin{align}
    \mathrm{I}& = \sum_{n,\mathbf{P}} \mel{\psi_H^0}{\hat{\psi}_\alpha(0)}{N_{g}+1,n,\mathbf{P}}\mel{N_{g}+1,n,\mathbf{P}}{\hat{\psi}_{\beta}^\dagger(0)}{\psi_H^0}\e^{i\mathbf{P}\cdot(\mathbf{x}-\mathbf{x}')/\hbar}\e^{-iE_n(t-t')/\hbar},\\[.2cm]
    \mathrm{II}& = \sum_{n,\mathbf{P}} \mel{\psi_H^0}{\hat{\psi}_{\beta}^\dagger(0)}{N_g-1,n,\mathbf{P}}\mel{N_g-1,n,\vb{P}}{\hat{\psi}_{\alpha}(0)}{\psi_H^0}\e^{-i\vb{P}\cdot(\vb{x}-\vb{x}')/\hbar}\e^{iE_n(t-t')/\hbar}.
\end{align}
$$

<details class="nobg-hidden" markdown="1">
<summary> Proof </summary>

Let's take $\mathrm{I}$ as an example to calculate the result,
 
$$
\begin{align*}
    \mathrm{I}& =\ev{\hat{\psi}_{\alpha}(0)\e^{i\hat{\mathbf{P}}\cdot(\mathbf{x}-\mathbf{x}')/\hbar}\textcolor{crimson}{\mathbb{1}}\e^{-i\hat{H}(t-t')/\hbar}\hat{\psi}_{\beta}^\dagger(0)}{\psi_H^0}\\[.2cm]
    &= \textcolor{crimson}{\sum_{N,n,\vb{P}}} \bra{\psi_H^0}\hat{\psi}_{\alpha}(0)\e^{i\vb{P}\cdot(\vb{x}-\vb{x}')/\hbar}\textcolor{crimson}{\ket{N,n,\vb{P}}\bra{N,n,\vb{P}}}\e^{-i\hat{H}(t-t')/\hbar}\hat{\psi}_{\beta}^\dagger(0)\ket{\psi_H^0}\\[.2cm]
    &=\sum_{N,n,\vb{P}}\mel{\psi_H^0}{\hat{\psi}_{\alpha}(0)}{N,n,\vb{P}} \mel{N,n,\vb{P}}{\hat{\psi}_{\beta}^\dagger(0)}{\psi_{H}^0}\e^{i\vb{P}\cdot(\vb{x}-\vb{x}')/\hbar} \e^{-iE_n(t-t')/\hbar}.
\end{align*}
$$

Note that $\hat{N}\hat{\psi}\_{\beta}^\dagger(0)\ket{\psi_H^0} \propto (N_{g}+1) \ket{\psi\_H^0}$, so $N$ must equal to $N_{g}+1$ in the above summation,

$$
    \mathrm{I} = \sum_{n,\mathbf{P}} \mel{\psi_H^0}{\hat{\psi}_\alpha(0)}{N_{g}+1,n,\mathbf{P}}\mel{N_{g}+1,n,\mathbf{P}}{\hat{\psi}_{\beta}^\dagger(0)}{\psi_H^0}\e^{i\mathbf{P}\cdot(\mathbf{x}-\mathbf{x}')/\hbar}\e^{-iE_n(t-t')/\hbar}.
$$

This is exactly the desired result and the same is true for $\mathrm{II}$.

<p style="text-align: right;"> &#x220E; </p>
</details>

For simplicity, we introduce two new weight functions $A_{\alpha\beta}(n,\vb{P})$ and $B_{\alpha\beta}(n,\vb{P})$:

$$
\begin{align}
    A_{\alpha\beta}:=
\end{align}
$$


$$
\begin{align}
    G_{\alpha\beta}(\vb{x}-\vb{x}',t-t') &= V \sum_{n} \mel{\psi_H^0}{\hat{\psi}_{\alpha}^0}{N_{g}+1,E_g(N_g+1),\mathbf{k}(N_g+1)} \times \frac{\mel{N_g+1,E_n(N_g+1),\mathbf{k}(N_g+1)}{\hat{\psi}_{\beta}^\dagger(0)}{\psi_H^0}}{\omega - \hbar^{-1}\epsilon_{n\mathbf{k}}(N_g+1) - \mu + i\eta}\\[.2cm]
\end{align}
$$ 