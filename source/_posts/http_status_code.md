title: HTTP常见状态码
id: 148
categories:
  - network
date: 2015-02-08 23:06:12
tags:
  - network
  - http
---

学习一下HTTP的状态码，这里记录一写常见的状态码。在[这里](http://www.daqianduan.com/4280.html)有一份详细完备的状态码列表。

| 状态码     |     信息 |   含义   |
| :--------: | :--------:| :------: |
|200|OK|一切正常，响应体跟在后面|
|202|Accepted|已接受请求但处理尚未完成|
|204|No content|无新文档，浏览器可显示原来的文档|
|301|Moved Permanently|请求的文档在其他地方，新URL在Location头中给出，浏览器跳转|
|304|Not Modified|客户端对有缓存的文档发出条件请求。服务器告诉客户原来缓冲的文档仍可用|
|400|Bad Request|请求出现语法错误|
|403|Unauthorized|资源不可用。服务器理解客户端请求，但拒绝处理，通常由权限设置导致|
|404|Not Found|无法找到指定位置的资源|
|500|Internal Server Error|服务器遇到未知错误，不能完成客户的请求|
|502|Bad Gateway|服务器作为网管或者代理，为了完成请求访问下一个服务器，但该服务器返回了非法的应答|

