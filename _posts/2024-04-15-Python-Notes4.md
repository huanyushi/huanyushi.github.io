---
title:      "&sect;4 Python: Function"
date:       2024-04-15
categories: [Python]
tag: [Python]
image:
    path: /assets/img/in-post/2024-04-05/python.jpg
    lqip: data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQgJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAIABADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDQsPDL3GCRXSWfhWKIAsKKK+fxmZ4jmcb6GtDC0rXsf//Z
---
> &#x1F447; 在此下载本文对应的 Jupyter Notebook 和 html 文件 
> - **[sec4_function.ipynb](/assets/python/sec4_function.ipynb)**
> - **[sec4_function.html](/assets/python/sec4_function.html)**
{: .prompt-info}

## 函数
在之前，我们已经遇到了许多 Python 提供的内建函数，比如 `print()`, `input()`, `len()` 等。我们也可以编写自己的函数，实现自己想要的特定功能。函数就像一个程序内的小程序，利用好函数可以提高应用的模块性，和代码的重复利用率。

### 函数的定义
在 Python 里我们定义函数需要使用 `def` 关键字，一般格式如下：

```python
def function_name (argument1, argument2, ...):
    <action>
```

基本规则如下：
- 函数代码块以 `def` 关键字开头，后接函数标识符名称（定义函数的名字）和圆括号`()`；
- 任何传入参数和自变量必须放在圆括号中间，圆括号之间可以用于定义参数；
- 函数的第一行语句可以选择性地使用文档字符串（用于存放函数说明）。
- 函数内容以冒号 `:` 起始，并且需要缩进；
- `return [expression]` 结束函数，选择性地返回一个值给调用方，不带表达式的 return 相当于返回 None. 当然 Python 函数也可以返回多个值。

```python
# 一个简单的函数，用来打印 Hello world!
def hello():
    '''
    这个代码用来打印 Hello world
    '''
    print('Hello world!')
    print('Hello world again!')

hello()
# Hello world!
# Hello world again!
```

```python
# 给 hello 函数增加参数
def hello(name):
    print('Hello' , name)

hello('Alice')  # Hello Alice
hello('Bob')    # Hello Bob
```

```python
# 比较两个数，并返回较大的数：
def my_max(a,b): # 和 Python 内置的 max 函数区分开
    if a > b:
        return a
    else:
        return b
    
print(my_max(3,3.14)) # 3.14
```

定义一个啥都不做的空函数，可以用 pass 语句。
```python
def nop():
    pass
```

既然 pass 语句啥都不干，那它有什么用？实际上 pass 可以用来作为占位符。比如现在还没想好怎么写函数的代码，就可以先放一个 pass，让代码能跑起来。

当然 pass 也可以用在其他语句里，比如 if 语句，for 循环等。


### 参数
定义函数的时候，我们把参数的名字和位置确定下来，函数的接口定义就完成了。对于函数的调用者来说，只需要知道如何传递正确的参数，以及函数将返回什么样的值就够了，函数内部的复杂逻辑被封装起来，调用者无需了解内部代码是如何编写的。（实际上这也体现了调包的便捷性）

Python 的函数定义非常简单，但灵活度却非常大。除了正常定义的必选参数外，还可以使用默认参数、可变参数和关键字参数，使得函数定义出来的接口，不但能处理复杂的参数，还可以简化调用者的代码。

在 Python 中，调用函数时可以使用的正式参数类型有：
- 必需参数
- 关键字参数
- 默认参数
- 不定长参数

#### 必需参数
必需参数必须以正确的顺序传入函数。调用时的数量必须和声明时的一样。例如，`random.randint(1,10)` 和 `random.randint(10,1)` 不同，前者返回 1 到 10 之间的一个随机整数，后者则会报错。这是因为 `random.randint()` 函数里，第一个参数是范围的下界，第二个参数是范围的上界。它们之间的位置不能交换。

```python
def my_print(str):
    print(str)

my_print() # 不加参数会报错，因为里面是必需参数
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
Cell In[8], line 4
      1 def my_print(str):
      2     print(str)
----> 4 my_print()

TypeError: my_print() missing 1 required positional argument: 'str'
```

#### 关键字参数
关键字参数是由函数调用时在它们前面的关键字来识别的。关键字参数通常用于可选变元。使用关键字参数允许函数调用时参数的顺序与声明时不一致，因为 Python 解释器能够用参数名匹配参数值。 

