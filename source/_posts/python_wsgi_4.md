title: Python WSGI教程(四)——可迭代响应对象
tags:
  - python
  - 翻译
id: 124
categories:
  - python
date: 2015-01-23 19:14:11
---

**可迭代响应对象：Response Iterable**
在之前正常工作的脚本中如果把最后一句的返回语句从原来的形式：
```python
return [response_body]
```
改为不放在列表中的形式：
```python
return response_body
```
如果我们再次运行，就会发现运行的速度变慢了。原因是服务器仍会将返回的结果作为可迭代对象来迭代访问，但现在实际放回的是一个字符串，于是服务器就会迭代这个字符串，然后每次只把一个字节发送给客户端。所以为了更好的性能，请不要忘记将返回的响应放在一个可迭代容器中（如列表）。
<!--more-->
如果返回的迭代对象访问时会产生多个字符串，则content_length应该设置为所有字符串的长度之和。如下面代码所示：

```python
#! /usr/bin/env python

from wsgiref.simple_server import make_server

def application(environ, start_response):

   response_body = ['%s: %s' % (key, value)
                    for key, value in sorted(environ.items())]
   response_body = '\n'.join(response_body)

   # 响应体现在有多个字符串
   response_body = ['The Beggining\n',
                    '*' * 30 + '\n',
                    response_body,
                    '\n' + '*' * 30 ,
                    '\nThe End']

   # 把content_length设置为所有字符串的总长
   content_length = 0
   for s in response_body:
      content_length += len(s)

   status = '200 OK'
   response_headers = [('Content-Type', 'text/plain'),
                  ('Content-Length', str(content_length))]
   start_response(status, response_headers)

   return response_body

httpd = make_server('localhost', 8051, application)
httpd.handle_request()
```
