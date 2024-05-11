---
title:      "Electrostatic Field Between Two Intersecting Grounded Planes"
date:       2023-06-06
categories: [Physics Musings]
tag: [electrodynamics]
media_subpath : /assets/img/in-post/2023/2023-06-06/
math: true
---
Consider two infinite grounded metal planes with an angle $\alpha$ between them, as shown in the following figure. A point charge $Q$ is located at $(r_0,\phi_0,0)$ in cylindrical coordinates, where $0< \phi_0 <\alpha$. Determine the electric potential in angle domain.

![problem](problem.jpg){: .light width="300"}
![problem](problem-dark.jpg){: .dark width="300"}
_Figure 1: Diagram of the problem_

As a classical problem in electrodynamics, I believe most people have encountered it. This problem is extraordinary easy when $\alpha = \pi/n, n\in \mathbb{Z}^{+}$. But what about $\alpha \neq \pi/n$? It's rare to see textbooks discussing this problem. Next, I'll solve it with *method of separation of variables* and expand upon it.

> In fact, this post was completed when I was a sophomore in college (2021). I am just reposting it this time, please see [here](https://dxwl.bnu.edu.cn/CN/10.16854/j.cnki.1000-0712.220175). In addition, I also answered one of the key integrals on Zhihu, please see [here](https://www.zhihu.com/question/604942674/answer/3061799399).
{: .prompt-info}

## Problem with Dirichlet boundary condition
### Special case: $\alpha = \pi/n$
If $\alpha = \pi/n$, the system exhibits a high degree of symmetry, we can solve it using the *method of images*. Please see the following examples:

![problem](dirichlet.PNG){: .light}
![problem](dirichlet-dark.PNG){: .dark}
_Figure 2: The positions of the charge $Q$ and image charges for $n = 2, 3, 4$ with Dirichlet boundary condition._

Obviously, the number of image charges is $2n-1$. The electric potential in angle domain can be obtained immediately,

$$
\begin{equation}
    \Phi(r,\phi,z) = \frac{Q}{4\pi\epsilon_0} \sum_{i=1}^{2n} \frac{(-1)^{n+1}}{|\vb{r}-\vb{r}_i|},
    \label{equ:Dirichlet-image}
\end{equation}
$$

where $$\vb{r}_i = r_0 \mathbf{e}_r + \phi_i \mathbf{e}_\phi$$ and 

$$
\begin{equation}
    \phi_i = \qty[\frac{i}{2}]\frac{2\pi}{n} + (-1)^{i+1}\phi_0, \quad (i=1,2,\dots,2n).
\end{equation}
$$

Or we can rewrite $\eqref{equ:Dirichlet-image}$ as 

$$
\begin{equation}
    \Phi(r,\phi,z) = \frac{Q}{4\pi\epsilon_0} \sum_{i=1}^{2n} \frac{(-1)^{i+1}}{\sqrt{r^2+r_0^2+z^2-2rr_0\cos(\phi-\phi_i)}}.
    \label{equ:image solution}
\end{equation}
$$

### General case: $\alpha$ can be any value
When $\alpha$ is arbitrary, the system no longer possesses a definite high degree symmetry, rendering the method of images ineffective. In such cases, solving the Poisson's equation directly becomes the most straightforward approach, 

$$
\begin{equation}
\nabla^2\Phi= -\frac{\rho}{\epsilon_0} = - \frac{Q}{\epsilon_0} \delta(\vb{r}-\vb{r}_0).
\end{equation}
$$

In cylindrical coordinates, this equation with Dirichlet boundary conditions (because the metal planes are grounded) can be expressed as:

$$
\begin{equation}
    \begin{cases}
\displaystyle{\frac{1}{r}\pdv{r}(r\pdv{\Phi}{r}) + \frac{1}{r^2} \pdv[2]{\Phi}{\phi} + \pdv[2]{\Phi}{z} = - \frac{Q}{\epsilon_0r_0}\ \delta(r-r_0)\delta(\phi-\phi_0)\delta(z)},\\[.2cm]
\displaystyle{\eval{\Phi}_{\phi=0} = \eval{\Phi}_{\phi=\alpha}=0.}
\end{cases}
\end{equation}
$$

Solving this problem is not easy, we can use the method of separation of variables. But we  still need to approach it step by step.


#### Find the eigenfunctions
Suppose the solution $\Phi$ can be written as $\Phi = R(r)\psi(\phi)Z(z)$, if $\vb{r}\neq\vb{r}_0$, the Poisson's equation becomes Laplace's equation:

$$
 \psi Z\ \dv[2]{R}{r} + \frac{Z\psi}{r} \dv{R}{r} + \frac{RZ}{r^2} \dv[2]{\psi}{\phi} + R\psi\ \dv[2]{Z}{z} = 0.
$$

Multiplying each term by $r^2/R\psi Z$ and rearranging appropriately, the equation becomes:

$$
\frac{r^2}{R} \dv[2]{R}{r} + \frac{r}{R} \dv{R}{r} + r^2\ \frac{1}{Z} \dv[2]{Z}{z} = - \frac{1}{\psi} \dv[2]{\psi}{\phi}.
$$

The right hand side is a function of $\phi$, while the left hand side is a function of $r$ and $z$. So both sides must equal the same constant, denoted as $m^2$. Therefore,

$$
- \frac{1}{\psi} \dv[2]{\psi}{\phi} = m^2 \quad \Longrightarrow\quad  \psi(\phi) = A \cos m \phi + B \sin m\phi.
$$

With boundary condition $$\eval{\psi}_{\phi=0}=\eval{\psi}_{\phi=\alpha} =0$$, we have

$$
\begin{equation}
\textcolor{DodgerBlue}{
    \psi(\phi) =  \sin(\frac{k\pi}{\alpha}\phi) ,\quad m = \frac{k\pi}{\alpha}\quad (k=1,2,\dots).}
    \label{equ:phi eigen}
\end{equation}
$$

Similarly, we have

$$
\frac{1}{R} \dv[2]{R}{r} + \frac{1}{r R} \dv{R}{r} - \frac{m^2}{r^2} = -\frac{1}{Z}\dv[2]{Z}{z}.
$$

The right hand side is a function of $z$, while the left hand side is a function of $r$. Obviously, both sides must equal the same constant too. Note the boundary condition $\eval{\Phi}_{z\to\pm\infty} = 0$, so the constant must be $\mu^2$. Therefore,

$$
- \frac{1}{Z} \dv[2]{Z}{z} = \mu^2 \quad \Longrightarrow  \quad Z = A\sin(\mu z) + B\cos(\mu z).
$$

Note that $\Phi(z=0)\neq 0$ and $\cos(\mu z)$ is an even function, so we can assume $\mu>0$, then

$$
\begin{equation}
\textcolor{DodgerBlue}{
    Z(z) = \cos(\mu z), \quad  \text{($\mu$ is continuous, $\mu>0$)}}
    \label{equ:z eigen}
\end{equation}
$$

Finally, $R(r)$ satisfies the following equation:

$$
\dv[2]{R}{r} + \frac{1}{r}\ \dv{R}{r} - \qty(\mu^2 + \frac{m^2}{r^2}) R=0. 
$$

Let $x=\mu r$, it becomes

$$
\dv[2]{R}{x} + \frac{1}{x}\ \dv{R}{x} - \qty(1+\frac{m^2}{x^2}) R=0.
$$

This is the standard $m$-order modified Bessel equation, and its solution is

$$
R(r) = A I_{m}(x) + B K_{m}(x) =A I_{m}(\mu r) + B K_{m}(\mu r),
$$

where $I_m(x)$ and $K_m(x)$ are the modified Bessel functions of the first and second kind respectively. They have the following properties:

$$
\begin{gather*}
I_{m}(x) \xrightarrow{x\to 0} \frac{1}{\Gamma(m+1)}\qty(\frac{x}{2})^m,\quad  I_{m}(x) \xrightarrow{x\to \infty} \frac{1}{\sqrt{2\pi x}}e^x \qty[1+\order{\frac{1}{x}}],\\[.2cm]
K_{m}(x) \xrightarrow[m\neq 0]{x\to 0} \frac{\Gamma(m)}{2}\qty(\frac{2}{x})^{m}, \quad K_{m}(x) \xrightarrow{x\to\infty} \sqrt{\frac{\pi}{2x}} e^{-x} \qty[1+\order{\frac{1}{x}}].
\end{gather*}
$$

Since $r\in(0,\infty)$, to make the electric potential not divergent and continuous except for the original point, $R(r)$ needs to be divided into two parts by $r$:

$$
\begin{equation}
\textcolor{DodgerBlue}{
R(r) = \begin{cases}
            I_{m}(\mu r), \quad r\in(0,r_0)\\[.2cm]
            K_{m}(\mu r),\quad r\in(r_0,\infty)
        \end{cases}}
\label{equ:r eigen}
\end{equation}
$$

Combine the results $\eqref{equ:phi eigen}$,$\eqref{equ:z eigen}$,$\eqref{equ:r eigen}$, we find the eigenfunctions of the original problem,

$$
\begin{equation*}
    \Phi_{k\mu}(r,\phi,z) = \left\{
            \begin{array}{l}
            \displaystyle{I_{k\pi/\alpha}(\mu r)\cos(\mu z) \sin(\frac{k\pi}{\alpha}\phi)},\quad r\in(0,r_0)\\[.2cm]
            \displaystyle{K_{k\pi/\alpha}(\mu r)\cos(\mu z) \sin(\frac{k\pi}{\alpha}\phi)}, \quad r\in(r_0,\infty)
            \end{array}
        \right\}, (k\in \mathbb{Z}^{+}; \text{$\mu$ is continuous , $\mu >0$})
\end{equation*}
$$

So the general solution can be expressed as linear superposition of these eigenfunctions,

$$
\begin{equation}
\textcolor{crimson}{
\begin{split}
  \Phi(r,\phi,z) &= \sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu}\  a_{k\mu} \Phi_{k\mu}(r,\phi,z) \\[.2cm]
  &=
  \begin{cases}
      \displaystyle{\sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu} A_{k\mu}I_{k\pi/\alpha}(\mu r)\cos(\mu z) \sin(\frac{k\pi}{\alpha}\phi)}, &r<r_0\\[.2cm]
      \displaystyle{\sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu} B_{k\mu}K_{k\pi/\alpha}(\mu r)\cos(\mu z) \sin(\frac{k\pi}{\alpha}\phi)}, &r> r_0
  \end{cases}