例如 `print()` 函数有可选的变元 `end` 和 `sep`，分别指定在参数末尾打印什么，以及在参数之间打印什么来隔开它们。

```python
print('Hello',end='') # 使用 end 参数，在打印结束后打印空字符串
print('World')
# HelloWorld
```

在上面的例子中我们看到，两行代码打印的结果之间并没有换行。这是因为我们利用了 end 参数，将原本 `print()` 函数默认的 `end = '\n'` 换行，替换成了 `end = ''`，这样就取消了每次打印之后换行的功能。

```python
print('cats','dogs','mice')         # cats dogs mice

# 使用 sep 参数替换掉默认的分隔字符串
print('cats','dogs','mice',sep=',') # cats,dogs,mice
```

当然也可以在我们编写的函数里添加关键字参数

```python
def info_print( name, age ):
   print ("名字: ", name)
   print ("年龄: ", age)
   return
 
# 两次打印结果一致，说明关键字参数使用时不需要指定顺序。
info_print( age=18, name="小明" )
# 名字:  小明
# 年龄:  18
info_print( name='小明', age=18)
# 名字:  小明
# 年龄:  18
```

#### 默认参数
调用函数时，如果没有传递参数，则会使用默认参数。默认参数的使用，可以简化函数的调用。

> **警告:** 设置参数时，一定要注意必需参数在前，默认参数在后，否则 Python 的解释器会报错。
{: .prompt-danger}

因为我们在调用函数时，没有默认值的参数（也就是必需参数）应该首先接收到对应的参数值。如果将默认参数放在必选参数之前，Python 无法判断我们提供的参数究竟是给谁的，所以会报错。

```python
def info_print( name, age = 30 ):
   print ("名字: ", name)
   print ("年龄: ", age)
   return
 
# 调用函数时没有传入 age 参数，因此使用默认值 30
info_print( name='小明')
# 名字:  小明
# 年龄:  30
```

#### 不定长参数
我们可能需要一个函数能处理比当初声明时更多的参数。这些参数叫做不定长参数，和前述参数不同，它在声明时不会命名。基本语法格式如下：

```python
def functionname([formal_args,] *var_args_tuple ):
   "函数_文档字符串"
   function_suite
   return [expression]
```

其中加了星号 `*` 的参数会以元组 (tuple) 的形式导入，存放所有未命名的变量参数。

```python
# 打印任何传入的参数
def info_print( arg1, *vartuple ):
   print ("输出: ")
   print (arg1)
   print (vartuple)
 
# 后三个参数都是未命名的变量参数
info_print( 70, 60, 50 ,'ASD')
# 输出: 
# 70
# (60, 50, 'ASD')

# 也可以不向函数传递未命名的变量，此时的不定长参数就是一个空元组。
info_print( 10 )
# 输出: 
# 10
# ()
```

```python
# 计算多个数的求和
def calc_sum(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum

print(calc_sum(1,2,3))        # 14
print(calc_sum(1,5,9,12,17))  # 540
```

还有一种就是参数带两个星号 `**`，基本语法格式如下：

```python
def functionname([formal_args,] **var_args_dict ):
   function_suite
   return [expression]
```

加了两个星号 `**` 的参数会以字典的形式导入。

```python
def info_print( arg1, **vardict ):
   print ("输出: ")
   print (arg1)
   print (vardict)
 
info_print(1, a=2,b=3)
# 输出: 
# 1
# {'a': 2, 'b': 3}
```

#### 参数传递
在 Python 中，类型属于对象，对象有不同类型的区分，但变量是没有类型的。比如 `[1,2,3]` 是 List 类型，`"ABC"` 是 String 类型，但对于一个变量来说是没有类型的，它仅仅是对一个对象的引用（就像 C 语言的指针一样）。

在 Python 中，字符串（string）、元组（tuple）和数（number）都是不可更改的对象，而列表（list）和字典（dictionary）则是可以修改的对象。

Python 函数的参数传递分为可变和不可变两个类型：
- **不可变类型：** 如 `function_name(a)`， 传递的只是 `a` 的值，没有影响 `a` 对象本身。如果在函数内部修改 `a` 的值，则是新生成一个 `a` 的对象；
- **可变类型：** 如 `function_name(la)`，则是将 `la` 真正的传过去，修改后函数外部的 `la` 也会受影响。

