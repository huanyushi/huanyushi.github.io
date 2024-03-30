---
title:      "HTML and CSS study notes: CSS introduction"
date:       2024-03-21
categories: [HTML and CSS, HTML]
tag: [HTML]
---

## 认识 CSS

**层叠样式表** (Cascading Style Sheets, 简称：**CSS**)，是一种用来为结构化文档（如 HTML 文档或 XML 应用）添加样式（字体、间距和颜色等）的计算机语言，CSS 文件的扩展名为 `.css`。通过使用 CSS 我们可以大大提升网页开发的工作效率。

- 样式定义如何显示 HTML 元素，它通常存储在样式表中
- 把样式添加到 HTML5 中，是为了解决**内容与表现分离的问题**
- 外部样式表可以极大提高工作效率，它通常存储在 CSS 文件中
- 多个样式定义可以**层叠**为一个

### CSS 语法
CSS 规则由两个主要部分构成：选择器 (selector)，以及一条或多条声明，见下图：
![selector](/img/in-post/2024-03-21/selector.gif){: width= 500}

- 选择器指向我们需要设置样式的 HTML 元素
- 声明块包含一条或多条声明，它们彼此之间用分号间隔
- 每条声明由一个属性 (property) 和一个值组成，属性是我们希望设置的样式属性 (style attribute)，每个属性有一个值，属性和值用冒号分开
- 要为多个元素编写一个规则，只需在选择器之间加上逗号

#### id 选择器

#### class 选择器
结合 HTML 和 CSS，我们可以定义一类元素，并对属于该类的所有元素应用样式。

### 将 CSS 插入 HTML 中
将样式表插入 HTML 有三种方法：
1. 外部样式表 (external style sheet)
2. 内部样式表 (internal style sheet)
3. 内联样式 (inline style)

#### 外部样式表
当样式需要应用于很多页面时，外部样式表是理想的选择。每个页面使用 `<link>` 链接到样式表，`<link>` 元素在文档的头部，如：
```html
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <!-- rel 属性指定 HTML 文件与所链接文件之间的关系，由于链接到样式表故使用值 "stylesheet" -->
    <!-- type 属性说明信息的类型是 "text/css"，不过在 HTML5 中不再需要这个属性，在比较老的页面上可能会看到它 -->
    <!-- href 说明样式表的位置，当然这也可以是一个完整的 URL -->
</head>
```
浏览器会从文件 `mystyle.css` 中读取样式声明，并根据它调整样式。注意样式表应该以 `.css` 为拓展名进行保存。

#### 内部样式表
当单个文档需要特殊样式时，就可以使用内部样式表对单个 HTML 进行样式修改。可以使用 `<style>` 元素在文档头部定义内部样式表，如：
```html
<head>
   <style>
     /*... ...*/
   </style>
</head>
```

#### 内联样式
内联样式将表现和内容混杂在一起，这种方法实际上并不推荐。当样式仅需要在一个元素上应用一次时可以考虑使用。使用内联元素，需要在相关的元素内使用 `style` 属性，`style` 属性可以包含任何 CSS 属性，参考下面的例子：
```html
<!-- 下面的示例代码可以改变段落的颜色和左外边距 -->
<p style = "color:sienna;margin-left:20px">这是一个段落。 </p>
```


## Reference

- [1] Elisabeth Robson, Eric Freeman. Head First HTML 与 CSS (第二版). 徐阳, 丁晓峰等译. 2013
- [2] [CSS Tutorial, W3Schools](https://www.w3schools.com/css/default.asp)
- [3] [CSS 教程, 菜鸟教程](https://www.runoob.com/css/css-tutorial.html)
- [4] [w3schools](https://www.w3school.com.cn/css/css_shiyong.asp)
