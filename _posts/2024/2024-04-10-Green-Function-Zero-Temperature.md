---
title:      "&sect;2.1 Single-Particle Green's Functions at Zero Temperature (Fermions)"
date:       2024-04-10
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
math: true
---
Hamiltonian  with interaction can not always be solved exactly, the first few orders of perturbation theory cannot provide an adequate description of an interacting many-particle system. So we must find other methods to obtain all orders in perturbation theory. Luckily, we can get a formal solution through **Green's functions**.

## Definition, symmetry and physical significance of single-particle Green's function
### Definition
<div class="box-info" markdown="1">
<div class="title"> Single-particle Green's function </div>
The single-particle Green's function is defined as:

$$
\begin{equation}
G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = -i \bra{\psi_{H}^{0}} \hat{\mathsf{T}}\qty[\hat{\psi}_{H\alpha}(\vb{x},t)\hat{\psi}_{H\beta}^\dagger(\vb{x}',t')]\ket{\psi_H^{0}},
\end{equation}
$$

</div>


where $\ket{\psi_{H}^{0}}$ is the Heisenberg ground state of the interacting system satisfying

$$
\begin{equation}
\hat{H} \ket{\psi_{H}^0} = E_g^{0} \ket{\psi_H^0}, \quad \braket{\psi_H^0} =0.
\end{equation}
$$

And $\hat{\psi}_{H\alpha}(\vb{x},t)$ is a Heisenberg operator with the time dependence

$$
\begin{equation}
\hat{\psi}_{H\alpha}(\vb{x},t) = \e^{i\hat{H}(t-t_0)/\hbar} \hat{\psi}_{\alpha}(\vb{x}) \e^{-i\hat{H}(t-t_0)/\hbar}.
\end{equation}
$$

The $\hat{T}$ product here represents a generalization of the time ordering operator,

$$
\begin{equation}
    \hat{\mathsf{T}} [\hat{\psi}_{H\alpha}(\vb{x},t)\hat{\psi}_{H\beta}^{\dagger}(\vb{x}',t')] = \begin{cases}
        \hat{\psi}_{H\alpha}(\vb{x},t)\hat{\psi}_{H\beta}^\dagger(\vb{x}',t'), \quad & t>t',\\[.2cm]
        \pm\hat{\psi}_{H\beta}^\dagger(\vb{x}',t')\hat{\psi}_{H\alpha}(\vb{x},t), & t'>t,
    \end{cases}
\end{equation}
$$

where the upper (lower) sign refers to bosons (fermions).

> More generally, the $\hat{\mathsf{T}}$ product of several operators orders them from right to left in ascending time order and adds a factor $(-1)^{P}$, where $P$ is the number of interchanges of fermion operators from the original given order.
{: prompt-tip}

### Symmetry
- If the Hamiltonian does not depend on time which means that $\hat{H}(t) = \hat{H}$, then the Green's function depends only on the time difference,
$$
\begin{equation}
G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = G_{\alpha\beta}(\vb{x},\vb{x}';t-t').
\end{equation}
$$

- If the system is spatially uniform or isotropic (i.e. $[\hat{H},\hat{P}] = 0$), then the Green's function depends only on the position difference,
$$
\begin{equation}
    G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = G_{\alpha\beta}(\vb{x}-\vb{x}';t,t').
\end{equation}
$$

- If the Hamiltonian is independent of particle's spin, then
$$
\begin{equation}
    G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = G(\vb{x},t;\vb{x}',t').
\end{equation}
$$
If $\alpha=\beta$, then $G_{\alpha\alpha}(\vb{x},t;\vb{x}',t') = G(\vb{x},t;\vb{x}',t')$. Assume the spin quantum number is $s$, then $\hat{S}^2 = s(s+1)$ and $\displaystyle{\sum_{\alpha}1 = 2s+1}$, so
$$
\begin{equation}
G(\vb{x},t;\vb{x}',t') = \frac{1}{2s+1}\sum_{\alpha} G_{\alpha\alpha}(\vb{x},t;\vb{x}',t'). 
\end{equation}
$$

- If all three conditions above are met, then
$$
\begin{equation}
    G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = G(\vb{x}-\vb{x}';t-t')\delta_{\alpha\beta}.
\end{equation}
$$

### Physical significance
Assume $t>t'$ and $t_0 = 0$,

$$
\begin{align*}
    G_{\alpha\beta}(\vb{x},t;\vb{x}',t') &\propto \mel{\psi_H^0}{\hat{\psi}_{\alpha}(\vb{x},t)\hat{\psi}_\beta^\dagger(\vb{x}',t')}{\psi_H^0}\\[.2cm]
    &= \mel{\psi_H^0}{\e^{i\hat{H}t/\hbar}\psi_{\alpha}(\vb{x})\e^{-i\hat{H}t/\hbar} \e^{i\hat{H}t'/\hbar}\hat{\psi}_{\beta}^\dagger(\vb{x}')\e^{-i\hat{H}t'/\hbar}}{\psi_H^0}\\[.2cm]
    &=\underbrace{\langle \psi_H^0 | \e^{i\hat{H}t/\hbar}\psi_{\alpha}(\vb{x})}_{\bra{\beta}} \ \underbrace{\e^{-i\hat{H}(t-t')/\hbar} \hat{\psi}_{\beta}^\dagger(\vb{x}')\e^{-i\hat{H}t'/\hbar} | \psi_H^{0} \rangle}_{\ket{\alpha}}
\end{align*}
$$