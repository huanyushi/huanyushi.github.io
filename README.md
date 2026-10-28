# Theory of Everything

This site is built with [Jekyll](https://jekyllrb.com/) and the beautiful [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy/) theme. Thanks to the contributors for their work.

Theme version: **Chirpy 7.6.0** (pinned in `Gemfile`). Math rendering uses
**MathJax 4.1.3**, pinned in `_data/origin/cors.yml`, with the `physics` extension
and custom macros in `assets/js/data/mathjax.js`.

Use Ruby **3.3** and `bundle install` to install the dependencies pinned in `Gemfile.lock`.

When upgrading the theme, compare `_includes/footer.html` with upstream,
and check custom styles against its `data-bs-theme` color-mode attribute.

## Customization
I've customized Chirpy to suit this blog. For details, see [Chirpy Blog Customization](https://huanyushi.github.io/posts/chirpy-blog-customization/) (in Chinese).

Customizations include:
- MathJax support for the `physics` package and custom macros.
- An illustrated sidebar with custom text and interaction styles.
- Site statistics from [Busuanzi (不蒜子)](https://busuanzi.ibruce.info/) in the footer.
- Neutral `.statement` cards with title bars for important article content.
- Custom `<details>` styles for lightweight proof blocks and collapsible cards.
- Python examples for generating LQIP (Low Quality Image Placeholders); see this [discussion](https://github.com/cotes2020/jekyll-theme-chirpy/discussions/1685).
- A Python example for inverting image colors.

## Introduction
I share study notes and ideas from my research here. Updates may be irregular, but you're always welcome to stop by and explore!

Selected posts:

- [Affleck–Kennedy–Lieb–Tasaki Model](https://huanyushi.github.io/posts/aklt-model/)
- [Reading Shadows of Anyons](https://huanyushi.github.io/posts/shadow-of-anyons/)
- [Selected Exercises from Introduction to Topological Manifolds](https://huanyushi.github.io/posts/topological-manifolds-exercise/)
- [Electrostatic Field Between Two Intersecting Grounded Planes](https://huanyushi.github.io/posts/electrostatic-field-between-intersecting-planes/)
- [Derivation of General Formula for the Clebsch-Gordan Coefficients](https://huanyushi.github.io/posts/clebsh-gordan-coefficients/)
- [An Integral Involving the Product of Bessel Function and Associated Laguerre Polynomial](https://huanyushi.github.io/posts/integral-involve-bessel-laguerre/)

## License

This work is licensed under the [MIT License](LICENSE).
