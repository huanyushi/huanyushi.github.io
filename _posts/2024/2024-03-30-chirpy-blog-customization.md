---
title:      "Chirpy Blog Customization"
date:       2024-03-30
categories: [HTML and CSS]
tag: [HTML, CSS]
math: true
pin: true
media_subpath : /assets/img/in-post/2024/2024-03-30/
render_with_liquid: false
description: 基于 Jekyll-Theme-Chirpy v7.6.0 的个性化设置：MathJax 配置、侧边栏样式、页脚站点统计、自定义 Statement 和 Details 元素样式、LQIP 和反色图片的 Python 实现等内容。
---
## 1. 简介
去年我通过 jekyll 在 GitHub Pages 上部署了自己的静态博客网站，效果甚合我意。

不过，最初我使用的模板是 [Huxpro](https://github.com/Huxpro/huxpro.github.io)，最近我花了一点时间，把博客模板迁移到了 [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy/)。传统的 Jekyll 模板通常会把主题布局、样式文件和博客内容放在同一个仓库里，后续修改和维护时不太方便。但在 Jekyll 3.2.0 开始，Jekyll 引入了 `gem-based theme` 机制，可以把主题样式封装成一个 gem 包，从而实现主题文件和博客内容的分离（这有点类似于 HTML 和 CSS 的关系）。

Chirpy 正是一个基于 `gem-based theme` 的主题，所以利用 Chirpy Starter 生成的博客仓库，默认只包含文章、配置等内容文件，如果要想实现对 Chirpy 模板的个性化处理，就必须找到主题 gem 中对应的布局或样式文件，并在自己的博客仓库中覆盖它们。

有两种方法可供选择。第一种就是直接访问 Chirpy 的 GitHub 项目页面，从它的源码里找到需要修改的文件。第二种则是使用 Bundler，通过命令 

```bash
bundle info --path jekyll-theme-chirpy
```

获取 `jekyll-theme-chirpy` 这个 gem 在本地的安装路径，如下图所示

![theme file](theme-file.PNG){: .shadow .rounded-10 width="700" }
_主题 gem 的本地安装路径_

在里面找到相应文件后，只需要把它复制到自己博客仓库中的相同路径下，就可以进行个性化定制了。

> 该截图停留在 Chirpy 6.5.5 版本，但新版本也是类似的，因此这里不再单独更新。
{: .prompt-info}

需要注意的事，Jekyll 在生成网站时，会优先读取自己博客仓库中的同名文件。也就是说，放入博客仓库中的布局、样式或组件文件，会覆盖主题 gem 中对应路径下的原文件；而没有修改过的文件，仍然会继续从 gem 包中读取。因此，没有改动的主题文件不需要全部复制进来。这样既能保持仓库结构简洁，也方便后续跟随 Chirpy 官方版本更新。

本篇文章主要记录一些我对 Chirpy 做过的一些个性化修改。至于一些零散的小改动，就不单独写入正文了。

## 2. 修改 MathJax 配置
[MathJax](https://www.mathjax.org/) 自从进入 3.x 时代后，数学公式的渲染速度已经有了明显提升，再考虑到 MathJax 支持丰富的扩展包，功能相比 [KaTeX](https://katex.org/) 更加灵活，所以我还是更倾向于使用 MathJax（没有 Physics 包可以说简直要了我半条命）。

Chirpy 对 MathJax 的配置位于 `assets/js/data/mathjax.js`{: .filepath} 文件中，只需要在主题 gem 的本地安装目录里找到这个文件，并将其复制到自己博客仓库中的对应路径下，就可以覆盖默认配置并进行修改。

当前博客使用 MathJax 4.1.3，通过下面的配置固定 CDN 版本，其他资源继续沿用主题默认设置：

```yaml
mathjax:
  js: https://cdn.jsdelivr.net/npm/mathjax@4.1.3/tex-mml-chtml.js
```
{: file="_data/origin/cors.yml"}

### 2.1. 为 MathJax 添加扩展包
我添加了一些扩展包，例如物理专业学生人手必备的 `physics`，同时也自定义了一些宏来简化公式输入。代码修改如下（更多内容可以从 [MathJax](https://docs.mathjax.org/en/latest/) 官网文档里找到说明）：

```javascript
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
```
{: file="assets/js/data/mathjax.js"}

其中 `output.displayOverflow: 'scroll'` 让超出容器宽度的行间公式可以横向滚动，避免长公式撑开页面。

### 2.2. 增加主页 preview 公式预览
在 blog 主页，每篇文章的摘要部分会直接显示尚未渲染的数学代码。如果希望在首页摘要中的公式也能正常预览，可以参考 [issue-1140](https://github.com/cotes2020/jekyll-theme-chirpy/issues/1140)。
> 不过我暂时没有这个打算，这个功能似乎相对鸡肋。以后有需要再开吧。
{: .prompt-info}

## 3. 侧边栏背景与主题配色
侧边栏样式集中在 `assets/css/sidebar.scss`{: .filepath} 中，在主样式文件导入：

```scss
@use "sidebar";
```
{: file="assets/css/jekyll-theme-chirpy.scss"}

背景图片以紫色和暖色为主，因此使用深紫色渐变遮罩，让图片亮部上的文字也能保持清晰。明暗模式下，侧栏都使用相同的深色背景：

```scss
#sidebar {
  --sidebar-bg: #25203b;
  background-color: var(--sidebar-bg);
  background-image:
    linear-gradient(rgba(27, 20, 48, .18), rgba(27, 20, 48, .24) 45%, rgba(27, 20, 48, .28)),
    url('../img/background2.png');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center top;
}
```
{: file="assets/css/sidebar.scss"}

导航文字使用接近白色的 `#F8F5FC`，当前项使用白色，并为文字和图标添加轻微深色阴影，使图片亮部上的导航也更清楚。

文字颜色的设置记录如下：

| 用途 | 变量 | 浅色 | 深色 |
| --- | --- | --- | --- |
| 正文 | `--text-color` | `#29263A` | `#BCB9C2` |
| 标题 | `--heading-color` | `#29263A` | `#D5D2DA` |
| 链接 | `--link-color` | `#5D4B8A` | `#C0A8EA` |

配色分别定义在 `assets/css/colors/_light.scss`{: .filepath} 和 `assets/css/colors/_dark.scss`{: .filepath} 的 `styles` mixin 中。

## 4. 首页文章卡片凸显
Chirpy 首页的文章列表本身已经采用了卡片式布局，整体观感比较清爽。不过默认情况下，当鼠标悬停在某篇文章上时，视觉反馈不太够，主要只是卡片背景变灰色。因此我对首页 post card 的 hover 效果做了一点调整：沿用 Chirpy 原有的卡片布局，悬停时显现一圈主题链接色的细描边，标题使用更鲜明的紫色，由明暗配色中的 `--home-card-hover-color` 控制。

另外，我移除了主题原有的灰色 hover 遮罩，避免摘要和日期等文字被一起压暗。

具体效果可以见以下图片：

![浅色模式下的卡片描边与标题高亮](card-hover.png){:.light .rounded-10}
![深色模式下的卡片描边与标题高亮](card-hover-dark.png){:.dark .rounded-10 .no-dark-filter}
_主页文章卡片凸显效果：主题色描边与标题高亮_

样式在 `assets/css/card-hover.scss`{:.filepath} 中，在 `assets/css/jekyll-theme-chirpy.scss`{:.filepath} 中通过 `@use "card-hover";` 导入即可。

```scss
/* 首页卡片：静态描边和主题色标题，不移动卡片或叠加遮罩。 */
#post-list > article.card-wrapper.card {
  --home-card-highlight: 0;
  --home-card-title-color: var(--heading-color);

  position: relative;

  &::after {
    content: "";
    position: absolute;
    inset: 0;
    border: 1px solid var(--link-color);
    border-radius: 0.625rem;
    opacity: var(--home-card-highlight);
    pointer-events: none;
    z-index: 2;
    transition: opacity 0.16s ease;
  }

  > .post-preview {
    /* 去掉 Chirpy 的灰色 hover 遮罩，保持摘要和元数据的对比度。 */
    &::before {
      display: none;
    }

    &:focus-visible {
      outline: 2px solid var(--link-color);
      outline-offset: 3px;
    }
  }

  .card-title {
    /* 覆盖 Chirpy 的标题颜色 !important，默认仍跟随主题。 */
    color: var(--home-card-title-color) !important;
    transition: color 0.16s ease;
  }

  &:has(> .post-preview:focus-visible) {
    --home-card-highlight: 1;
    --home-card-title-color: var(--home-card-hover-color);
  }

  @media (hover: hover) and (pointer: fine) {
    &:hover {
      --home-card-highlight: 1;
      --home-card-title-color: var(--home-card-hover-color);
    }
  }

  @media (prefers-reduced-motion: reduce) {
    &::after,
    .card-title {
      transition: none;
    }
  }
}
```
{: file="assets/css/card-hover.scss"}

## 5. 增加站点统计
Chirpy 的页脚采用了较为灵活的布局，因此可以通过修改 `_includes/footer.html`{: .filepath} 文件，在页脚中加入站点访问统计。这个文件默认位于主题 gem 包中，需要先复制到自己博客仓库的对应路径下，再进行修改。

我这里使用的是[不蒜子](https://busuanzi.ibruce.info/)提供的访问统计服务，只需要在页脚合适的位置插入如下代码：

```html
<!-- 站点统计 -->
<p> 
  {% include footer-busuanzi.html %}
</p>
```
{: file="_includes/footer.html"}

然后新建 `_includes/footer-busuanzi.html`{: .filepath} 文件，并写入不蒜子的统计代码：

```html
<!-- 不蒜子站点统计，放在页脚处 (footer.html 中插入) -->
<script async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
<i class="fa fa-user" aria-hidden="true"></i> <span id="busuanzi_value_site_uv"></span> |
<i class="fa fa-eye" aria-hidden="true"></i> <span id="busuanzi_value_site_pv"></span>
```
{: file="_includes/footer-busuanzi.html"}

其中 `uv` 表示独立访客数，`pv` 表示页面浏览量，具体说明可以参考[不蒜子教程](https://ibruce.info/2015/04/04/busuanzi/)。

如果需要更详细的站点统计信息，例如用户来源、访问地区、页面访问路径、访问设备等，也可以使用 [Google Analytics](https://analytics.google.com/analytics/web/#/provision) ，Chirpy 已经在 `_config.yml`{: .filepath} 中预留了相关配置，填入自己的 Google Analytics ID 即可。


> 由于这里覆盖了主题自带的 `_includes/footer.html` 文件，后续升级 Chirpy 时，如果页脚结构发生变化，需要手动检查并同步相关修改。
{: .prompt-warning}

## 6. 增加新的 Statement 块

Chirpy 主题已经自带了 `prompt-info`、`prompt-tip`、`prompt-warning` 和 `prompt-danger` 四种 prompt。但这种自带的 prompt 不能凸显标题（可以用来表明定义、性质、结论等内容），因此我新建了 `.statement` 类，下面是一个包含 Markdown 和公式的示例：

<div class="statement" markdown="1">
<div class="statement-title">勾股关系</div>

直角三角形的两条直角边为 $a,b$，斜边为 $c$，则

$$
a^2+b^2=c^2.
$$

</div>

```markdown
<div class="statement" markdown="1">
<div class="statement-title">勾股关系</div>

直角三角形的两条直角边为 $a,b$，斜边为 $c$，则

$$
a^2+b^2=c^2.
$$

</div>
```

`markdown="1"` 让包裹中的正文继续使用 Markdown，样式位于 `assets/css/statement.scss`{: .filepath}，在主样式文件中通过 `@use "statement";` 导入。块内背景跟随页面，标题栏通过 `color-mix()` 混入少量链接色，标题文字使用主题标题色。

## 7. Details 元素的样式设计
`<details>` 可以折叠内容，`<summary>` 是点击展开的标题。我设置了两种样式：`details-inline` 用于证明和补充推导，`details-block` 使用与 Statement 一致的卡片和标题栏。

<details class="details-inline" markdown="1">
<summary>Proof</summary>

由 $(a+b)^2=a^2+2ab+b^2$，整理得到

$$
a^2+b^2=(a+b)^2-2ab.
$$

</details>

<details class="details-block" markdown="1">
<summary>平方和的另一种写法</summary>

由 $(a+b)^2=a^2+2ab+b^2$，整理得到

$$
a^2+b^2=(a+b)^2-2ab.
$$

</details>

写法如下，将类名换成 `details-inline` 即可使用简洁样式；添加 `open` 属性可默认展开。

```markdown
<details class="details-block" markdown="1">
<summary>平方和的另一种写法</summary>

由 $(a+b)^2=a^2+2ab+b^2$，整理得到

$$
a^2+b^2=(a+b)^2-2ab.
$$

</details>
```

样式位于 `assets/css/details.scss`{: .filepath}，在主样式文件中通过 `@use "details";` 导入。

## 8. LQIP 的 Python 实现
LQIP (Low Quality Image Placeholder) 指的是低质量图像占位符，在加载原图之前，先显示一个轻量级、低分辨率的模糊预览，改善等待时的视觉体验。它不会减少原图本身的下载量。

![LQIP](lqip.png){: .no-dark-filter}
_低质量图像占位符，from [daun](https://processwire.com/modules/image-placeholders/)._

Chirpy 已经预设了此功能，文章封面可在 Front Matter 的 `image.lqip` 中配置占位图，正文图片则可添加 `lqip` 属性。我写了一个 Python 代码可以方便地将图像压缩模糊并保存，且转换成 base64 编码。这是根据我的文件路径来写的，有需要可以自行调整。

```python
from PIL import Image, ImageFilter
import base64
import pyperclip 

def image_lqip(image_path,output_image_path,length=16,width=8,radius=2):
    """
    生成 LQIP（Low-Quality Image Placeholder）并保存到文件中，并返回base64编码的字符串。
    
    参数：
    - image_path：原始图像文件路径
    - output_image_path：输出 LQIP 文件路径
    - length：调整后图像的长度，默认为 16
    - width：调整后图像的宽度，默认为 8
    - radius：高斯模糊的半径，默认为 2
    
    返回值：
    - base64 编码的字符串
    """
    im = Image.open(image_path)
    im = im.resize((length,width))
    im = im.convert('RGB')
    im2 = im.filter(ImageFilter.GaussianBlur(radius)) # 采用高斯模糊
    im2.save(output_image_path)

    # 转成 base64 编码
    with open(output_image_path, "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read())
        base64_string = encoded_string.decode('utf-8')
    
    return base64_string

image_start = "../huanyushi.github.io"
image_end = input()
image_path = image_start + image_end 

base64_image = image_lqip(image_path, "test.jpg")

pyperclip.copy('data:image/jpeg;base64,'+ base64_image) # 将结果复制到剪贴板
print(base64_image)
print(image_end) # 顺带输出一下导入的是什么文件
```

如果想要将 base64 编码的字符串转换成图片，也可以用以下 Python 程序进行转换。

```python
import base64

def save_base64_image(base64_string, output_path):
    """
    将base64编码的字符串保存为图像文件。
    
    参数：
    - base64_string：base64编码的字符串
    - output_path：输出图像文件路径
    """

    # 解码base64编码的字符串
    decoded_data = base64.b64decode(base64_string)
    
    # 将解码后的数据保存为图像文件
    with open(output_path, 'wb') as image_file:
        image_file.write(decoded_data)

# 这是模板作者里用的图片，当作例子来展示了。
base64_string = "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQgJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAIABADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwB1s4jcEmpLtg7ZU0UV9jb3rnwt/csf/9k="
save_base64_image(base64_string, "decoded_image.jpg")
```

## 9. 反色图片的 Python 实现
Chirpy 支持切换明暗模式，同时文中的图片也可以相应转换至明暗模式。但在暗色模式下，如果文章中插入了白底图片，视觉上会显得格外刺眼，夜间阅读会破防整体的暗色观感。一个解决办法是对于部分图片通过反色的方式将亮色转换至暗色（但不是所有，注意反色不等于暗色！）。

我写了一个 Python 程序可以将图片转换至反色模式，有需要可以自取。同样，文件路径也是根据我自己实际情况来设置的，需要做相应修改：

```python
from PIL import Image, ImageChops
from pathlib import Path
import matplotlib.pyplot as plt  

def invert_color(fname):
    with Image.open(fname) as source:
        im = source.convert('RGB')
    im_inverted = ImageChops.invert(im)
    return im, im_inverted

# 从博客仓库根目录运行，或替换为自己的图片路径。
image_path = Path("assets/img/in-post/2024/2024-03-30/inverse.png")

image_origin, image_inverted = invert_color(image_path)

# 绘图对比，不想绘图可以直接去掉
plt.subplot(121) 
plt.title('original') 
plt.axis('off')
plt.imshow(image_origin)
plt.subplot(122) 
plt.title('inverse') 
plt.imshow(image_inverted)
plt.axis('off')
plt.show()

# 保存图片
output_path = image_path.with_name(image_path.stem + '-dark' + image_path.suffix)
image_inverted.save(output_path) # 如：test.PNG 保存为 test-dark.PNG
```
![inverse comparison](inverse.png){:.light .rounded-10}
![inverse comparison](inverse-dark.png){:.dark .rounded-10}
_反色图片与原图片对比_

## 10. 暗色模式下降低图片亮度
通过 Chirpy 自带的 light / dark 双图机制，可以精确控制图片在明暗模式下的显示效果，但需要额外维护一份暗色版本。如果只是想减轻白底图片的刺眼感，也可以直接降低亮度，而不做反色。


当前博客在暗色模式下给 `article` 中的普通图片添加亮度滤镜，包括文章正文图片和首页卡片封面。在 `assets/css/jekyll-theme-chirpy.scss`{: .filepath} 里添加以下代码即可：

```scss
/* 暗色模式下，降低普通文章图片亮度，避免白底图片刺眼 */

/* 用户手动切换为暗色模式 */
html[data-bs-theme='dark'] article img {
  filter: brightness(.8) contrast(.95);
}

/* 已经专门指定为 dark 模式的图片，不再额外压暗 */
html[data-bs-theme='dark'] article .dark img,
html[data-bs-theme='dark'] article .no-dark-filter,
html[data-bs-theme='dark'] article .no-dark-filter img {
  filter: none;
}

/* 用户没有手动指定模式，且系统是暗色模式 */
@media (prefers-color-scheme: dark) {
  html:not([data-bs-theme]) article img {
    filter: brightness(.8) contrast(.95);
  }

  /* 已经专门指定为 dark 模式的图片，不再额外压暗 */
  html:not([data-bs-theme]) article .dark img,
  html:not([data-bs-theme]) article .no-dark-filter,
  html:not([data-bs-theme]) article .no-dark-filter img {
    filter: none;
  }
}
```

这里的核心代码是 `filter: brightness(.8) contrast(.95);`，这表示将图片亮度降低到原来的 80%，对比度略微降低到 95%，这可以让白底图片在夜间模式下不至于过于刺眼，同时也不会严重影响图片内容的可读性。

对于专门准备的暗色版图片，Chirpy 7.6.0 会将 Markdown 中的 `.dark` 类移到图片外层链接上，因此通过 `article .dark img {filter: none;}` 取消额外压暗。

另一方面，如果某些图片本来就是暗色背景，或者图片颜色具有重要信息，我们也可以手动添加一个排除类 `.no-dark-filter`，例如

```markdown
![example](/path/to/image.png){: .no-dark-filter }
```

添加了 `.no-dark-filter` 属性的图片就不会出现亮度滤镜。

## 11. 其他问题
### 11.1. GitHub Commits 提交规范
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) 是一种规范化的 Git 提交信息格式，能有效提升 commit message 的可读性，也方便历史记录和版本控制。

最基础的格式如下：

```swift
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

其中 `<type>` 表示提交类型（必填），也决定它在 changelog 中的分类，通常有以下几种：

- **feat:** 新功能；
- **fix:** 修复 bug；
- **docs:** 仅修改文档；
- **style:** 不影响代码逻辑的修改，比如格式、空格、缩进、缺失的分号；
- **refactor:** 代码重构（不包含功能变更或 bug 修复）；
- **perf:** 性能优化；
- **test:** 添加测试或修改测试；
- **build:** 构建系统或依赖的变动（例如 webpack、rollup）
- **chore:** 杂项、不属于其他类型的更改（比如改 .gitignore、更新依赖）；
- **ci:** 持续集成相关（GitHub Actions、Travis CI、Circle 等）；
- **revert:** 回滚某个提交（会自动生成 footer）。

而 `[optional scope]` 表示影响范围（可选），`[description]` 表示简短的描述（必填），例如：

```bash
feat(blog): add comment system
fix(pdf): correct link to external document
docs(readme): update usage instructions
```

`[optional body]` 在解释提交的动机、问题背景、修改细节，尤其是重大提交或 refactor 时有用。`[optional footer(s)]` 则用于关闭 issue、BREAKING CHANGE 等信息。

### 11.2. git push 失败: couldn't connet to server
将本地文件 push 到 github 远程仓库里，经常出现 `couldn't connet to server` 的报错，经过查询没有明显有效的办法。以下是**可能有效**的措施（目前来看第三种最有效）：

1. 关掉梯子 (VPN) 再 push 一下试试；
2. 在命令行中运行以下代码来取消代理。
   ```bash
   git config --global --unset http.proxy 
   git config --global --unset https.proxy 
   ```
3. 打开梯子的情况下。对右下角网络点击右键，打开`网络和 Internet 设置`，点击代理，查看地址和端口号，如 `127.0.0.1:7890`。在命令行中输入 
   ```shell 
   git config --global http.proxy http://127.0.0.1:7890
   ```
   可通过 `git config --global -l` 查看是否设置成功。之后再进行 push 即可。

### 11.3. jekyll serve 预览速度较慢
方法很多，比如减少文件夹数量、压缩图片大小等。以下罗列一些我摸索出来的方法：

1. 对博客设置增量构建（即只重新建构发生更改的文件，而不是每次重新构建整个站点），可以在 `_config.yml`{: .filepath} 中添加 `incremental: true`，之后每次 jekyll 都将重新构建发生更改的文件。

   当然更合适的方法是使用 `bundle exec jekyll s --incremental` 或者 `bundle exec jekyll s -I` 来构建博客，这样手动可调更灵活。
2. 压缩图片大小，这也是加速博客构建和浏览的一种方式。

### 11.4. 避免 Liquid 标签被解析
在 Jekyll 中，`{{ ... }}` 和 `{% ... %}` 是 Liquid 模板语言的语法。如果在 post 中不小心使用了它们（比如用了花括号），可能会被 Jekyll 当作模板语法解析，导致渲染出错。

有两种常用的[解决办法](https://jekyllrb.com/docs/liquid/tags/)。

1. 禁用整篇文章的 Liquid 渲染。只需在文章的 Front Matter 中添加
   ```markdown
   ---
   render_with_liquid: false
   ---
   ```
2. 用 `{% raw %}` 包裹需要保留的 Liquid 代码段。一个例子如下所示：
   ```markdown
   <!-- {% raw %} -->
   {% if user %}
     Hello, {{ user.name }}!
   {% endif %}
   <!-- {% endraw %} -->
   ```

与第一种方法相比，第二种方法更灵活，只影响局部代码块，其它部分仍可正常使用 Liquid 模板。

### 11.5. 其他可能有用的资源

- [TinyPNG](https://tinypng.com/), [Website Planet](https://www.websiteplanet.com/zh-hans/webtools/imagecompressor/)：免费的在线图片压缩网站，虽然说是有损压缩，但视觉上几乎没有影响，且图片压缩甚至能达到 80%。
- [PageSpeed Insights](https://pagespeed.web.dev/)：谷歌推出的网站性能检测工具，输入网址后会提供一个报告和优化方案，顺带看看哪里拖慢了加载速度。
- [Coolors](https://coolors.co/), [Color Hunt](https://www.colorhunt.co/)：在线调色网站，可以用来提供推荐配色。