\end{split}
}
\label{equ:general solution}
\end{equation}
$$

#### Calculate the coefficients
Even though we get $\eqref{equ:general solution}$, it's not the final result we want. Because it still has undetermined coefficients $A_{k\mu},B_{k\mu}$. Note that we have two conditions we haven't used yet,

1. The electric potential should be continuous at $\vb{r} = \vb{r}_0$;
2. The electric potential satisfies the Poisson's equation, and the right side of the Poisson equation is the Dirac function.

First let us consider continuity, we can get

$$
\sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu} A_{k\mu}I_{k\pi/\alpha}(\mu r_0)\cos(\mu z) \sin(\frac{k\pi}{\alpha}\phi) = \sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu} B_{k\mu}K_{k\pi/\alpha}(\mu r_0)\cos(\mu z) \sin(\frac{k\pi}{\alpha}\phi).
$$

Integrate $z$ on both sides and use 

$$
\begin{equation}
    \delta(\mu) =\frac{1}{2\pi} \int_{-\infty}^{\infty}\dd{z} e^{i\mu z} = \frac{1}{2\pi} \int_{-\infty}^{\infty}\dd{z} \cos(\mu z).
 \end{equation}
$$

It becomes

$$
\sum_{k=1}^{\infty} A_{k\mu} I_{k\pi/\alpha}(\mu r_0) \sin(\frac{k\pi}{\alpha}\phi) =     \sum_{k=1}^{\infty} B_{k\mu} K_{k\pi/\alpha}(\mu r_0) \sin(\frac{k\pi}{\alpha}\phi).
$$

Due to the orthogonality of $\sin(k\pi\phi/\alpha)$ in $\phi\in(0,\alpha)$, the corresponding coefficients must be equal, so we obtain the first relationship:

$$
\begin{equation}
    \textcolor{ForestGreen}{A_{k\mu} I_{k\pi/\alpha}(\mu r_0) = B_{k\mu} K_{k\pi/\alpha}(\mu r_0).}
    \label{equ:AB1}
