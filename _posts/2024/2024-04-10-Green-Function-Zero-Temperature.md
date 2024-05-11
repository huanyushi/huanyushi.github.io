---
title:      "&sect;2.1 Single-Particle Green's Functions at Zero Temperature (Fermions)"
date:       2024-04-10
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
math: true
---
Hamiltonian  with interaction can not always be solved exactly, the first few orders of perturbation theory cannot provide an adequate description of an interacting many-particle system. So we must find other methods to obtain all orders in perturbation theory. Luckily, we can get a formal solution through **Green's functions**.

## 1. Definition, symmetry and physical significance of single-particle Green's function
### 1.1. Definition
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
{: .prompt-tip}

### 1.2. Symmetry
1. If the Hamiltonian does not depend on time which means that $\hat{H}(t) = \hat{H}$, then the Green's function depends only on the time difference,

   $$
   \begin{equation}
   G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = G_{\alpha\beta}(\vb{x},\vb{x}';t-t').
   \end{equation}
   $$


2. If the system is spatially uniform or isotropic (i.e. $[\hat{H},\hat{P}] = 0$), then the Green's function depends only on the position difference,

   $$
   \begin{equation}
       G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = G_{\alpha\beta}(\vb{x}-\vb{x}';t,t').
   \end{equation}
   $$


3. If the Hamiltonian is independent of particle's spin, then

   $$
   \begin{equation}
       G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = G(\vb{x},t;\vb{x}',t').
   \end{equation}
   $$

   And if $\alpha=\beta$, then $G_{\alpha\alpha}(\vb{x},t;\vb{x}',t') = G(\vb{x},t;\vb{x}',t')$. Assume the spin quantum number is $s$, then $\hat{S}^2 = s(s+1)$ and $\displaystyle{\sum_{\alpha}1 = 2s+1}$, so

   $$
   \begin{equation}
   G(\vb{x},t;\vb{x}',t') = \frac{1}{2s+1}\sum_{\alpha} G_{\alpha\alpha}(\vb{x},t;\vb{x}',t'). 
   \end{equation}
   $$

4. If all three conditions above are met, then

   $$
   \begin{equation}
       G_{\alpha\beta}(\vb{x},t;\vb{x}',t') = G(\vb{x}-\vb{x}';t-t')\delta_{\alpha\beta}.
   \end{equation}
   $$

### 1.3. Physical significance
Without loss of generality, we can assume $t>t'$ and let $t_0 = 0$, then the Green's function becomes

