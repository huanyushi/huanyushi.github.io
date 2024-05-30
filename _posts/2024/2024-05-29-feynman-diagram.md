---
title:      "&sect;2.4 Diagrammatic Analysis of Perturbation Theory"
date:       2024-05-29
categories: [Condensed Matter Physics, Quantum Many-Particle Theory]
tag: [condensed matter physics, many-particle physics]
media_subpath : /assets/img/in-post/many-particle-physics/
math: true
render_with_liquid: false
---

We have got the expression of the exact Green's function in the interaction picture:

$$
\begin{equation}
    iG_{\alpha\beta}(x,x') = \frac{\ev{\hat{\mathsf{T}}\qty[\hat{\psi}_{I\alpha}(x)\hat{\psi}_{I\beta}^\dagger(x')\hat{S}]}{\Phi^0}}{\ev{\hat{S}}{\Phi^0}},
    \label{green-function}
\end{equation}
$$

where $\hat{H}\_0 \ket{\Phi^0} = E\_g^0 \ket{\Phi^0}$ and 

$$
\begin{equation}
\begin{split}
    \hat{S} &= \hat{\mathsf{T}}\exp\qty[-\frac{i}{\hbar}\int_{-\infty}^{\infty} \dd{t} \hat{V}_{I}(t)]\\[.2cm]
    &= 1 - \frac{i}{\hbar} \int_{-\infty}^\infty \dd{t} \hat{V}_I(t)  + \frac{1}{2!}\qty(\frac{-i}{\hbar})^2 \int_{-\infty}^{\infty} \dd{t}_1 \int_{-\infty}^{\infty} \dd{t}_2 \hat{\mathsf{T}}\qty[\hat{V}_I(t_1)\hat{V}_{I}(t_2)] + \cdots
\end{split}
\end{equation}
$$

For the interparticle potential $\hat{V}$ independent of particle spin, we have