\end{equation}
$$

Next, using the second condition and substituting the general solution into Poisson's equation, we can get

$$
\begin{multline*}
    \sum_{k=1}^{\infty} \int_{0}^{\infty}\dd{\mu} a_{k\mu}\bigg[ \sin(\frac{k\pi\phi}{\alpha})\cos(\mu z)\dv[2]{R}{r}+\frac{\sin(k\pi\phi/\alpha)\cos(\mu z)}{r}\dv{R}{r}+ \frac{R\cos(\mu z)}{r^2}\dv[2]{\sin(k\pi\phi)}{\phi}\\[.2cm]
    +R\sin(\frac{k\pi\phi}{\alpha})\dv[2]{\cos(\mu z)}{z}\bigg] = - \frac{Q}{\epsilon_0r_0} \delta(r-r_0)\delta(\phi-\phi_0)\delta(z).
\end{multline*}
$$

Note that $\dv*{R}{r}$ is discontinuous at $r=r_0$, we can integrate the neighborhood of $r_0$ to cancel the $\delta(r-r_0)$,

$$
 \lim_{\delta\to 0}\sum_{k=1}^{\infty}\int_{0}^{\infty} \dd{\mu} \int_{r_0-\delta}^{r_0+\delta}\dd{r} a_{k\mu}\qty[\sin(\frac{k\pi\phi}{\alpha})\cos(\mu z)\dv[2]{R}{r}] = -\frac{Q}{\epsilon_0r_0}\delta(\phi-\phi_0)\delta(z) .
$$

Similarly, integrate $z$ on both sides,

$$
\begin{align*}
    &\lim_{\delta\to 0}\sum_{k=1}^{\infty}\int_{0}^{\infty} \dd{\mu} \int_{r_0-\delta}^{r_0+\delta}\dd{r} a_{k\mu}\qty{\sin(\frac{k\pi\phi}{\alpha})\qty[\int_{-\infty}^{\infty}\dd{z}\cos(\mu z)]\dv[2]{R}{r} }\\[.2cm] 
    ={}& \lim_{\delta\to 0}\sum_{k=1}^{\infty}\int_{0}^{\infty} \dd{\mu} \int_{r_0-\delta}^{r_0+\delta}\dd{r} 2\pi a_{k\mu}\delta(\mu)\qty[\sin(\frac{k\pi\phi}{\alpha})\dv[2]{R}{r} ]\\[.2cm]
    ={}& \lim_{\delta\to 0}\sum_{k=1}^{\infty} \int_{r_0-\delta}^{r_0+\delta}\dd{r} \pi a_{k\mu}\qty[\sin(\frac{k\pi\phi}{\alpha})\dv[2]{R}{r}] = -\frac{Q}{\epsilon_0r_0}\delta(\phi-\phi_0).
\end{align*}
$$

Then, with the orthogonality of $\sin(k\pi\phi/\alpha)$, multiply both sides by $\sin(k'\pi\phi/\alpha)$ and integrate $\phi$,

$$
\begin{align*}
    \lim_{\delta\to 0}\int_{r_0-\delta}^{r_0+\delta} \frac{\alpha \pi a_{k\mu}}{2} \dv[2]{R}{r}\dd{r} &= -\frac{Q}{\epsilon_0r_0}\sin(\frac{k\pi\phi_0}{\alpha})\\
    &=\frac{\alpha \pi }{2} \left(B_{k\mu}\dv{K_{k\pi/\alpha}(\mu r_0)}{r} - A_{k\mu} \dv{I_{k\pi/\alpha}(\mu r_0)}{r}\right).
\end{align*}
$$

It turns out to be the second relationship

$$
\begin{equation}
    \textcolor{ForestGreen}{A_{k\mu}I_{k\pi/\alpha}'(\mu r_0)- B_{k\mu}K_{k\pi/\alpha}'(\mu r_0) = \frac{2Q}{\mu\alpha\epsilon_0r_0\pi}\sin(\frac{k\pi\phi_0}{\alpha}).}
    \label{equ:AB2}
\end{equation}
$$

Combining $\eqref{equ:AB1}$ and $\eqref{equ:AB2}$, we can get the coefficient $A_{k\mu},B_{k\mu}$

$$
\begin{equation}
    \begin{cases}
    \displaystyle{A_{k\mu}  = \frac{2Q}{\mu\alpha\epsilon_0r_0\pi}\sin(\frac{k\pi\phi_0}{\alpha}) \frac{K_{k\pi/\alpha}(\mu r_0)}{K_{k\pi/\alpha}(\mu r_0)I_{k\pi/\alpha}'(\mu r_0)-K_{k\pi/\alpha}'(\mu r_0)I_{k\pi/\alpha}(\mu r_0)}}, \\[.2cm]
    \displaystyle{B_{k\mu}  = \frac{2Q}{\mu\alpha\epsilon_0r_0\pi}\sin(\frac{k\pi\phi_0}{\alpha}) \frac{I_{k\pi/\alpha}(\mu r_0)}{K_{k\pi/\alpha}(\mu r_0)I_{k\pi/\alpha}'(\mu r_0)-K_{k\pi/\alpha}'(\mu r_0)I_{k\pi/\alpha}(\mu r_0)}}.
    \end{cases}
\end{equation}
$$

But that is not enough, we can simplify these expressions further with the Wro&#324;skian of the modified Bessel functions:

$$
\begin{equation}
 W[K_{m}(x),I_{m}(x)] = K_m(x) I_m'(x)-K'_m(x)I_m(x) = \frac{1}{x}.
\end{equation}
$$

So

$$
K_{k\pi/\alpha}(\mu r_0)I_{k\pi/\alpha}'(\mu r_0)-K_{k\pi/\alpha}'(\mu r_0)I_{k\pi/\alpha}(\mu r_0) = \frac{1}{\mu r_0},
$$

where the prime means the derivative with resect to $\mu r_0$. The finally results of $A_{k\mu},B_{k\mu}$ are

$$
\begin{equation}
        \textcolor{crimson}{
    \begin{cases}
    \displaystyle{A_{k\mu}  = \frac{2Q}{\alpha\epsilon_0\pi}\sin(\frac{k\pi\phi_0}{\alpha}) K_{k\pi/\alpha}(\mu r_0)}, \\[.2cm]
    \displaystyle{B_{k\mu}  = \frac{2Q}{\alpha\epsilon_0\pi}\sin(\frac{k\pi\phi_0}{\alpha}) I_{k\pi/\alpha}(\mu r_0)}.
    \end{cases}
        }
    \label{equ:coefficient}
\end{equation}
$$

#### Final result
After obtaining the coefficients $A_{k\mu},B_{k\mu}$, integrating $\eqref{equ:general solution}$ and $\eqref{equ:coefficient}$, we can write the final solution of the original problem:

$$
\begin{equation*}
    \Phi(r,\phi,z) =
    \begin{cases}
        \displaystyle{\sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu}\ \frac{2Q}{\alpha\epsilon_0\pi}\sin(\frac{k\pi\phi_0}{\alpha}) K_{k\pi/\alpha}(\mu r_0)I_{k\pi/\alpha}(\mu r)\cos(\mu z) \sin(\frac{k\pi}{\alpha}\phi)},\quad r<r_0\\[.2cm]
        \displaystyle{\sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu}\ \frac{2Q}{\alpha\epsilon_0\pi}\sin(\frac{k\pi\phi_0}{\alpha}) K_{k\pi/\alpha}(\mu r)I_{k\pi/\alpha}(\mu r_0)\cos(\mu z) \sin(\frac{k\pi}{\alpha}\phi)}, \quad r> r_0
    \end{cases}
