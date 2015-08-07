title: Python WSGI教程(三)——环境字典
tags:
  - python
  - 翻译
id: 119
categories:
  - Python
date: 2015-01-23 16:58:52
---

<del style="position: relative; display: block;">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=301514d3-5123-4eec-a799-9f7640b33c9b)</del>
<div style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
<div></div>
<div>

`收集` `翻译` `python` `eat.wordpress.post`

</div>
<div>

**环境字典：Environment dictionary**
环境字典会包含一些CGI环境变量，由服务器在接收到每一次来自客户端的请求时产生。下面的脚本代码会输出整个字典的内容。
<!--more-->

</div>
<div>

    <span style="color: #75715e;">#! /usr/bin/env python</span>

    <span style="color: #75715e;"># 使用python内置的WSGI服务器</span>
    <span style="color: #f92672;">from</span> wsgiref.simple_server <span style="color: #f92672;">import</span> make_server

    <span style="color: #f92672;"><span style="color: #66d9ef;">def</span> <span style="color: #a6e22e;">application</span><span style="color: #f8f8f2;">(environ, start_response)</span>:</span>
       <span style="color: #75715e;"># 排序并将环境字典的键值对转换为字符串</span>
       response_body = [<span style="color: #e6db74;">'%s: %s'</span> % (key, value)
                        <span style="color: #f92672;">for</span> key, value <span style="color: #f92672;">in</span> sorted(environ.items())]
       response_body = <span style="color: #e6db74;">'\n'</span>.join(response_body)

       status = <span style="color: #e6db74;">'200 OK'</span>
       response_headers = [(<span style="color: #e6db74;">'Content-Type'</span>, <span style="color: #e6db74;">'text/plain'</span>),
                      (<span style="color: #e6db74;">'Content-Length'</span>, str(len(response_body)))]
       start_response(status, response_headers)

       <span style="color: #f92672;">return</span> [response_body]

    <span style="color: #75715e;"># 实例化一个WSGI服务器对象。</span>
    <span style="color: #75715e;"># 该服务器对象可以接收来自客户端（我们的浏览器）的请求，将它传给应用程序，</span>
    <span style="color: #75715e;"># 并且将应用程序返回过来的响应再发送给客户端。</span>
    httpd = make_server(
       <span style="color: #e6db74;">'localhost'</span>, <span style="color: #75715e;"># 主机名。</span>
       <span style="color: #ae81ff;">8051</span>, <span style="color: #75715e;"># 监听请求的端口号。</span>
       application <span style="color: #75715e;"># 我们的可调用应用对象，在这里是一个函数。</span>
       )

    <span style="color: #75715e;"># 在这里简单地一次性监听，得到响应后处理完则直接退出。</span>
    httpd.handle_request()`</pre>

    要运行这段脚本代码的话，将其保存为environment.py，然后打开终端，进入脚本所在的目录下，输入：

    </div>
    <div>
    <pre style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`&gt;&gt;&gt;python environment.py`</pre>

    如果是在Windows系统的话，需要将python.exe的路径添加到系统环境变量路径中。最后我们打开浏览器，在地址栏输入我们的服务器运行的地址和端口号即可看到结果：

    <pre style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 10px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start;">`http://localhost:8051/

