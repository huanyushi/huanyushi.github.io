---
title:      "TikZ: Feynman Diagram Examples"
date:       2024-05-26
categories: [LaTeX]
tag: [quantum field theory, LaTeX]
media_subpath: /img/in-post/feynman-diagram/
description: A gallery of TikZ examples featuring numerous Feynman diagrams with TikZ codes for quantum field theory and condensed matter field theory.
published: false
math: true
---

## 1. $e^{-}e^{+}\to \gamma\gamma$

![](electron-positron-annilation-photon.PNG){: .light}
![](electron-positron-annilation-photon-dark.PNG){: .dark}
_Electron–positron annihilation, $e^{-}e^{+}\to \gamma\gamma$_

<details class="details-inline" markdown="1">
<summary>TikZ code </summary>

```latex
%!TEX program = lualatex
\documentclass{article}
\usepackage{tikz-feynman}
\usepackage{float}
\usepackage{subfig}

\begin{document}

\begin{figure}[H]
    \centering
    \subfloat[$t$-channel]{
    \begin{tikzpicture}[baseline=(a)]
        \draw[-Stealth,thick](-2,0)--(-2,3)node[above]{$t$};
        \begin{feynman}[large]
            \vertex (e1){$e^-$};
            \vertex [above right= of e1](a);
            \vertex [above left= of a](g1){$\gamma_1$};
            \vertex [right= of a](b);
            \vertex [above right= of b](g2){$\gamma_2$};
            \vertex [below right= of b](e2){$e^+$};
    
            \diagram*{
                (e1) --[fermion,edge label'=$p_1$](a) --[photon,momentum' = $k_1$](g1),
                (e2) --[anti fermion,momentum = $p_2$](b) --[photon,momentum = $k_2$](g2),
                (a) --[fermion,edge label'=$q$](b),
            };
        \end{feynman}
    \end{tikzpicture}
    }
    \subfloat[$u$-channel]{
    \begin{tikzpicture}[baseline=(a)]
        \begin{feynman}[large]
            \vertex (e1){$e^-$};
            \vertex [above right= of e1](a);
            \vertex [above left= of a](g1){$\gamma_1$};
            \vertex [right= of a](b);
            \vertex [above right= of b](g2){$\gamma_2$};
            \vertex [below right= of b](e2){$e^+$};

            \diagram*{
                (e1) --[fermion, edge label' =$p_1$](a) --[fermion,edge label'=$\tilde{q}$](b),
                (e2) --[anti fermion,momentum=$p_2$](b) --[photon, momentum' = $k_1$](g1),
                (a) --[photon, momentum = $k_2$](g2),
            };
        \end{feynman}
    \end{tikzpicture}
    }
\end{figure}

\end{document}
```

</details> 