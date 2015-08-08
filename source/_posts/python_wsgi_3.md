title: Python WSGI教程(三)——环境字典
tags:
  - python
  - 翻译
id: 119
categories:
  - python
date: 2015-01-23 16:58:52
---

**环境字典：Environment dictionary**
环境字典会包含一些CGI环境变量，由服务器在接收到每一次来自客户端的请求时产生。下面的脚本代码会输出整个字典的内容。
<!--more-->
```python
#! /usr/bin/env python

# 使用python内置的WSGI服务器
from wsgiref.simple_server import make_server

def application(environ, start_response):
   # 排序并将环境字典的键值对转换为字符串
   response_body = ['%s: %s' % (key, value)
                    for key, value in sorted(environ.items())]
   response_body = '\n'.join(response_body)

   status = '200 OK'
   response_headers = [('Content-Type', 'text/plain'),
                  ('Content-Length', str(len(response_body)))]
   start_response(status, response_headers)

   return [response_body]

# 实例化一个WSGI服务器对象。
# 该服务器对象可以接收来自客户端（我们的浏览器）的请求，将它传给应用程序，
# 并且将应用程序返回过来的响应再发送给客户端。
httpd = make_server(
   'localhost', # 主机名。
   8051, # 监听请求的端口号。
   application # 我们的可调用应用对象，在这里是一个函数。
   )

# 在这里简单地一次性监听，得到响应后处理完则直接退出。
httpd.handle_request()
```
要运行这段脚本代码的话，将其保存为environment.py，然后打开终端，进入脚本所在的目录下，输入：
```bash
>>>python environment.py
```
如果是在Windows系统的话，需要将python.exe的路径添加到系统环境变量路径中。最后我们打开浏览器，在地址栏输入我们的服务器运行的地址和端口号即可看到结果：

    http://localhost:8051/