让我们看以下两个实例：


```python
# 传递不可变对象的例子
def change(a):
    print(id(a))   # 指向的是同一个对象
    a=10
    print(id(a))   # 一个新对象
 
a=1
print(id(a))  # 140710768919336, 140710768919336
change(a)     # 140710768919624
``` 

- 形参指的是函数定义时用来接收传递给函数的值的参数；
- 实参指的是函数调用时传递给函数的具体值或变量。实参是实际传递给函数的值，在函数调用时与形参相匹配。

可以看见在调用函数前后，形参和实参指向的是同一个对象（对象 id 相同），在函数内部修改形参后，形参指向的是不同的 id。


```python
# 传递可变对象的例子
def changeme( mylist ):
   "修改传入的列表"
   mylist.append([1,2,3,4])
   print ("函数内取值: ", mylist)
   return
 
# 调用changeme函数
mylist = [10,20,30]
changeme( mylist )             # 函数内取值:  [10, 20, 30, [1, 2, 3, 4]]
print ("函数外取值: ", mylist)  # 函数外取值:  [10, 20, 30, [1, 2, 3, 4]]
```

> **警告:** 函数的参数请尽量不要使用可变数据类型，否则可能会产生难以理解的 BUG。
{: .prompt-danger}

具体请看以下的例子

```python
def add_end(L=[]):
    '''在传入的列表末尾添加一个 END'''
    L.append('END')
    return L

# 正常调用
add_end([1, 2, 3])  # [1, 2, 3, 'END']

# 反复运行以下代码，会一直在空列表后添加 `END`
add_end() # ['END', 'END', 'END', 'END', 'END', 'END']
```

为什么会出现这种情况？

原因是 Python 函数在定义的时候，默认参数 `L` 的值就被计算出来了，是 `[]` ，即默认参数 `L` 指向对象 `[]`。每次调用该函数，如果改变了 `L` 的内容，则下次调用时，默认参数的内容就变了，不再是定义函数时使用的 `[]`。

即第一次运行 `add_end()` 后，`L = ['END']` 就改变了原先 `L=[]` 的内容，第二次运行的结果就会变成 `L = ['END','END']`。

为什么要设计字符串、数字、`None` 这样的不变对象呢？因为不变对象一旦创建，对象内部的数据就不能修改，这样就减少了由于修改数据导致的错误。此外，由于对象不变，在多任务环境下同时读取对象就不会出现奇怪的 BUG.

要修改上面的例子，我们可以使用 `None` 这个不变对象来实现，如下


```python
def add_end(L=None):
    if L is None:
        L = []
    L.append('END')
    return L

# 不管运行多少次，结果都不变。
add_end() # ['END']
```

### 局部和全局作用域

- 在被调用函数内赋值的变元和变量，处于该函数的局部作用域。处于局部作用域的变量，称为局部变量。
- 在所有函数之外的变量，属于全局作用域。处于全局作用域的变量，称为全局变量。

变量只可能是局部或者全局二者之一。可以将作用域看成是变量的容器，当作用域被销毁时，所有保存在该作用域内的变量的值就被丢弃了。作用域很重要，理由如下：
- 全局作用域中的代码不能使用任何局部变量；
- 但是，局部作用域可以访问全局变量；
- 一个函数的局部作用域中的代码，不能使用其他局部作用域中的变量；
- 如果在不同的作用域中，可以使用相同的名字命名不同的变量。如可以有一个名为 `spam` 的局部变量，和一个名为 `spam` 的全局作用量。

#### 局部和全局变量的关系
> 局部变量不能在全局作用域内使用
{: .prompt-info}

下述程序在运行时会报错，这是因为 `eggs` 只属于函数 `spam()` 调用所创建的局部作用域。在程序执行从 `spam` 返回后，该局部作用域就会被销毁，不再有名为 `eggs` 的变量。


```python
def spam():
    eggs = 31337
spam()
print(eggs)
---------------------------------------------------------------------------

NameError                                 Traceback (most recent call last)

Cell In[76], line 5
      3     eggs = 31337
      4 spam()
----> 5 print(eggs)


NameError: name 'eggs' is not defined
```

> 局部作用域不能使用其他局部作用域内的变量
{: .prompt-info}

