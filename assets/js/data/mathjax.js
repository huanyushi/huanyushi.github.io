---
layout: compress
# WARNING: Don't use '//' to comment out code, use '{% comment %}' and '{% endcomment %}' instead.
---

{%- comment -%}
  See: <https://docs.mathjax.org/en/latest/options/input/tex.html#tex-options>
{%- endcomment -%}

MathJax = {
  loader: { load: ['[tex]/physics',] },
  output: {
    displayOverflow: 'scroll'
  },
  tex: {
    inlineMath: [
      ['$', '$'],
      ['\\(', '\\)']
    ],
    displayMath: [
      ['$$', '$$'],
      ['\\[', '\\]']
    ],
    packages: {'[+]': ['physics']},
    tags: 'ams',
    preFilters: [({math}) => {
      math.math = math.math.replace(/\\\\(?!\[)/g, '\\\\[.1cm]');
    }],
    macros: {
        eu: '\\mathrm{e}',
        iu: '\\mathrm{i}',
        RR: '\\mathbb{R}',
        ZZ: '\\mathbb{Z}',
        QQ: '\\mathbb{Q}',
      },
  },
};
