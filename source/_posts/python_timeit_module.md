title: Python代码计时模块timeit学习笔记
id: 134
categories:
  - python
date: 2015-01-27 19:46:18
tags:
  - python
---

timeit模块提供了一种简便的方法来为Python中的小块代码进行计时。它有三种使用方式，从命令行调用，从Python交互解释器调用，或者直接在脚本代码中进行调用。下面仅仅简略记述一下该模块在交互解释器以及脚本中的基础使用方法。

### 在Python交互解释器中的使用
** timeit函数 **
最基本的使用方法是直接调用timeit函数。
```python
import timeit
timeit.timeit(stmt='pass', setup='pass', timer=<default timer>, number=1000000)
```
<!--more-->
模块的第一个参数为要执行计时的语句（statement）。按字符串的形式传入要执行的代码。第二个参数setup用于构建代码环境，可以用来导入需要的模块。最后的number指定了运行的次数。

使用示例如下：
```python
>>>import timeit
>>>timeit.timeit('"-".join(str(n) for n in range(100))', number=10000)
0.21051692962646484
```
** repeat函数 **
另一个可供使用的函数是repeat函数，指定整个试验的重复次数，返回一个包含了每次试验的执行时间的列表。
```python
>>> timeit.repeat('"-".join(str(n) for n in range(100))',repeat=3, number=10000)
[0.21938705444335938, 0.21767210960388184, 0.21688294410705566]
```
利用这一函数可以很方便得实现多次试验取平均的方法。

#### 在脚本程序中的使用
timeit模块同样可以在脚本中直接使用。使用方法还是调用上述的函数。但是在脚本中时需要为setup传入一条字符串形式的语句，用于构建执行环境，示例如下：

```python
def test():
	L = []
	for i in range(100):
		L.append(i)

if __name__ == '__main__':
	import timeit
	print timeit.timeit("test()", setup="from __main__ import test"))
```
