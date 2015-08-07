title: Python WSGI教程(六)——解析Post请求
tags:
  - python
  - 翻译
id: 130
categories:
  - Python
date: 2015-01-23 23:47:21
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=52057d0b-befa-4120-801c-cd09ef7f6d99)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`收集` `翻译` `python` `eat.wordpress.post` 
</div><div >

**解析Post请求：Parsing the Request - Post** 

当请求类型是POST时，查询字符串不再通过URL传递，而是包含在HTTP请求体之中来传递。请求体在环境字典中保存为键为“wsgi.input”对应的一个类文件变量。

为了从wsgi.input中读出请求体，有必要先知道请求体的长度，即CONTENT_LENGTH变量。WSGI规范中指出，存放有请求体大小的这一CONTENT_LENGTH变量是不可靠的，有可能是空值，或者直接缺失，所以获取时应采用try/except语法块来进行异常防错。 

<!--more--> 

如下所示的脚本应保存为parsing_post.wsgi，因为这是表单action属性的值。
</div><div >

    <span  style="color: #75715e;">#!/usr/bin/env python</span>

    <span  style="color: #f92672;">from</span> wsgiref.simple_server <span  style="color: #f92672;">import</span> make_server
    <span  style="color: #f92672;">from</span> cgi <span  style="color: #f92672;">import</span> parse_qs, escape

    html = <span  style="color: #e6db74;">"""
    &lt;html&gt;
    &lt;body&gt;
       &lt;form method="post" action="parsing_post.wsgi"&gt;
          &lt;p&gt;
             Age: &lt;input type="text" name="age"&gt;
             &lt;/p&gt;
          &lt;p&gt;
             Hobbies:
             &lt;input name="hobbies" type="checkbox" value="software"&gt; Software
             &lt;input name="hobbies" type="checkbox" value="tunning"&gt; Auto Tunning
             &lt;/p&gt;
          &lt;p&gt;
             &lt;input type="submit" value="Submit"&gt;
             &lt;/p&gt;
          &lt;/form&gt;
       &lt;p&gt;
          Age: %s&lt;br&gt;
          Hobbies: %s
          &lt;/p&gt;
       &lt;/body&gt;
    &lt;/html&gt;
    """</span>

    <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">application</span><span  style="color: #f8f8f2;">(environ, start_response)</span>:</span>

       <span  style="color: #75715e;"># 环境变量CONTENT_LENGTH可能为空值或缺失，采用try/except来防错</span>
       <span  style="color: #f92672;">try</span>:
          request_body_size = int(environ.get(<span  style="color: #e6db74;">'CONTENT_LENGTH'</span>, <span  style="color: #ae81ff;">0</span>))
       <span  style="color: #f92672;">except</span> (ValueError):
          request_body_size = <span  style="color: #ae81ff;">0</span>

       <span  style="color: #75715e;"># 当请求方法为POST时查询字符串被放在HTTP请求体中进行传递。它被WSGI服务器具体存放在名为wsgi.input的一个类文件环境变量中。</span>
       request_body = environ[<span  style="color: #e6db74;">'wsgi.input'</span>].read(request_body_size)
       d = parse_qs(request_body)

       age = d.get(<span  style="color: #e6db74;">'age'</span>, [<span  style="color: #e6db74;">''</span>])[<span  style="color: #ae81ff;">0</span>] <span  style="color: #75715e;"># 返回第一个age值。</span>
       hobbies = d.get(<span  style="color: #e6db74;">'hobbies'</span>, []) <span  style="color: #75715e;"># 返回一个hobbies列表。</span>

       <span  style="color: #75715e;"># 总是对用户输入进行转义来避免脚本注入。</span>
       age = escape(age)
       hobbies = [escape(hobby) <span  style="color: #f92672;">for</span> hobby <span  style="color: #f92672;">in</span> hobbies]

       response_body = html % (age <span  style="color: #f92672;">or</span> <span  style="color: #e6db74;">'Empty'</span>,
                   <span  style="color: #e6db74;">', '</span>.join(hobbies <span  style="color: #f92672;">or</span> [<span  style="color: #e6db74;">'No Hobbies'</span>]))

       status = <span  style="color: #e6db74;">'200 OK'</span>

       response_headers = [(<span  style="color: #e6db74;">'Content-Type'</span>, <span  style="color: #e6db74;">'text/html'</span>),
                      (<span  style="color: #e6db74;">'Content-Length'</span>, str(len(response_body)))]
       start_response(status, response_headers)

       <span  style="color: #f92672;">return</span> [response_body]

    httpd = make_server(<span  style="color: #e6db74;">'localhost'</span>, <span  style="color: #ae81ff;">8051</span>, application)
    httpd.serve_forever()