$$
\begin{align*}
    G_{\alpha\beta}(\vb{x},t;\vb{x}',t') &\propto \mel{\psi_H^0}{\hat{\psi}_{\alpha}(\vb{x},t)\hat{\psi}_\beta^\dagger(\vb{x}',t')}{\psi_H^0}\\[.2cm]
    &= \mel{\psi_H^0}{\e^{i\hat{H}t/\hbar}\hat{\psi_{\alpha}}(\vb{x})\e^{-i\hat{H}t/\hbar} \e^{i\hat{H}t'/\hbar}\hat{\psi}_{\beta}^\dagger(\vb{x}')\e^{-i\hat{H}t'/\hbar}}{\psi_H^0}\\[.2cm]
    &=\underbrace{\langle \psi_H^0 | \e^{i\hat{H}t/\hbar}}_{\bra{\Phi_2}} \ \underbrace{\hat{\psi}_{\alpha}(\vb{x})\e^{-i\hat{H}(t-t')/\hbar} \hat{\psi}_{\beta}^\dagger(\vb{x}')\e^{-i\hat{H}t'/\hbar} | \psi_H^{0} \rangle}_{\ket{\Phi_1}}.
\end{align*}
$$ 

Starting from the ground state $\ket{\psi_{H}^0}$, $\e^{-i\hat{H} t'/\hbar}$ represents the evolution to time $t'$. If we apply the field operator $\hat{\psi}\_{\beta}^{\dagger}(\vb{x}')$ to this state $\e^{-i\hat{H} t'/\hbar}\ket{\psi_{H}^0}$, it means that a particle with spin index $\beta$ is created at position $\vb{x}'$. Finally, let this state evolve from time $t'$ to $t$ and let the particle created at time $t'$ be annihilated by $\hat{\psi}\_{\alpha}(\vb{x})$ at $\vb{x}$ with a spin index $\alpha$. So we reach the state $\ket{\Phi_1} = \hat{\psi}\_{\alpha}(\vb{x})\e^{-i\hat{H}(t-t')/\hbar} \hat{\psi}\_{\beta}^\dagger(\vb{x}')\e^{-i\hat{H}t'/\hbar}\ket{\psi_H^0}$.

Similarly for the state $\bra{\Phi_2}$. Starting from the ground state $\bra{\psi_H^0}$, after evolving to time $t$, we get the state $\bra{\Phi_2} = \bra{\psi_H^0}\e^{i\hat{H}t/\hbar}$.

So Green's function is actually proportional to this probability amplitude $\braket{\Phi_2}{\Phi_1}$. That's why Green's function is also called as **propagator**.
 
## 2. Relation to observables

### 2.1. The ground state expectation value of a single particle operator
The expectation value of any single particle operator in the ground state of the system can be expressed via Green's function. 

<div class="box-danger" markdown="1">
<div class="title"> The ground state expectation value of a single particle operator </div>

$$
\begin{equation}
    \mel{\psi_H^0}{\hat{F}^{(1)}}{\psi_H^0} = \pm i \sum_{\alpha}\sum_\beta \int \dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s}) G_{\alpha\beta}(\vb{x},t;\vb{x}',t'),
\end{equation}
$$

where the upper (lower) sign refers to bosons (fermions).

<details class="nobg-hidden" markdown="1">
<summary> Proof </summary>
Recall the previous section, we have obtained the expression of single particle operator in second quantization:

$$
\begin{equation*}
    \hat{F}^{(1)} = \sum_{\alpha}\sum_{\beta}\int \dd[3]{x} \hat{\psi}^\dagger_{\alpha}(\vb{x}) \mel{\alpha}{\hat{f}(\vb{x}_i,\hat{p}_i,\hat{s}_i)}{\beta}\hat{\psi}_{\beta}(\vb{x}).
\end{equation*}
$$

Then the ground state of a single operator $\hat{F}^{(1)}$ can be expressed as 

$$
\begin{align*}
    \mel{\psi_H^0}{\hat{F}^{(1)}}{\psi_H^0} & = \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \mel{\psi_H^0}{\hat{\psi}^\dagger_{\alpha}(\vb{x}) \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s_i})\hat{\psi}_{\beta}(\vb{x})}{\psi_H^0}\\[.2cm]
    &=\sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \lim_{\vb{x}'\to \vb{x}} \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s})
    \\[.2cm]
    &\qquad \times \mel{\psi_{H}^0}{\cancelto{\e^{-iE_g t}}{\e^{-i\hat{H}t/\hbar}}\hat{\psi}_{H\alpha}(\vb{x},t)^\dagger \cancel{\e^{i\hat{H}t/\hbar}}\cancel{\e^{-i\hat{H}t/\hbar}}\hat{\psi}_{H\beta}(\vb{x},t)\cancelto{\e^{iE_g t}}{\e^{i\hat{H}t}}}{\psi_{H_0}}\\[.2cm]
    &=\sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \lim_{\vb{x}'\to\vb{x}} \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s})
    \mel{\psi_H^0}{\hat{\psi}_{H\alpha}^\dagger(\vb{x}',t)\hat{\psi}_{H\beta}(\vb{x},t)}{\psi_H^0}\\[.2cm]
    &=\sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} 
     \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s})
    \mel{\psi_H^0}{\hat{\psi}_{H\alpha}^\dagger(\vb{x}',t')\hat{\psi}_{H\beta}(\vb{x},t)}{\psi_H^0}
\end{align*}
$$

Note that $\hat{A}(t')\hat{B}(t) = \hat{\mathsf{T}}\left[\hat{A}(t')\hat{B}(t)\right]$ if $t'>t$. And 