一个函数被调用时就创建了一个新的局部作用域，这包括一个函数被另一个函数调用时的情况。如下述代码所示，可以看见 `spam()` 函数调用时打印的仍是它创建的局部作用域里的 `eggs` 值，而非内部调用的另一个函数 `bacon()` 内 `eggs` 值


```python
def spam():
    eggs = 99
    bacon()
    print(eggs)

def bacon():
    ham = 101
    eggs = 0

spam() # 99
```    

> 全局变量可以在局部作用域中获取
{: .prompt-info}

见以下代码，因为在 `spam()` 函数中，没有变元名为 `eggs`，也没有代码为`eggs` 复制，所以当 `spam()` 中使用 `eggs` 时，Python 认为它是对全局变量 `eggs` 的引用，所以下述代码会打印出 42。


```python
def spam():
    print(eggs)
eggs = 42
spam()      # 42
print(eggs) # 42
```

> 局部变量和全局变量名称可以相同
{: .prompt-info}

要想生活简单，就要避免局部变量和全局变量或者其他局部变量同名。但在技术上，在 Python 中让局部变量和全局变量同名是完全合法的，但这只会徒增烦恼。请见以下实例：


```python
def spam():
    eggs = 'spam local'
    print(eggs)

def bacon():
    eggs = 'bacon local'
    print(eggs) 
    spam()
    print(eggs)

eggs = 'global'
bacon()     # bacon local, spam local, bacon local
print(eggs) # global
```

在这个程序中，实际上有 3 个不同的变量，但它们都名为 `eggs`。这些变量是：
1. 存在于 `spam()`被调用时的局部作用域的名为 `eggs` 的变量；
2. 存在于 `bacon()` 被调用时的局部作用域的名为 `eggs` 的变量；
3. 存在于全局作用域的名为 `eggs` 的变量。

因为这 3 个独立的变量都有相同的名字，追踪某一个时刻使用的是哪个变量，
可能比较麻烦。这就是应该避免在不同作用域内使用相同变量名的原因。

#### global 语句

如果需要在一个函数内修改全局变量就需要使用到 `global` 语句。

如果在函数的顶部有 `global eggs` 这样的代码，它就告诉 Python，“在这个函数中，`eggs` 指的是全局变量，所以不要用这个名字创建一个局部变量。”


```python
def spam():
    global eggs
    eggs = 'spam'

eggs = 'global'
spam()
print(eggs)  # spam
```   

一个函数中，一个变量要么总是全局变量，要么总是局部变量。函数中的代码
没有办法先使用名为 `eggs` 的局部变量，稍后又在同一个函数中使用全局 `eggs` 变量。

如果想在一个函数中修改全局变量中存储的值，就必须对该变量使用 global
语句。

在一个函数中，如果试图在局部变量赋值之前就使用它，像下面的程序这样，Python
就会报错。


```python
def spam():
    print(eggs) # ERROR!
    eggs = 'spam local'

eggs = 'global'
spam()
 ---------------------------------------------------------------------------

 UnboundLocalError                         Traceback (most recent call last)

 Cell In[7], line 6
       3     eggs = 'spam local'
       5 eggs = 'global'
 ----> 6 spam()
 

 Cell In[7], line 2, in spam()
       1 def spam():
 ----> 2     print(eggs) # ERROR!
       3     eggs = 'spam local'
 

 UnboundLocalError: cannot access local variable 'eggs' where it is not associated with a value
```

发生这个错误是因为，Python 看到 `spam()` 函数中有针对 `eggs`的赋值语句，会认为它是局部变量。但是 `print(eggs)` 执行在 `eggs` 赋值之前，局部变量并不存在。Python 不会退回到使用全局 `eggs` 变量。

在实际开发中，我们应该尽量减少对全局变量的使用，因为全局变量的作用域和影响过于广泛，可能会发生意料之外的修改和使用，除此之外全局变量比局部变量拥有更长的生命周期，可能导致对象占用的内存长时间无法被垃圾回收。