* * *

**结束** 

这篇教程涉及到WSGI规范的部分就这么多，翻译到此为止。该教程中还涵盖了一些关于通用CGI和Apache mod_python模块的内容，以后有机会待我学习到了再做翻译。
</div><div ></div></div><center style='display:none'>@%28%u6536%u96C6%29%5B%u7FFB%u8BD1%7Cpython%7Ceat.wordpress.post%5D%0A%23Python%20WSGI%u6559%u7A0B%28%u516D%29%u2014%u2014%u89E3%u6790Post%u8BF7%u6C42%0A**%u89E3%u6790Post%u8BF7%u6C42%uFF1AParsing%20the%20Request%20-%20Post**%0A%u5F53%u8BF7%u6C42%u7C7B%u578B%u662FPOST%u65F6%uFF0C%u67E5%u8BE2%u5B57%u7B26%u4E32%u4E0D%u518D%u901A%u8FC7URL%u4F20%u9012%uFF0C%u800C%u662F%u5305%u542B%u5728HTTP%u8BF7%u6C42%u4F53%u4E4B%u4E2D%u6765%u4F20%u9012%u3002%u8BF7%u6C42%u4F53%u5728%u73AF%u5883%u5B57%u5178%u4E2D%u4FDD%u5B58%u4E3A%u952E%u4E3A%u201Cwsgi.input%u201D%u5BF9%u5E94%u7684%u4E00%u4E2A%u7C7B%u6587%u4EF6%u53D8%u91CF%u3002%0A%0A%u4E3A%u4E86%u4ECEwsgi.input%u4E2D%u8BFB%u51FA%u8BF7%u6C42%u4F53%uFF0C%u6709%u5FC5%u8981%u5148%u77E5%u9053%u8BF7%u6C42%u4F53%u7684%u957F%u5EA6%uFF0C%u5373CONTENT_LENGTH%u53D8%u91CF%u3002WSGI%u89C4%u8303%u4E2D%u6307%u51FA%uFF0C%u5B58%u653E%u6709%u8BF7%u6C42%u4F53%u5927%u5C0F%u7684%u8FD9%u4E00CONTENT_LENGTH%u53D8%u91CF%u662F%u4E0D%u53EF%u9760%u7684%uFF0C%u6709%u53EF%u80FD%u662F%u7A7A%u503C%uFF0C%u6216%u8005%u76F4%u63A5%u7F3A%u5931%uFF0C%u6240%u4EE5%u83B7%u53D6%u65F6%u5E94%u91C7%u7528try/except%u8BED%u6CD5%u5757%u6765%u8FDB%u884C%u5F02%u5E38%u9632%u9519%u3002%0A%3C%21--more--%3E%0A%u5982%u4E0B%u6240%u793A%u7684%u811A%u672C%u5E94%u4FDD%u5B58%u4E3Aparsing_post.wsgi%uFF0C%u56E0%u4E3A%u8FD9%u662F%u8868%u5355action%u5C5E%u6027%u7684%u503C%u3002%0A%0A%60%60%60python%0A%23%21/usr/bin/env%20python%0A%0Afrom%20wsgiref.simple_server%20import%20make_server%0Afrom%20cgi%20import%20parse_qs%2C%20escape%0A%0Ahtml%20%3D%20%22%22%22%0A%3Chtml%3E%0A%3Cbody%3E%0A%20%20%20%3Cform%20method%3D%22post%22%20action%3D%22parsing_post.wsgi%22%3E%0A%20%20%20%20%20%20%3Cp%3E%0A%20%20%20%20%20%20%20%20%20Age%3A%20%3Cinput%20type%3D%22text%22%20name%3D%22age%22%3E%0A%20%20%20%20%20%20%20%20%20%3C/p%3E%0A%20%20%20%20%20%20%3Cp%3E%0A%20%20%20%20%20%20%20%20%20Hobbies%3A%0A%20%20%20%20%20%20%20%20%20%3Cinput%20name%3D%22hobbies%22%20type%3D%22checkbox%22%20value%3D%22software%22%3E%20Software%0A%20%20%20%20%20%20%20%20%20%3Cinput%20name%3D%22hobbies%22%20type%3D%22checkbox%22%20value%3D%22tunning%22%3E%20Auto%20Tunning%0A%20%20%20%20%20%20%20%20%20%3C/p%3E%0A%20%20%20%20%20%20%3Cp%3E%0A%20%20%20%20%20%20%20%20%20%3Cinput%20type%3D%22submit%22%20value%3D%22Submit%22%3E%0A%20%20%20%20%20%20%20%20%20%3C/p%3E%0A%20%20%20%20%20%20%3C/form%3E%0A%20%20%20%3Cp%3E%0A%20%20%20%20%20%20Age%3A%20%25s%3Cbr%3E%0A%20%20%20%20%20%20Hobbies%3A%20%25s%0A%20%20%20%20%20%20%3C/p%3E%0A%20%20%20%3C/body%3E%0A%3C/html%3E%0A%22%22%22%0A%0Adef%20application%28environ%2C%20start_response%29%3A%0A%0A%20%20%20%23%20%u73AF%u5883%u53D8%u91CFCONTENT_LENGTH%u53EF%u80FD%u4E3A%u7A7A%u503C%u6216%u7F3A%u5931%uFF0C%u91C7%u7528try/except%u6765%u9632%u9519%0A%20%20%20try%3A%0A%20%20%20%20%20%20request_body_size%20%3D%20int%28environ.get%28%27CONTENT_LENGTH%27%2C%200%29%29%0A%20%20%20except%20%28ValueError%29%3A%0A%20%20%20%20%20%20request_body_size%20%3D%200%0A%0A%20%20%20%23%20%u5F53%u8BF7%u6C42%u65B9%u6CD5%u4E3APOST%u65F6%u67E5%u8BE2%u5B57%u7B26%u4E32%u88AB%u653E%u5728HTTP%u8BF7%u6C42%u4F53%u4E2D%u8FDB%u884C%u4F20%u9012%u3002%u5B83%u88ABWSGI%u670D%u52A1%u5668%u5177%u4F53%u5B58%u653E%u5728%u540D%u4E3Awsgi.input%u7684%u4E00%u4E2A%u7C7B%u6587%u4EF6%u73AF%u5883%u53D8%u91CF%u4E2D%u3002%0A%20%20%20request_body%20%3D%20environ%5B%27wsgi.input%27%5D.read%28request_body_size%29%0A%20%20%20d%20%3D%20parse_qs%28request_body%29%0A%0A%20%20%20age%20%3D%20d.get%28%27age%27%2C%20%5B%27%27%5D%29%5B0%5D%20%23%20%u8FD4%u56DE%u7B2C%u4E00%u4E2Aage%u503C%u3002%0A%20%20%20hobbies%20%3D%20d.get%28%27hobbies%27%2C%20%5B%5D%29%20%23%20%u8FD4%u56DE%u4E00%u4E2Ahobbies%u5217%u8868%u3002%0A%0A%20%20%20%23%20%u603B%u662F%u5BF9%u7528%u6237%u8F93%u5165%u8FDB%u884C%u8F6C%u4E49%u6765%u907F%u514D%u811A%u672C%u6CE8%u5165%u3002%0A%20%20%20age%20%3D%20escape%28age%29%0A%20%20%20hobbies%20%3D%20%5Bescape%28hobby%29%20for%20hobby%20in%20hobbies%5D%0A%0A%20%20%20response_body%20%3D%20html%20%25%20%28age%20or%20%27Empty%27%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%27%2C%20%27.join%28hobbies%20or%20%5B%27No%20Hobbies%27%5D%29%29%0A%0A%20%20%20status%20%3D%20%27200%20OK%27%0A%0A%20%20%20response_headers%20%3D%20%5B%28%27Content-Type%27%2C%20%27text/html%27%29%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%28%27Content-Length%27%2C%20str%28len%28response_body%29%29%29%5D%0A%20%20%20start_response%28status%2C%20response_headers%29%0A%0A%20%20%20return%20%5Bresponse_body%5D%0A%0Ahttpd%20%3D%20make_server%28%27localhost%27%2C%208051%2C%20application%29%0Ahttpd.serve_forever%28%29%0A%60%60%60%0A%0A***%0A**%u7ED3%u675F**%0A%u8FD9%u7BC7%u6559%u7A0B%u6D89%u53CA%u5230WSGI%u89C4%u8303%u7684%u90E8%u5206%u5C31%u8FD9%u4E48%u591A%uFF0C%u7FFB%u8BD1%u5230%u6B64%u4E3A%u6B62%u3002%u8BE5%u6559%u7A0B%u4E2D%u8FD8%u6DB5%u76D6%u4E86%u4E00%u4E9B%u5173%u4E8E%u901A%u7528CGI%u548CApache%20mod_python%u6A21%u5757%u7684%u5185%u5BB9%uFF0C%u4EE5%u540E%u6709%u673A%u4F1A%u5F85%u6211%u5B66%u4E60%u5230%u4E86%u518D%u505A%u7FFB%u8BD1%u3002</center>