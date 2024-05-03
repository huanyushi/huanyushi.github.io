---
title:      "&sect;1.3 Jellium Model and Hubbard Model"
date:       2024-04-09
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
math: true
---

## Jellium model

**Jellium model** also known as the **uniform electron gas** or **homogeneous electron gas** is a quantum mechanical model of interacting electrons in a solid where the positive charges are assumed to be uniformly distributed in space. This can be seen as a first approximation to a metallic system. In a real crystal the positive charge (ions) is not uniform and can also have its own dynamics (lattice vibrations). The general Hamiltonian can be written as

$$
\begin{equation}
    \hat{H} = \hat{H}_e + \hat{H}_{\mathrm{ion}} + \hat{H}_{e-\mathrm{ion}},
\end{equation}
$$

where $\hat{H}_{e}$ and $\hat{H}_{\mathrm{ion}}$ are terms related only to electrons and ions respectively, $\hat{H}_{e-\mathrm{ion}}$ is the interaction between electrons and ions, i.e.,

$$
\begin{align}
    \hat{H}_{e} &= \sum_{i=1}^{N} \qty(-\frac{\hbar^2\nabla^2_i}{2\mu}) + \frac{1}{2} \sum_{i\neq j}^{N} \frac{e^2}{|\vb{r}_i - \vb{r}_j|},\\[.2cm]
    \hat{H}_{\mathrm{ion}} & = \cancelto{0}{\hat{T}_{\mathrm{ion}}} + \frac{1}{2} \iint \dd[3]{x}\dd[3]{x'} \frac{[en_{\mathrm{ion}}(\vb{x})][en_{\mathrm{ion}}(\vb{x}')]}{|\vb{x}-\vb{x}'|} ,\\[.2cm]
    \hat{H}_{e-\mathrm{ion}}& = \iint \dd[3]{x}\dd[3]{x'} \frac{[-e n_{e}(\vb{x})][e n_{\mathrm{ion}}(\vb{x}')]}{|\vb{x}-\vb{x}'|},
\end{align}
$$

where $\mu$ is the mass of an electron, $n_{\mathrm{ion}}$ and $n_{e}$ are particle density of ions and electrons respectively. Since these positive ions are much heavier than the electrons, it is permissible to neglect the ionic motion entirely (i.e. $\hat{T}\_{\mathrm{ion}} =0$). With our previous assumption of a uniform background, the particle density of ions is $n_{\mathrm{ion}}(\vb{x}) = \frac{N}{V}$, where $N$ is the total number of ions and $V$ is the volume of this system, then

$$
\begin{align}
    \hat{H}_{\mathrm{ion}} &= \frac{1}{2}\iint\dd[3]{x}\dd[3]{x}'  \frac{\qty[e\frac{N}{V}][e\frac{N}{V}]}{|\vb{x}- \vb{x}'|}  = \frac{1}{2} \qty(\frac{eN}{V})^2 \iint \frac{\dd[3]{x}\dd[3]{x'}}{|\vb{x}-\vb{x}'|},\\[.2cm]
    \hat{H}_{e-\mathrm{ion}} & = \iint \frac{\qty[-e \sum_{i=1}^{N}\delta(\vb{r}-\vb{r}_i)][e\frac{N}{V}]}{|\vb{r}-\vb{x}|} = - \frac{e^2 N}{V} \sum_{i=1}^{N} \int \frac{\dd[3]{x}}{|\vb{r}_i - \vb{x}|}. 
\end{align}
$$

It is convenient to enclose the system in a large cubical box with sides of length $L$ (i.e. box normalization) and use periodic boundary conditions which means

$$
V = L^3, \quad F(\vb{r}) = F(\vb{r} + \vb{i} L) = F(\vb{r} + \vb{j} L) = F(\vb{r} + \vb{k} L).
$$

The Fourier transformation is:

$$
\begin{equation*}
\begin{cases}
    \displaystyle{F(\vb{r}) = \frac{1}{V}\sum_{\vb{k}} F(\vb{k}) \e^{i\vb{k}\cdot \vb{r}}}\\[.2cm]
    \displaystyle{F(\vb{k}) = \int_{V} F(\vb{r})\e^{i\vb{k}\cdot \vb{r}}\dd[3]{r}}
\end{cases}\quad \text{where}\ k_i = \frac{2\pi n_i}{L}, \ i=x,y,z, \ n_i = 0,\pm 1,\pm 2, \dots
\end{equation*}
$$

Summation and integral in momentum space can be converted:

$$
\begin{equation*}
    \sum_{\vb{k}} (\cdots)  = \frac{L^3}{(2\pi)^3} \int \dd[3]{k} (\cdots).
\end{equation*}
$$

<details class="box-hidden" markdown="1" open>
<summary> Fourier transform of $1/|\vb{r}|$ </summary>
As a useful example, we give the calculation of the Fourier transform of $1/|\vb{r}|$. If we try to take the Fourier transform of $1/|\vb{r}|$ directly, we would get a nonsensical answer. So we consider the Fourier transform of the Yukawa potential $V_{\eta}(r) = \frac{\mathrm{e}^{-\eta r}}{r}$:

$$
\begin{align*}
    \mathcal{F}[V_{\eta}(r)] &= \int \frac{\e^{-\eta r}}{r} \e^{-i\vb{k}\cdot\vb{r}}\dd[3]{r}\\[.2cm]
    &= \int_0^{2\pi} \dd{\phi} \int_0^{\pi} \sin\theta \dd{\theta} \int_0^{\infty} \frac{\e^{-\eta r}}{r} \e^{-ikr\cos\theta} r^2 \dd{r}\\[.2cm]
    &=2\pi \int_0^{\infty} r\e^{-\eta r} \qty[-\frac{1}{ikr}\e^{-ikr}+ \frac{1}{ikr} \e^{ikr}]\dd{r}\\[.2cm]
    &=\frac{4\pi}{k^2 + \eta^2}.
\end{align*}
$$

We just need to let $\eta \to 0$ to get the Fourier transform of $1/|\vb{r}|$. We choose to keep $\eta$ because it is crucial for our later calculations.
</details>

So the Fourier transformation of $1/\vert \vb{x} - \vb{x}'\vert $ and $1/\vert \vb{r}-\vb{x}\vert$ is

$$
\begin{align}
    \frac{1}{\vert \vb{x}-\vb{x}' \vert} &= \frac{1}{V} \sum_{\vb{k}} \frac{4\pi}{k^2 + \eta^2} \e^{i\vb{k}\cdot (\vb{x} - \vb{x}')},\\[.2cm]
    \frac{1}{\vert \vb{r} -\vb{x} \vert} &= \frac{1}{V}\sum
    _{\vb{k}} \frac{4\pi}{k^2 +\eta^2} \e^{i\vb{k}\cdot (\vb{r}-\vb{x})}.