$$
 \hat{\mathsf{T}}\qty[\hat{A}(t')\hat{B}(t)] = \hat{\mathsf{T}}\qty[\pm \hat{B}(t)\hat{A}(t')] = \pm \hat{\mathsf{T}}\qty[\hat{B}(t)\hat{A}(t)'], 
$$
 
where the upper (lower) sign refers to bosons (fermions). Then

$$
\begin{align*}
    \mel{\psi_H^0}{\hat{F}^{(1)}}{\psi_H^0} & = \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} 
     \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s})
    \mel{\psi_H^0}{\hat{\mathsf{T}}\qty[\hat{\psi}_{H\alpha}^\dagger(\vb{x}',t')\hat{\psi}_{H\beta}(\vb{x},t)]}{\psi_H^0}\\[.2cm]
    &=\pm \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} 
     \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s})
    \mel{\psi_H^0}{\hat{\mathsf{T}}\qty[\hat{\psi}_{H\beta}(\vb{x},t)\hat{\psi}_{H\alpha}^\dagger(\vb{x}',t')]}{\psi_H^0}\\[.2cm]
    &= \pm \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} 
     \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s}) G_{\beta\alpha}(\vb{x},t;\vb{x}',t')\\[.2cm]
     &= \pm \sum_{\alpha}\sum_{\beta} \int \dd[3]{x} \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} 
     \hat{f}_{\alpha\beta}(\vb{x},-i\hbar\nabla,\hat{s}) G_{\alpha\beta}(\vb{x},t;\vb{x}',t').
\end{align*}
$$

<p style="text-align: right;"> &#x220E; </p>
</details>

</div>

<div class="box-tip" markdown="1">
<div class="title"> Examples </div>

- For total kinetic energy operator:

    $$
    \begin{align}
        \ev{\hat{T}}{\psi_H^0}  &= \pm i \sum_{\alpha}\sum_{\beta} \int \dd[3]{x}  \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}}  \delta_{\alpha\beta}\qty(-\frac{\hbar^2\nabla^2}{2m}) G_{\alpha\beta}(\vb{x},t;\vb{x}',t')\notag\\[.2cm]
        &= \pm i \sum_{\alpha} \int \dd[3]{x}  \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} \qty(-\frac{\hbar^2\nabla^2}{2m}) G_{\alpha\alpha}(\vb{x},t;\vb{x}',t').
    \end{align} 
    $$

- For total momentum operator:

    $$
    \begin{align}
        \ev{\hat{P}}{\psi_H^0} = \pm i \sum_{\alpha} \int \dd[3]{x}  \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} (-i\hbar\nabla)G_{\alpha\alpha}(\vb{x},t;\vb{x}',t').
    \end{align}
    $$

- For local density operator:

    $$
    \begin{align}
        \ev{n(\vb{y})}{\psi_H^0} &= \sum_{\alpha} \ev{\hat{\psi}_{\alpha}^\dagger(\vb{y}) \hat{\psi}_{\alpha}(\vb{y})}{\psi_H^0}\notag\\[.2cm]
        &= \sum_{\alpha} \ev{\hat{\psi}_{H\alpha}(\vb{y},t)\hat{\psi}_{H\alpha}(\vb{y},y)}{\psi_H^0}\notag\\[.2cm]
        &= \sum_{\alpha} \lim_{\substack{\vb{y}'\to\vb{y}\\ t'\to t^+}} \ev{\hat{\psi}_{H\alpha}^\dagger(\vb{y}',y')\hat{\psi}_{H\alpha}(\vb{y},t)}{\psi_H^0}\notag\\[.2cm]
        &=\pm i \sum_{\alpha}\lim_{\substack{\vb{y}'\to\vb{y}\\ t'\to t^+}} G_{\alpha\alpha}(\vb{y},t;\vb{y}',t').
    \end{align}
    $$

    And total particle number operator:

    $$
    \begin{align}
        \ev{N}{\psi_H^0} &= \ev{\int\dd[3]y\ \hat{n}(\vb{y})}{\psi_H^0}\notag =\int \dd[3]{y} \ev{\hat{n}(\vb{y})}{\psi_H^0}\notag\\[.2cm]
        &=\pm i \sum_{\alpha} \int \dd[3]{y} \lim_{\substack{\vb{y}'\to\vb{y}\\ t'\to t^+}} G_{\alpha\alpha}(\vb{y},t;\vb{y}',t').
    \end{align}
    $$

