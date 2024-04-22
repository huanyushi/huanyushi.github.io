---
title:      "A Challenging Double Integral"
date:       2023-04-25
categories: [Mathematics, Integration]
tag: [special function, integration]
math: true
---
## Question:
Try to solve the following integral:

$$
\int_0^1 \int_0^1 \frac{y^2}{(x^2y^2+1+2y^2)(y^2+1)}\, \mathrm{d}x\mathrm{d}y.
$$

I have already solved this integral on Zhihu, and you can see my solution [here](https://www.zhihu.com/question/597465258/answer/2999395127).

## Solution:
First integrate with respect to $x$, and the original integral can be simplified to

$$
\begin{aligned}
    I & =\int_0^1 \frac{y^2\,\mathrm{d}y}{(1+y^2)(1+2y^2)} \int_0^1 \frac{1}{x^2 \frac{y^2}{1+2y^2}+1}\, \mathrm{d}x\\[.3cm]
    & =\int_0^1 \frac{y^2}{(1+y^2)(1+2y^2)} \cdot \frac{\sqrt{1+2y^2}}{y} \arctan \frac{y}{\sqrt{1+2y^2}}\, \mathrm{d}y\\[.3cm]
    &= {\color{RoyalBlue}\int_0^1 \frac{y}{(1+y^2)\sqrt{1+2y^2}} \arctan \frac{y}{\sqrt{1+2y^2}}\, \mathrm{d}y  }, \quad y\mapsto 1/x \qquad (\star)\\[.3cm]
    &=\int_1^{\infty} \frac{1}{(1+x^2)\sqrt{2+x^2}} \arctan \frac{1}{\sqrt{2+x^2}}\, \mathrm{d}x\\[.5cm]
    &=\frac{\pi}{2} \int_1^{\infty} \frac{1}{(1+x^2)\sqrt{2+x^2}} \, \mathrm{d}x - \int_1^{\infty}\frac{\arctan\sqrt{2+x^2}}{(1+x^2)\sqrt{2+x^2}}\,\mathrm{d}x\\[.3cm]
    &=\frac{\pi}{2}\arctan \frac{x}{\sqrt{2+x^2}}\Bigg|_{x=1}^{\infty} - \int_1^{\infty}\frac{\arctan\sqrt{2+x^2}}{(1+x^2)\sqrt{2+x^2}}\,\mathrm{d}x \\[.3cm]
    &=\frac{\pi^2}{24} - \underbrace{\int_1^{\infty} \frac{\arctan \sqrt{2+x^2}}{(1+x^2)\sqrt{2+x^2}}\,\mathrm{d}x}_{J}.
\end{aligned}
$$

So the question now boils down to the calculation of $J$, which is essentially related to [Ahmed's integral](https://arxiv.org/abs/1411.5169). And

$$
J  = \int_1^{\infty} \frac{\arctan\sqrt{2+x^2}}{(1+x^2)\sqrt{2+x^2}}\,\mathrm{d}x,
$$

which can be solved by using Feynman's trick. Let

$$
J(u) = \int_1^{\infty} \frac{\arctan (u\sqrt{2+x^2})}{(1+x^2)\sqrt{2+x^2}},
$$

so 

$$
\begin{aligned}
J'(u) &= \int_1^{\infty} \frac{\mathrm{d}x}{(x^2+1)(u^2(x^2+2)+1)}\\[.3cm]
&=\frac{1}{1+u^2} \int_1^{\infty}\left(\frac{1}{1+x^2}-\frac{1}{\frac{1+2u^2}{u^2}+x^2}\right)\,\mathrm{d}x    \\[.3cm]
&=\frac{1}{1+u^2}\left[\arctan x - \frac{u}{\sqrt{1+2u^2}} \arctan \frac{ux}{\sqrt{1+2u^2}}\right] \Bigg|_{x=1}^{x=\infty}\\[.3cm]
&=\frac{\pi}{4} \frac{1}{1+u^2} - \frac{\pi}{2} \frac{u}{(1+u^2)\sqrt{1+2u^2}} + \frac{u}{(1+u^2)\sqrt{1+2u^2}}\arctan \frac{u}{\sqrt{1+2u^2}}.
\end{aligned}
$$

Note that $J(0) = 0$, by integrating with respect to $u$, we can obtain $J$:

$$
\begin{aligned}
&J(1)-J(0)\\[.3cm]
={}&\int_0^{1}J'(u)\,\mathrm{d}u\\[.3cm]
={}&\frac{\pi}{4}\int_0^{1}\frac{\mathrm{d}u}{1+u^2} - \frac{\pi}{2}\int_0^1 \frac{u\,\mathrm{d}u}{(1+u^2)\sqrt{1+2u^2}} + \int_0^{1}\frac{u}{(1+u^2)\sqrt{1+2u^2}}\arctan \frac{u}{\sqrt{1+2u^2}}\,\mathrm{d}u\\[.3cm]
={}&\frac{\pi}{4}\cdot\frac{\pi}{4} - \frac{\pi}{2}\cdot \frac{\pi}{12} + \int_0^{1}\frac{u}{(1+u^2)\sqrt{1+2u^2}}\arctan \frac{u}{\sqrt{1+2u^2}}\,\mathrm{d}u\\[.3cm]
={}&\frac{\pi^2}{48}+ \underbrace{
    {\color{Royalblue}{\int_0^{1}\frac{u}{(1+u^2)\sqrt{1+2u^2}}\arctan \frac{u}{\sqrt{1+2u^2}}\,\mathrm{d}u}}
}_{I}.
\end{aligned}
$$

The result of the blue part in the above equation is exactly the $I$ that we initially calculated. Please refer to equation $(\star)$. Notice that

$$
I = \frac{\pi^2}{24} - J,
$$

so we can obtain

$$
J = \frac{\pi^2}{48} + \frac{\pi^2}{24} - J \quad \Rightarrow \quad J= \frac{\pi^2}{32}.
$$

Integrating all the previous results, we can obtain the following result:

$$
\color{red}{
\begin{aligned}
    &\int_0^{1}\frac{x}{(1+x^2)\sqrt{1+2x^2}} \arctan \frac{x}{\sqrt{1+2x^2}}\,\mathrm{d}x = \frac{\pi^2}{96}\\[.3cm]
    &\int_1^{\infty}\frac{\sqrt{2+x^2}}{(1+x^2)\sqrt{2+x^2}} \, \mathrm{d}x = \frac{\pi^2}{32}\\[.3cm]
    &\int_0^1 \frac{\arctan \sqrt{2+x^2}}{(1+x^2)\sqrt{2+x^2}} \, \mathrm{d}x = \frac{5\pi^2}{96}, \quad \color{black}{\text{Ahmed's Integral}}
\end{aligned}
}
$$

And the original integral is

$$
\int_0^1 \int_0^1 \frac{y^2}{(x^2y^2+1+2y^2)(y^2+1)}\, \mathrm{d}x\mathrm{d}y = \frac{\pi^2}{96}.
$$