\end{equation*}
$$

Or in a more compact form

$$
\begin{equation*}
    \Phi(r,\phi,z) =\sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu}\ \frac{2Q}{\alpha\epsilon_0\pi} K_{k\pi/\alpha}(\mu r_>)I_{k\pi/\alpha}(\mu r_<)\cos(\mu z)\sin(\frac{k\pi\phi_0}{\alpha}) \sin(\frac{k\pi\phi}{\alpha}),
\end{equation*}
$$

where $r_< = \min(r_0,r),r_>=\max(r_0,r)$. But it can be further simplified, which requires us to use the formula[^foot-1] (I will give a proof at the end)

$$
\begin{equation}
    \int_{0}^{\infty} K_{\nu}(ax) I_{\nu}(bx) \cos(cx)\dd{x} = \frac{1}{2\sqrt{ab}} Q_{\nu-\frac{1}{2}}\qty(\frac{a^2+b^2+c^2}{2ab}).
    \label{equ:integral}
\end{equation}
$$

where $\Re\ a>\abs{\Re\ b}, \Re\ \nu>-\frac{1}{2}$, and $Q_{\nu}(x)$ is the second kind of the Legendre function. So the final result can be written in the following form

$$
\begin{equation}
\textcolor{crimson}{
\Phi(r,\phi,z) =\frac{Q}{\alpha\epsilon_0\pi\sqrt{r_0r}}  \sum_{k=1}^{\infty}  Q_{\frac{k\pi}{\alpha}-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r})\sin(\frac{k\pi\phi_0}{\alpha})\sin(\frac{k\pi\phi}{\alpha}).}
\label{equ:final solution}
\end{equation}
$$

This is exactly the electric potential in angle domain.

### Prove they are equivalent if $\alpha=\pi/n$

What we can do is not only get the results $\eqref{equ:image solution}$ and $\eqref{equ:final solution}$, we can also mathematically prove that the two solutions are equivalent when $\alpha=\pi/n$, this requires us to prove

$$
\begin{equation}
\sum_{k=1}^{2n} \frac{(-1)^{k+1}}{\xi-\cos(\phi-\phi_k)}=
                \frac{4\sqrt{2}n}{\pi} \sum_{k=1}^{\infty} Q_{nk-\frac{1}{2}}\qty(\xi) \sin(nk\phi_0)\sin(nk\phi),
\label{equ:proof-1}
\end{equation}
$$

where

$$
\begin{equation}
\phi_{k} = \qty[\frac{k}{2}]\frac{2\pi}{n} + (-1)^{k+1}\phi_0,\quad  \xi=\frac{r^2+r_0^2+z^2}{2r_0r}.
\end{equation}
$$

Before our proof, we need to know

$$
\begin{gather}
    \frac{1}{|\vb{r}-\vb{r}_{k}|} = \frac{1}{\sqrt{r^2+r_0^2+z^2-2r_0r\cos(\phi-\phi_k)}},\\[.2cm]
    \nabla^2\qty( \frac{1}{|\vb{r}-\vb{r}_k|})= - \frac{4\pi}{r_0}\ \delta(r-r_0)\delta(\phi-\phi_k)\delta(z).
\end{gather}
$$

So $1/\abs{\vb{r}-\vb{r}_k}$ is also a solution of the original Poisson's equation, but it does not satisfy the two boundary conditions. Following our previous expansion method, we can get a similar result

$$
\begin{equation}
    \textcolor{ForestGreen}{
    \begin{split}
        \frac{1}{|\vb{r}-\vb{r}_k|} &= \frac{2}{\pi} \sum_{m=-\infty}^{\infty} \int_{0}^{\infty} \dd{\mu} e^{im(\phi-\phi_k)} \cos[\mu(z-z_k)] I_m(\mu r_<)K_m(\mu r_>)\\[.1cm]
        &=\frac{4}{\pi} \int_{0}^{\infty} \dd{\mu} \cos[\mu(z-z_k)]\qty{\frac{1}{2}I_0(\mu r_<)K_0(\mu r_>)+ \sum_{m=1}^{\infty}\cos[m(\phi-\phi_k)]I_{m}(\mu r_<)K_m(\mu r_>)}.
    \end{split}
    }
    \label{equ:green function expansion}
\end{equation}
$$

Let $\vb{r}_k = r_0 \vb{e}_r + \phi_k \vb{e}_k$, we have

$$
 \frac{1}{|\vb{r}-\vb{r_k}|} 
        =\frac{1}{\pi\sqrt{r r_0}}Q_{-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r}) + \frac{2}{\pi\sqrt{rr_0}}\sum_{m=1}^{\infty} \cos[m(\phi-\phi_k)] Q_{m-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r r_0}). 
$$

Then

