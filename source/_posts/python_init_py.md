title: Python：__init__.py 详解
id: 153
categories:
  - python
date: 2015-02-14 09:28:08
tags:
  - python
---

翻译一篇介绍 \__init\__.py 的好文。
原文地址：[Be Pythnoic: \__init\__.py](http://mikegrouchy.com/blog/2012/05/be-pythonic-\__init\__py.html)
翻译：YongLi1992
***
### \__init\__.py 是什么？
\__init\__.py 文件的主要用处是用来初始化 Python 包（packages）的。我们以下面的一个标准 Python 模块结构来展示这一用处。

    package/
    __init__.py
    file.py
    file2.py
    file3.py
    subpackage/
        __init__.py
        submodule1.py
        submodule2.py

如你所见，在上述目录结构中包含 \__init__.py 文件可以告知 Python 解释器，该目录应被作为一个 Python 包来处理。

<!--more-->

### \__init__.py 中有什么
\__init__.py 可以是一个空文件。但它也可以为包做一些设置工作，如 import 其它文件，加载路径等等。

一种常见的做法是在 \__init__.py 中把同级 python 文件中的类，函数等 import 到包的顶级，以方从包的外部使用。

在上述的例子中假定我们的 file.py 文件中有一个 File 类。如果 \__init__.py 为空的话，从包的外部导入 File 类你需要这样做：
```python
from package.file import File
```
然而，你可以在 \__init__.py 文件中先 import 这个类，从而把它提升到包的顶级：
```python
# 在 __init__.py 文件中这样写
from file import File

# 从包的外面可以更方便地导入 File 类了
from package import File
```

另外一件在 \__init\__.py 中可以做的事情是用 \__all\__ 变量来控制使用 import * 语句时要导入的文件。当 \__init\__.py 中定义了 \__all\__  变量时，使用下面的语句将只导入指定的文件。
```python
from package import *
```
\__all\__ 是一个列表变量，放的是你希望导入的文件的名字。以我们之前的目录为例，如果我们希望导入 subpackage 中所有的 submodules，在 \__init\__.py 文件中可以这样写：
```python
__all__ = ['submodule1', 'submodule2']
```
有了这一变量之后，当你使用：
```python
from subpackage import *
```
subpackage 下的 submodule1，submodule2 都会被导入了。
