---
title:      "Chirpy Blog Customization"
date:       2024-03-30
categories: [HTML and CSS]
tag: [HTML, CSS]
math: true
---
## 简介
在去年利用 jekyll 在 github 部署静态博客网站，效果甚合我意。

但原先利用的模板是 [Huxpro](https://github.com/Huxpro/huxpro.github.io)，最近花了一点时间把模板改成了 [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy/)。以前 Jekyll 把主题样式和博客内容混杂在一起，不利于编辑，但在 3.2.0 版本后，Jekyll 引入了 `gem-based theme`，把网站的样式封装成了一个 gem 包，实现了主题样式和博客内容的分离（这有点类似于 HTML 和 CSS）。Chirpy 模板正是一个 `gem-based theme`，所以利用 Chirpy Starter 生成的 blog，它只包含了内容文件，要想实现对 Chirpy 模板的个性化处理，就必须找到它的样式文件。

有两种方法可供选择。第一种就是直接访问 Chirpy 的 github 项目页面，从它的源码里扒出来样式文件及代码。第二种则利用 git，通过命令 `bundle info --path jekyll-theme-chirpy` 获取封装的样式文件地址，如下图所示

![theme file](/in-post/2024-03-30/theme-file.PNG){: .shadow width="700" lqip="/in-post/2024-03-30/lqip-file"}

在里面找到相应的样式文件后，把它放入自己 blog 对应的文件里，就可以进行个性化定制了。

注意生成博客时，放入自己 `.github.io` 文件夹的样式文件会覆盖原先 gem 包里的同名文件，而未修改的样式文件则照样从 gem 包里读取，所以未修改的样式文件没必要导入，这样也方便后续跟随模板作者进行更新。本篇文章就是记录一些我个人对 Chirpy 进行的部分修改（一些小的修改就不写了）。

## MathJax 的修改
MathJax 自从进入 3.x 时代后，渲染数学公式的速度几乎比肩 KaTeX，再考虑到 MathJax 支持丰富的拓展包，功能相比 KaTeX 更为强大，所以优先考虑 MathJax。模板作者对 MathJax 的设置在 `_includes/js-selector.html` 文件中，在隐藏的 gem 包里找到相应代码，即可进行修改。
### MathJax 添加拓展包
添加了一些拓展包，如 `physics`，代码修改如下（更多内容可以从 MathJax 官网文档里找到说明）：
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
### 增加主页 preview 公式预览
在 Blog 主页，对每篇文章的预览部分会直接显示数学代码，要想能够在主页也预览公式，可以参考 [issue-1140](https://github.com/cotes2020/jekyll-theme-chirpy/issues/1140)。
> 暂时没有这个打算，这个功能似乎相对鸡肋。以后有需要再开吧。
{: .prompt-info}

## 侧边栏的修改
### 侧边栏增加背景图片
在 `assets/css/jekyll-theme-chirpy.scss` 文件中，增加对侧边栏样式设置的 CSS 代码，其中 `background-image` 便是用来添加背景图片的基本命令，只需后面添加图片的 url 即可，如下：
```css
#sidebar {
    background-image: url(https://cdn.jsdelivr.net/gh/huanyushi/Blog-Image-Bed@main/img/background.jpg); /* <- change background image */
    background-size: cover; /* <- customize the image size */
    background-repeat: no-repeat; /* <- no-repeat */
    background-position: top; /* <- image position */
}
```
同样也要注意修改相应文字的颜色，我这里选的是深色背景，所以对应文字都是白色，
```css
#sidebar .site-title a {
    color: #ffffff; 
    text-shadow: 5px 5px 10px rgba(0,0,0,0.5);
}
#sidebar .site-subtitle {
    color: #ffffff;
    text-shadow: 2px 2px 3px rgba(0,0,0, 0.7);
}
#sidebar .sidebar-bottom .mode-toggle, #sidebar a {
    color: #ffffff;
}
#sidebar .sidebar-bottom .btn {
    color: var(--sidebar-btn-color);
}
```

### 侧边栏增加友链
在隐藏的 gem 包里找到 `_includes/side.html` 文件，在其中添加以下几行代码即可：
<!-- {% raw %} -->
```html
<!-- Friends link -->
<div class="friends">
{% if site.friends %}
    <hr style="color:white;border: 1px solid ">
    <p><i class="fas fa-user-friends"></i><span>FRIENDS</span></p>
    <ul>
    {% for friend in site.friends %}
    <li><a href="{{friend.href}}">{{friend.title}}</a></li>
    {% endfor %}
    </ul>
{% endif %}
</div>
```
<!-- {% endraw %}) -->
而相关的样式设置添加到了 `assets/css/jekyll-theme-chirpy.scss` 中，如下：
```css
/* 侧边栏友链样式设置 */
#sidebar .friends {
    padding-left: 2.5rem;
    padding-right: 1.25rem;
    width: 100%;
    margin-bottom: 1.5rem;
}
#sidebar .friends p {
    color: rgb(255,255,255,0.95);
    font-family: inherit;
    font-weight:600;
    font-size: 95%;
}
#sidebar .friends p i {
    opacity: 0.8;
    margin-right: 1.5rem;
}
#sidebar .friends p span {
    letter-spacing: 0.2px;
    opacity: 0.9;
}
#sidebar .friends ul {
    color:white;
    font-size:95%;
    opacity: 0.95;
    margin-bottom: 0rem;
}
#sidebar .friends ul li {
    margin-bottom: 0.4rem;
    opacity: 0.9;
}

```
已成功封装，只需要在 `_config.yml` 里添加以下设置即可（可以一直往后叠加）：
```yml
friends:
  [
    { title: "title1", href: "link1" },
    { title: "title2", href: "link2" },
    { title: "title3", href: "link3"},
  ]
```

> **注意**
> 1. 友链不能加太多，容易挤占底部社交平台的空间，让它跑到屏幕外面去了（不过这也和系统分辨率有关系）。如果友链太多建议在侧边栏新开一个选项卡，也就是在 `_tabs` 文件夹下新建一个 `.md` 文件。
> 2. 我这里设置的是友链沉底，保持在底部社交平台上方。如果分辨率拉大，会发现它和上面侧边栏选项卡之间有很大间距。如果想调整友链位置紧跟选项卡之后，可以在 `_includes/sidebar.html` 中修改选项卡的样式，将 `<nav class="flex-column flex-grow-1 w-100 ps-0">` 中的 `flex-grow-1` 删除；并加入到友链样式中原先的 `<div class="friends">` 修改为 `<div class="friends flex-grow-1">`。同时 `assets/css/jekyll-theme-chirpy.scss` 中 `#sidebar .friends` 里的 `margin-bottom: 2rem` 修改为上间距 `margin-top: ? rem`, ? 的值可以自己选定。
{: .prompt-warning}


## 评论区添加
评论区使用 giscus，模板作者已经将相关选项封装好了，在 `_config.yml` 文件中填上个人信息即可。

教程请见 [giscus](https://giscus.app/) 项目，关于它的高级功能设置请见 [Advanced usage](https://github.com/giscus/giscus/blob/main/ADVANCED-USAGE.md)。

## 增加站点统计
模板作者贴心的在页脚使用了 flex 格式，直接在隐藏的 gem 包里找到 `_inlcude/footer.html` 文件，复制后在中间插入[不蒜子](https://busuanzi.ibruce.info/)即可成功在页脚显示站点统计，`uv` 和 `pv` 就是访问量的两种统计算法，具体解释请见[教程](https://ibruce.info/2015/04/04/busuanzi/)。
```html
  <p>
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    <i class="fa fa-user" aria-hidden="true"></i> <span id="busuanzi_value_site_uv"></span> |
    <i class="fa fa-eye" aria-hidden="true"></i> <span id="busuanzi_value_site_pv"></span>
  </p>
```
另外更多详细的站点统计信息（如用户量、用户地区、用户访问了哪些页面等内容）可以使用 [Google Analytics](https://analytics.google.com/analytics/web/#/provision) 来获取，在 `_config.yml` 中加入 ID 即可。

## 其他问题
### git push 失败: couldn't connet to server
将本地文件 push 到 github 远程仓库里，经常出现 `couldn't connet to server` 的报错，经过查询没有明显有效的办法。以下是**可能有效**的措施：

1. 关掉梯子 (VPN) 再 push 一下试试；
2. 在 `git` 中运行以下代码来取消代理。
```bash
git config --global --unset http.proxy 
git config --global --unset https.proxy 
```
3. 打开梯子的情况下。对右下角网络点击右键，打开`网络和 Internet 设置`，点击代理，查看地址和端口号，如 `127.0.0.1:7890`。在命令行 (cmd) 中输入 
```shell 
git config --global http.proxy http://127.0.0.1:7890
```

可通过 `git config --global -l` 查看是否设置成功。之后再进行 push 即可。

### jekyll serve 预览速度较慢
方法很多，比如减少文件夹数量、压缩图片大小等。还可以通过设置增量构建的方法（即只重新建构发生更改的文件，而不是每次重新构建整个站点），
可以在 `_config.yml` 中添加

```yml
incremental: true
```

之后每次 jekyll 都将重新构建发生更改的文件。另外也可以使用 `bundle exec jekyll s --incremental` 构建可以达到同样效果（这样可以不用在 `_config.yml` 中设置了）。

### 在 blog 中插入文件
使用 `<iframe>` 元素即可，如
```html
<iframe src="file path" width="100%" height='800'></iframe>
```
利用这个技巧可以在 post 中插入 html, pdf 等文件进行预览。

> **警告：**这个功能在谷歌浏览器上可以正常使用，但是其他浏览器不一定支持，且加 overflow 在移动端也不能产生滚动条，慎用！
{: .prompt-danger}