$$
\begin{align*}
    &{}\sqrt{2r_0r}\sum_{k=1}^{2n} \frac{(-1)^{k+1}}{\sqrt{r^2+r_0^2+z^2-2r_0r\cos(\phi-\phi_k)}}\\[.2cm]
    =&{}\frac{\sqrt{2}}{\pi} \sum_{k=1}^{2n}(-1)^{k+1}\qty{Q_{-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r})+2\sum_{m=1}^{\infty}\cos[m(\phi-\phi_k)]Q_{m-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r})}\\[.2cm]
    =&{} \frac{\sqrt{2}}{\pi} Q_{-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r})\sum_{k=1}^{2n}(-1)^{k+1} + \frac{2\sqrt{2}}{\pi} \sum_{k=1}^{2n}(-1)^{k+1}\sum_{m=1}^{\infty}\cos[m(\phi-\phi_k)]Q_{m-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r})\\[.2cm]
    =&{}\frac{2\sqrt{2}}{\pi} \sum_{m=1}^{\infty} Q_{m-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r}) \textcolor{DodgerBlue}{\sum_{k=1}^{2n} (-1)^{k+1}\cos\qty[m\qty(\phi-\qty[\frac{k}{2}]\frac{2\pi}{n}+(-1)^{k}\phi_0)]}.
\end{align*}
$$

Calculate the blue part and simplify the rounding function. Obviously, the sum of this formula needs to be split into two parts where $k$ is odd and $k$ is even:

$$
\begin{align*}
    &\sum_{k=1}^{2n} (-1)^{k+1}\cos\qty[m\qty(\phi-\qty[\frac{k}{2}]\frac{2\pi}{n}+(-1)^{k}\phi_0)] \\[.2cm]
    ={}& \sum_{k \ \text{odd}} \cos\qty[m\qty(\phi-\frac{(k-1)\pi}{n}-\phi_0)]- \sum_{k \ \text{even}} \cos\qty[m\qty(\phi-\frac{k\pi}{n}+\phi_0)],
\end{align*}
$$

where the first part is ($p\in\mathbb{Z}^{+}$)

$$
\begin{equation*}
\begin{split}
     &\sum_{l=1}^{n} \cos\qty[m\qty(\phi-\frac{(2l-2)\pi}{n}-\phi_0)] \\[.2cm]
     ={}& \Re\qty[ e^{im(\phi-\phi_0)}e^{i \frac{2m\pi}{n}} \sum_{l=1}^{n} \qty(e^{-i\frac{2m\pi}{n}})^{l}] = \begin{cases}
        0, &\qty(\dfrac{m}{n} \neq p)\\[.2cm]
        n\cos[m(\phi-\phi_0)] ,\quad &\qty(\dfrac{m}{n} = p)
    \end{cases}
\end{split}
\end{equation*}
$$

and the second part is

$$
\begin{equation*}
\begin{split}
    &\sum_{l=1}^{n} \cos\qty[m\qty(\phi-\frac{2l\pi}{n}+\phi_0)] \\[.2cm]
    ={}& \Re\qty[ e^{im(\phi+\phi_0)} \sum_{l=1}^{n} \qty(e^{-i\frac{2m\pi}{n}})^{l}] = \begin{cases}
        0, &\qty(\dfrac{m}{n} \neq p)\\[.2cm]
        n\cos[m(\phi+\phi_0)] ,\quad &\qty(\dfrac{m}{n} = p)
    \end{cases}
\end{split}
\end{equation*}
$$

So the blue part is

$$
\begin{equation*}
    \sum_{k=1}^{2n} (-1)^{k+1}\cos\qty[m\qty(\phi-\qty[\frac{k}{2}]\frac{2\pi}{n}+(-1)^{k}\phi_0)] = \begin{cases}
        0, &\qty(\dfrac{m}{n} \neq p)\\[.2cm]
        2n\sin(m\phi)\sin(m\phi_0) ,\quad &\qty(\dfrac{m}{n} = p)
    \end{cases}
\end{equation*}
$$

Substituting this result into the right hand side of $\eqref{equ:proof-1}$, we can get

$$
\begin{equation}
\textcolor{ForestGreen}{
     \sqrt{2r_0r}\sum_{k=1}^{2n} \frac{(-1)^{k+1}}{\sqrt{r^2+r_0^2+z^2-2r_0r\cos(\phi-\phi_k)}}
    =\frac{4\sqrt{2}n}{\pi} \sum_{p=1}^{\infty} Q_{pn-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r}) \sin(pn\phi_0)\sin(pn\phi).}
\end{equation}
$$

Obviously, the result of the above formula is exactly $\eqref{equ:proof-1}$. Thus, for any point where the point charge $Q$ is placed within the area sandwiched by the metal planes, we verify $\eqref{equ:proof-1}$ is indeed true.

## Problem with Neumann boundary condition

We can do much more than that, we can go further and consider Neumann boundary conditions. Similarly, we will discuss in two cases.

### Special case: $\alpha = \pi/n$

This situation can also be solved using the method of images, for example

![Neumann](neumann.png){: .light width="400"}
![Neumann](neumann-dark.png){: .dark width="400"}
_Figure 3: The positions of the charge $Q$ and image charges for $n =4$ with Neumann boundary condition._

It's just that all the image charges and source charges have the same sign at this time. So

$$
\begin{equation}
    \phi_{i} = \qty[\frac{i}{2}]\frac{2\pi}{n} + (-1)^{i+1}\phi_0, \quad (i=1,2,\dots,2n).
\end{equation}
$$

and

$$
\begin{equation}
 \Phi(r,\phi,z) = \frac{Q}{4\pi\epsilon_0} \sum_{i=1}^{2n} \frac{1}{\sqrt{r^2+r_0^2+z^2-2rr_0\cos(\phi-\phi_i)}}.
 \label{equ:2 solution1}
\end{equation}
$$

### General case: $\alpha$ can be any value
In order to satisfy the Neumann boundary condition $\partial_n \Phi =0$ , it is only necessary to modify the eigenfunction in the $\phi$ direction . One thing that needs to be noted is the situation of $k=0$ cannot be thrown away, then

$$
\psi(\phi)=\cos(\frac{k\pi}{\alpha}\phi), \quad m=\frac{k\pi}{\alpha}\quad (k=0,1,2,\dots)
$$

