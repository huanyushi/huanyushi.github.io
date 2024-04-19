---
title:      "&sect;3 Python: Control Flow Statement"
date:       2024-04-13
categories: [Python]
tag: [Python]
image: 
    path: /assets/img/in-post/2024-04-05/python.jpg
    lqip: data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQgJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAIABADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDQsPDL3GCRXSWfhWKIAsKKK+fxmZ4jmcb6GtDC0rXsf//Z
math: true
---
> &#x1F447; 在此下载本文对应的 Jupyter Notebook 和 html 文件 
> - **[sec3_control_flow_statement.ipynb](/assets/python/sec3_control_flow_statement.ipynb)**
> - **[sec3_control_flow_statement.html](/assets/python/sec3_control_flow_statement.html)**
{: .prompt-info}

编程真正的力量不仅在于运行（或执行）一条接一条的指令，它还可以决定跳过指令，重复指令，或从几条指令中选择一条运行。控制流语句可以决定在什么条件下执行哪些 Python 语句。

控制流语句的开始部分通常是条件，接下来是一个代码块，称为子句。
- 条件总是求值为一个布尔值，`True` 或 `False`。控制流语句根据条件是 True 还是 False，来决定做什么。
- 代码块给出具体要执行的 Python 语句（注意代码块要缩进）。

### if 语句
最常见的控制流语句是 if 语句。 if 语句的子句将在语句的条件为 True 时执行，如果条件为 False，子句将跳过。

if 子句后面有时候也跟着 else 语句。只有当 if 语句的条件为 False 时，else 子句才会被执行。

但有时候我们会希望将情况分为更多种可能，而不是简单的“非黑即白”，这时候我们可以使用 elif 语句，也就是“否则如果”。elif 总是跟在 if 或另一条 elif 语句后面，它提供了另一个条件，仅在前面的条件均为 False 时才检查该条件。

总的来说，if 语句的一般形式如下（请别忘了后面的冒号 `:`）：
```python
if condition_1:
    statement_block_1
elif condition_2:
    statement_block_2
else:
    statement_block_3
```

- 如果 "condition_1" 为 True 将执行 "statement_block_1" 块语句
- 如果 "condition_1" 为 False，将判断 "condition_2"
- 如果 "condition_2" 为 True 将执行 "statement_block_2" 块语句
- 如果 "condition_2" 为 False，将执行 "statement_block_3" 块语句

> if 语句有一个重要的特点，它是从上往下判断的
{: .prompt-info}

这里我们举一个分段函数求值的例子，定义一个函数 $f(x)$ 为

$$
f(x) = \begin{cases}
3x-5, \quad&(x>1)\\[.2cm]
x+2, & (-1\leq x\leq 1)\\[.2cm]
5x+3,& (x<-1)
\end{cases}
$$

```python
x = float(input('x = '))
if x > 1:
    y = 3 * x - 5
elif x >= -1:
    y = x + 2
else:
    y = 5 * x + 3
print('f(%.2f) = %.2f' % (x, y)) # f(3.20) = 4.60
# 这里的 %.2f 是我们前面提到的格式化输出，指保留两位小数的浮点数输出。
```
```python
age = int(input("请输入你家狗狗的年龄: ")) # 3
print("")
if age <= 0:
    print("你是在逗我吧!")
elif age == 1:
    print("相当于 14 岁的人。")
elif age == 2:
    print("相当于 22 岁的人。")
elif age > 2:
    human = 22 + (age -2)*5 # 27
    print("对应人类年龄: ", human)
 
### 退出提示
input("点击 enter 键退出")
```

```python
# 请体会以下代码为什么输出是 'teenager' 而不是 'adult'
age = 20
if age >= 6:
    print('teenager')
elif age >= 18:
    print('adult')
else:
    print('kid')
```
值得一提的是，在 Python 中，if 语句是可以嵌套的，简单来说就是把 if...elif...else 结构放在另外一个 if...elif...else 结构中。
```python
# 展示一个嵌套的 if 语句的例子
chinese_score = 80
english_score = 30

if chinese_score >=60:
    if english_score >=60:
        print('语文和英语都及格了')
    else:
        print('语文及格了，但英语没及格')
else:
    print('语文和英语都没及格')
```
### match 语句
Python 3.10 增加了 `match...case` 的条件判断，不需要在使用一连串的 `if-else` 判断了。match 语句接受一个表达式并把它的值与一个或多个 case 块给出的一系列模式进行比较。这表面上像 C, Java 或 JavaScript 等语言中的 switch 语句，但其实它更像 Rust 或 Haskell 中的模式匹配。

match 语句的基本格式如下：

```python
match subject:
    case <pattern_1>:
        <action_1>
    case <pattern_2>:
        <action_2>
    case <pattern_3>:
        <action_3>
    case _: # 表示当其他 case 都无法匹配时，匹配这条。
        <action_wildcard>
```

