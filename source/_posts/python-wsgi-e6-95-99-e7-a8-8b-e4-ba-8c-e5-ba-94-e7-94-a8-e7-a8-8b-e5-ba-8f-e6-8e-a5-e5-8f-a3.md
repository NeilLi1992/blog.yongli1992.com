title: Python WSGI教程(二)——应用程序接口
tags:
  - python
  - 翻译
id: 121
categories:
  - Python
date: 2015-01-23 16:57:42
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=4c16666e-b2bf-41f9-8b92-f36835a5fb28)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`收集` `翻译` `python` `eat.wordpress.post` 
</div><div >

**应用程序接口：Application Interface** 

WSGI应用接口实现为一个可调用对象：函数，方法，类或者任何一个实现了__call__方法的对象。该可调用对象应满足下述条件：

*   必须接收两个位置参数：

        1.  一个包含了CGI环境变量的字典
    2.  一个可调用函数对象，让应用程序调用来向服务器提交HTTP状态码和HTTP响应头。
*   必须向服务器Return包装在可迭代对象中的字符串（一个或多个）。
    <!--more-->
    应用程序的基本骨架大致如下：

</div><div >

    <span  style="color: #75715e;"># 这是我们的应用对象。 它可以采用任何名字来命名,</span>
    <span  style="color: #75715e;"># 但当在Apache中使用mod_wsgi来运行时则必须命名为application</span>
    <span  style="color: #75715e;"># 必须接收两个参数：</span>
    <span  style="color: #75715e;">#   一为包含了CGI环境变量的环境字典，由服务器对来自客户端的每一次请求而生成。</span>
    <span  style="color: #75715e;">#   二为由服务器提供的一个回调函数，可以调用以向服务器返回HTTP状态码和HTTP响应头。</span>
    <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">application</span><span  style="color: #f8f8f2;">(environ, start_response)</span>:</span>

       <span  style="color: #75715e;"># 在这里我们利用环境字典中的信息生成一个简单的响应体。</span>
       response_body = <span  style="color: #e6db74;">'The request method was %s'</span> % environ[<span  style="color: #e6db74;">'REQUEST_METHOD'</span>]

       <span  style="color: #75715e;"># HTTP 响应吗</span>
       status = <span  style="color: #e6db74;">'200 OK'</span>

       <span  style="color: #75715e;"># 这里是客户端需要的HTTP响应头，必须按一个个元组对的形式存放在一个列表中。</span>
       <span  style="color: #75715e;"># 如：[(响应头名称, 响应头值)].</span>
       response_headers = [(<span  style="color: #e6db74;">'Content-Type'</span>, <span  style="color: #e6db74;">'text/plain'</span>),
                           (<span  style="color: #e6db74;">'Content-Length'</span>, str(len(response_body)))]

       <span  style="color: #75715e;"># 使用由服务器提供的这个start_resposne回调函数来提交状态码和响应头</span>
       start_response(status, response_headers)

       <span  style="color: #75715e;"># 在这里利用return来返回真正的响应体</span>
       <span  style="color: #75715e;"># 请注意响应体在这里被包装在一个列表中。实际上WSGI要求它存放在一个可迭代对象中即可，不一定要是列表。</span>
       <span  style="color: #f92672;">return</span> [response_body]
