---
title:      "Summary of Contour Integration"
date:       2023-03-23
categories: [LaTeX]
tag: [integration, LaTeX]
toc: false
image: 
    path: /assets/img/in-post/2023/2023-03-23/preface.PNG
    lqip: data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQgJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAIABADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3gDD0ZbfRRQB//9k=
---
TikZ作为LaTeX著名的绘图宏包，拥有十分强大的功能，基本上你能想到可以精确描述的矢量图，它都能帮你画出来，关于它的学习指导在网络上有很多资源，在此就不一一列举。

本文重点针对复分析里的围道积分（以围道为分类标准），在此我罗列了一些常用的围道，并给出相应的TikZ绘图结果，（也方便我以后在回答或其他文章里引用，就不用再重复造轮子了）。

关于留数定理的简单应用和计算过程，建议参考[冰河佬的文章](https://zhuanlan.zhihu.com/p/119176842)（堪称全网最详细的留数定理入门教程）。

本文内容首发于[知乎](https://zhuanlan.zhihu.com/p/616112259)。

> &#x1F447; TikZ 实例总结请见此 PDF 文件：
> - **[TikZ-Example-Contour-Integration.pdf](/assets/pdf/TikZ-Example-Contour-Integration.pdf)**
{: .prompt-info}

## Update:
* 2023.3.23: 发布ver_1.0
* 2023.4.17: 将围道上的箭头更改为`>={Kite[inset=0pt,length=0.32cm]}`，更新至ver_1.1