So the general solution must also be modified,

$$
\begin{equation*}
\begin{split}
        \Phi(r,\phi,z) &= \sum_{k=0}^{\infty}\int_{0}^{\infty}\dd{\mu}\  a_{k\mu} \Phi_{k\mu}(r,\phi,z) \\[.2cm]
        &=
        \begin{cases}
            \displaystyle{\sum_{k=0}^{\infty}\int_{0}^{\infty}\dd{\mu} A_{k\mu}I_{k\pi/\alpha}(\mu r)\cos(\mu z) \cos(\frac{k\pi}{\alpha}\phi)}, &r<r_0\\[.2cm]
            \displaystyle{\sum_{k=0}^{\infty}\int_{0}^{\infty}\dd{\mu} B_{k\mu}K_{k\pi/\alpha}(\mu r)\cos(\mu z) \cos(\frac{k\pi}{\alpha}\phi)}, &r> r_0
        \end{cases}
\end{split}
\end{equation*}
$$

The coefficients can be solved using the same method as before:

$$
\begin{equation*}
    \begin{cases}
        \displaystyle{A_{0\mu}= \frac{Q}{\alpha\epsilon_0\pi}K_0(\mu r_0)}\\[.2cm]
        \displaystyle{B_{0\mu}= \frac{Q}{\alpha\epsilon_0\pi}I_0(\mu r_0)}
    \end{cases},
    \quad
    \begin{cases}
        \displaystyle{A_{k\mu}= \frac{2Q}{\alpha\epsilon_0\pi}\cos(\frac{k\pi\phi_0}{\alpha})K_{k\pi/\alpha}(\mu r_0)}\\[.2cm]
        \displaystyle{A_{k\mu}= \frac{2Q}{\alpha\epsilon_0\pi}\cos(\frac{k\pi\phi_0}{\alpha})I_{k\pi/\alpha}(\mu r_0)}
    \end{cases}
    \ (k=1,2,\dots)
\end{equation*}
$$

Thus, the final result of the electric potential is

$$
\begin{equation}
\textcolor{crimson}{\Phi(r,\phi,z) =
\frac{Q}{\alpha\epsilon_0\pi\sqrt{r_0r}} \left\{\frac{1}{2} Q_{-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r})+
\sum_{k=1}^{\infty}  
Q_{\frac{k\pi}{\alpha}-\frac{1}{2}}
\qty(\frac{r^2+r_0^2+z^2}{2r_0r})
\cos(\frac{k\pi\phi_0}{\alpha})
\cos(\frac{k\pi\phi}{\alpha})\right\}.
}
        \label{equ:2 solution2}
\end{equation}
$$

### Prove they are equivalent if $\alpha =\pi/n$

Also use formula $\eqref{equ:green function expansion}$,

$$
\begin{align*}
    &\sum_{k=1}^{2n} \frac{1}{\sqrt{ \xi-\cos(\phi-\phi_k)}}\\[.2cm]
    ={}&\sqrt{2r_0r}\sum_{k=1}^{2n} \frac{1}{\sqrt{r^2+r_0^2+z^2-2r_0r\cos(\phi-\phi_k)}}\\[.2cm]
    ={}&\sqrt{2r_0r}\qty{ 
        \frac{1}{\pi\sqrt{r r_0}}\sum_{k=1}^{2n}Q_{-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r}) + \frac{2}{\pi\sqrt{rr_0}}\sum_{m=1}^{\infty} \cos[m(\phi-\phi_k)] Q_{m-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r r_0})
    }\\[.2cm]
    ={}&\frac{4\sqrt{2}n}{\pi} \Bigg\{\frac{1}{2}Q_{-\frac{1}{2}}(\xi) + \sum_{m=1}^{\infty}Q_{m-\frac{1}{2}}(\xi)\sum_{k=1}^{\infty}\frac{\cos\qty[\phi-\qty[\dfrac{k}{2}]\dfrac{2\pi}{n}+(-1)^{k}\phi_0]}{2n}\Bigg\}.
\end{align*}
$$

For the summation of $k$ on the right side, it can be calculated directly

$$
\begin{equation*}
    \frac{1}{2n}\sum_{k=1}^{2n}\cos\qty[m\qty(\phi-\qty[\frac{k}{2}]\frac{2\pi}{n}+(-1)^{k}\phi_0)] = \begin{cases}
        0, &\qty(\dfrac{m}{n} \neq p)\\[.2cm]
        \cos(m\phi)\cos(m\phi_0) ,\quad &\qty(\dfrac{m}{n} = p)
    \end{cases}
\end{equation*}
$$

So

$$
\begin{equation}
\textcolor{ForestGreen}{
    \begin{split}
    &\sum_{k=1}^{2n} \frac{1}{\sqrt{ \xi-\cos(\phi-\phi_k)}}\\[.2cm]
    ={}& \frac{4\sqrt{2}n}{\pi} \left\{\frac{1}{2}Q_{-\frac{1}{2}}(\xi) + \sum_{k=1}^{\infty} Q_{nk-\frac{1}{2}} \qty(\xi) \cos(nk\phi_0)\cos(nk\phi) \right\}.
    \end{split}
}
\end{equation}
$$

This is the result given after the two solutions $\eqref{equ:2 solution1}$ and $\eqref{equ:2 solution2}$ are equivalent.

## Problem with mixed boundary condition

The problem with mixed boundary condition can also be solved. See the following results.

### Special case: $\alpha = \pi/2n$

Note that this is different from the previous two cases. When $\alpha = \pi/(2n-1)$, the method of images is no longer valid. So we just discuss the case when $\alpha = \pi/2n$, see following example

![mixed](mixed.png){: .light width="400"}
![mixed](mixed-dark.png){: .dark width="400"}
_Figure 4: The positions of the charge $Q$ and image charges for $n=4$ with mixed boundary condition._

So

$$
\begin{equation}
    \phi_{i} = \qty[\frac{i}{2}]\frac{\pi}{n} + (-1)^{i+1}\phi_0. \quad (i=1,2,\dots,4n),
\end{equation}
$$

and the electric potential is

