---
title:      "&sect;2.2 The Analytic Properties of Single-Particle Green's function (fermions)"
date:       2024-05-22
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
media_subpath : /assets/img/in-post/many-particle-physics/
math: true
---
In the previous section, we have shown some symmetries of single particle Green's function without proof. In this section, we will prove them in detail and discuss more analytic properties. Moreover, we will derive the **Lehmann representation** of single particle Green's function. Although our final expressions are *formally* applicable to both bosons and fermions, the existence of Bose condensation at $T=0$ introduces additional complications, and we shall consider only fermions in next sections. 

## 1. The Lehmann representation
The Hamiltonian $\hat{H}$, total momentum operator $\hat{P}$ and total particle number operator are commute with each other, so they have common eigenstates which form a complete orthonormal basis. We define a set of common eigenstates as $\qty{N,E_n(N),\mathbf{P}(N)}$ which satisfies

$$
\begin{equation}
\begin{cases}
\displaystyle{\braket{N',E_{n'}(N'),\mathbf{P}'(N')}{N,E_n(N),\mathbf{P}(N)}  = \delta_{N'N}\delta_{n'n}\delta_{\mathbf{P}'\mathbf{P}}}, \quad \text{orthonormality}\\[.2cm]
\displaystyle{\sum_{N}\sum_{n}\sum_{\mathbf{P}} \ket{N,E_n(N),\mathbf{P}}\bra{N,E_n(N),\mathbf{P}(N)} = \mathbb{1}}, \quad \text{completeness}.    
\end{cases}
\end{equation}
$$

The ground state is defined as $\ket{N_g,E_g(N_g),\mathbf{P}_g(N_g)}$, its energy is $E\_{n=0}=E_g$. If $n\neq 0$, $E_{n\neq 0}$ is the energy of a excited state. 