---
title:      "Python Notes: Introduction and Study Resources"
date:       2024-04-05
categories: [Python]
tag: [Python]
image: /img/in-post/2024-04-05/python.jpeg
---
## Python 简介
Python 是一种高级的解释型、动态类型和面向对象的计算机编程语言，Python 的设计哲学，强调代码的可读性和简洁的语法，尤其是使用空格缩进来划分代码块。相比于 C 语言或 Java，Python 让开发者能够用更少的代码表达想法。对于编程初学者来说，学习 Python 是十分推荐的。

目前世界上有数百种编程语言，但实际真正流行的编程语言只有十几种。查看最近的 TIBOE 排行榜（反应不同编程语言的流行程度）可以发现 Python 在近几年使用量与日俱增，且目前位列第一。

![TIBOE](/img/in-post/2024-04-05/TIBOE.PNG){: .shadow width="700"}

当然这也并不意味着其他编程语言一无是处，Python 毫无缺点。事实上，作为一门高级语言，它最大的缺点就是运行速度较慢。考虑到 Python 是一门解释型语言，在开发过程中它省去了编译的环节，没能将代码编译成底层的二进制代码，所以 Python 程序相比类似于 C 语言的完全编译的语言程序要慢很多。但实际上，Python 里一些程序是通过发送到其内部已经编译好的 C 语言代码处理的，在绝大部分领域运行的速度也足够快。且日常使用中，很少需要编写处理海量数据的大型代码，类似于 0.001s 和 1s 的编译时间差实际上基本没什么影响。

Python 本身的标准库就提供了非常完善的功能，当然也可以在网络上寻找所需的第三方库，它们往往是其他大佬开发并封装好的。相当于我们直接借用了其他人的武器去砍小怪。

说了这么多，那 Python 具体可以用来干嘛呢？比如：
- **数据科学和机器学习：** Python 有丰富的数据科学库（如 Numpy, Pandas, Scikit-learn）和机器学习框架（如 TensorFlow, PyTorch），在数据分析、机器学习和人工智能领域广泛使用。
- **科学计算：** Python 本身也是科学计算的理想工具，比如 Scipy 库广泛用于数学、科学、工程学等领域，可以处理积分、插值、拟合、傅里叶变换等各种数学计算问题。
- **网络爬虫：** 如 Beautiful Soup, Scrapy 库可以用来编写爬虫从网站上获取数据。
- **游戏开发：** 一些游戏开发库，如 Pygame，可以使游戏开发变得更加简单。
- **桌面应用程序：** 使用 Tkinter 或者 PyQt 库可以用来开发桌面应用程序。
- and so on ...

## Python 学习资源

关于 Python 的学习资源在网络上也有很多，这里罗列一些我觉得有用的。

