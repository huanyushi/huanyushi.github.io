---
title:      "HTML and CSS study notes: HTML introduction"
date:       2024-03-19
categories: [HTML and CSS]
tag: [HTML, CSS]
image: 
    path: /assets/img/in-post/2024/2024-03-21/html.jpg
    lqip: data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQgJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAIABADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDbhk2NyaWaTe3Boor4u/7s+95VzXP/2Q==
---
## 认识 HTML
**超文本标记语言**（HyperText Markup Language，简称：**HTML**）是一种用于创建网页的标准标记语言。利用其编写的文件放在 Web 服务器上，任何浏览器就能通过互联网得到相应的 Web 页面。

- HTML 不是一种编程语言，而是一种**标记语言** (markup language)
- 标记语言是一套**标记标签** (markup tag)
- HTML 使用**标记标签**来描述网页
- 超文本 (hypertext) 可以摆脱单个页面的束缚，链接到其他页面

>当你在网上冲浪，单击一个链接来访问某个页面。
>
>这个单击会导致浏览器向 Web 服务器请求一个 HTML 页面，获取这个页面，其中 HTML 会告诉浏览器页面的所有内容和结构，并在你的浏览器窗口显示。
{: .prompt-info}

HTML 不单可以用来建立 Web 页面，还可以建立成熟的 Web 应用（如社交媒体应用、地图应用、游戏等）

### 一个简单的实例
下面提供了一个简单的实例，通过新建`.html`文件，即可看到相应的生成效果。
```html
<!DOCTYPE html> <!-- 告诉浏览器使用的是 HTML5 -->
<html> <!-- html 标记告诉浏览器文件的内容是 HTML  -->
    <head> <!-- head 标记包含 web 页面的有关信息 -->
        <meta charset="utf-8"> <!-- 声明 unicode 编码-->
        <title> 页面标题 </title> <!-- title 标记出现在浏览器窗口的顶部 -->
        <style type="text/css">        
        /* style 用于给页面增加样式，放在 HTML 的首部里，它有一个可选的属性 type，告诉浏览器使用什么类型的样式*/
            body {
                background-color: #d2b48c;
                margin-left: 20%;
                margin-right: 20%;
                border: 2px dotted black;
                padding: 10px 10px 10px 10px;
                font-family: sans-serif;
                /* CSS 使用的语法和 HTML 完全不同，用于给页面修改样式*/
            }
        </style>
    </head>  

    <body> <!-- body 标记记录页面主体，页面主体包含 Web 页面的所有内容和结构，即我们在浏览器中看到的部分 -->
        <h1> 一级标题 </h1>
        <h2> 二级标题 </h2>
        <p> 一个段落 </p>

        <h2> 另一个二级标题 </h2>
        <p> <a href="new.html">另一个段落 </a> </p>
        <!-- <a> 元素用于链接到新的 new.html 页面，该 HTML 文件需在同一文件夹下 -->
    </body>
</html>
```
### 指定 HTML5
HTML5 是 HTML 最新的修订版本，在2014年10月由万维网协会 (World Wide Web Consortium, 简称：W3C) 完成标准制定。HTML5 的设计目的是为了在移动设备上支持多媒体，且它简单易学。HTML 的上一版本 HTML4.01 诞生于1999年，HTML5 的具体改进和新特性可在网络上查询得到，在此不再赘述。

HTML 不会再有版本6、7、8……制定标准的人已经把该规范变成一个“活”的标准，会随着技术的发展形成相应文档，所以不再有版本号，甚至我们可以把 HTML5 就称为 HTML。这里的关键是**向后兼容性** (backwards compatibility)，表示我们可以继续向 HTML 增加新的内容，但浏览器还会继续支持原来的内容。

> 在 `.html` 文件第一行加入 `<!DOCTYPE html>`，可以告诉浏览器使用的是最新的 HTML 版本。
{: .prompt-info}

### 指定字符编码 
字符编码为我们提供一种方法，可以在计算机上表示某种语言中的所有字母、数字和其他符号，如 ASCII、莫尔斯码等各种编码。如今标准同一位 Unicode 字符编码，采用 Unicode，一种编码就可以表示所有语言。考虑到还存在其他编码，我们需要告诉浏览器我们正在使用 Unicode （或其他编码），这需要在 HTML 中加入 `<meta>` 标记，即：

