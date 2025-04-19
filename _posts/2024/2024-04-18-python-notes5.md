---
title:      "&sect;5 Python: List, Tuple, Set and Dictionary"
date:       2024-04-18
categories: [Python]
tag: [Python]
image:
    path: /img/in-post/python-notes/python.jpg
    lqip: data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQgJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAIABADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDQsPDL3GCRXSWfhWKIAsKKK+fxmZ4jmcb6GtDC0rXsf//Z
---
> &#x1F447; 在此下载本文对应的 Jupyter Notebook 和 html 文件 
> - **[sec5_list_tuple_set_dictionary.ipynb](https://cdn.jsdelivr.net/gh/huanyushi/blog-images@main/python/sec5_list_tuple_set_dictionary.ipynb)**
> - **[sec5_list_tuple_set_dictionary.html](https://cdn.jsdelivr.net/gh/huanyushi/blog-images@main/python/sec5_list_tuple_set_dictionary.html)**
{: .prompt-info}

## List 列表
Python 支持多种**复合**数据类型，可以将不同元素组合在一起，最常见的是**列表**，用方括号标注，逗号分隔的一组值。注意列表可以包含不同类型的元素，但一般情况下，各个元素的类型是相同的。

使用列表的好处在于，所需的数据放在一个结构中，程序能够更灵活的处理数据，比放在一些重复的变量中方便。

### 列表的基本操作
列表的创建

```python
test_list = [1,4,9,16,25]
print(test_list) # [1, 4, 9, 16, 25]

test_list = ['a','b',1, 2.0, True]
print(test_list) # ['a', 'b', 1, 2.0, True]
```

列表支持索引和切片（规则和字符串的索引切片是一样的，一定要记得列表的索引是从 0 开始的）。

通过 `+` 和 `*` 还可以支持合并与重复的操作。

```python
test_list = ['a','b',1, 2.0, True]

print(test_list[1])      # b
print(test_list[-1])     # True
print(test_list[2:5])    # [1, 2.0, True]
print(test_list[-1::-1]) # [True, 2.0, 1, 'b', 'a']

print(test_list[0:3] + ['你好','我好','大家好']) # ['a', 'b', 1, '你好', '我好', '大家好']
print(test_list*2) # ['a', 'b', 1, 2.0, True, 'a', 'b', 1, 2.0, True]
```

和字符串不同的是，列表是可以更改替换的。

```python
# 字符串不可以被替换
a = 'string'
a[3] = 'I'
---------------------------------------------------------------------------

TypeError                                 Traceback (most recent call last)

Cell In[1], line 2
        1 a = 'string'
----> 2 a[3] = 'I'


TypeError: 'str' object does not support item assignment
```

```python
# 列表可以被替换
a = ['s','t','r','i','n','g']
a[3] = 'I'
print(a)      # ['s', 't', 'r', 'I', 'n', 'g']

a[3:] = []
print(a)      # ['s', 't', 'r']

print(len(a)) # 3
``` 

列表还可以进行嵌套操作（创建包含其他列表的列表）

```python
# 嵌套列表
list1 = ['a','b','c']
list2 = [1,2,3]
list3 = [list1,list2]

print (list1 + ['d']) # ['a', 'b', 'c', 'd']
print(list3)          # [['a', 'b', 'c'], [1, 2, 3]]
print(list3[0])       # ['a', 'b', 'c']
print(list3[0][2])    # c
``` 

通过 `append` 方法可以在列表末尾添加新条目（更多方法在后续介绍）。注意这将直接改变原变量的值。

```python
letter = ['a','b','c']

letter.append('d')
print(letter) # ['a', 'b', 'c', 'd']
```

```python
letter = ['a','b','c','d']

del letter[0] # del 可以删除列表中的某些值
print(letter) # ['b', 'c', 'd']

del letter # del 可以删除变量的赋值
print(letter)
---------------------------------------------------------------------------

NameError                                 Traceback (most recent call last)

Cell In[21], line 7
        4 print(letter)
        6 del letter # del 可以删除变量的赋值
----> 7 print(letter)


NameError: name 'letter' is not defined
```

利用 `in` 和 `not in` 操作符，可以确定一个元素是否在列表中。


```python
print('hello' in ['hello', 'hi', 'howdy', 'heyas']) # True
print('cat' in ['hello','hi'])                      # False
print('cat' not in ['hello','hi'])                  # True
```
   

假设我们拥有一个列表，想要将列表中的元素为多个变量进行赋值，可以采用多重赋值技巧。

```python
cat = ['fat', 'black', 'loud']
size, color, disposition = cat

print(size, color, disposition) # fat black loud
```

有一点值得一提的是，变量引用在列表的情况下会变得尤为不同，具体请看以下两个例子。

```python
spam = 42
cheese = spam
spam = 100

print(spam,cheese) # 100 42
```

```python
spam = [0, 1, 2, 3, 4, 5]
cheese = spam
cheese[1] = 'Hello!'

print(spam)   # [0, 'Hello!', 2, 3, 4, 5]
print(cheese) # [0, 'Hello!', 2, 3, 4, 5]
```

可以发现在变量引用数字的时候，我们将 spam 拷贝到 cheese 中，并改变 spam 的值，这没有影响到 cheese 中的值。这是因为 spam 和 cheese 是不同的变量，保存了不同的值。

但对于列表来说情况则不同，将列表赋给一个变量时，实际上是将列表的**引用**赋给了该变量。当创建列表 `[0,1,2,3,4,5]` 时，我们将它的引用赋给了变量 `spam`。但下一行只是将 spam 中的列表引用拷贝到 cheese，而非列表值 `[0,1,2,3,4,5]`本身。这意味着存储在 spam 和 cheese 中的引用，现在指向了同一个列表。当我们修改 cheese 变量的第一个元素时，实际上也修改了 spam 指向的同一个列表。

简单来说，我们赋给变量的不是列表值本身，而是一个引用，通过 `id()` 函数可以查看这些引用（它们是一些数字，Python 在内部使用这些 ID）。

> **总结：** 在变量必须保存可变数据类型的值时，如列表或者字典，Python 就将引用赋给变量。对于不可变的数据类型的值，如字符串、数或元组，Python 就将值赋给变量。
{: .prompt-info}

虽然 Python 变量在技术上包含了对列表或字典值的引用，但人们通常随意地说，该变量包含了列表或字典。

在处理列表或字典这种可变数据类型时，虽然传递引用是最方便的方法，但它有时会导致令人困惑的缺陷。当使用函数或者方法修改了传入的列表或者字典，我们可能不希望这些变动影响原来的列表或者字典（比如通过 `.append()` 方法会直接改变原列表，但我们希望生成一个新的列表它的末尾增加了新的元素，且这种变动不影响原先的列表）。

要实现这一点，我们可以使用 Python 内的 copy 模块，其中包含 `copy()` 和 `deepcopy()` 函数。`copy()` 函数可以用来复制列表或字典这样的可变数据类型，而不只是像我们上面提到的复制引用。

如果要复制的列表中，它内部还包含了列表，就需要使用 `deepcopy()` 函数，它将同时复制它们内部的列表

```python
# 列表的浅复制
import copy
spam = ['A', 'B', 'C', 'D']
cheese = copy.copy(spam)
cheese[1] = 42

print(spam)   # ['A', 'B', 'C', 'D']
print(cheese) # ['A', 42, 'C', 'D']
```

```python
# 嵌套列表的浅复制
spam = [['A','B'],[1,2,3]]
cheese = copy.deepcopy(spam)
cheese[0][1] = 'C'

print(spam)   # [['A', 'B'], [1, 2, 3]]
print(cheese) # [['A', 'C'], [1, 2, 3]]
```

### 列表的方法
方法和函数其实是一回事，只是它是调用在一个值上。方法部分跟在这个值后面，用一个句号分隔。

每种数据类型都有它自己的一组方法，方法只属于单个数据类型，比如不能在字符串类型里调用列表的方法。列表数据类型有一些有用的方法，用来查找、添加、删除或操作列表中的值。这里列举了一些常用的方法：

- `index()` 方法在列表中查找值并返回它的索引
- `append()` 和 `insert()` 方法在列表中添加值
- `remove()` 方法从列表中删除指定值
- `pop()` 方法从列表中删除指定位置的值
- `sort()` 方法将列表中的值排序
- `count()` 方法可以统计某个元素在列表中出现的次数
- `reverse()` 方法可以将列表的元素进行反转
- `clear()` 方法可以清空列表

`index()` 方法可以在列表中查找值并返回它的索引，但如果它不在列表中，Python 程序就会报错。

另外若列表存在重复的值，就只会返回它第一次出现的索引。


```python
# index()方法

spam = ['hello', 'hi', 'howdy', 'heyas']

print(spam.index('hello')) # 0
print(spam.index('heyas')) # 3

spam = ['Zophie', 'Pooka', 'Fat-tail', 'Pooka']
print(spam.index('Pooka')) # 1

print(spam.index('no'))
---------------------------------------------------------------------------

ValueError                                Traceback (most recent call last)

Cell In[37], line 11
      8 spam = ['Zophie', 'Pooka', 'Fat-tail', 'Pooka']
      9 print(spam.index('Pooka'))
---> 11 print(spam.index('no'))


ValueError: 'no' is not in list
```

`append()` 和 `insert()` 方法可以在列表中添加值，注意这两种方法都会直接改变原列表。

其中 `append()` 方法将参数添加到列表末尾。而 `insert()` 方法可以在列表任意位置插入一个值，其中第一个参数是新值的索引，第二个参数是要插入的新值。

```python
# append() 和 insert() 方法

spam = ['cat', 'dog', 'bat']
spam.append('moose')
print(spam) # ['cat', 'dog', 'bat', 'moose']

spam.insert(1,'chicken')
print(spam) # ['cat', 'chicken', 'dog', 'bat', 'moose']
```

```python
eggs = 'Hello'
eggs.append('world')
---------------------------------------------------------------------------

AttributeError                            Traceback (most recent call last)

Cell In[2], line 2
      1 eggs = 'Hello'
----> 2 eggs.append('world')


AttributeError: 'str' object has no attribute 'append'
```

`remove()` 方法可以将值从列表中删除，它同样直接改变原列表。如果要删除的值在列表中出现多次，只有第一次出现的值会被删除。若删除列表中不存在的值，也会导致 Python 报错。


```python
# remove() 方法

spam = ['cat','bat', 'rat', 'elephant']
spam.remove('bat')
print(spam) # ['cat', 'rat', 'elephant']

spam.remove('chicken')
---------------------------------------------------------------------------

ValueError                                Traceback (most recent call last)

Cell In[7], line 7
      4 spam.remove('bat')
      5 print(spam)
----> 7 spam.remove('chicken')


ValueError: list.remove(x): x not in list
```

```python
spam = ['cat','bat','rat','hat','cat']
spam.remove('cat')

print(spam) # ['bat', 'rat', 'hat', 'cat']
```

`pop()` 方法可以移除列表中指定位置的元素，这里要注意它的返回值不是 `None`，而是删除元素的值。当如果我们不写索引时，`pop()` 方法默认删除最后一个列表里的最后一个元素。


```python
spam = [0,1,2,3,4]

print(spam.pop()) # 4
print(spam)       # [0, 1, 2, 3]

spam.pop(2)
print(spam)       # [0, 1, 3]
```    

`sort()` 方法可以对一组数值构成或一组字符串构成的列表进行排序，它也是直接修改原列表。其中默认的将数字从小到大排序，将字符串按照 ASCII 字符顺序进行打印（对于纯字母而言，小写的 `a` 在大写的 `Z` 之后）。注意不能对既有字符串也有数的列表进行排序，Python 会报错。

也可以在 `sort()` 方法里，指定关键字参数 `reverse = True`，让 `sort()` 按逆序进行排序。如果想要按照普通的字典顺序来排序，也可以加入关键字参数 `key=str.lower`，也即将列表中所有的字符串值当成小写（但实际上并不会改变它们在列表的值）。


```python
# sort()方法

spam = [2, 5, 3.14, 1, -7]
spam.sort()
print('排序打印',spam)     # 排序打印 [-7, 1, 2, 3.14, 5]
spam.sort(reverse=True)
print('逆序打印',spam)     # 逆序打印 [5, 3.14, 2, 1, -7]

spam = ['ants','cats','dogs','badgers','elephants']
spam.sort()
print('排序打印',spam)     # 排序打印 ['ants', 'badgers', 'cats', 'dogs', 'elephants']
spam.sort(reverse=True)
print('逆序打印',spam)     # 逆序打印 ['elephants', 'dogs', 'cats', 'badgers', 'ants']
```

```python
spam = ['Alice', 'ants', 'Bob', 'badgers', 'Carol', 'cats']
spam.sort()
print(spam) # ['Alice', 'Bob', 'Carol', 'ants', 'badgers', 'cats']

spam = ['a', 'z', 'A', 'Z']
spam.sort(key=str.lower)
print(spam) # ['a', 'A', 'z', 'Z']
```

```python
# count() 方法
spam = [1, 1, 2, 2, 2, 3, 3, 3, 3, 4]

print('1 的个数是',spam.count(1)) # 1 的个数是 2
print('2 的个数是',spam.count(2)) # 2 的个数是 3
print('3 的个数是',spam.count(3)) # 3 的个数是 4
```

```python
# reverse() 方法
spam = [1, 2, 3, 4]
spam.reverse()

print(spam) # [4, 3, 2, 1]
```

```python
# clear() 方法
spam = [1, 2, 3, 4]
spam.clear()

print(spam) # []
```

### 列表推导式
Python 推导式是一种独特的数据处理方式，可以从一个数据序列构建另一个新的数据序列的结构体。，这种生成方式更为简洁。Python 支持各种数据结构的推导式：
- 列表推导式
- 字典推导式
- 集合推导式
- 元组推导式

这里我们先着重介绍一下列表推导式，其他类型的推导式逻辑是一致的。列表推导式的格式为：
```python
[out_exp_res for out_exp in input_list]
# or
[out_exp_res for out_exp in input_list if condition]
```


```python
# 创建平方值的列表
squares = []
for x in range(5):
    squares.append(x**2)
print(squares) # [0, 1, 4, 9, 16]

squares = list(map(lambda x: x**2, range(5)))
print(squares) # [0, 1, 4, 9, 16]

squares = [x**2 for x in range(5)]
print(squares) # [0, 1, 4, 9, 16]
```

```python
print([(x,y) for x in [1,2,3] for y in [3,1,4] if x!=y])
# [(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]

# 上述代码等价于
spam = []
for x in [1,2,3]:
    for y in [3,1,4]:
        if x!=y:
            spam.append((x,y))
print(spam) # [(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
```

```python
# 嵌套的列表推导式，矩阵转置
matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
]

print([[row[i] for row in matrix] for i in range(4)])
# [[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]

# 上述代码等价于
transposed = []
for i in range(4):
    transposed.append([row[i] for row in matrix])
print(transposed) # [[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]

# 也等价于
transposed = []
for i in range(4):
    transposed_row = []
    for row in matrix:
        transposed_row.append(row[i])
    transposed.append(transposed_row)
print(transposed) # [[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]

```

## Tuple 元组
元组和列表几乎一样，除了以下两点：
1. 元组输入时用圆括号 `()`, 但列表使用的是方括号 `[]`；
2. 元组是不可变的数据类型，但列表是可变的数据类型。元组没有 `append()`, `insert()` 这样的方法。

其他操作和列表几乎完全一致，比如索引、切片、用于 for 循环等。

这里有一个非常值得探讨的问题，我们已经有了列表这种数据结构，为什么还需要元组这样的类型呢？

1. 我们在项目中尤其是多线程环境中可能更喜欢使用不变对象（一方面因为对象状态不能修改，所以可以避免由此引起的不必要的程序错误；另一方面因为没有任何一个线程能够修改不变对象的内部状态，一个不变对象自动就是线程安全的）。所以结论就是：如果不需要对元素进行添加、删除、修改的时候，可以考虑使用元组。
2. 元组在创建时间和占用的空间上面都优于列表。简单来说就是程序运行更快，占用空间更少。


```python
eggs = ('Hello', 42, 0.5)

print(eggs[0])   # Hello
print(eggs[1:3]) # (42, 0.5) 
print(len(eggs)) # 3

for i in eggs:
    print('Now is %s.'%i)
# 3
# Now is Hello.
# Now is 42.
# Now is 0.5.
    
print(42 in eggs, 0.5 not in eggs) # True False
```

元组推导式和列表推导式的用法也几乎相同，只要用 `()` 圆括号把各部分括起来。有一点需要注意，元组推导式返回的结果是一个**生成器对象**，使用 `tuple()` 函数可以将它转换成元组


```python
# 元组推导式
spam = (x for x in range(1,10)) # 返回生成器对象
print(spam)         # <generator object <genexpr> at 0x000002222E65DFF0> 
print(tuple(spam))  # (1, 2, 3, 4, 5, 6, 7, 8, 9)
```

```python
eggs = ('Hello', 42, 0.5)
eggs[1] = 99 # 元组不可变，不能被修改、添加或删除。
---------------------------------------------------------------------------

TypeError                                 Traceback (most recent call last)

Cell In[38], line 2
    1 eggs = ('Hello', 42, 0.5)
----> 2 eggs[1] = 99


TypeError: 'tuple' object does not support item assignment
```

如果元组中只有一个值, Python 会认为我们只是在一个圆括号里输入了一个值。要需要将它识别为一个元组，我们可以在这个值后面添加一个逗号。


```python
eggs = ('hello')
print(type(eggs)) # <class 'str'>

eggs = ('hello',)
print(type(eggs)) # <class 'tuple'>
```

通过 `list()` 和 `tuple()` 函数可以将列表和元组互相转换类型。

```python
a = list(('cat','dog',5))
print(type(a)) # <class 'list'>

b = tuple(['cat','dog',5])
print(type(b)) # <class 'tuple'>
```

最后我们来看一个“可变的”元组。这里的可变并非意味着原来的元组可变，而是代表元组包含的可变元素发生了改变。如果要创建一个内容也不变的元组，就必须保证元组的每一个元素本身也不能改变。请看以下例子：


```python
spam = ('a','b', ['A','B'])
spam[2][0] = 'X'
spam[2][1] = 'Y'

# spam 中的元素发生了改变，因为 spam[2] 是一个列表，是一个可变元素
print(spam) # ('a', 'b', ['X', 'Y'])
```
## Set 集合

Python 还支持集合这种数据类型。集合是由不重复元素组成的无序容器。集合中的元素不会重复，并且可以进行交集、并集、差集等常见的集合操作。

### 集合的基本操作

集合的定义：可以使用大括号 `{}` 来创建集合，元素之间用逗号分隔，也可以用 `set()` 函数来创建集合。创建的基本格式是：

```python
parame = {value01,value02,...}
# 或者
set(value)
```

```python
set1 = {1,2,3,4}
set2 = set([4,5,6,7])

set3 = {1,1,1,2,3,4}
# 集合中的元素不会重复
print(set3) # {1, 2, 3, 4}
```


```python
a = set('abracadabra')
b = set('alacazam')

# 差集：集合 a 中包含，但集合 b 中不包含的元素
print(a-b) # {'b', 'd', 'r'}
# 并集：集合 a 或 b 中包含的元素
print(a|b) # {'b', 'a', 'r', 'z', 'c', 'm', 'd', 'l'}
# 交集：集合 a 和 b 中包含的元素
print(a&b) # {'c', 'a'}
# 不同时包含于 a 和 b 的元素（只出现在其中一个集合里）
print(a^b) # {'b', 'z', 'r', 'm', 'd', 'l'}
```

```python
# 集合推导式
a = {x for x in 'abracadabra' if x not in 'abc'}
print(a) # {'r', 'd'}

a = {x for x in range(10) if x %2 ==0}
print(a) # {0, 2, 4, 6, 8}
```

### 集合的方法
以下列举一些较为常见的方法：
- `add()` 方法将元素添加到集合中
- `update()` 方法也可以添加元素，且参数可以是列表、元组、字典等
- `remove()` 方法将元素从集合中删除
- `discard()` 方法也可以将元素从集合中删除，且元素不存在时不会报错
- `clear()` 方法可以清空集合
- `intersection()` 方法**返回**多个集合的交集
- `difference()` 方法**返回**多个集合的差集
- `union()` 方法**返回**多个集合的并集


```python
x = {1,2,3}
x.add(4)
print(x) # {1, 2, 3, 4}

x.update(['5','6'])
print(x) # {1, 2, 3, 4, '5', '6'}

x.remove('6')
print(x) # {1, 2, 3, 4, '5'}

x.discard('7')

x.clear()
print(x) # set()
```

```python
x = {1,2,3}
y = {2,3,4}

print(x.intersection(y)) # {2, 3}
print(x.difference(y))   # {1}
print(x.union(y))        # {1, 2, 3, 4}
```

## Dictionary 字典
Python 里还有一个非常有用的内置数据类型，称为字典（dictionary），它提供了一种灵活的访问和组织数据的方式。像列表一样，字典是许多值的集合。但不像列表的索引只能是整数，字典的索引可以是许多不同的数据类型。字典的索引称为“键”，键及其关联的值成为“键-值”对（key-value）。

### 字典的基本操作
字典的每个键值对 `key->value` 用冒号 `:` 割开，每个键值对用逗号 `,` 分隔，整个字典包括在花括号 `{}` 中，基本格式如下：

```python
d = {key1 : value1, key2 : value2, key3 : value3 }
```

也可以通过 `dict()` 函数用键值对序列创建字典。注意键必须是唯一的，且是不可变数据类型；但值可以不唯一，且可以取任何数据类型。通过键可以访问对应的值（字典的索引就是键）。


```python
my_cat = {'size':'fat', 'color':'gray', 'disposition':'loud'}

print(my_cat['size']) # fat
print('My cat has ' + my_cat['color'] + ' fur.') # My cat has gray fur.

fruit =dict([('apples',3),('bananas','4'),('pears',5)])
print(fruit) # {'apples': 3, 'bananas': '4', 'pears': 5}
```


```python
# 字典推导式
print({x: x**2 for x in (2,4,6)}) # {2: 4, 4: 16, 6: 36}

listdemo = ['Google','Runoob', 'Taobao']
spam = {key:len(key) for key in listdemo}
print(spam) # {'Google': 6, 'Runoob': 6, 'Taobao': 6}
```

列表是一个序列（元素按照顺序排列存储），但字典中的键值对是不排序的，所以它是一个无序容器（集合也是一个无序容器）。确定两个列表是否相同时，元素的顺序很重要，但在字典里，键值对的顺序并不重要。

>**注意：** 无序的数据类型不能做切片。
{: .prompt-warning}


```python
spam = ['cats', 'dogs', 'moose']
bacon = ['dogs','moose','cats']
print(spam == bacon) # False

eggs = {'name':'Zophie', 'species':'cat', 'age':'8'}
ham = {'species':'cat', 'age':'8', 'name':'Zophie'}
print(eggs == ham)   # True 
```
    

尽管字典是不排序的，但可以用任意值作为键，这一点让我们能够用强大的方式来组织数据。

```python
# 保存朋友生日的数据
birthdays = {'Alice':'Apr 1', 'Bob':'Dec 12', 'Carol':'Mar 4'}

while True:
    print('Enter a name: (blank to quit)')
    name = input()
    if name =='':
        break
        
    if name in birthdays:
        print(birthdays[name] + ' is the birthday of ' + name)
    else:
        print('I do not have birthday information for ' + name)
        print('What is their birthday')
        bday = input()
        birthdays[name] = bday # 给字典添加新的键值对
        print('Brithday database updated.')
```    

前面我们提到，字典的键必须是不可变数据类型，而值可以是任何数据类型。所以一个自然的想法是，值也是一个字典。这样我们就得到了一个嵌套字典。


```python
# 统计客人所带的食物数量和种类
all_food = {'Alice':{'apples':5,'pretzels':12},
           'Bob':{'ham sandwiches':3, 'apples':2},
           'Carol':{'cups':3, 'apple pies':1}}

def total_brought(guests,item):
    num_brought = 0
    for k,v in guests.items():
        num_brought = num_brought + v.get(item,0)
    return num_brought

print('被带来的食物各自有：')
print('- Apples ' + str(total_brought(all_food,'apples')))
print('- Cups ' + str(total_brought(all_food,'cups')))
print('- Cakes ' + str(total_brought(all_food,'cakes')))
print('- Ham Sandwiches ' + str(total_brought(all_food,'ham sandwiches')))
print('- Apple pies ' + str(total_brought(all_food,'apple pies')))
# 被带来的食物各自有：
# - Apples 7
# - Cups 3
# - Cakes 0
# - Ham Sandwiches 3
# - Apple pies 1
```

和列表相比较，字典有以下几个特点：

1. 查找和插入的速度极快，不会随着key的增加而变慢；
2. 需要占用大量的内存，内存浪费多。

而列表相反：
1. 查找和插入的时间随着元素的增加而增加；
2. 占用空间小，浪费内存很少。

所以，字典是用空间来换取时间的一种方法。
字典可以用在需要高速查找的很多地方，在 Python 代码中几乎无处不在，正确使用字典非常重要，需要牢记的第一条就是字典的键必须是不可变对象。

### 字典的方法
这里介绍一些字典的可能常用方法：
- `keys()` 方法返回字典的键
- `values()` 方法返回字典的值
- `items()` 方法返回字典的键值对
- `get(key,default=None)` 方法返回指定键的值，如果键不在字典中就返回 default 设置的默认值
- `setdefault()` 方法和 `get()` 类似，但如果键不在字典中，会添加键并将其值设为 default
- `copy()` 方法返回一个字典的浅复制
- `update(dic2)` 方法将字典 dic2 的键值对更新到原字典中
- `pop(key[,default])` 删除字典键所对应的值，并返回被删除的值
- `clear()` 方法清空字典

结合字典的方法，通过 `in` 和 `not in` 操作符可以检查键或值是否存在于字典中。


```python
# 返回字典的键、值、键值对
spam = {'color': 'red', 'age':42}

# dict_keys, dict_values, dict_items 是它们的数据类型
print(spam.keys())   # dict_keys(['color', 'age'])
print(spam.values()) # dict_values(['red', 42])
print(spam.items())  # dict_items([('color', 'red'), ('age', 42)])
```

```python
# 判断键或值是否存在于字典中
spam = {'name': 'Zophie', 'age':7}
print('name' in spam.keys())      # True 
print('Zophie' in spam.values())  # True
print('color' not in spam.keys()) # True
```

```python
# 返回指定字典键的值
spam = {'apples':5, 'cups':2}
print(spam.get('apples','replace')) # 5
print(spam.get('pears','replace'))  # replace
print(spam,'\n')                    # {'apples': 5, 'cups': 2} 

print(spam.setdefault('apples','replace')) # 5
print(spam.setdefault('pears','replace'))  # replace
print(spam)                                # {'apples': 5, 'cups': 2, 'pears': 'replace'}
```

```python
# 更新或删除字典中的键值对
spam = {'apples':5, 'cups':2}
spam.update({'pears':7, 'bananas':10})
print(spam) # {'apples': 5, 'cups': 2, 'pears': 7, 'bananas': 10}

print(spam.pop('apples')) # 5
print(spam) # {'cups': 2, 'pears': 7, 'bananas': 10}
```

```python
# 统计一段文本里字符出现的次数
import pprint

message = 'It was a bright cold day in April, and the clocks were striking thirteen.'
count = {}
for character in message:
    count.setdefault(character, 0)
    count[character] = count[character] + 1

# pprint 的输出结果比 print 更干净
pprint.pprint(count)
# {' ': 13,
#  ',': 1,
#  '.': 1,
#  'A': 1,
#  'I': 1,
#  'a': 4,
#  'b': 1,
#  'c': 3,
#  'd': 3,
#  'e': 5,
#  'g': 2,
#  'h': 3,
#  'i': 6,
#  'k': 2,
#  'l': 3,
#  'n': 4,
#  'o': 2,
#  'p': 1,
#  'r': 5,
#  's': 3,
#  't': 6,
#  'w': 2,
#  'y': 1}
```

## 补充：String 字符串再叙

### 字符串的基本操作
列表并不是唯一表示序列值的数据类型。例如，字符串和列表实际上很相似，只要我们认为字符串时单个文字字符的列表。对列表的许多操作，也可以作用于字符串：索引、切片、用于 for 循环、用于 in 和 not in 操作符等，这部分内容在第二节我们已经提及过，现在回顾一下。



```python
name = 'Ziphie'

print(name[0])      # Z
print(name[-2])     # i
print(name[0:4])    # Ziph
print(name[4:0:-1]) # ihpi

for i in name:
    print('The letter is %s.'%i)
# The letter is Z.
# The letter is i.
# The letter is p.
# The letter is h.
# The letter is i.
# The letter is e.
    
print('Z' in name, 'Z' not in name) # True False
```

但有一点需要反复强调（尽管我们之前已经提过），字符串是**不可变**的数据类型，列表是**可变**的数据类型。

> **提醒：** 可变的数据类型，可以被添加、删除或者修改。但不可变的数据类型，不能被更改，否则会报错。
{: .prompt-warning}


```python
# 字符串的格式化输出
a, b = 5, 10
print('%d * %d = %d' % (a, b, a*b))        # 5 * 10 = 50

print('{0} * {1} = {2}'.format(a,b,a * b)) # 5 * 10 = 50
print(f'{a} * {b} = {a * b}')              # 5 * 10 = 50
```    

### 字符串的方法
一些字符串方法会分析字符串，或生成转变过得字符串。这里我们简单介绍一些常用的字符串方法。
- `upper()`, `lower()` 方法会返回一个新字符串，原字符串的所有字母都转换为大写或小写。非字母字符保持不变
- `isupper()`, `islower()` 方法判断字符串里所有字母是否都是大写或小写
- `isalpha()` 方法判断字符串是否只含字母且非空
- `isalnum()` 方法判断字符串是否只含字母和数字，且非空
- `isdecimal()` 方法判断字符串是否只含数字且非空
- `isspace()` 方法判断字符串是否只包含空格、制表符和换行，且非空
- `istitle()` 方法判断字符串是否仅包含以大写字母开头、后面都是小写字母的单词
- `startswith()`, `endswith()` 方法判断是否是以指定字符串开始或结束
- `join()` 方法将字符串列表连接起来，被调用的字符串是连接符
- `split()` 方法将字符串分割，返回一个字符串列表
- `rjust()`, `ljust()`, `center()` 方法用来对齐文本 
- `strip()`, `rstrip()`, `lstrip()` 方法用来删除空白字符


```python
# upper() 和 lower() 方法
spam = 'Hello world!'
spam = spam.upper()
print(spam) # HELLO WORLD!

spam = spam.lower()
print(spam) #  hello world!
```

```python
#isupper() 和 islower() 方法
spam = 'Hello world!'
print(spam.islower()) # False
print(spam.isupper()) # False

spam = spam.upper()
print(spam.isupper()) # True

spam = spam.lower()
print(spam.islower()) # True
```

```python
# isX() 方法
print('hello'.isalpha())    # True
print('hello123'.isalpha()) # False
print('hello123'.isalnum()) # True
print('hello'.isalnum())    # True
print('123'.isdecimal())    # True
print(' '.isspace())        # True
print('This Is Title Case'.istitle())            # True
print('This Is Title Case 123'.istitle())        # True
print('This Is not Title Case'.istitle())        # False
print('This Is NOT Title Case Either'.istitle()) # False
```
    
```python
# startswith() 和 endswith() 方法
print('Hello world!'.startswith('Hello')) # True
print('Hello world!'.endswith('world!'))  # True
```

```python
# join() 方法
print(','.join(['cats','rats','bats']))     # cats,rats,bats
print('-'.join(['My','name','is','Simon'])) # My-name-is-Simon
```

```python
# split() 方法
print('My name is Simon'.split())    # ['My', 'name', 'is', 'Simon']
print('My,name,is,Simon'.split(',')) # ['My', 'name', 'is', 'Simon']
```

```python
# rjust(), ljust(), center() 方法
print('Hello'.rjust(10))       #      Hello
print('Hello'.rjust(20,'*'))   # ***************Hello
print('Hello'.ljust(20,'-'))   # Hello---------------
print('Hello'.center(20,'='))  # =======Hello========
```

```python
# strip(), lstrip(), rstrip() 方法
spam = ' Hello world '
print(spam.strip()) # 删除两边空格
print(spam.lstrip()) # 删除左边空格
print(spam.rstrip()) # 删除右边空格
# Hello world
# Hello world 
#  Hello world
```

## References
1. [Python 官方手册（中文）](https://docs.python.org/zh-cn/3/)
2. [Python 官方手册（英文）](https://docs.python.org/3/)
3. [Python 3 教程 - 菜鸟教程](https://www.runoob.com/python3/python3-tutorial.html)
4. [廖雪峰的 Python 教程](https://www.liaoxuefeng.com/wiki/1016959663602400)
5. [Python - 100天从新手到大师](https://github.com/jackfrued/Python-100-Days/tree/master)
6. Matthes, E.《Python编程 - 从入门到实践》(袁国忠译). 人民邮电出版社 (Year).
7. Sweigart, A.《Python编程 - 快速上手 -- 让繁琐工作自动化》(王海鹏译). 人民邮电出版社