Python 网站资源（注意只有官方手册是最新的）：
- [Python 官方手册（中文）](https://docs.python.org/zh-cn/3/)
- [Python 官方手册（英文）](https://docs.python.org/3/)
- [Python 3 教程 - 菜鸟教程](https://www.runoob.com/python3/python3-tutorial.html)
- [廖雪峰的 Python 教程](https://www.liaoxuefeng.com/wiki/1016959663602400)

Python 入门教程书籍（第二本更侧重办公自动化）：
- Eric Matthes 著, 袁国忠译. *Python编程-从入门到实践*（第二版）. 人民邮电出版社
- Al Sweigart 著, 王海鹏译. *Python编程-快速上手--让繁琐工作自动化*. 人民邮电出版社

## Jupyter notebook
Jupyter notebook 是一种基于网页的交互式计算环境，支持多种编程语言。最开始是用于 Python 语言编程的，但现在已经支持超过 40 种编程语言，比如 R, Julia 和 Scala 等。Jupyter 的名称实际上是由 3 种主要支持语言的首字母构成，JUlia, PYthon 和 R。

使用 Jupyter Notebook 可以创建和共享包含实时代码、可视化和解释型文本的文档，这种结合了代码和文本的方式，让它成为数据分析、机器学习、科学研究和教学等领域中非常受欢迎的工具。

从 Anaconda 里打开 Jupyter notebook 或者 Jupyter Lab 均可，只是前者通过网页打开，后者通过终端打开，没有本质区别。往后的几篇 Python 入门教程均围绕 Jupyter notebook 进行介绍。
### 修改默认打开路径
Jupyter notebook 默认打开的是 C 盘 `Users/Username` 的文件夹，想要修改它的默认打开路径，可以打开它的配置文件进行修改，通常是放在 `C:\Users\Username\.jupyter\jupyter_notebook_config.py` 文件里，如果找不到也可以打开 Anaconda Prompt，输入 `jupyter notebook --generate-config` 找到配置文件，再输入 `y` 后 <kbd>Enter</kbd>。 

对配置文件进行以下修改
```python
## The directory to use for notebooks and kernels.
#  Default: ''
# c.NotebookApp.notebook_dir = ''
# 找到上面这一行代码，在它后面补充修改后的路径，注意它前面的注释符号 # 也要去掉。
------------------------------------------
## The directory to use for notebooks and kernels.
#  Default: ''
c.NotebookApp.notebook_dir = 'Your path' # e.g. 'E:\python'
```
再 <kbd>ctrl</kbd> + <kbd> s </kbd> 保存，通过 Anaconda Prompt 输入 `jupyter notebook` 打开后就发现是修改后的路径了。

但还要注意一点，通过快捷方式打开仍然是 C 盘的位置。找到 Jupyter Notebook 快捷方式文件，右键 -> 属性 -> 目标 -> 将其后面的 `"%USERPROFILE%"` 删除 -> 应用 -> 确定。这样便修改完成了。

### 安装插件
参考[Jupyter notebook插件安装教程](https://blog.csdn.net/qq_22941289/article/details/134608546)，打开 Anaconda Prompt，依次输入运行以下代码即可
```shell
pip install jupyter_nbextensions_configurator jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
```
安装完成后要进行激活
```shell
pip show jupyter_contrib_nbextensions
```
找到 Location 标明的地址，通过 `cd: (相应的Location)\jupyter_contrib_nbextensions` 进入插件目录，通过以下代码激活。
```shell
python application.py install
```
最后启动 Jupyter notebook 便可以看到插件了。
![extensions](/img/in-post/2024-04-05/extensions.PNG){: width = "600"}
注意如果安装失败，需要卸载再重新安装，通过
```shell
pip uninstall jupyter_contrib_nbextensions
pip uninstall jupyter_nbextensions_configurator
```
即可卸载。 之后打开 Jupyter notebook 就可以看到 Nbextensions 了，在其中可以勾选需要使用的插件。以下列举一些常用的插件：
- Hinterland: 对代码进行自动补全；
- Table of Contents: 生成标题目录；
- Collapsible headings, Codefolding: 折叠标题、代码下的内容；
- Toggle all line numbers: 显示代码行号；
- Variable Inspector: 显示当前参数的属性；

> **警告：** Jupyter notebook 在 6.5 版本后不再支持第三方插件。如果想继续使用的话要考虑回退版本。说实话，过程很麻烦，还不如用 VS code.
{: .prompt-danger}
解决办法，管理员模式运行 Anaconda Prompt，卸载 Jupyter notebook，
```shell
pip uninstall notebook
```
使用以下命令安装特定版本的Jupyter notebook，
```shell
pip install notebook==6.4.6
```
### 常用快捷键
在 `.ipynb` 文件里按键 <key>H</key> 即可进入快捷键界面，如下图所示，
![kuaijie1](/img/in-post/2024-04-05/kuaijie1.JPG)

![kuaijie2](/img/in-post/2024-04-05/kuaijie2.JPG)

将一切准备工作做好后，就可以安心写代码了。