```html
<meta charset="utf-8">
<!-- "meta" 表示我们要告诉浏览器关于页面的一些信息，在 charset 属性中指定字符编码-->
<!-- "utf-8" 是 unicode 系列中的一个编码，Web 页面中使用的就是 "utf-8" -->
```
>**Note:** 指定 `doctype` 以及用 `<meta>` 标记指定字符编码有点像纳税，这是我们的义务，必须执行。另外对于中文网页也需要声明 `utf-8` 编码，否则会出现乱码。 
{: .prompt-warning}

### HTML 元素
HTML 元素 (element) 由三个部分构成：**元素 = 开始标记 + 内容 + 结束标记**，比如 `<h1> Title </h1>` 整个称为一个元素，我们可以把它叫做 `<h1>` 元素，它由包围内容的标记和标记之间的内容组成。
>**Tip1:** 大多数的 HTML 可以嵌套。HTML 文档由相互嵌套的元素构成。
>
>**Tip2:** 没有内容的元素称为空 (void) 元素，一般在开始标签中加入斜杠来关闭空元素，如 `<img src=figure.png />`.
{: .prompt-tip}

### HTML 属性
HTML 属性 (attributes) 用于指定元素的附加信息，比如：
```html
<style type="text/css"></style> <!-- type 属性指定使用哪一种样式语言，这里是 CSS-->
<a href="new.html"></a> <!-- href 属性告诉我们超链接的目标文件或目标地址 -->
<img src="figure.png"/> <!-- src 属性注定一个 img 标记显示的图像的文件名-->
```
属性的一般结构是：**属性名="属性值"**，Web 浏览器一般只识别每个元素预定义的属性，以下可以查看完整的 HTML 属性列表：
1. [HTML attribute, wikipedia](https://en.wikipedia.org/wiki/HTML_attribute)
2. [HTML attribute reference, MDN web docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes)
3. [HTML attribute reference, W3Schools](https://www.w3schools.com/tags/ref_attributes.asp)
4. [HTML 标签参考手册, 菜鸟教程](https://www.runoob.com/tags/html-reference.html)

### 域名及 URL
当在我们的计算机上创建好 HTML 文件，所链接的页面也都在自己的计算机上，若需要将其发布到 Web上，需要做以下几件事：
1. 找一家托管公司（需要一个在 Web 上全天候工作的服务器）。
2. 为自己的网站选好一个域名，比如 google&#46;com（注意**域名**和**网站名**是两回事）。
3. 想办法把文件从自己的计算机上传到托管公司的服务器上。
4. 将新网站告诉朋友、家人和粉丝。

>**Note:** 域名和网站名并不等同，google&#46;com 是一个域名，而 www.google&#46;com 是一个网站名。购买域名就像买下一块地，比如 google&#46;com。但在这块地上可以建很多网站，例如 home.google&#46;com, outhouse.google&#46;com 等，其中 www.google&#46;com 只是 google&#46;com 域上的一个网站。
{: .prompt-warning}

当我们在 web 上发布页面后，可以在浏览器中输入 Web 地址来跳转到我们的页面中。而我们在浏览器上输入的 Web 地址称为**统一资源定位符** (Uniform Resource Locators, 简称：**URL**)，如：

http://www&#46;google&#46;com/index.html

其中：
- 第一部分 `http` 指出用来获取资源的协议。HTTP 也称为超文本传输协议 (HyperText Transfer Protocol)，它是一种不安全的协议。现在我们大都使用 HTTPS (Hypertext Transfer Protocol Secure)，也即超文本传输安全协议，它通过 SSL/TLS 协议进行加密，使得传输数据的过程中更加安全。具体讨论超出本文的范围，在此不做介绍。
- 第二部分 `www.google.com` 是网站名。
- 第三部分 `index.html` （我随手敲的，谷歌不一定有），是从根文件夹到资源 `index.html` 的绝对路径。

> 统一资源定位符 (URL) 是一个全局地址，可以用来定位 Web 上的任意资源，包括 HTML 页面、音频、视频和很多其它形式的 Web 内容。
{: .prompt-info}

如果我们向 Web 服务器请求访问的是一个目录而非文件时，如

http://www&#46;google&#46;com/

Web 服务器接收到类似请求会尝试寻找该目录下的一个默认文件，通常名为 `index.html` 或者 `default.htm`，若能找到则会返回浏览器显示（实际也要取决于托管公司对默认文件的命名）。若上述请求链接末尾不包含 `/` ，当该目录确实存在，服务器会自动加上末尾的斜线。



## HTML 基础命令

### 标题
标题通过 `<h1>`-`<h6>` 共六级标题定义。
```html
<h1>这是一级标题</h1>
<h2>这是二级标题</h2>
...
<h6>这是六级标题</h6>
```
### 段落
段落由标签 `<p>` 来定义。
```html
<p>这是一个段落</p>
```

### 文本
`<em>` 定义被强调的文本（斜体），`<strong>` 定义为重要的文本（加粗），`<mark>` 定义为被高亮的文本（背景增加颜色），`<sub>` 和 `<sup>` 分别表示下标和上标，`<ins>` 和 `<del>` 分别表示插入和删除，如：
```html
<em>强调</em>
<strong>重要</strong>
<mark>高亮</mark>
<sub>下标</sub>
<sup>上标</sup>
<ins>插入</ins>
<del>删除</del>
```
相应的效果为：<em>强调</em>，<strong>重要</strong>，<mark>高亮</mark>，<sub>下标</sub>，<sup>上标</sup>，<ins>插入</ins>，<del>删除</del>。

> `<b>` 元素也可以用来加粗文本，`<i>` 元素也可以用来斜体文本，但根据 HTML 5 的规范，这两个元素应该作为最后的选择，只有在没有其他标记比较合适时才使用它。
{: .prompt-warning}

<p id="link"></p>

### 链接
链接由标签 `<a>` 来定义，在 `href` 属性中指定链接的地址。


```html
<a href="new.html"> 指定页面 </a>
<a href="https://www.google.com"
   title="google官网" 
   target="_blank"> 指定链接 </a>
```

> **Tip1:** 我们完全可以将图片或者一整个段落放在 `<a>` 标记之间进行链接，这种嵌套是合法的。
>
> **Tip2:** 指定页面的文件可以选择相对路径另一个文件夹下的文件。如 `<a href='file/new.html'>`. 如果需要选择向上一级的文件夹，只需使用'..'来实现，如 `<a href="../new.html">`.
> 
> **Tip3:** `<a>` 元素可以增加 `title` 属性，对所需链接的页面进行描述，提高代码可读性。
{: .prompt-tip}

利用 `id` 属性可以在页面相应位置创造一个锚点，利用 `<a>` 元素可以链接到页面的指定位置，如指定<a href = "#link">链接</a>，代码示例为：
```html
<p id="link">创建锚点的位置</p>

<a href="#link">引用锚点的文字</a> 
<!--注意可以链接到其他页面的锚点，并非只有当前页面-->
```

`<a>` 元素的 `target` 属性可以规定在何处打开目标 URL，有以下几个选择：
- `_blank`：在新窗口中打开。
- `_parent`：在父窗口中打开。
- `_self`：默认，在当前页面跳转。
- `_top`: 在当前窗体打开链接，并替换当前的整个窗体（框架页）。

### 图像
图像格式有很多种，Web 上最常用的只是其中3种格式：**JPEG、PNG 和 GIF**。它们具体的区别可以理解为：
1. JPEG 适合连续色调图像，可以表示包含多达1600万种不同颜色的图像。这是一种“有损”格式，缩小文件大小时会丢掉图像的一些信息。不支持透明度。文件比较小，以便 Web 页面更高效地显示。不支持动画。
2. PNG 适合单色图像和线条构成的图像，可以表示包含上百万种不同颜色的图像。它会压缩文件来缩小文件大小，不过是一种“无损”格式。允许将颜色设置为“透明”。与相应的 JPEG 文件相比，PNG 文件更大一些，不过具体取决于使用颜色数，可能比相应的 GIF 文件小，也可能更大。
3. GIF 最适合单色图像和线条构成的图像，可以表示最多256种不同颜色的图像，也是一种“无损”格式。GIF 也支持透明度，不过只允许一种颜色设置为“透明”。GIF 文件通常比相应的 JPEG 文件大。支持动画。

图像通过标签 `<img>` 来定义，`width` 和 `height` 通过像素数来指定图片大小。
```html
<img src="/images/logo.png" width="258" height='39' />
<!-- 即插入相对路径下 images 文件夹里的 logo.png 图片 -->
<img src="http://www.???.com/logo.png" />
<!-- 即插入相应 URL 处的图片 -->
```
> **Tip1:** `<img>` 元素是一个内联元素。
>
> **Tip2:** `<img>` 还有 `alt` 属性，指定描述这个图像的一些文本，若图像未能成功显示，就会使用这个文本来取代它。
{: .prompt-tip}


### 水平线
通过使用 `<hr>` 标签可在页面中创建水平线，如：
```html
<p>这是一个段落</p>
<hr> <!--创造一条水平线-->
<p>这是另一个段落</p>
```

### 引用
添加简短的引用，使用 `<q>` 元素即可，其效果就是在引用的周围加入引号，如：
```html
<p>WWF's goal is to:
<q>Build a future where people live in harmony with nature.</q>
We hope they succeed.</p>
```
>**Tip1:** 所有的主流浏览器都支持 `<q>` 元素，但并不是所有浏览器都能实现。
>
>**Tip2:** 去掉引号，改用 `<q>` 元素似乎显得很鸡肋，但这样可以让页面更结构化，更有意义。另外，我们还可以统一对引用设置样式。
{: .prompt-tip}

添加较长的引用可以使用 `<blockquote>`，它需要单独显示。如：
```html
<p> 一个段落 </p>
<blockquote>
   Passing cars, <br>
   When you can't see,<br>
   May get you,<br>
   A glimpse,<br>
   Of eternity.<br>
</blockquote>
<!-- <br> 元素实现换行命令 -->
<p> 另一个段落 </p>
```

> **Tip1:** `<blockquote>` 和 `<q>` 是两类不同的元素，前者是一个块 (block) 元素，而后者是一个内联 (inline) 元素。块元素特立独行，内联元素随波逐流。
{: .prompt-tip}

### 换行
使用 `<br>` 元素即可实现换行，如：
```html
<p> 使用 br 元素<br>在文本中<br>换行。 </p>
```

### 列表
使用 `<ol>` 元素包围列表项 `<li>` 即可实现有序列表，如：
```html
<ol>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ol>
```
而使用 `<ul>` 元素包围列表项 `<li>` 将显示无序列表，如：
```html
<ul>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ul>
```
>**Tip1:** `ul` 指 unordered list, `ol` 指 ordered list, `li` 指 list item.
>
>**Tip2:** 列表显然可以嵌套。
>
>**Tip3:** 还有一类定义列表 `<dl>`，列表中每一项都有一个定义术语 `<dt>` 和一个定义描述 `<dd>`，具体不再赘述。
{: .prompt-tip}

### 字符实体
浏览器要用<和>来开始和结束标记，如果在 HTML 内容中使用这两个字符，就会有问题。但 HTML 提供了一种简便的方法，使用一种称为字符实体 (character entity) 的简单缩写来指定这样一些特殊字符。

例如，>字符的缩写是`&gt;`, <字符的缩写是`&lt;`。

一些字符实体可以在以下网站上找到：
1. [HTML 4 Entity Names, W3Schools](https://www.w3schools.com/charsets/ref_html_entities_4.asp)
2. [Unicode 15.1 Character Code Charts](https://www.unicode.org/charts/)


## References

1. Elisabeth Robson, Eric Freeman. Head First HTML 与 CSS (第二版). 徐阳, 丁晓峰等译. 2013
2. [HTML Tutorial, W3Schools](https://www.w3schools.com/html/default.asp)
3. [HTML 教程, 菜鸟教程](https://www.runoob.com/html/html-tutorial.html)