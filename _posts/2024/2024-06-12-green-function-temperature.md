---
title:      "&sect;4.1 Matsubara Green's Function at Finite Temperature"
date:       2024-06-12
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
media_subpath : /assets/img/in-post/many-particle-physics/
math: true
---

Our theory of many-particle systems at zero temperature made extensive use of the single-particle Green's function, which was expressed as a perturbation expansion in the interaction picture. Knowledge of $G$ provided both the complete equilibrium properties of the system and the excitation energies of the system containing one more or one less particle (Lehmann representation). At finite temperatures, however, we can not directly calculate $G$ from the same diagrammatic analysis before. It is therefore necessary to introduce another new Green's function, i.e. **Matsubara Green's Function**.

## Matsubara Green's Function

### Definition
In treating system at finite temperatures, it will be most convenient to use the grand canonical ensemble, which allows for the possibility of a variable number of particles. The Hamiltonian becomes

$$
\hat{K} = \hat{H} - \mu \hat{N},
$$

where $\mu$ is the chemical potential and $\hat{N}$ is the total particle number operator. To deal with mixed states, we introduce the density operator

$$
\begin{equation}
    \hat{\rho} : = \frac{\e^{-\beta \hat{K}}}{\Xi} = \e^{\beta(\Omega- \hat{K})},
\end{equation}
$$

where $\beta = 1/k_{B}T$, $\Omega = -\beta^{-1}\ln \Xi$ is the thermodynamic potential and $\Xi$ is the grand partition function. Note that $\Xi$ can be expressed as

$$
\begin{equation}
    \Xi = \Tr(\e^{-\beta\hat{K}}) = \e^{-\beta \Omega},
\end{equation}
$$

The expectation value of an operator $\hat{O}$ in the grand canonical ensemble is

$$
\begin{equation}
    \expval*{\hat{O}}_{T} = \Tr\qty[\hat{\rho}\hat{O}]=\Tr\qty[\e^{\beta(\Omega- \hat{K})}\hat{O}].
\end{equation}
$$

The chemical potential can be determined by the expectation value of the total particle number operator $\hat{N}$:

$$
\begin{equation}
    \expval*{\hat{N}}_{T} = \Tr\qty[\e^{\beta(\Omega-\hat{K})}\hat{N}] = N.
\end{equation}
$$

Assume $\hat{H}$ do not dependent on time. So, for any Schr&ouml;dinger operator $\hat{O}_S(\vb{x})$, we can introduce the (modified) Heisenberg picture as

$$
\begin{equation}
    \hat{O}_{H}(\vb{x},\tau) = \e^{\hat{K}\tau/\hbar}\hat{O}_{S}(\vb{x})\e^{-\hat{K}\tau/\hbar}.
\end{equation}
$$

<div class="box-info" markdown="1">
<div class="title"> Field operators in Heisenberg picture </div>
In particular, the field operators in the Heisenberg picture assume the form

$$
\begin{equation}
    \hat{\psi}_{H\alpha}(\vb{x},\tau) = \e^{\hat{K}\tau/\hbar} \hat{\psi}_{\alpha}(\vb{x})\e^{-\hat{K}\tau/\hbar},\quad \hat{\psi}^\dagger_{H\alpha}(\vb{x},t) = \e^{\hat{K}\tau/\hbar}\hat{\psi}_{\alpha}^\dagger(\vb{x}) \e^{-\hat{K}\tau/\hbar}.
\end{equation}
$$
 
</div>

> Note that $\hat{\psi}^\dagger\_{H\alpha}(\vb{x},\tau)$ is *not* the adjoint of $\hat{\psi}\_{H\alpha}(\vb{x},\tau)$ as long as $\tau$ is real. That's because
>
> $$
>   \qty[\hat{\psi}_{H\alpha}(\vb{x},\tau)]^\dagger = \e^{-\hat{K}\tau/\hbar} \hat{\psi}_{\alpha}^\dagger(\vb{x}) \e^{\hat{K}\tau/\hbar} \neq \hat{\psi}_{H\alpha}^\dagger(\vb{x},\tau). 
> $$
>
> To avoid confusion the adjoint of an operator $\hat{O}$ is explicitly denoted by $[\hat{O}]^\dagger$ in this Chapter.
{. prompt-warning}


<div class="box-info" markdown="1">
<div class="title"> Matsubara Green's function </div>
The Matsubara Green's function (or single-particle temperature Green's function) is defined as

$$
\begin{equation}
    \mathcal{G}_{\alpha\beta}(\vb{x},\tau;\vb{x}',\tau') : = \Tr\qty[\hat{\rho}\hat{\mathsf{T}}_{\tau}\qty[\hat{\psi_{H\alpha}(\vb{x},\tau)\hat{\psi}_{H\beta}^\dagger(\vb{x}',\tau')}]] = -\expval{\hat{\mathsf{T}}_{\tau}\qty[\hat{\psi}_{H\alpha}(\vb{x},\tau)\hat{\psi}_{H\beta}^\dagger(\vb{x}',\tau')]}_{T}, 
\end{equation}
$$

where $\hat{\mathsf{T}}_{\tau}$ denotes ordering the operators according to their value of $\tau$, with the smallest at the right. $\hat{\mathsf{T}}_{\tau}$ also includes the signature factor $(-1)^P$, where $P$ is the number of permutations of fermion operators needed to restore the original ordering.

</div>

## Relation to observables
### Expectation value of single-particle operators

<div class="box-danger" markdown="1">
<div class="title"> Expectation value of a single-particle operator </div>

For a single-particle operator, its expectation value at finite temperature is

$$
\begin{equation}
    \expval*{\hat{F}^{(1)}}_{T} = \mp \sum_{\alpha}\sum_{\beta}\int\dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to \tau^+}} \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s}) \mathcal{G}_{\beta\alpha}(\vb{x},\tau;\vb{x}',\tau'),
