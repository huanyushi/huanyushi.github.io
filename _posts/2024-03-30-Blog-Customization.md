---
title:      "Chirpy Blog Customization"
date:       2024-03-30
categories: [HTML and CSS]
tag: [HTML]
math: true
---
## 简介
在去年利用 jekyll 在 github 部署静态博客网站，效果甚合我意。

但原先利用的模板是 [Huxpro](https://github.com/Huxpro/huxpro.github.io)，最近花了一点时间把模板改成了 [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy/)。以前 Jekyll 把主题样式和博客内容混杂在一起，不利于编辑，但在 3.2.0 版本后，Jekyll 引入了 `gem-based theme`，把网站的样式封装成了一个 gem 包，实现了主题样式和博客内容的分离（这有点类似于 HTML 和 CSS）。Chirpy 模板正是一个 `gem-based theme`，所以利用 Chirpy Starter 生成的 blog，它只包含了内容文件，要想实现对 Chirpy 模板的个性化处理，就必须找到它的样式文件。

有两种方法可供选择。第一种就是直接访问 Chirpy 的 github 项目页面，从它的源码里扒出来样式文件及代码。第二种则利用 git，通过命令 `bundle info --path jekyll-theme-chirpy` 获取封装的样式文件地址，如下图所示

![theme file](/img/in-post/2024-03-30/theme-file.png)

在里面找到相应的样式文件后，把它放入自己 blog 对应的文件里，就可以进行个性化定制了。注意放入自己 blog 文件的样式文件会覆盖原先 gem 包里的同名文件，所以不需要修改的样式文件实际上没必要导入，这样也方便后续跟随模板作者进行更新。本篇文章就是记录一些我个人对 Chirpy 进行的部分修改（一些细节上的修改就不写了）。

## MathJax 的修改
MathJax 自从进入 3.x 时代后，渲染数学公式的速度几乎比肩 KaTeX，再考虑到 MathJax 支持丰富的拓展包，功能相比 KaTeX 更为强大，所以优先考虑 MathJax。模板作者对 MathJax 的设置在 `_includes/js-selector.html` 文件中，找到相应代码，即可进行修改。
### MathJax 添加拓展包
添加了一些拓展包，如 `physics`，代码修改如下：
```html
<script>
/* see: <https://docs.mathjax.org/en/latest/options/input/tex.html#tex-options> */
MathJax = {
    tex: {
    /* start/end delimiter pairs for in-line math */
    inlineMath: [
        ['$', '$'],
        ['\\(', '\\)']
    ],
    /* start/end delimiter pairs for display math */
    displayMath: [
        ['$$', '$$'],
        ['\\[', '\\]']
    ],
    /* load package */
    packages: {'[+]': ['physics']},
    /* equation numbering */
    tags: 'ams'
    },
    svg: { fontCache: 'global'},
    loader: {load: ['[tex]/physics']},
};
</script>
```