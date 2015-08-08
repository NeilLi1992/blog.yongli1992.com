title: Python 命令行解析模块argparse使用学习
tags:
  - python
id: 72
categories:
  - python
date: 2015-01-20 16:08:42
---

argparse在Python2.7中引入，是用于替代原来的optparse模块的。
## 基本知识
导入模块后，获得一个parser对象。通过调用其add_argument()方法来设置程序可接受的命令行参数。
调用其parse_args方法来获取一个收集了所有参数的args对象。此时从命令行得到的参数可以由args对象的属性来获取。
基本过程如下：
```python
import argparse
parser = argparse.ArgumentParser()
args = paresr.parse_args()
```
<!--more-->
## 添加参数
通过parser对象的add_argument方法来添加。调用的时候可以指定以下属性（仅列出部分）：
help：指定一个字符串，在命令行中使用-h，--help参数时可以详细解释你设置的该命令的作用，类似文档。
type：指定该参数的类型，这样由args的属性获取的该参数直接为正确的类型，免去类型转换。如不指定，默认为字符串。
default：默认值。
choice：有效值范围。

### 位置参数
调用parser对象的add_argument方法并传入一个字符串参数，指定从命令行接收的参数名。如果字符串不以''-''开头，则为必须的位置参数。
如下：
```python
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("echo") # 添加名为echo的参数
args = paresr.parse_args()
print args.echo # 参数解析之后可以调用args对象的同名属性来获取参数
```
添加的时候为help参数指定一个字符串的话，在命令行中使用-h时候，该字符串就会作为文档列在你给的参数后面了。
```python
parser.add_argument("echo", help="echo the string you use here")
```
添加的时候为type参数指定指定一个type对象的话，解析出来的参数直接是对应的类型，免去类型转换。否则解析出来默认为字符串。
```python
parser.add_argument("square", type=int)
args = parser.parse_args()
print args.square ** 2 # 解析出出来的square就是整数类型，直接参与运算
```
命令行中运行如下：
```bash
$python test.py 4
16
```

### 可选参数
调用parser对象的add_argument方法时若传入的字符串是以"-"开头的，则该参数为可选参数。在命令行中运行的时候可以提供也可以不提供。
如下：
```python
parser.add_argument("-v", action="store_true", default=False)
args = parser.parse_args()
if args.v:
	print "More information"
```
其中在添加时设置default参数，为v添加默认值。设置action为"store_true"表明在命令行中运行时若有-v则将其设置为true。
