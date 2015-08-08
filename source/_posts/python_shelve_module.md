title: Python存储模块shelve学习笔记
tags:
  - python
id: 85
categories:
  - python
date: 2015-01-20 15:06:18
---

Shelve是python中一个用于持久化存储的模块，采用字典的存储形式。Shelve模块的好处是，基本上任何python对象都可以作为存储的键。
#### 创建
调用shelve.open()方法来创建存储对象。传入字符串作为文件名。这里传入的字符串无须加后缀，但是shelve模块底层在写入文件的时候可能会自动为其加上后缀名[^1]。
调用方法时还可以为一个参数writeback指定一个布尔值，其默认值为False。若指定writeback为True，则对存储对象的操作将缓存在内存中，只有当调用存储对象的sync方法和close方法时才会写回文件。当存储的操作很多时，会影响内存性能并导致close过程的速度很慢。
```python
import shelve
s = shelve.open("filename")
```

<!--more-->

####使用
打开存储对象s后，使用的过程非常简单，视为操作一个字典即可。下面为一些操作的例子
```python
s[key] = data # 若key已存在，则覆盖
data = s[key] # 取回数据
del s[key]    # 删除

flag = s.has_key(key) # 检测是否含有键
key_list = s.keys() # 返回所有键的列表
```

#### 可变对象的更新问题
使用shelve过程中存在一个易错的陷进，即当我们已经从存储对象s中取出某个可变数据对象data之后，data在内存中发生更改时，s是无法知道这个更改的，也无法将这个更改自动写回存储文件。如下：
```python
>>>s['my_list'] = [1,2,3] # 放入一个可变对象，列表变量my_list
>>>s
>{'my_list': [1,2,3]}
>>>data = s['my_list'] # 取出可变对象
>>>data.append(4) # 做出更改
>>>s
>{'my_list': [1,2,3]} # 存储对象无法知道发生了更改，存储数据不变
```
为了避免该问题，我们应始终牢记：
*仅当对存储对象进行了**赋值**操作时，才算真正存储了。*

故，对可变对象的正确更新应按如下方式进行：
```python
temp = s['my_list'] # 取出可变对象
temp.append(4) # 进行更改
s['my_list'] = temp # 赋值操作发生，进行存储
>>>s
>{'my_list': [1,2,3,4]} # 存储成功
```
最后，对本地文件的操作完成后不要忘记关闭它：
```python
s.close() # 关闭存储对象
```
[^1]:[官方文档](https://docs.python.org/2/library/shelve.html)是这么写的，但是实测的时候没有加后缀，暂不确定具体是何因素决定了后缀的添加与否。
