title: Python WSGI教程(二)——应用程序接口
tags:
  - python
  - 翻译
id: 121
categories:
  - python
date: 2015-01-23 16:57:42
---

**应用程序接口：Application Interface**
WSGI应用接口实现为一个可调用对象：函数，方法，类或者任何一个实现了\_\_call\_\_方法的对象。该可调用对象应满足下述条件：
- 必须接收两个位置参数：
	1. 一个包含了CGI环境变量的字典
	2. 一个可调用函数对象，让应用程序调用来向服务器提交HTTP状态码和HTTP响应头。
- 必须向服务器Return包装在可迭代对象中的字符串（一个或多个）。
<!--more-->
应用程序的基本骨架大致如下：

```python
# 这是我们的应用对象。 它可以采用任何名字来命名,
# 但当在Apache中使用mod_wsgi来运行时则必须命名为application
# 必须接收两个参数：
# 	一为包含了CGI环境变量的环境字典，由服务器对来自客户端的每一次请求而生成。
#	二为由服务器提供的一个回调函数，可以调用以向服务器返回HTTP状态码和HTTP响应头。
def application(environ, start_response):

   # 在这里我们利用环境字典中的信息生成一个简单的响应体。
   response_body = 'The request method was %s' % environ['REQUEST_METHOD']

   # HTTP 响应吗
   status = '200 OK'

   # 这里是客户端需要的HTTP响应头，必须按一个个元组对的形式存放在一个列表中。
   # 如：[(响应头名称, 响应头值)].
   response_headers = [('Content-Type', 'text/plain'),
                       ('Content-Length', str(len(response_body)))]

   # 使用由服务器提供的这个start_resposne回调函数来提交状态码和响应头
   start_response(status, response_headers)

   # 在这里利用return来返回真正的响应体
   # 请注意响应体在这里被包装在一个列表中。实际上WSGI要求它存放在一个可迭代对象中即可，不一定要是列表。
   return [response_body]
```
