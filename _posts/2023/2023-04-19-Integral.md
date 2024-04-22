---
title:      "An Integral Involving the Product of Bessel Function and Associated Laguerre Polynomial"
date:       2023-04-19
categories: [Mathematics, Integration]
tag: [special function, integration]
math: true
---
## Question:
Try to prove the following integral:

$$
\int_{0}^{\infty} z^{\mu/2} \mathrm{e}^{-z} L_{n}^{\mu}(z)J_{\mu}\left(2\sqrt{xz}\right) \mathrm{d}z = \frac{1}{n!} x^{n+\mu/2}\mathrm{e}^{-x},
$$

where $x>0,n\in\mathbb{N}$ and $L_{n}^{\mu}(z), J_{\mu}(z)$ denote associated Laguerre polynomial and Bessel function respectively.

This question was asked on Zhihu recently, and you can find my [solution](https://www.zhihu.com/question/595970760/answer/2990294940) in it. You can see that this integral looks awful, but has a very concise result. That's why I post this question in my blog.

## Solution:
**Train of Thought**: Recall the orthogonality of the associated Laguerre polynomials:

$$
\int_0^{\infty}z^{\mu} \mathrm{e}^{-z} L_{n}^{\mu}(z) L_{n'}^{\mu}(z) \ \mathrm{d}z = \frac{\Gamma(\mu+n+1)}{n!}\delta_{nn'}. 
$$

So if $z^{-\mu/2}J_{\mu}(2\sqrt{xz})$ can be expressed as the linear combination of associated Laguerre polynomials $L_{m}^{\mu}(z)$ with different $m$:

$$
z^{-\mu/2}J_{\mu}(2\sqrt{xz}) \sim \sum_{m=0}^{\infty} a_m L_{m}^{\mu}(z) ,
$$

then we just need to use the orthogonality to find answer. You can see the following steps for detailed process.
### Lemma 1

$$
\color{Green}{\text{Lemma 1:}\quad\displaystyle{ \int_0^{\infty}z^{\mu} \mathrm{e}^{-z} L_{n}^{\mu}(z) L_{n'}^{\mu}(z) \ \mathrm{d}z = \frac{\Gamma(\mu+n+1)}{n!}\delta_{nn'}}} .
$$

Recall the generating function of the associated Laguerre polynomials:

$$
\sum_{n=0}^{\infty}L_{n}^{\mu}(z)t^{n} = \frac{\mathrm{e}^{-zt/(1-t)}}{(1-t)^{\mu+1}} ,
$$

then we can calculate the product of two different generating functions,

$$
\begin{aligned}
 &\sum_{n=0}^{\infty}t^{n}L_{n}^{\mu}(z) \cdot \sum_{n'=0}^{\infty} s^{n'}L_{n'}^{\mu'}(z)\\[.5cm] ={}&\sum_{n=0}^{\infty}\sum_{n'=0}^{\infty} t^{n}s^{n'} L_{n}^{\mu}(z)L_{n'}^{\mu'}(z) \\[.5cm]={}& \frac{1}{(1-t)^{\mu+1}(1-s)^{\mu'+1}}\, \mathrm{exp}\left[-z \left(\frac{t}{1-t}+ \frac{s}{1-s}\right) \right].
\end{aligned}
$$

Multiplying both sides by $z^{\lambda}\mathrm{e}^{-z}$ and integrating,

$$
\begin{aligned} &\sum_{n=0}^{\infty}\sum_{n'=0}^{\infty} t^{n}s^{n'}\int_{0}^{\infty} z^{\lambda} \mathrm{e}^{-z} L_{n}^{\mu}(z) L_{n'}^{\mu'}(z) \ \mathrm{d}z\\[.5cm] ={}&\int_0^{\infty} \frac{z^{\lambda}}{(1-t)^{\mu+1}(1-s)^{\mu'+1}} \, \exp\left[-z \frac{1-ts}{(1-t)(1-s)}\right] \ \mathrm{d}z\\[.5cm] ={}&\frac{(1-t)^{\lambda-\mu}(1-s)^{\lambda -\mu'}}{(1-ts)^{\lambda+1}}\int_0^{\infty} \mathrm{e}^{-x}x^{\lambda}\ \mathrm{d}x\\[.5cm] ={}&\Gamma(\lambda+1)\sum_{l=0}^{\infty}\binom{\lambda-\mu}{l}(-t)^{l} \sum_{l'=0}^{\infty} \binom{\lambda-\mu'}{l}(-s)^{l'}\sum_{k=0}^{\infty}\binom{-\lambda-1}{k}(-ts)^{k} \\[.5cm] ={}&\Gamma(\lambda+1)\sum_{n=0}^{\infty}\sum_{n=0}^{\infty}t^{n}s^{n'} \sum_{k=0}^{\infty}(-)^{n+n'+k}  \binom{\lambda-\mu}{n-k}\binom{\lambda-\mu'}{n'-k}\binom{-\lambda-1}{k}. \end{aligned}
$$

Comparing the coefficients of $t^{n}s^{n'}$ on both sides, we can find:

$$
\int_0^{\infty} z^{\lambda} \mathrm{e}^{-z} L_{n}^{\mu}(z) L_{n'}^{\mu'}(z) \ \mathrm{d}z =  (-)^{n+n'}\Gamma(\lambda+1) \sum_{k=0}^{\infty} \binom{\lambda-\mu}{n-k}\binom{\lambda-\mu'}{n'-k}\binom{\lambda+k}{k} .
$$

Let $\lambda = \mu = \mu'$, the above equation becomes

$$
\int_0^{\infty}z^{\mu} \mathrm{e}^{-z} L_{n}^{\mu}(z) L_{n'}^{\mu}(z) \ \mathrm{d}z = \frac{\Gamma(\mu+n+1)}{n!}\delta_{nn'}.
$$

Thus, we have proved the lemma 1.
### Lemma 2

$$
\color{Green}{\text{Lemma 2:}\quad\displaystyle{J_{\mu}(2\sqrt{xz})\mathrm{e}^{x}(xz)^{-\mu/2} = \sum_{n=0}^{\infty}\frac{x^{n}}{\Gamma(n+\mu+1)}L_{n}^{\mu}(z)}} .
$$

From the definition of the Bessel functions:

$$
J_{\nu}(z) =\left(\frac{z}{2}\right)^{\nu}\sum_{k=0}^{\infty} \frac{(-)^{k}}{k!} \frac{1}{\Gamma(\nu+k+1)}\left(\frac{z}{2}\right)^{2k},
$$

we can find

$$
J_{\mu}(2\sqrt{xz})\mathrm{e}^{x} (xz)^{-\mu/2} = \sum_{k=0}^{\infty}\frac{(-)^{k}}{k!} \frac{(xz)^{k}}{\Gamma(\mu+k+1)}\mathrm{e}^{x} .
$$

On the other hand, from the definition of the associated Laguerre polynomials:

$$
L_{n}^{\mu}(z) = \sum_{m=0}^{n} (-)^{m}\binom{n+\mu}{n-m} \frac{z^{m}}{m!},
$$

we can calculate the right hand side of the lemma 2,

$$
\begin{aligned} &\sum_{n=0}^{\infty}\frac{x^n}{\Gamma(n+\mu+1)}L_{n}^{\mu}(z) \\[.5cm] ={}& \sum_{n=0}^{\infty}\sum_{m=0}^{n}\frac{(-)^{m}}{m!} \frac{z^{m}x^{n}}{\Gamma(n-m+1)\Gamma(\mu+m+1)}\\[.5cm] ={}&\sum_{n=0}^{\infty}\sum_{m=0}^{n}\frac{x^{n-m}}{\Gamma(n-m+1)}\frac{(-xz)^{m}}{m!\Gamma(\mu+m+1)} \quad \text{Cauchy product}\\[.5cm] ={}&\sum_{k=0}^{\infty}\frac{x^{k}}{\Gamma(k+1)}\cdot \sum_{k=0}^{\infty}\frac{(-xz)^{k}}{k! \Gamma(\mu+k+1)}\\[.5cm] ={}&\sum_{k=0}^{\infty}\frac{(-)^{k}}{k!} \frac{(xz)^{k}}{\Gamma(\mu+k+1)}\mathrm{e}^{x} .\end{aligned}
$$

It coincides exactly with the result of the Bessel function expansion, so we have proved the lemma 2.
### Answer
Back to our original question, using lemma 2, we can find that

$$
 J_{\mu}(2\sqrt{xz})z^{-\mu/2} = \mathrm{e}^{-x}x^{\mu/2}\sum_{n=0}^{\infty}\frac{x^{n}}{\Gamma(n+\mu+1)}L_{n}^{\mu}(z) .
$$

So we can calculate the original integral directly,

$$
\begin{aligned} &\int_{0}^{\infty} z^{\mu/2} \mathrm{e}^{-z} L_{n}^{\mu}(z)J_{\mu}\left(2\sqrt{xz}\right) \mathrm{d}z\\[.5cm]
={}&\int_{0}^{\infty} z^{\mu} \mathrm{e}^{-z} L_{n}^{\mu}(z) z^{-\mu/2}J_{\mu}\left(2\sqrt{xz}\right) \mathrm{d}z\\[.5cm] 
={}&\sum_{n'=0}^{\infty}\mathrm{e}^{-x}x^{\mu/2} \cdot \frac{x^{n'}}{\Gamma(n'+\mu+1)}\int_0^{\infty}z^{\mu} \mathrm{e}^{-z} L_{n}^{\mu}(z)L_{n'}^{\mu}(z)\ \mathrm{d}z,\quad \color{Green}\text{Lemma 1}\\[.5cm] 
={}&\sum_{n'=0}^{\infty}\mathrm{e}^{-x}  \frac{x^{n'+\mu/2}}{\Gamma(n'+\mu+1)}\frac{\Gamma(\mu+n+1)}{n!}\delta_{nn'}\\[.5cm] ={}&\frac{1}{n!} x^{n+\mu/2}\mathrm{e}^{-x}. \end{aligned}
$$

Thus we have proved the identity,

$$
\color{red}{\int_{0}^{\infty} z^{\mu/2} \mathrm{e}^{-z} L_{n}^{\mu}(z)J_{\mu}\left(2\sqrt{xz}\right) \mathrm{d}z = \frac{1}{n!} x^{n+\mu/2}\mathrm{e}^{-x}.}
$$