\end{align}
$$

Then

$$
\begin{align}
    \hat{H}_{\mathrm{ion}}& = \frac{1}{2}\qty(\frac{eN}{V})^2 \iint \qty[\frac{1}{V} \sum_{\vb{k}} \frac{4\pi}{k^2 + \eta^2} \e^{i\vb{k}\cdot(\vb{x}-\vb{x}')}]\dd[3]{x}\dd[3]{x'}\notag\\[.2cm]
    &= \frac{1}{2} \qty(\frac{eN}{V})^2 \sum_{\vb{k}} \frac{4\pi}{k^2 + \eta^2} \int \e^{i\vb{k}\cdot\vb{x}} \dd[3]{x} \int \e^{-i\vb{k}\cdot \vb{x}'} \dd[3]{x'}\notag \\[.2cm]
    &=\frac{1}{2}\qty(\frac{eN}{V})^2 \frac{1}{V} \sum_{\vb{k}} \frac{4\pi}{k^2 + \eta^2} \int \e^{i\vb{k}\cdot\vb{x}} \dd[3]{x} \cdot V\delta_{k,0}\notag \\[.2cm]
    &=\frac{1}{2} \qty(\frac{eN}{V})^2 \frac{4\pi}{\eta^2} V, \label{equ:Jellium-cancel-1}
\end{align} 
$$

and 

$$
\begin{align}
    \hat{H}_{e-\mathrm{ion}} & = -\frac{e^2N}{V} \sum_{i=1}^{N} \int \qty[\frac{1}{V}\sum_{\vb{k}} \frac{4\pi}{k^2+\eta^2} \e^{i\vb{k}\cdot(\vb{r}_i -\vb{x})}]\dd[3]{x}\notag\\[.2cm]
    &= -\frac{e^2N}{V} \sum_{i=1}^{N} \frac{1}{V} \sum_{\vb{k}} \e^{i\vb{k}\cdot\vb{r}_i} \int \e^{-i\vb{k}\cdot\vb{x}} \dd[3]{x}\notag\\[.2cm]
    &=-\frac{e^2N}{V} \sum_{i=1}^{N} \frac{1}{V} \sum_{\vb{k}} \frac{4\pi}{k^2+\eta^2} \e^{i\vb{k}\cdot\vb{r}_i} V\delta_{k,0}\notag\\[.2cm]
    &=-\qty(\frac{eN}{V})^2 \frac{4\pi}{\eta^2}V.\label{equ:Jellium-cancel-2}
\end{align}
$$

The interaction between these electrons in $\hat{H}_{e}$ is

$$
\begin{align*}
    \frac{1}{2}\sum_{i\neq j} \frac{e^2}{|\vb{r}_i - \vb{r}_j|} & = \frac{1}{2} \sum_{i\neq j} e^2 \qty[\frac{1}{V}\sum_{\vb{k}} \frac{4\pi}{k^2 + \eta^2} \e^{i\vb{k}\cdot (\vb{r}_i - \vb{r}_j)}]\\[.2cm]
    &=\frac{1}{2} \sum_{i\neq j} e^2 \Bigg[\frac{1}{V} \underbrace{\frac{4\pi}{\eta^2}}_{\vb{k}=0} + \frac{1}{V}\underbrace{\sum_{\vb{k}\neq 0} \frac{4\pi}{k^2}\e^{i\vb{k}\cdot(\vb{r}_i - \vb{r}_j)}}_{\vb{k}\neq 0}\Bigg],
\end{align*}
$$

where we divide the summation of $\vb{k}$ into two parts $\vb{k}=0$ and $\vb{k}\neq 0$. For $\vb{k}=0$, it becomes

$$
\begin{align}
    \frac{1}{2}\sum_{i\neq j} e^2 \frac{1}{V} \frac{4\pi }{\eta^2} &= \frac{1}{2}\qty[\sum_{i=1}^{N} \sum_{j=1}^{N} e^2 \frac{1}{V}\frac{4\pi}{\eta^2} - \sum_{i=1}^{N} e^2 \frac{1}{V}\frac{4\pi}{\eta^2}]\notag\\[.2cm]
    &=\frac{1}{2} \qty[\frac{e^2}{V}\frac{4\pi}{\eta^2} N^2 - \frac{e^2}{V}\frac{4\pi}{\eta^2} N]\notag\\[.2cm]
    &=\frac{1}{2}\frac{e^2}{V}\frac{4\pi}{\eta^2} \qty[N^2 - N]\notag\\[.2cm]
    &=\frac{1}{2} \qty(\frac{eN}{V})^2 \frac{4\pi}{\eta^2} V - \frac{1}{2}\frac{e^2N}{V} \frac{4\pi}{\eta^2}. \label{equ:Jellium-cancel-3}
\end{align}
$$

Combine these results $\eqref{equ:Jellium-cancel-1}$, $\eqref{equ:Jellium-cancel-2}$ and $\eqref{equ:Jellium-cancel-3}$, only $-\frac{1}{2}\frac{e^2N}{V} \frac{4\pi}{\eta^2}$ left. It represents an energy $-\frac{1}{2}4\pi e^2 (V\eta^2)^{-1}$ per particle and vanishes in the proper physical limit: first $L\to \infty$ and then $\eta \to 0$ (always keeping $\eta^{-1}\ll L$). Note that we use the thermodynamic limit $N\to\infty, V\to\infty$, but $N/V$ constant. 

<div class="box-info" markdown="1">
<div class="title"> Hamiltonian of the Jellium model </div>
Thus the Hamiltonian of the Jellium model is

$$
\begin{equation}
\begin{split}
        \hat{H} &= \sum_{i=1}^{N} \qty(-\frac{\hbar^2\nabla_{i}^2}{2\mu}) + \frac{1}{2V} \sum_{i\neq j} \sum_{\vb{k}\neq 0} \frac{4\pi e^2}{k^2} \e^{i\vb{k}\cdot(\vb{r}_i-\vb{r}_j)}\\[.2cm]
        &= \sum_{i=1}^{N} \hat{h}(\vb{r}_i) + \frac{1}{2}\sum_{i\neq j} V(\vb{r}_i -\vb{r}_j).
\end{split}
\label{equ:Jellium-Hamiltonian}
\end{equation}
$$

</div>

In plane wave representation, $\eqref{equ:Jellium-Hamiltonian}$ becomes

$$
\begin{align}
    \hat{H} &= \sum_{\alpha} \int \hat{\psi}_{\alpha}^\dagger (\vb{x}) \hat{h}(\vb{x}) \hat{\psi}_{\alpha}(\vb{x})\dd[3]{x} \notag\\[.2cm]
        &\qquad + \frac{1}{2} \sum_{\alpha}\sum_{\beta} \iint \dd[3]{x}\dd[3]{x'} \hat{\psi}_{\alpha}^\dagger(\vb{x})\hat{\psi}_\beta^\dagger(\vb{x}') \qty[\frac{1}{V}\sum_{\vb{q}\neq 0} \frac{4\pi e^2}{q^2} \e^{i\vb{q}\cdot(\vb{x}-\vb{x}')}] \hat{\psi}_\beta(\vb{x}')\hat{\psi}_{\alpha}(\vb{x})\notag\\[.2cm]
        &=\sum_{\vb{k}}\sum_\alpha \frac{\hbar^2 k^2}{2\mu} \hat{C}_{\vb{k}\alpha}^\dagger \hat{C}_{\vb{k}\alpha} + \frac{1}{2V}\sum_{\alpha}\sum_\beta \sum_{\vb{k}}\sum_{\vb{k}'}\sum_{\vb{q}\neq 0} \frac{4\pi e^2}{q^2} C_{\vb{k}+\vb{q},\alpha}^\dagger \hat{C}_{\vb{k}'-\vb{q},\beta}^\dagger \hat{C}_{\vb{k}'\beta} \hat{C}_{\vb{k}\alpha}.
\end{align}
$$

> To be continued...
{: .prompt-tip}