match 语句除了可以匹配简单的单个值外，还可以匹配多个值（利用 `|`，即表示“或”将多个字面值组合到一个模式中）、匹配一定范围，并且把匹配后的值绑定到变量。

```python
# 使用 if 语句对学生成绩进行等级匹配
score = 'B'
if score == 'A':
    print('score is A.')
elif score == 'B':
    print('score is B.')
elif score == 'C':
    print('score is C.')
else:
    print('invalid score.')
# score is B.
```
```python
# 改用 match 语句
score = 'B'

match score:
    case 'A':
        print('score is A.')
    case 'B':
        print('score is B.')
    case 'C':
        print('score is C.')
    case _: # _表示匹配到其他任何情况
        print('score is ???.')
# score is B.
```

```python
age = 15

match age:
    case x if x < 10:
        print(f'< 10 years old: {x}')
    case 10:
        print('10 years old.')
    case 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18:
        print('11~18 years old.')
    case 19:
        print('19 years old.')
    case _:
        print('not sure.')
```

### while 循环语句
利用 while 语句，可以让一个代码块一遍又一遍地执行。只要 while 语句的条件为 True， while 子句中的代码就会执行。

while 语句的一般形式是：
```python
while condition:
    statement...
```

while 语句看起来和 if 语句类似。不同之处是它们的行为，if 子句结束时，程序继续执行 if 语句之后的雨具。但在 while 子句结束时，程序执行跳回到 while 语句开始处，也就是“循环”的含义。

```python
# 计算 1 + 2 + ... + 100
n = 100
sum = 0
i = 1
while i <= n:
    sum = sum + i
    i += 1

print("1 到 %d 之和为: %d" % (n,sum))
# 1 到 100 之和为: 5050
```
> **警告：**谨慎写出没有终止的死循环。
{: .prompt-danger}

如果遇到死循环代码，请及时终止运行。
```python
while True:  # 表达式永远为 true
    print('Hello')
```
- 我们可以使用 break 语句让执行提前跳出 while 循环子句。
- 也有 continue 语句，如果程序执行遇到 continue 语句就会马上跳回到循环开始处。
- 也可以在 while 循环中使用 else 语句，如果 while 后面的条件语句为 False 时，则执行 else 的语句块。

```python
# 猜数字：系统随机生成一个1~100之间的整数，用户去猜一直到猜中为止。
import random

answer = random.randint(1, 100)
counter = 0
while True:
    counter += 1
    number = int(input('请输入: '))
    if number < answer:
        print('你猜的数是 %d, 大一点'% number)
    elif number > answer:
        print('你猜的数是 %d, 小一点'% number)
    else:
        print('你猜的数是 %d, 恭喜你猜对了!'% number)
        break
print('你总共猜了%d次' % counter)
if counter > 7:
    print('你的智商余额明显不足')
# 你猜的数是 50, 小一点
# 你猜的数是 30, 大一点
# 你猜的数是 40, 小一点
# 你猜的数是 35, 小一点
# 你猜的数是 33, 小一点
# 你猜的数是 31, 大一点
# 你猜的数是 32, 恭喜你猜对了!
# 你总共猜了7次
```
```python
# 只打印奇数
n = 0
while n < 10:
    n = n + 1
    if n % 2 == 0: # 如果 n 是偶数，执行 continue 语句
        continue # continue语句会直接继续下一轮循环，后续的print()语句不会执行
    print(n)
# 1
# 3
# 5
# 7
# 9
```
```python
# 询问用户名及密码
while True:
    print('Who are you?')
    name = input()
    if name != 'Joe':
        continue
    print('Hello, Joe. What is the password? (It is a fish.)')
    password = input()
    if password == 'swordfish':
        break
print('Access granted.')
```
### for 循环语句
当条件为 True 时，while 循环会继续循环直到条件为 False，这并不方便直接控制循环次数。但如果我们想让一个代码块执行固定次数，我们可以通过 for 循环语句和 `range()` 函数来实现。

for 循环可以遍历任何可迭代对象，如一个列表或者一个字符串。它的一般格式如下（else 可以不加）：
```python
for <variable> in <sequence>:
    <statements>
else:
    <statements>
```

`range()` 是 Python 内置的一个函数，它有三个参数，分别指定开始值、结束值（不包括结束值）和步长。

```python
for i in range(3,11,2):
    print(i)
# 3
# 5
# 7
# 9
```

```python
# 对列表循环
names = ['Michael', 'Bob', 'Tracy']
for name in names:
    print("Hello, %s"% name)
# Hello, Michael
# Hello, Bob
# Hello, Tracy
```
```python
# 对字符串循环
string = 'ABCDEFGHIJKLMNOPQRSTUVWXXYZ'
for letter in string:
    print(letter)
else:
    print("Finally finished!")
# A
# B
# C
# D
# E
# F
# G
# H
# I
# J
# K
# L
# M
# N
# O
# P
# Q
# R
# S
# T
# U
# V
# W
# X
# X
# Y
# Z
# Finally finished!
```
```python
# 计算 1 + 2 + ... + 100
result = 0
for i in range(1,101):
    result = result + i
print(result)                 # 5050

print(sum(list(range(101))))  # 5050
```
```python
# 利用 for 循环生成列表
[1/i for i in range(1,10,3)] # [1.0, 0.25, 0.14285714285714285]
```