$$
\Phi(r,\phi,z) = \frac{Q}{4\pi\epsilon_0} \sum_{k=1}^{2n}
                \left\{ \frac{(-1)^{k+1}}{\sqrt{r^2+r_0^2+z^2-2rr_0\cos(\phi-\phi_{2k-1})}} + \frac{(-1)^{k+1}}{\sqrt{r^2+r_0^2+z^2-2rr_0\cos(\phi-\phi_{2k})}}\right\} .
$$

### General case: $\alpha$ can be any value

Also modify the eigenfunction in the $\phi$ direction by using

$$
 \psi(\phi)=\sin(\frac{(2k-1)\pi}{2\alpha}\phi), \quad m=\frac{(2k-1)\pi}{2\alpha}\quad (k=1,2,\dots).
$$

The general solution is

$$
\begin{equation*}
\begin{split}
        \Phi(r,\phi,z) &= \sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu}\  a_{k\mu} \Phi_{k\mu}(r,\phi,z) \\[.2cm]
        &=
        \begin{cases}
            \displaystyle{\sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu} A_{k\mu}I_{\frac{(2k-1)\pi}{2\alpha}}(\mu r)\cos(\mu z) \sin(\frac{(2k-1)\pi}{2\alpha}\phi)}, &r<r_0\\[.2cm]
            \displaystyle{\sum_{k=1}^{\infty}\int_{0}^{\infty}\dd{\mu} B_{k\mu}K_{\frac{(2k-1)\pi}{2\alpha}}(\mu r)\cos(\mu z) \sin(\frac{(2k-1)\pi}{2\alpha}\phi)}, &r> r_0
        \end{cases}
\end{split}
\end{equation*}
$$

And the coefficients are

$$
\begin{equation}
    \begin{cases}
    \displaystyle{A_{k\mu}  = \frac{2Q}{\alpha\epsilon_0\pi}\sin(\frac{(2k-1)\pi}{2\alpha}\phi_0) K_{\frac{(2k-1)\pi}{2\alpha}}(\mu r_0),} \\[.2cm]
    \displaystyle{B_{k\mu}  = \frac{2Q}{\alpha\epsilon_0\pi}\sin(\frac{(2k-1)\pi}{2\alpha}\phi_0) I_{\frac{(2k-1)\pi}{2\alpha}}(\mu r_0).}
    \end{cases}
\end{equation}
$$


And the final result is

$$
\begin{equation}
    \textcolor{crimson}{
        \Phi(r,\phi,z) =\frac{Q}{\alpha\epsilon_0\pi\sqrt{r_0r}}  \sum_{k=1}^{\infty}  Q_{\frac{(2k-1)\pi}{2\alpha}-\frac{1}{2}}\qty(\frac{r^2+r_0^2+z^2}{2r_0r})\sin(\frac{(2k-1)\pi\phi_0}{2\alpha})\sin(\frac{(2k-1)\pi\phi}{2\alpha}).
    }
\end{equation}
$$

### Prove they are equivalent if $\alpha=\pi/2n$
 Also use formula $\eqref{equ:green function expansion}$, 

$$
\begin{align*}
    &\sum_{k=1}^{2n}\qty{ \frac{(-1)^{k+1}}{\sqrt{\xi-\cos(\phi-\phi_{2k-1})}} + \frac{(-1)^{k+1}}{\sqrt{\xi-\cos(\phi-\phi_{2k})}}}\\[.2cm]
    ={}&\sqrt{2r_0r}\left\{ \sum_{k=1}^{2n} \frac{(-1)^{k+1}}{\sqrt{r^2+r_0^2+z^2-2r_0r\cos(\phi-\phi_{2k-1})}}+\sum_{k=1}^{2n} \frac{(-1)^{k+1}}{\sqrt{r^2+r_0^2+z^2-2r_0r\cos(\phi-\phi_{2k})}} \right\}\\[.2cm]
    ={}&\frac{2\sqrt{2}}{\pi} \sum_{m=1}^{\infty} Q_{m-\frac{1}{2}}(\xi) \qty{\sum_{k=1}^{2n}(-1)^{k+1}\cos[m(\phi-\phi_{2k-1})]+\sum_{k=n}^{2n}(-1)^{k+1}\cos[m(\phi-\phi_{2k})]}\\[.2cm]
    ={}&\frac{4\sqrt{2}}{\pi} \sum_{m=1}^{\infty} Q_{m-\frac{1}{2}}(\xi) \cos\qty(m\phi_0-\frac{m\pi}{2n})\sum_{k=1}^{2n}(-1)^{k+1}\cos\qty[m\phi-\frac{(2k-1)m\pi}{2n}].
\end{align*}
$$

Calculate the second sum of the above equation,

$$
\begin{align*}
    \sum_{k=1}^{2n}(-1)^{k+1}\cos\qty[m\phi-\frac{(2k-1)m\pi}{2n}]=\begin{cases}
        \displaystyle{-2n\cos(m\phi+\frac{m\pi}{2n})}, \quad &\qty(\dfrac{m}{n} = 2p-1)\\[.2cm]
        0, \quad &\qty(\dfrac{m}{n} = 2p-1)
    \end{cases}
\end{align*}
$$

then

$$
\begin{align*}
    &\sum_{k=1}^{2n}\qty{ \frac{(-1)^{k+1}}{\sqrt{\xi-\cos(\phi-\phi_{2k-1})}} + \frac{(-1)^{k+1}}{\sqrt{\xi-\cos(\phi-\phi_{2k})}}}\\[.2cm]
    ={}& - \frac{8\sqrt{2}n}{\pi}\sum_{p=1}^{\infty} Q_{(2p-1)n-\frac{1}{2}}(\xi) \cos((2p-1)n\phi_0-\frac{(2p-1)\pi}{2})\cos((2p-1)n\phi+\frac{(2p-1)\pi}{2}).
\end{align*}
$$

That is,

$$
\begin{equation}
\textcolor{ForestGreen}{
    \begin{split}
     &\sum_{k=1}^{2n}\qty{ \frac{(-1)^{k+1}}{\sqrt{\xi-\cos(\phi-\phi_{2k-1})}} + \frac{(-1)^{k+1}}{\sqrt{\xi-\cos(\phi-\phi_{2k})}}}\\[.2cm]
     ={}&
    \frac{8\sqrt{2}n}{\pi}\sum_{k=1}^{\infty} Q_{(2p-1)n-\frac{1}{2}}(\xi) \sin[(2p-1)n\phi_0]\sin[(2p-1)n\phi],
    \end{split}
}
\end{equation}
$$

