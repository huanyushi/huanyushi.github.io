---
title:      "中山大学物理与天文学院本科实验报告模板"
date:       2023-04-10
categories: [LaTeX]
tag: [LaTeX]
description: 利用 LaTeX 制作的中山大学物理与天文学院本科实验报告模板。
image: 
  path: /img/in-post/2023/2023-04-10/preface.PNG
  lqip: data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQgJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAIABADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3RJmaTHarQbNFFNiR/9k=
---
> "The laws of physics is the canvas God laid down on which to paint his masterpiece"
> --- Dan Brown.

## 写在前面

本模板源于我大二一时兴起所做。对于撰写实验报告，学院只提供了简陋的 word 模板，使用 word 效率低下且排版效果不甚理想。于是我仿照学院提供的模板格式，在其基础上完成了此 LaTeX 模板。

临近毕业，我发现此模板在学院内部仍有流传，但毕竟当时写就并不规范，且功能有诸多缺失。考虑到种种原因，**我决定将此模板进行更新完善并打包公布在 Github 和知乎上**，希望有助于后辈学子，同时也希望对其他兄弟院校的同学有一定参考和帮助作用。

本模板已上传至：
* [GitHub](https://github.com/huanyushi/SYSU-SPA-Labreport-Template) 
* [知乎](https://zhuanlan.zhihu.com/p/620722147)

Demo 请见 [PDF](https://cdn.jsdelivr.net/gh/huanyushi/blog-images@main/pdf/SYSU-SPA-LabReport-Template.pdf) ，源码可在 [release](https://github.com/huanyushi/SYSU-SPA-Labreport-Template/releases) 上下载。 

![GitHub license](https://img.shields.io/github/license/huanyushi/SYSU-SPA-labreport-Template.svg){: .normal} ![Github Version](https://img.shields.io/github/release/huanyushi/SYSU-SPA-labreport-Template.svg){: .normal}


## 模板功能说明

### 更新内容
本模板经过更新完善后，除几个必要的实验报告部分：
* 扉页
* 预习报告
* 实验记录
* 分析与讨论

在此前的实验报告基础上我增加了以下几个内容：
* **参考文献**，注明引用内容是作者对他人知识成果的承认和尊重，是保证学术诚信必须养成的习惯；
* **代码附录**，给出了使用 Lstlisting 环境展示代码的示例；
* **常用命令展示**，鉴于部分学生初次接触 LaTeX，本模板也给出了相应的常用命令展示以方便查阅。

### 注意事项
1. 参考文献应导入 `bib` 文件中，编译顺序请按 `xelatex` -> `bibtex` -> `xelatex` -> `xelatex`， 若要调整参考文献的格式在 `main.tex` 中修改 `\bibliographystyle{}` 即可；
2. `lstlisting` 代码环境配置如下，导入的是 `Python` 语言，可手动更改或添加其他程序语言，其他相关配置可参考 `listings` 宏包的手册，
```latex
\usepackage{listings}
\definecolor{c1}{HTML}{2752C9} % 定义的颜色
\lstloadlanguages{python}
\lstdefinestyle{pythonstyle}{
backgroundcolor=\color{gray!5},
language=python,
frameround=tftt,
frame=shadowbox, 
keepspaces=true,
breaklines,
columns=spaceflexible,      
basicstyle=\ttfamily\small, % 基本文本设置
keywordstyle=[1]\color{c1}\bfseries, 
keywordstyle=[2]\color{Red!70!black},   
stringstyle=\color{Purple},       
showstringspaces=false,
commentstyle=\ttfamily\scriptsize\color{green!40!black},% 注释文本设置
tabsize=2,
morekeywords={as},
morekeywords=[2]{np, plt, sp},
numbers=left, % 代码行数
numberstyle=\it\tiny\color{gray}, % 代码行数的数字字体设置
stepnumber=1,
rulesepcolor=\color{gray!30!white}
}
```
![code](/img/in-post/2023/2023-04-10/readme1.jpg)
3. 本模板定义了两种形式的 `box` ，可参考 `tcolorbox` 宏包的手册进行修改，
```latex
\usepackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\newtcolorbox{tbox}[2][]{
  colframe=black!70!,
  breakable,
  enhanced,
  boxrule =0.5pt,
  title = {#2},
  fonttitle = \large\kaishu\bfseries,
  drop fuzzy shadow,
  #1
}
\newtcolorbox[auto counter,number within=section]{question}[1][]{
  top=2pt,bottom=2pt,arc=1mm,
  boxrule=0.5pt,
  breakable,
  enhanced,
  coltitle=c1!80!gray,
  colframe=c1,
  colback=c1!3!white,
  drop fuzzy shadow,
  title={思考题~\thetcbcounter：\quad},
  fonttitle=\bfseries,
  attach title to upper,
  #1
}
```
![colorbox](/img/in-post/2023/2023-04-10/readme2.jpg)
4. TikZ 是一个知名的绘图宏包（其文档说明高达1000多页，超乎常人想象），在此补充了一些 TikZ 实例
![TikZ example](/img/in-post/2023/2023-04-10/readme3.JPG)

## 声明
* 本模板仅供学习交流所用，_非学院官方模板_。
* 本模板不再进行更新维护，若有任何额外需求请自行设计更改。
* **欢迎报考中山大学物理与天文学院**。

## 许可证
该项目是在 MIT 许可下发布的。