\end{equation}
$$

where the upper (lower) sign refers to bosons (fermions). 

<details class="details-inline" markdown="1">
<summary>Proof</summary>
The second quantization form of a single particle operator is

$$
\hat{F}^{(1)} = \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \hat{\psi}_{\alpha}^\dagger(\vb{x}) \mel{\alpha}{\hat{f}(\vb{x},-i\hbar\nabla,\hat{s})}{\beta} \hat{\psi}_{\beta}(\vb{x}).
$$

Then the expectation value of $\hat{F}^{(1)}$ at finite temperature is

$$
\begin{align*}
    \expval*{\hat{F}^{(1)}}_T & = \sum_{\alpha}\sum_\beta \int \dd[3]{x} \Tr\qty[\hat{\rho}\hat{\psi}_{\alpha}^\dagger(\vb{x})\hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s})\hat{\psi}_{\beta}(\vb{x})]\\[.2cm]
    &=\sum_{\alpha}\sum_{\beta}\int\dd[3]{x} \lim_{\vb{x}'\to \vb{x}} \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s}) \Tr\qty[\hat{\rho}\hat{\psi}^\dagger(\vb{x}')\hat{\psi}_{\beta}(\vb{x})]\\[.2cm]
    &=\sum_{\alpha}\sum_{\beta} \int\dd[3]{x} \lim_{\vb{x}'\to\vb{x}} \hat{f}_{\alpha\beta}(\vb{x})\Tr\qty[\hat{\rho}\e^{-\hat{K}\tau/\hbar}\hat{\psi}_{H\alpha}^\dagger(\vb{x}',\tau)\e^{\hat{K}\tau/\hbar}\e^{-\hat{K}\tau/\hbar}\hat{\psi}_{H\beta}(\vb{x},\tau)\e^{\hat{K}\tau/\hbar}]\\[.2cm]
    &=\sum_{\alpha}\sum_{\beta}\int\dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to\tau^+}}\hat{f}_{\alpha\beta}(\vb{x}) \Tr\qty[\hat{\rho}\hat{\psi}^\dagger_{H\alpha}(\vb{x}',\tau')\hat{\psi}_{H\beta}(\vb{x},\tau)]\\[.2cm]
    &=\sum_{\alpha}\sum_{\beta} \int\dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to\tau^+}}\hat{f}_{\alpha\beta}(\vb{x}) \Tr\qty[\hat{\rho}\hat{\mathsf{T}}_{\tau}\qty[\hat{\psi}^\dagger_{H\alpha}(\vb{x}',\tau')\hat{\psi}_{H\beta}(\vb{x},\tau)]]\\[.2cm]
    &=\pm \sum_{\alpha}\sum_{\beta} \int\dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to\tau^+}}\hat{f}_{\alpha\beta}(\vb{x}) \Tr\qty[\hat{\rho}\hat{\mathsf{T}}_{\tau}\qty[\hat{\psi}_{H\beta}(\vb{x},\tau)\hat{\psi}^\dagger_{H\alpha}(\vb{x}',\tau')]]\\[.2cm]
    &=\mp \sum_{\alpha}\sum_{\beta} \int\dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to\tau^+}}\hat{f}_{\alpha\beta}(\vb{x}) \mathcal{G}_{\beta\alpha}(\vb{x},\tau;\vb{x}',\tau').
\end{align*}
$$

<p style="text-align: right;"> &#x220E; </p>
</details>

If $\hat{f}\_{\alpha\beta} = \mel{\alpha}{\hat{f}}{\beta}$ is independent of particle's spin, i.e. $\hat{f}\_{\alpha\beta} = \hat{f}\delta\_{\alpha\beta}$, then

$$
\begin{equation}
    \expval*{\hat{F}^{(1)}}_{T} = \mp \sum_{\alpha}\int\dd[3]{x}  \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to \tau^+}} \hat{f}(\vb{x},-i\hbar\nabla) \mathcal{G}_{\alpha\alpha}(\vb{x},\tau;\vb{x}',\tau').
\end{equation}
$$

</div>

<div class="box-tip" markdown="1">
<div class="title"> Examples </div>

- For total kinetic energy operator:

    $$
    \begin{equation}
        \expval*{\hat{T}}_T  = \mp  \sum_{\alpha} \int \dd[3]{x}  \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to \tau^+}} \qty(-\frac{\hbar^2\nabla^2}{2m}) \mathcal{G}_{\alpha\alpha}(\vb{x},\tau;\vb{x}',\tau').
    \end{equation}
    $$

- For total momentum operator:

    $$
    \begin{equation}
        \expval*{\hat{\mathbf{P}}}_T = \mp  \sum_{\alpha} \int \dd[3]{x}  \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to \tau^+}} \qty(-i\hbar\nabla) \mathcal{G}_{\alpha\alpha}(\vb{x},\tau;\vb{x}',\tau').
    \end{equation}
    $$

- For Total particle number operator:

    $$
    \begin{equation}
        \expval*{\hat{N}}_T =\mp  \sum_{\alpha} \int \dd[3]{x}  \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to \tau^+}} \mathcal{G}_{\alpha\alpha}(\vb{x},\tau;\vb{x}',\tau').
    \end{equation}
    $$

- For total spin operator:

    $$
    \begin{equation}
        \expval*{\hat{S}}_T = \mp \sum_{\alpha}\sum_\beta \int \dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ \tau'\to \tau^+}} \mel{\alpha}{\hat{s}}{\beta}\mathcal{G}_{\beta\alpha}(\vb{x},\tau;\vb{x}',\tau').
    \end{equation}
    $$
    
</div>


