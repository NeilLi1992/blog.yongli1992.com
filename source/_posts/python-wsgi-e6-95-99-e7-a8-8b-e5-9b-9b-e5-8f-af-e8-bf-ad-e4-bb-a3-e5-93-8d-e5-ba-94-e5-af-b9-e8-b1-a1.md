title: Python WSGI教程(四)——可迭代响应对象
tags:
  - python
  - 翻译
id: 124
categories:
  - Python
date: 2015-01-23 19:14:11
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=edd2110c-ffe2-4dd9-b46f-295400ed6406)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`收集` `翻译` `python` `eat.wordpress.post` 

</div><div >

**可迭代响应对象：Response Iterable** 

在之前正常工作的脚本中如果把最后一句的返回语句从原来的形式：

</div><div >

    <span  style="color: #f92672;">return</span> [response_body]`</pre>

    改为不放在列表中的形式：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f92672;">return</span> response_body`</pre>

    如果我们再次运行，就会发现运行的速度变慢了。原因是服务器仍会将返回的结果作为可迭代对象来迭代访问，但现在实际放回的是一个字符串，于是服务器就会迭代这个字符串，然后每次只把一个字节发送给客户端。所以为了更好的性能，请不要忘记将返回的响应放在一个可迭代容器中（如列表）。 

    <!--more--> 

    如果返回的迭代对象访问时会产生多个字符串，则content_length应该设置为所有字符串的长度之和。如下面代码所示：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #75715e;">#! /usr/bin/env python</span>

    <span  style="color: #f92672;">from</span> wsgiref.simple_server <span  style="color: #f92672;">import</span> make_server

    <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">application</span><span  style="color: #f8f8f2;">(environ, start_response)</span>:</span>

       response_body = [<span  style="color: #e6db74;">'%s: %s'</span> % (key, value)
                        <span  style="color: #f92672;">for</span> key, value <span  style="color: #f92672;">in</span> sorted(environ.items())]
       response_body = <span  style="color: #e6db74;">'\n'</span>.join(response_body)

       <span  style="color: #75715e;"># 响应体现在有多个字符串</span>
       response_body = [<span  style="color: #e6db74;">'The Beggining\n'</span>,
                        <span  style="color: #e6db74;">'*'</span> * <span  style="color: #ae81ff;">30</span> + <span  style="color: #e6db74;">'\n'</span>,
                        response_body,
                        <span  style="color: #e6db74;">'\n'</span> + <span  style="color: #e6db74;">'*'</span> * <span  style="color: #ae81ff;">30</span> ,
                        <span  style="color: #e6db74;">'\nThe End'</span>]

       <span  style="color: #75715e;"># 把content_length设置为所有字符串的总长</span>
       content_length = <span  style="color: #ae81ff;">0</span>
       <span  style="color: #f92672;">for</span> s <span  style="color: #f92672;">in</span> response_body:
          content_length += len(s)

       status = <span  style="color: #e6db74;">'200 OK'</span>
       response_headers = [(<span  style="color: #e6db74;">'Content-Type'</span>, <span  style="color: #e6db74;">'text/plain'</span>),
                      (<span  style="color: #e6db74;">'Content-Length'</span>, str(content_length))]
       start_response(status, response_headers)

       <span  style="color: #f92672;">return</span> response_body

    httpd = make_server(<span  style="color: #e6db74;">'localhost'</span>, <span  style="color: #ae81ff;">8051</span>, application)
    httpd.handle_request()