$$
\begin{equation}
    \int_{-\infty}^{\infty} \hat{V}_I(t')\dd{t}' = \frac{1}{2}\sum_{\alpha\beta}\int\dd[4]{x}\int\dd[4]{x'} \hat{\psi}_{I\alpha}^\dagger(x)\hat{\psi}_{I\beta}^\dagger(x')\hat{U}(x,x') \hat{\psi}_{I\beta}(x') \hat{\psi}_{I\alpha}(x).
\end{equation}
$$

Wick's theorem allows us to evaluate it as a perturbation expansion involving *only wholly contracted field operators in the interaction picture*. These contractions are just the free-field Green's functions $G^0$, and $G$ is thereby expressed in a series containing $U$ and $G^0$.  This expansion can be analyzed directly in coordinate space, or (for a uniform system) in momentum space and the procedure can be simplified as some diagrams which are known as the **Feynman diagrams**.

## 1. Feynman diagrams in coordinate space
### 1.1. Zeroth order
Consider the zeroth order of the numerator of $\eqref{green-function}$ where $\hat{S} = 1$, then

$$
\begin{equation}
    \begin{split}
    \text{Zeroth order}& = \ev{\hat{\mathsf{T}}\qty[\hat{\psi}_{I\alpha}(x)\hat{\psi}_{I\beta}^\dagger(x')]}{\Phi^0} \\[.2cm]
    & = \ev{\hat{\mathsf{N}}\qty[\hat{\psi}_{I\alpha}(x)\hat{\psi}_{I\beta}^\dagger(x') + \hat{\psi}_{I\alpha}^{\bullet}(x)\hat{\psi}_{I\beta}^{\dagger\bullet}(x')]}{\Phi^0}\\[.2cm]
        & = iG_{\alpha\beta}^0(x,x')
    \end{split}
\end{equation}
$$

This is the result we calculated in the previous post which represent the case of no interaction.

### 1.2. First order
Consider the first order of the numerator of $\eqref{green-function}$,

$$
\begin{equation}
    \begin{split}
        \text{First order} & = -\frac{i}{2\hbar}\sum_{\gamma\delta}\iint\dd[4]{y}\dd[4]{z} \hat{U}(y,z) \textcolor{red}{\ev{\hat{\mathsf{T}}\qty[\hat{\psi}_{I\alpha}(x)\hat{\psi}_{I\beta}^\dagger(x')\hat{\psi}_{I\gamma}^\dagger(y)\hat{\psi}_{I\delta}^\dagger(z)\hat{\psi}_{I\delta}(z)\hat{\psi}_{I\gamma}]}{\Phi^0}}.
    \end{split}
\end{equation}
$$

The red part of the above equation can be analyzed with Wick's theorem where only the full contraction terms don't vanish. Moreover, only the contractions of $\hat{\psi}$ and $\hat{\psi}^\dagger$ do not equal to zero. So actually, only six possible full contractions will contribute. To be explicit, I have used the traditional Wick contraction notation in the following figure.

![wick-contraction-first-order](wick-contraction-first-order.PNG){: .light}
![wick-contraction-first-order](wick-contraction-first-order-dark.PNG){: .dark}

### 1.3. Feynman diagrams in coordinate space
We now associate a diagram with each of the equations appearing in the above figure.
The Green's function $G^0$ is denoted by a straight line with an arrow running from the second argument to the first, while the interaction potential is denoted by a dashed line.

![Green's-function-and-interaction](feynman-1.PNG){: .light }
![Green's-function-and-interaction](feynman-1-dark.PNG){: .dark }
_Diagrams of Green's function and interaction._

These six equations can be represented by the following six diagrams:

![first-order-feynman-diagram](feynman-2.PNG){: .light}
![first-order-feynman-diagram](feynman-2-dark.PNG){: .dark}
_The first order Feynman diagrams._

<details class="details-inline" markdown="1">
<summary>TikZ code </summary>

```latex
\documentclass{article}
\usepackage[left=5em,right=5em]{geometry}
\usepackage{tikz}
\usepackage{amsmath}
\usepackage{physics}
\usepackage{tikz-feynhand}
\usepackage{tikz-feynman}
\usepackage{subfig}
\setlength{\feynhandlinesize}{1pt} 

\begin{document}

% 说明： propag 本质上就是 tikz 里的 path，因此不仅仅局限于 tikz-feynhand 文档说明里已有的功能；

\begin{figure}
    \subfloat[]{% a
        \begin{tikzpicture}[scale=1.5]
            \begin{feynhand}
                \vertex (a) at (0,0); \vertex (b) at (3,0);
                \vertex (c) at (1,1); \vertex (d) at (2,1); 
                \propag[fer] (b) node[below]{$x',\beta$} to (a)node[below]{$x,\alpha$};
                \propag[fer] (c) circle [xshift=-0.4cm,radius=0.4,rotate=-90];
                \propag[fer] (d) circle [xshift=0.4cm,radius=0.4,rotate=-90];
                \propag[chasca] (c) node [left]{$z,\delta$} to (d) node[right]{$y,\gamma$};
            \end{feynhand}
        \end{tikzpicture}
    }
    \hspace{.4cm}
    \subfloat[]{% b
        \begin{tikzpicture}[scale=1.5]
            \begin{feynhand}
                \vertex (a) at (0,0); \vertex (b) at (3,0);
                \vertex (c1) at (1,1); \vertex (c2) at (2,1); 
                \propag[fer] (b) node[below]{$x',\beta$} to (a)node[below]{$x,\alpha$};
                \propag[fer] (c1) circle [xshift=0.5cm,radius=0.5,rotate=-90];
                \propag[fer] (c1) circle [xshift=0.5cm,radius=0.5,rotate=90];
                \propag[chasca] (c2) node [right]{$z,\delta$} to (c1) node[left]{$y,\gamma$};
            \end{feynhand}
        \end{tikzpicture}
    }
    \hspace{.4cm}
    \subfloat[]{% c
    \begin{tikzpicture}[scale=1.5]
        \begin{feynhand}
            \vertex (a) at (0,0); \vertex (b) at (1,0); \vertex (c) at (2,0);\vertex (d) at (3,0);
            \node at (a) [below]{$x,\alpha$};\node at (b) [below]{$y,\gamma$};\node at (c) [below]{$z,\delta$};\node at (d) [below]{$x',\beta$}; 
            \graph{ (d) -- [fer] (c)  -- [fer] (b)  -- [fer](a) };
            \propag[chasca] (c) arc(0:180:0.5);
        \end{feynhand}
    \end{tikzpicture}
}
\vspace{.3cm}

\subfloat[]{% d
\begin{tikzpicture}[scale=1.5]
    \begin{feynhand}
        \vertex (a) at (0,0); \vertex (b) at (1.5,0); \vertex (c) at (3,0);\vertex (d) at (1.5,0.5); 
        \node at (a) [below]{$x,\alpha$}; \node at (c) [below]{$x',\beta$}; 
        \node at (b) [below]{$y,\gamma$};
        \node at (d) [above]{$z,\delta$};
        \graph{ (c) -- [fer] (b)  -- [fer] (a) };
        \propag[chasca] (d) to (b);
        \propag[fer] (1.5,0.9) circle [radius=0.4,rotate=-90] ;
    \end{feynhand}
\end{tikzpicture}
}
\hspace{.4cm}
\subfloat[]{% e
\begin{tikzpicture}[scale=1.5]
    \begin{feynhand}
        \vertex (a) at (0,0); \vertex (b) at (1.5,0); \vertex (c) at (3,0);\vertex (d) at (1.5,0.5); 
        \node at (a) [below]{$x,\alpha$}; \node at (c) [below]{$x',\beta$}; 
        \node at (b) [below]{$z,\delta$};
        \node at (d) [above]{$y,\gamma$};
        \graph{ (c) -- [fer] (b)  -- [fer] (a) };
        \propag[chasca] (b) to (d);
        \propag[fer] (1.5,0.9) circle [radius=0.4,rotate=-90] ;
    \end{feynhand}
\end{tikzpicture}
}
\hspace{.4cm}
\subfloat[]{% f
\begin{tikzpicture}[scale=1.5]
    \begin{feynhand}
        \vertex (a) at (0,0); \vertex (b) at (1,0); \vertex (c) at (2,0);\vertex (d) at (3,0);
        \node at (a) [below]{$x,\alpha$};\node at (c) [below]{$y,\gamma$};\node at (b) [below]{$z,\delta$};\node at (d) [below]{$x',\beta$}; 
        \graph{ (d) -- [fer] (c)  -- [fer] (b)  -- [fer](a) };
        \propag[chasca] (b) arc(180:0:0.5);
    \end{feynhand}
\end{tikzpicture}
}
\end{figure}
```

</details>

1. The terms $a$, $b$, $d$, and $e$ contain a Green's function with both arguments at the same time, which is indicated by a solid line closed on itself, i.e. $i G_{\alpha\beta}(x,x)$.  Their integral eventually leads to a constant, leaving only the free propagator $G^0$.
2. The terms $a$ and $b$ are **disconnected diagrams**, containing subunits that are not connected to the rest of the diagram by any lines. *These disconnected diagrams do not contribute to the exact Green's function* which will be proved later.