```python
# 计算 1 - 2 + 3 -... -100
sum([row*(-1)**(row+1) for row in range(1,101)]) # -50
```
```python
# 找到 100 以内的质数（即不含除1和自身外为因数的数）
print([x for x in range(2,101) if True not in [x%y == 0 for y in range(2,x)]])
# [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
```

### 补充：标准库
在 Python 程序里可以调用一组基本的函数，它们被称为 “内建函数”（我更喜欢叫内置函数），包括我们此前见到的 `print()`, `input()`, `len()` 和 `range()` 函数。 Python 也包括一组模块，称为“标准库”。每个模块都是一个 Python 程序（或者说一个 `.py` 文件），它包含一组相关的函数，例如我们在第二节介绍的 math 模块有数学运算相关的函数，random 模块有随机数相关的函数。

在编写程序时利用其他大佬写好的模块，可以有效减轻我们的负担，以及提高代码的可维护性。（大佬写的代码和我们写的屎山自然不同）

在使用这些模块中的函数前，我们必须用 `import` 语句导入该模块，如

```python
import module # 导入模块的所有部分
from module import name # 从模块中导入指定部分
from module import * # 导入模块的所有部分，且调用模块内的函数时不需要写模块名的前缀
```
内置的函数 dir() 可以找到模块内定义的所有名称。

> 更多的模块在后续我们会慢慢接触了解。
{: .prompt-tip}

```python
# 给出 numpy 模块里的定义的所有名称
import numpy
dir(numpy) 
```

```python
import random
for i in range(5):
    print(random.randint(1,10)) # 使用 random 模块的 randint 函数
    # 生成 1 ~ 10 之间的随机整数（包含 1 和 10）
```
使用 sys 模块内的 `sys.exit()` 函数可以让程序终止或退出。
```python
import sys
while True:
    print('Type exit to exit.')
    response = input()
    if response == 'exit':
        sys.exit()
    print('You typed ' + response + '.')
```

另外我们常常听说“调包侠”的梗，这里的包 (package) 和模块 (module) 有什么区别呢？包是一种管理 Python 模块命名空间的形式，可以防止模块名的冲突。

比如，一个 `abc.py` 的文件是一个名字叫 `abc` 的模块，一个 `xyz.py` 的文件就是一个名字叫 `xyz` 的模块。但这两个模块名字和其他模块冲突了，我们可以通过包来组织模块，避免冲突。方法是选择一个顶层包名，比如 `mycompany`，按照如下目录存放：

```
mycompany
├─ __init__.py
├─ abc.py
└─ xyz.py
```

引入了包以后，只要顶层的包名不与别人冲突，那么所有的模块都不会与别人冲突。此时 `abc.py` 模块的名字就变成了 `mycompany.abc`， `xyz.py` 的模块名就变成了 `mycompany.xyz`。 注意 `__init__.py` 是必须存在的，否则 Python 就把该目录当成普通目录，而非一个包。 `__init__.py` 可以是空文件，也可以有 Python 代码，因为它本身就是一个模块，它的模块名就是 `mycompany`。

后面我们常用的绘图模块 `matplotlib.pyplot`, `matplotlib` 就是一个包名，而 `pyplot` 是一个模块名。

有些大佬已经把自己的代码打包好了，我们可以安装他们写好的代码拿来自己用。那么如何安装第三方模块呢？这需要我们通过包管理工具 pip 完成，具体使用教程可以去网络上查询。

这里要提一点，我们经常需要用到很多第三方库，比如科学计算和绘图必备的 `numpy`, `matplotlib`, `scipy`，用 pip 一个个安装比较麻烦。对于小白来说，直接下载 [Anaconda](https://anaconda.org/) 是非常推荐的，它已经内置了许多非常有用的第三方库。通过设置环境变量，可以将环境变量的内容自动添加到模块搜索路径中。

## References
- [1] [Python 官方手册（中文）](https://docs.python.org/zh-cn/3/)
- [2] [Python 官方手册（英文）](https://docs.python.org/3/)
- [3] [Python 3 教程 - 菜鸟教程](https://www.runoob.com/python3/python3-tutorial.html)
- [4] [廖雪峰的 Python 教程](https://www.liaoxuefeng.com/wiki/1016959663602400)
- [5] [Python - 100天从新手到大师](https://github.com/jackfrued/Python-100-Days/tree/master)
- [6] Eric Matthes.《Python编程 - 从入门到实践（第二版）》（袁国忠译）. 人民邮电出版社
- [7] Al Sweigart.《Python编程 - 快速上手 -- 让繁琐工作自动化》（王海鹏译）. 人民邮电出版社