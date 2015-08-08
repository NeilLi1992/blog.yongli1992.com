title: Python WSGI教程(五)——解析Get请求
tags:
  - python
  - 翻译
id: 128
categories:
  - python
date: 2015-01-23 23:32:58
---

**解析Get请求：Parsing the Request - Get**
再次运行environment.py，这一次在浏览器中输入下面的地址：

    http://localhost:8051/?age=10&hobbies=software&hobbies=tunning

请注意这一次在环境字典中输出的变量：*QUERY_STRING* 和 *REQUEST_METHOD *。当请求方法是GET时，表单的变量都会附加在URL中被称为查询字符串的部分来发送。所谓查询字符串即URL中问号（？）之后的全部内容。在此例中查询字符串的值即为age=10&hobbies=software&hobbies=tunning。请注意hobbies变量出现了两次，这是有可能的，比如表单中存在复选框或者用户直接在URL中故意输入重复的查询键。
<!--more-->
我们可以通过硬编码的形式来从环境变量中取出查询字符串，获取参数值。不过更简单的方法是使用CGI模块的parse_qs函数来直接获得一个字典，其中键为查询字符串中的键，值为列表，存储了查询字符串中对应某个键的所有值。

**永远要当心用户的输入**，处理用户输入来避免潜在的脚本注入。CGI的转义（escape）函数可以达到此目的。

如下所示的代码展示了对GET请求的解析。为了让它正常工作，请保存文件名为parsing_get.wsgi，因为这是我们编写的html表单中action的值。对于运行在使用了mod_wsgi模块的apache服务器上的主程序(main)脚本来说，wsgi文件扩展名是非常常用的。

```python
#!/usr/bin/env python

from wsgiref.simple_server import make_server
from cgi import parse_qs, escape

html = """
<html>
<body>
   <form method="get" action="parsing_get.wsgi">
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
</html>"""

def application(environ, start_response):

   # 解析后直接返回一个字典，每个值都是一个列表，包含了查询字符串中所有对应于该键的值
   d = parse_qs(environ['QUERY_STRING'])

   # 调用字典的get方法并传入一个key不存在时返回的默认值，这样可以在第一次显示表单时也给出合理的值
   age = d.get('age', [''])[0] # 返回第一个age值.
   hobbies = d.get('hobbies', []) # 返回一个hobbies列表.

   # 总是对用户输入进行转义来避免脚本注入
   age = escape(age)
   hobbies = [escape(hobby) for hobby in hobbies]

   response_body = html % (age or 'Empty',
               ', '.join(hobbies or ['No Hobbies']))

   status = '200 OK'

   # 修改 content type 为 text/html
   response_headers = [('Content-Type', 'text/html'),
                  ('Content-Length', str(len(response_body)))]
   start_response(status, response_headers)

   return [response_body]

httpd = make_server('localhost', 8051, application)
# 这里我们改为调用serve_forever()而不是原来的handle_request()，以保持服务器不停监听。
# 在Windows中你可以在任务管理器中kill掉python.exe进程来结束运行。
# 在Linux/Mac OS系统中按下CTRL+C来终止运行。
httpd.serve_forever()
```