</div><div ></div></div><center style='display:none'>@%28%u6536%u96C6%29%5B%u7FFB%u8BD1%7Cpython%7Ceat.wordpress.post%5D%0A%23Python%20WSGI%u6559%u7A0B%28%u56DB%29%u2014%u2014%u53EF%u8FED%u4EE3%u54CD%u5E94%u5BF9%u8C61%0A**%u53EF%u8FED%u4EE3%u54CD%u5E94%u5BF9%u8C61%uFF1AResponse%20Iterable**%0A%u5728%u4E4B%u524D%u6B63%u5E38%u5DE5%u4F5C%u7684%u811A%u672C%u4E2D%u5982%u679C%u628A%u6700%u540E%u4E00%u53E5%u7684%u8FD4%u56DE%u8BED%u53E5%u4ECE%u539F%u6765%u7684%u5F62%u5F0F%uFF1A%0A%60%60%60python%0Areturn%20%5Bresponse_body%5D%0A%60%60%60%0A%u6539%u4E3A%u4E0D%u653E%u5728%u5217%u8868%u4E2D%u7684%u5F62%u5F0F%uFF1A%0A%60%60%60python%0Areturn%20response_body%0A%60%60%60%0A%u5982%u679C%u6211%u4EEC%u518D%u6B21%u8FD0%u884C%uFF0C%u5C31%u4F1A%u53D1%u73B0%u8FD0%u884C%u7684%u901F%u5EA6%u53D8%u6162%u4E86%u3002%u539F%u56E0%u662F%u670D%u52A1%u5668%u4ECD%u4F1A%u5C06%u8FD4%u56DE%u7684%u7ED3%u679C%u4F5C%u4E3A%u53EF%u8FED%u4EE3%u5BF9%u8C61%u6765%u8FED%u4EE3%u8BBF%u95EE%uFF0C%u4F46%u73B0%u5728%u5B9E%u9645%u653E%u56DE%u7684%u662F%u4E00%u4E2A%u5B57%u7B26%u4E32%uFF0C%u4E8E%u662F%u670D%u52A1%u5668%u5C31%u4F1A%u8FED%u4EE3%u8FD9%u4E2A%u5B57%u7B26%u4E32%uFF0C%u7136%u540E%u6BCF%u6B21%u53EA%u628A%u4E00%u4E2A%u5B57%u8282%u53D1%u9001%u7ED9%u5BA2%u6237%u7AEF%u3002%u6240%u4EE5%u4E3A%u4E86%u66F4%u597D%u7684%u6027%u80FD%uFF0C%u8BF7%u4E0D%u8981%u5FD8%u8BB0%u5C06%u8FD4%u56DE%u7684%u54CD%u5E94%u653E%u5728%u4E00%u4E2A%u53EF%u8FED%u4EE3%u5BB9%u5668%u4E2D%uFF08%u5982%u5217%u8868%uFF09%u3002%0A%3C%21--more--%3E%0A%u5982%u679C%u8FD4%u56DE%u7684%u8FED%u4EE3%u5BF9%u8C61%u8BBF%u95EE%u65F6%u4F1A%u4EA7%u751F%u591A%u4E2A%u5B57%u7B26%u4E32%uFF0C%u5219content_length%u5E94%u8BE5%u8BBE%u7F6E%u4E3A%u6240%u6709%u5B57%u7B26%u4E32%u7684%u957F%u5EA6%u4E4B%u548C%u3002%u5982%u4E0B%u9762%u4EE3%u7801%u6240%u793A%uFF1A%0A%0A%60%60%60python%0A%23%21%20/usr/bin/env%20python%0A%0Afrom%20wsgiref.simple_server%20import%20make_server%0A%0Adef%20application%28environ%2C%20start_response%29%3A%0A%0A%20%20%20response_body%20%3D%20%5B%27%25s%3A%20%25s%27%20%25%20%28key%2C%20value%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20for%20key%2C%20value%20in%20sorted%28environ.items%28%29%29%5D%0A%20%20%20response_body%20%3D%20%27%5Cn%27.join%28response_body%29%0A%0A%20%20%20%23%20%u54CD%u5E94%u4F53%u73B0%u5728%u6709%u591A%u4E2A%u5B57%u7B26%u4E32%0A%20%20%20response_body%20%3D%20%5B%27The%20Beggining%5Cn%27%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%27*%27%20*%2030%20+%20%27%5Cn%27%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20response_body%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%27%5Cn%27%20+%20%27*%27%20*%2030%20%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%27%5CnThe%20End%27%5D%0A%0A%20%20%20%23%20%u628Acontent_length%u8BBE%u7F6E%u4E3A%u6240%u6709%u5B57%u7B26%u4E32%u7684%u603B%u957F%0A%20%20%20content_length%20%3D%200%0A%20%20%20for%20s%20in%20response_body%3A%0A%20%20%20%20%20%20content_length%20+%3D%20len%28s%29%0A%0A%20%20%20status%20%3D%20%27200%20OK%27%0A%20%20%20response_headers%20%3D%20%5B%28%27Content-Type%27%2C%20%27text/plain%27%29%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%28%27Content-Length%27%2C%20str%28content_length%29%29%5D%0A%20%20%20start_response%28status%2C%20response_headers%29%0A%0A%20%20%20return%20response_body%0A%0Ahttpd%20%3D%20make_server%28%27localhost%27%2C%208051%2C%20application%29%0Ahttpd.handle_request%28%29%0A%60%60%60</center>