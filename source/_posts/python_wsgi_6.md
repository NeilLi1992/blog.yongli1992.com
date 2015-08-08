title: Python WSGI教程(六)——解析Post请求
tags:
  - python
  - 翻译
id: 130
categories:
  - python
date: 2015-01-23 23:47:21
---

**解析Post请求：Parsing the Request - Post**
当请求类型是POST时，查询字符串不再通过URL传递，而是包含在HTTP请求体之中来传递。请求体在环境字典中保存为键为“wsgi.input”对应的一个类文件变量。

为了从wsgi.input中读出请求体，有必要先知道请求体的长度，即CONTENT_LENGTH变量。WSGI规范中指出，存放有请求体大小的这一CONTENT_LENGTH变量是不可靠的，有可能是空值，或者直接缺失，所以获取时应采用try/except语法块来进行异常防错。
<!--more-->
如下所示的脚本应保存为parsing_post.wsgi，因为这是表单action属性的值。

```python
#!/usr/bin/env python

from wsgiref.simple_server import make_server
from cgi import parse_qs, escape

html = """
<html>
<body>
   <form method="post" action="parsing_post.wsgi">
      <p>
         Age: <input type="text" name="age">
         </p>
      <p>
         Hobbies:
         <input name="hobbies" type="checkbox" value="software"> Software
         <input name="hobbies" type="checkbox" value="tunning"> Auto Tunning
         </p>
      <p>
         <input type="submit" value="Submit">
         </p>
      </form>
   <p>
      Age: %s<br>
      Hobbies: %s
      </p>
   </body>
</html>
"""

def application(environ, start_response):

   # 环境变量CONTENT_LENGTH可能为空值或缺失，采用try/except来防错
   try:
      request_body_size = int(environ.get('CONTENT_LENGTH', 0))
   except (ValueError):
      request_body_size = 0

   # 当请求方法为POST时查询字符串被放在HTTP请求体中进行传递。它被WSGI服务器具体存放在名为wsgi.input的一个类文件环境变量中。
   request_body = environ['wsgi.input'].read(request_body_size)
   d = parse_qs(request_body)

   age = d.get('age', [''])[0] # 返回第一个age值。
   hobbies = d.get('hobbies', []) # 返回一个hobbies列表。

   # 总是对用户输入进行转义来避免脚本注入。
   age = escape(age)
   hobbies = [escape(hobby) for hobby in hobbies]

   response_body = html % (age or 'Empty',
               ', '.join(hobbies or ['No Hobbies']))

   status = '200 OK'

   response_headers = [('Content-Type', 'text/html'),
                  ('Content-Length', str(len(response_body)))]
   start_response(status, response_headers)

   return [response_body]

httpd = make_server('localhost', 8051, application)
httpd.serve_forever()
```

***
**结束**
这篇教程涉及到WSGI规范的部分就这么多，翻译到此为止。该教程中还涵盖了一些关于通用CGI和Apache mod_python模块的内容，以后有机会待我学习到了再做翻译。