which is what we want to verify.


## Appendix: Prove the integral formula

We used $\eqref{equ:integral}$ in our previous calculation without proof, and now we prove it. With Sonine-Gegenbauer integral

$$
\int_{0}^{\pi}\frac{t^{\nu}J_{\nu}(t\sqrt{a^2+b^2-2ab\cos\theta})}{(a^2+b^2-2ab\cos\theta)^{\nu/2}}\sin^{2\nu}\theta\dd{\theta} = \frac{\pi\Gamma(2\nu)}{2^{\nu-1}\Gamma(\nu)}\frac{J_{\nu}(at)}{a^{\nu}}\frac{J_{\nu}(bt)}{b^{\nu}},
$$

we calculate the integration of $J_{\nu}(ax)J_{\nu}(bx)\mathrm{e}^{-cx}$,

$$
\begin{align*}
    &\frac{\pi\Gamma(2\nu)}{2^{\nu-1}\Gamma(\nu)}\frac{1}{a^{\nu}b^{\nu}}\int_{0}^{\infty} J_{\nu}(at)J_{\nu}(bt)\mathrm{e}^{-ct}\dd{t}\\[.2cm]
    ={}&\int_{0}^{\infty}\qty(\int_{0}^{\pi}\frac{t^{\nu}J_{\nu}(t\sqrt{a^2+b^2-2ab\cos\theta})}{(a^2+b^2-2ab\cos\theta)^{\nu/2}}\sin^{2\nu}\theta\dd{\theta})\mathrm{e}^{-ct}\dd{t}\\[.2cm]
    ={}&\int_0^{\pi}\frac{\sin^{2\nu}\theta}{(a^2+b^2-2ab\cos\theta)^{\nu/2}}\qty(\int_{0}^{\infty}t^{\nu}J_{\nu}(t\sqrt{a^2+b^2-2ab\cos\theta})\mathrm{e}^{-ct}\dd{t})\dd{\theta}
\end{align*}
$$

Then use the following two integral formulas,

$$
\int_{0}^{\infty} \mathrm{e}^{-ax}J_{\nu}(bx)x^{\nu}\dd{x} = \frac{b^{\nu}\Gamma(2\nu+1)}{2^{\nu}\Gamma(\nu+1)}\frac{1}{(a^2+b^2)^{\nu+1/2}},
$$

and 

$$
\begin{equation*}
\begin{split}
&\int_{0}^{\infty} t^{\nu}J_{\nu}(t\sqrt{a^2+b^2-2ab\cos\theta}) \mathrm{e}^{-ct}\dd{t} \\[.2cm]
={}& \frac{(\sqrt{a^2+b^2-2ab\cos\theta})^{\nu}\Gamma(2\nu+1)}{2^{\nu}\Gamma(\nu+1)}\frac{1}{(c^2+a^2+b^2-2ab\cos\theta)^{\nu+1/2}}.
\end{split}
\end{equation*}
$$

Substituting into the above formula, we can get

$$
\begin{align*}
    \frac{\pi\Gamma(2\nu)}{2^{\nu-1}\Gamma(\nu)}\frac{1}{a^{\nu}b^{\nu}}\int_{0}^{\infty} J_{\nu}(at)J_{\nu}(bt)\mathrm{e}^{-ct}\dd{t} &=\frac{\Gamma(2\nu+1)}{2^{\nu}\Gamma(\nu+1)}\int_{0}^{\pi}\frac{\sin^{2\nu}\theta}{(c^2+a^2+b^2-2ab\cos\theta)^{\nu+1/2}}\dd{\theta}\\[.2cm]
    &=\frac{\Gamma(2\nu+1)}{2^{\nu}\Gamma(\nu+1)}\frac{2^{\nu+1/2}}{(2ab)^{\nu+1/2}}Q_{\nu-\frac{1}{2}}\qty(\frac{c^2+a^2+b^2}{2ab}).
\end{align*}
$$

So

$$
\int_{0}^{\infty} J_{\nu}(at)J_{\nu}(bt)\mathrm{e}^{-ct}\dd{t} = \frac{1}{\pi\sqrt{ab}}Q_{\nu-\frac{1}{2}}\qty(\frac{a^2+b^2+c^2}{2ab}).
$$

Following the derivation in this post, we can give the cylindrical coordinate expansion of Green's function in another form (like $\eqref{equ:green function expansion}$):

$$
\frac{1}{|\vb{x}-\vb{x}'|} =\frac{2}{\pi} \sum_{m=-\infty}^{\infty} \int_0^{\infty} \dd{k} \mathrm{e}^{im(\phi-\phi')}\cos[k(z-z')]I_{m}(kr_<)K_{m}(k r_>).
$$

By choosing different constant forms when separating variables, we can get another expansion form of Green's function in cylindrical coordinates:

$$
    \frac{1}{|\vb{x}-\vb{x}'|} = \sum_{m=-\infty}^{\infty}\int_{0}^{\infty}\dd{k} e^{im(\phi-\phi')}J_m(kr)J_m(kr')\mathrm{e}^{-k(z_>-z_<)}. 
$$

Since they are the same Green's function, the two expansion forms are equivalent. The only difference lies in the selection of constants when separating variables. Note that $e^{im(\phi-\phi')}$ is pairwise orthogonal when $m$ is different. By comparing their coefficients, we can easily get:

$$
\int_{0}^{\infty} \dd{k} \frac{2}{\pi} K_{m}(kr_>)I_m(kr_<)\cos[k(z-z')] = \int_0^{\infty}\dd{k} J_m(kr)J_m(kr')e^{-k(z_>-z_<)}.
$$

Thus,

$$
\int_{0}^{\infty} K_{\nu}(ax) I_{\nu}(bx) \cos(cx)\dd{x} = \frac{1}{2\sqrt{ab}} Q_{\nu-\frac{1}{2}}\qty(\frac{a^2+b^2+c^2}{2ab}).
$$

This is exactly $\eqref{equ:integral}$.

[^foot-1]: Zwillinger, D. (Ed.). *Table of integrals, series, and products* (8th ed.). Academic Press. p. 726. (2014)