title: 记一个使用yield读写文件的方法
tags:
  - python
  - 原创
id: 104
categories:
  - python
date: 2015-01-23 03:30:08
---

在学习yield的使用方法的时候遇到了一个非常实用的应用，记录如下。

在我们直接使用read()方法来读取一个文件的全部内容的时候，会导致不可预测的内存占用，即当文件很大时有可能直接内存不够用了。好的方法是利用一个指定长度的缓冲区配合yield来逐次返回文件内容，代码示例如下：
```python
def read_file(file_name):
	BUFFER_SIZE = 1024
	with open(file_name, 'r+') as f:
		while True:
			block = f.read(BUFFER_SIZE) # 读取文件内容至缓存区
			if block:
				yield block
			else:
				return # 退出生成器
```