- For spin density operator:

    $$
    \begin{align}
       \ev{\hat{s}(\vb{y})}{\psi_H^0}= \pm i \sum_{\alpha\beta} \mel{\alpha}{\hat{s}}{\beta}  \lim_{\substack{\vb{y}'\to\vb{y}\\ t'\to t^+}} G_{\beta\alpha}(\vb{y},t;\vb{y}',t').
    \end{align}
    $$

    And total spin operator:

    $$
    \begin{align}
        \ev{\hat{S}}{\psi_H^0} = \pm i \sum_{\alpha}\sum_\beta \mel{\alpha}{\hat{s}}{\beta} \int \dd[3]{y} \lim_{\substack{\vb{y}'\to\vb{y}\\ t'\to t^+}} G_{\beta\alpha}(\vb{y},t;\vb{y}',t').
    \end{align}
    $$

- For electrical current density operator:

    $$
    \begin{align}
        \ev{\hat{\mathbf{J}}(\vb{x})}{\psi_H^0} &= -\frac{ie\hbar}{2m} \sum_{\alpha} \qty{ \ev{\hat{\psi}_{\alpha}^\dagger(\vb{x})\nabla \hat{\psi}_{\alpha}(\vb{x})}{\psi_H^0} - \ev{\qty(\nabla \hat{\psi}_{\alpha}^\dagger(\vb{x}))\hat{\psi}_{\alpha}(\vb{x})}{\psi_H^0} }\notag\\[.2cm]
        &=-\frac{ie\hbar}{2m} \sum_{\alpha}
        \begin{aligned}[t]
        &\Big\{\ev{\hat{\psi}_{H\alpha}(\vb{x},t)\nabla\hat{\psi}_{H\alpha}(\vb{x},t)}{\psi_H^0}\\[.2cm]
        &\quad -\ev{\qty(\nabla \hat{\psi}_{H\alpha}^\dagger(\vb{x},t))\hat{\psi}_{H\alpha}(\vb{x},t)}{\psi_H^0}\Big\}
        \end{aligned}
        \notag\\[.2cm]
        &=-\frac{ie\hbar}{2m}\sum_{\alpha}
        \begin{aligned}[t]
            &\Big\{ \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} \nabla_{\vb{x}} \ev{\hat{\psi}_{H\alpha}^\dagger(\vb{x}',t')\hat{\psi_{H\alpha}(\vb{x},t)}}{\psi_H^0}\\
            &\quad-\lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} \nabla_{\vb{x}'} \ev{\hat{\psi}_{H\alpha}(\vb{x}',t')\hat{\psi}_{H\alpha}(\vb{x},t)}{\psi_H^0}\Big\}
        \end{aligned}\notag\\[.2cm]
        &=-\frac{ie\hbar}{2m} \cdot \pm i \sum_{\alpha} \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} \qty(\nabla_{\vb{x}} - \nabla_{\vb{x}'}) G_{\alpha\alpha}(\vb{x},t;\vb{x}',t')\notag\\[.2cm]
        &=\pm \frac{e\hbar}{2m} \sum_{\alpha} \lim_{\substack{\vb{x}'\to\vb{x}\\ t'\to t^+}} \qty(\nabla_{\vb{x}} - \nabla_{\vb{x}'}) G_{\alpha\alpha}(\vb{x},t;\vb{x}',t').
    \end{align}
    $$

</div>


### 2.2. The ground state energy