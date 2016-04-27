title: Python技巧
tags:
  - python
id: 77
categories:
  - python
---

### 二维矩阵一维化
将二维矩阵扁平化的单行写法：
```python
a = [[1,2,3],[4,5,6],[7,8,9]]
b = [item for sublist in a for item in sublist]
>>> b
>[1,2,3,5,6,7,8,9]
```

###从列表中去除指定元素
给定一个列表a_list，指定一个元素x。调用列表的remove方法可以删除列表第一个出现的x。但是如果要清楚列表中所有的x的话，可以用filter函数。
需要注意的是，filter不是一个原地方法，调用后返回新的列表，原列表不变。
```python
>>>a_list = [1,1,1,2,3]
>>>x = 1
>>>filter(lambda e: e!= x, a_list)
>[2,3] # 返回新的列表对象，去除了所有指定元素x
>>>a_list
>[1,1,1,2,3] # 原列表不变
```