事实上，减少对全局变量的使用，也是降低代码之间耦合度的一个重要举措，同时也是对[迪米特法则](https://en.wikipedia.org/wiki/Law_of_Demeter) (Law of Demeter ) 的践行。减少全局变量的使用就意味着我们应该尽量让变量的作用域在函数的内部，但是如果我们希望将一个局部变量的生命周期延长，使其在定义它的函数调用结束后依然可以使用它的值，这时候就需要使用闭包，这个我们有机会可以在后续的内容中进行讲解。

## 匿名函数
在 Python 中可以使用 `lambda` 来创建小巧的匿名函数。

所谓匿名，就是指我们不再使用 `def` 语句这样标准的形式来定义一个函数。`lambda` 只是一个表达式，函数体比 `def` 简单很多。它的基本语法格式如下：

```python
lambda [arg1 [,arg2,....,arg3]]:expression
```

```python
#  没有参数
f = lambda: "Hello, world!"
print(f())  # Hello, world!
```

```python
# 将参数 + 10
plus_ten = lambda a : a + 10

print(plus_ten(5)) # 15
```

```python
# 将两个参数相加
sum = lambda arg1, arg2: arg1 + arg2
 
print ("相加后的值为 : ", sum( 10, 20 )) # 相加后的值为 :  30
print ("相加后的值为 : ", sum( 20, 20 )) # 相加后的值为 :  40
```

当然匿名函数也可以封装在一个函数内，这样可以使用同样的代码来创建多个匿名函数。

```python
def myfunc(n):
  return lambda a : a * n
 
mydoubler = myfunc(2) # 得到参数*2的匿名函数
mytripler = myfunc(3) # 得到参数*3的匿名函数
 
print(mydoubler(11)) # 22
print(mytripler(11)) # 33
```

## 递归函数
在函数内部，可以调用其他函数。如果一个函数在内部调用自身本身，那这个函数就是一个递归函数。

递归函数的优点是定义简单，逻辑清晰。理论上，所有的递归函数都可以写成循环的方式，但循环的逻辑不如递归清晰。


```python
# 阶乘，n! = n * (n-1) * ... *1
def fact(n):
    if n ==1:
        return 1
    return n * fact(n-1)

print(fact(1)) # 1! = 1
print(fact(5)) # 5! = 120
```
   

## 补充：异常处理
在 Python 程序中遇到错误，或者“异常”，意味着整个程序崩溃。显然我们不希望这发生在我们写的代码中，我们更希望程序能检测错误，处理它们然后继续运行。

例如，考虑下面的程序，它会出现“除数为零”的错误：


```python
def spam(divideBy):
    return 42 / divideBy
print(spam(2))  # 21.0
print(spam(12)) # 3.5
print(spam(0))
print(spam(1))
 ---------------------------------------------------------------------------

 ZeroDivisionError                         Traceback (most recent call last)

 Cell In[8], line 5
       3 print(spam(2))
       4 print(spam(12))
 ----> 5 print(spam(0))
       6 print(spam(1))
 

 Cell In[8], line 2, in spam(divideBy)
       1 def spam(divideBy):
 ----> 2     return 42 / divideBy
 

 ZeroDivisionError: division by zero
```

当试图将一个数除以零时，就会发生错误。根据错误信息，我们知道 `spam()` 中的 `return()` 语句导致了一个错误。

错误可以由 `try` 和 `except` 语句处理。那些可能出错的语句被放在 `try` 子句中，如果错误发生，程序执行就转到接下来的 `except` 子句开始处。


```python
def spam(divideBy):
    try:
        return 42 / divideBy
    except ZeroDivisionError:
        print('Error: Invalid argument.')
        
print(spam(2))  # 21.0
print(spam(12)) # 3.5
print(spam(0))  # Error: Invalid argument.
print(spam(1))  # 42.0
```

## References
- [1] [Python 官方手册（中文）](https://docs.python.org/zh-cn/3/)
- [2] [Python 官方手册（英文）](https://docs.python.org/3/)
- [3] [Python 3 教程 - 菜鸟教程](https://www.runoob.com/python3/python3-tutorial.html)
- [4] [廖雪峰的 Python 教程](https://www.liaoxuefeng.com/wiki/1016959663602400)
- [5] [Python - 100天从新手到大师](https://github.com/jackfrued/Python-100-Days/tree/master)
- [6] Eric Matthes.《Python编程 - 从入门到实践（第二版）》（袁国忠译）. 人民邮电出版社
- [7] Al Sweigart.《Python编程 - 快速上手 -- 让繁琐工作自动化》（王海鹏译）. 人民邮电出版社