</div>
<div></div>
</div>
<center style="display: none;">@%28%u6536%u96C6%29%5B%u7FFB%u8BD1%7Cpython%7Ceat.wordpress.post%5D%0A%23Python%20WSGI%u6559%u7A0B%28%u4E09%29%u2014%u2014%u73AF%u5883%u5B57%u5178%0A**%u73AF%u5883%u5B57%u5178%uFF1AEnvironment%20dictionary**%0A%u73AF%u5883%u5B57%u5178%u4F1A%u5305%u542B%u4E00%u4E9BCGI%u73AF%u5883%u53D8%u91CF%uFF0C%u7531%u670D%u52A1%u5668%u5728%u63A5%u6536%u5230%u6BCF%u4E00%u6B21%u6765%u81EA%u5BA2%u6237%u7AEF%u7684%u8BF7%u6C42%u65F6%u4EA7%u751F%u3002%u4E0B%u9762%u7684%u811A%u672C%u4EE3%u7801%u4F1A%u8F93%u51FA%u6574%u4E2A%u5B57%u5178%u7684%u5185%u5BB9%u3002%0A%3C%21--more--%3E%0A%60%60%60python%0A%23%21%20/usr/bin/env%20python%0A%0A%23%20%u4F7F%u7528python%u5185%u7F6E%u7684WSGI%u670D%u52A1%u5668%0Afrom%20wsgiref.simple_server%20import%20make_server%0A%0Adef%20application%28environ%2C%20start_response%29%3A%0A%20%20%20%23%20%u6392%u5E8F%u5E76%u5C06%u73AF%u5883%u5B57%u5178%u7684%u952E%u503C%u5BF9%u8F6C%u6362%u4E3A%u5B57%u7B26%u4E32%0A%20%20%20response_body%20%3D%20%5B%27%25s%3A%20%25s%27%20%25%20%28key%2C%20value%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20for%20key%2C%20value%20in%20sorted%28environ.items%28%29%29%5D%0A%20%20%20response_body%20%3D%20%27%5Cn%27.join%28response_body%29%0A%0A%20%20%20status%20%3D%20%27200%20OK%27%0A%20%20%20response_headers%20%3D%20%5B%28%27Content-Type%27%2C%20%27text/plain%27%29%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%28%27Content-Length%27%2C%20str%28len%28response_body%29%29%29%5D%0A%20%20%20start_response%28status%2C%20response_headers%29%0A%0A%20%20%20return%20%5Bresponse_body%5D%0A%0A%23%20%u5B9E%u4F8B%u5316%u4E00%u4E2AWSGI%u670D%u52A1%u5668%u5BF9%u8C61%u3002%0A%23%20%u8BE5%u670D%u52A1%u5668%u5BF9%u8C61%u53EF%u4EE5%u63A5%u6536%u6765%u81EA%u5BA2%u6237%u7AEF%uFF08%u6211%u4EEC%u7684%u6D4F%u89C8%u5668%uFF09%u7684%u8BF7%u6C42%uFF0C%u5C06%u5B83%u4F20%u7ED9%u5E94%u7528%u7A0B%u5E8F%uFF0C%0A%23%20%u5E76%u4E14%u5C06%u5E94%u7528%u7A0B%u5E8F%u8FD4%u56DE%u8FC7%u6765%u7684%u54CD%u5E94%u518D%u53D1%u9001%u7ED9%u5BA2%u6237%u7AEF%u3002%0Ahttpd%20%3D%20make_server%28%0A%20%20%20%27localhost%27%2C%20%23%20%u4E3B%u673A%u540D%u3002%0A%20%20%208051%2C%20%23%20%u76D1%u542C%u8BF7%u6C42%u7684%u7AEF%u53E3%u53F7%u3002%0A%20%20%20application%20%23%20%u6211%u4EEC%u7684%u53EF%u8C03%u7528%u5E94%u7528%u5BF9%u8C61%uFF0C%u5728%u8FD9%u91CC%u662F%u4E00%u4E2A%u51FD%u6570%u3002%0A%20%20%20%29%0A%0A%23%20%u5728%u8FD9%u91CC%u7B80%u5355%u5730%u4E00%u6B21%u6027%u76D1%u542C%uFF0C%u5F97%u5230%u54CD%u5E94%u540E%u5904%u7406%u5B8C%u5219%u76F4%u63A5%u9000%u51FA%u3002%0Ahttpd.handle_request%28%29%0A%60%60%60%0A%u8981%u8FD0%u884C%u8FD9%u6BB5%u811A%u672C%u4EE3%u7801%u7684%u8BDD%uFF0C%u5C06%u5176%u4FDD%u5B58%u4E3Aenvironment.py%uFF0C%u7136%u540E%u6253%u5F00%u7EC8%u7AEF%uFF0C%u8FDB%u5165%u811A%u672C%u6240%u5728%u7684%u76EE%u5F55%u4E0B%uFF0C%u8F93%u5165%uFF1A%0A%60%60%60bash%0A%3E%3E%3Epython%20environment.py%0A%60%60%60%0A%u5982%u679C%u662F%u5728Windows%u7CFB%u7EDF%u7684%u8BDD%uFF0C%u9700%u8981%u5C06python.exe%u7684%u8DEF%u5F84%u6DFB%u52A0%u5230%u7CFB%u7EDF%u73AF%u5883%u53D8%u91CF%u8DEF%u5F84%u4E2D%u3002%u6700%u540E%u6211%u4EEC%u6253%u5F00%u6D4F%u89C8%u5668%uFF0C%u5728%u5730%u5740%u680F%u8F93%u5165%u6211%u4EEC%u7684%u670D%u52A1%u5668%u8FD0%u884C%u7684%u5730%u5740%u548C%u7AEF%u53E3%u53F7%u5373%u53EF%u770B%u5230%u7ED3%u679C%uFF1A%0A%0A%20%20%20%20http%3A//localhost%3A8051/</center>