</div><div ></div></div><center style='display:none'>@%28%u6536%u96C6%29%5B%u7FFB%u8BD1%7Cpython%7Ceat.wordpress.post%5D%0A%23Python%20WSGI%u6559%u7A0B%28%u4E8C%29%u2014%u2014%u5E94%u7528%u7A0B%u5E8F%u63A5%u53E3%0A**%u5E94%u7528%u7A0B%u5E8F%u63A5%u53E3%uFF1AApplication%20Interface**%0AWSGI%u5E94%u7528%u63A5%u53E3%u5B9E%u73B0%u4E3A%u4E00%u4E2A%u53EF%u8C03%u7528%u5BF9%u8C61%uFF1A%u51FD%u6570%uFF0C%u65B9%u6CD5%uFF0C%u7C7B%u6216%u8005%u4EFB%u4F55%u4E00%u4E2A%u5B9E%u73B0%u4E86%5C_%5C_call%5C_%5C_%u65B9%u6CD5%u7684%u5BF9%u8C61%u3002%u8BE5%u53EF%u8C03%u7528%u5BF9%u8C61%u5E94%u6EE1%u8DB3%u4E0B%u8FF0%u6761%u4EF6%uFF1A%0A-%20%u5FC5%u987B%u63A5%u6536%u4E24%u4E2A%u4F4D%u7F6E%u53C2%u6570%uFF1A%0A%091.%20%u4E00%u4E2A%u5305%u542B%u4E86CGI%u73AF%u5883%u53D8%u91CF%u7684%u5B57%u5178%0A%092.%20%u4E00%u4E2A%u53EF%u8C03%u7528%u51FD%u6570%u5BF9%u8C61%uFF0C%u8BA9%u5E94%u7528%u7A0B%u5E8F%u8C03%u7528%u6765%u5411%u670D%u52A1%u5668%u63D0%u4EA4HTTP%u72B6%u6001%u7801%u548CHTTP%u54CD%u5E94%u5934%u3002%0A-%20%u5FC5%u987B%u5411%u670D%u52A1%u5668Return%u5305%u88C5%u5728%u53EF%u8FED%u4EE3%u5BF9%u8C61%u4E2D%u7684%u5B57%u7B26%u4E32%uFF08%u4E00%u4E2A%u6216%u591A%u4E2A%uFF09%u3002%0A%3C%21--more--%3E%0A%u5E94%u7528%u7A0B%u5E8F%u7684%u57FA%u672C%u9AA8%u67B6%u5927%u81F4%u5982%u4E0B%uFF1A%0A%0A%60%60%60python%0A%23%20%u8FD9%u662F%u6211%u4EEC%u7684%u5E94%u7528%u5BF9%u8C61%u3002%20%u5B83%u53EF%u4EE5%u91C7%u7528%u4EFB%u4F55%u540D%u5B57%u6765%u547D%u540D%2C%0A%23%20%u4F46%u5F53%u5728Apache%u4E2D%u4F7F%u7528mod_wsgi%u6765%u8FD0%u884C%u65F6%u5219%u5FC5%u987B%u547D%u540D%u4E3Aapplication%0A%23%20%u5FC5%u987B%u63A5%u6536%u4E24%u4E2A%u53C2%u6570%uFF1A%0A%23%20%09%u4E00%u4E3A%u5305%u542B%u4E86CGI%u73AF%u5883%u53D8%u91CF%u7684%u73AF%u5883%u5B57%u5178%uFF0C%u7531%u670D%u52A1%u5668%u5BF9%u6765%u81EA%u5BA2%u6237%u7AEF%u7684%u6BCF%u4E00%u6B21%u8BF7%u6C42%u800C%u751F%u6210%u3002%0A%23%09%u4E8C%u4E3A%u7531%u670D%u52A1%u5668%u63D0%u4F9B%u7684%u4E00%u4E2A%u56DE%u8C03%u51FD%u6570%uFF0C%u53EF%u4EE5%u8C03%u7528%u4EE5%u5411%u670D%u52A1%u5668%u8FD4%u56DEHTTP%u72B6%u6001%u7801%u548CHTTP%u54CD%u5E94%u5934%u3002%0Adef%20application%28environ%2C%20start_response%29%3A%0A%0A%20%20%20%23%20%u5728%u8FD9%u91CC%u6211%u4EEC%u5229%u7528%u73AF%u5883%u5B57%u5178%u4E2D%u7684%u4FE1%u606F%u751F%u6210%u4E00%u4E2A%u7B80%u5355%u7684%u54CD%u5E94%u4F53%u3002%0A%20%20%20response_body%20%3D%20%27The%20request%20method%20was%20%25s%27%20%25%20environ%5B%27REQUEST_METHOD%27%5D%0A%0A%20%20%20%23%20HTTP%20%u54CD%u5E94%u5417%0A%20%20%20status%20%3D%20%27200%20OK%27%0A%0A%20%20%20%23%20%u8FD9%u91CC%u662F%u5BA2%u6237%u7AEF%u9700%u8981%u7684HTTP%u54CD%u5E94%u5934%uFF0C%u5FC5%u987B%u6309%u4E00%u4E2A%u4E2A%u5143%u7EC4%u5BF9%u7684%u5F62%u5F0F%u5B58%u653E%u5728%u4E00%u4E2A%u5217%u8868%u4E2D%u3002%0A%20%20%20%23%20%u5982%uFF1A%5B%28%u54CD%u5E94%u5934%u540D%u79F0%2C%20%u54CD%u5E94%u5934%u503C%29%5D.%0A%20%20%20response_headers%20%3D%20%5B%28%27Content-Type%27%2C%20%27text/plain%27%29%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%28%27Content-Length%27%2C%20str%28len%28response_body%29%29%29%5D%0A%0A%20%20%20%23%20%u4F7F%u7528%u7531%u670D%u52A1%u5668%u63D0%u4F9B%u7684%u8FD9%u4E2Astart_resposne%u56DE%u8C03%u51FD%u6570%u6765%u63D0%u4EA4%u72B6%u6001%u7801%u548C%u54CD%u5E94%u5934%0A%20%20%20start_response%28status%2C%20response_headers%29%0A%0A%20%20%20%23%20%u5728%u8FD9%u91CC%u5229%u7528return%u6765%u8FD4%u56DE%u771F%u6B63%u7684%u54CD%u5E94%u4F53%0A%20%20%20%23%20%u8BF7%u6CE8%u610F%u54CD%u5E94%u4F53%u5728%u8FD9%u91CC%u88AB%u5305%u88C5%u5728%u4E00%u4E2A%u5217%u8868%u4E2D%u3002%u5B9E%u9645%u4E0AWSGI%u8981%u6C42%u5B83%u5B58%u653E%u5728%u4E00%u4E2A%u53EF%u8FED%u4EE3%u5BF9%u8C61%u4E2D%u5373%u53EF%uFF0C%u4E0D%u4E00%u5B9A%u8981%u662F%u5217%u8868%u3002%0A%20%20%20return%20%5Bresponse_body%5D%0A%60%60%60</center>