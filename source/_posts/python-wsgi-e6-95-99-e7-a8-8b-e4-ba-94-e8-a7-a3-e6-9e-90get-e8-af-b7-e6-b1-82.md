title: Python WSGI教程(五)——解析Get请求
tags:
  - python
  - 翻译
id: 128
categories:
  - Python
date: 2015-01-23 23:32:58
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=2fbae679-8a3a-4ff8-970c-06430f083e5f)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`收集` `翻译` `python` `eat.wordpress.post` 
</div><div >

**解析Get请求：Parsing the Request - Get** 

再次运行environment.py，这一次在浏览器中输入下面的地址：

    http://localhost:8051/?age=10&amp;hobbies=software&amp;hobbies=tunning
    `</pre>

    请注意这一次在环境字典中输出的变量：_QUERY_STRING_ 和 _REQUEST_METHOD _。当请求方法是GET时，表单的变量都会附加在URL中被称为查询字符串的部分来发送。所谓查询字符串即URL中问号（？）之后的全部内容。在此例中查询字符串的值即为age=10&amp;hobbies=software&amp;hobbies=tunning。请注意hobbies变量出现了两次，这是有可能的，比如表单中存在复选框或者用户直接在URL中故意输入重复的查询键。 

    <!--more--> 

    我们可以通过硬编码的形式来从环境变量中取出查询字符串，获取参数值。不过更简单的方法是使用CGI模块的parse_qs函数来直接获得一个字典，其中键为查询字符串中的键，值为列表，存储了查询字符串中对应某个键的所有值。

    **永远要当心用户的输入**，处理用户输入来避免潜在的脚本注入。CGI的转义（escape）函数可以达到此目的。

    如下所示的代码展示了对GET请求的解析。为了让它正常工作，请保存文件名为parsing_get.wsgi，因为这是我们编写的html表单中action的值。对于运行在使用了mod_wsgi模块的apache服务器上的主程序(main)脚本来说，wsgi文件扩展名是非常常用的。
    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #75715e;">#!/usr/bin/env python</span>

    <span  style="color: #f92672;">from</span> wsgiref.simple_server <span  style="color: #f92672;">import</span> make_server
    <span  style="color: #f92672;">from</span> cgi <span  style="color: #f92672;">import</span> parse_qs, escape

    html = <span  style="color: #e6db74;">"""
    &lt;html&gt;
    &lt;body&gt;
       &lt;form method="get" action="parsing_get.wsgi"&gt;
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
    &lt;/html&gt;"""</span>

    <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">application</span><span  style="color: #f8f8f2;">(environ, start_response)</span>:</span>

       <span  style="color: #75715e;"># 解析后直接返回一个字典，每个值都是一个列表，包含了查询字符串中所有对应于该键的值</span>
       d = parse_qs(environ[<span  style="color: #e6db74;">'QUERY_STRING'</span>])

       <span  style="color: #75715e;"># 调用字典的get方法并传入一个key不存在时返回的默认值，这样可以在第一次显示表单时也给出合理的值</span>
       age = d.get(<span  style="color: #e6db74;">'age'</span>, [<span  style="color: #e6db74;">''</span>])[<span  style="color: #ae81ff;">0</span>] <span  style="color: #75715e;"># 返回第一个age值.</span>
       hobbies = d.get(<span  style="color: #e6db74;">'hobbies'</span>, []) <span  style="color: #75715e;"># 返回一个hobbies列表.</span>

       <span  style="color: #75715e;"># 总是对用户输入进行转义来避免脚本注入</span>
       age = escape(age)
       hobbies = [escape(hobby) <span  style="color: #f92672;">for</span> hobby <span  style="color: #f92672;">in</span> hobbies]

       response_body = html % (age <span  style="color: #f92672;">or</span> <span  style="color: #e6db74;">'Empty'</span>,
                   <span  style="color: #e6db74;">', '</span>.join(hobbies <span  style="color: #f92672;">or</span> [<span  style="color: #e6db74;">'No Hobbies'</span>]))

       status = <span  style="color: #e6db74;">'200 OK'</span>

       <span  style="color: #75715e;"># 修改 content type 为 text/html</span>
       response_headers = [(<span  style="color: #e6db74;">'Content-Type'</span>, <span  style="color: #e6db74;">'text/html'</span>),
                      (<span  style="color: #e6db74;">'Content-Length'</span>, str(len(response_body)))]
       start_response(status, response_headers)

       <span  style="color: #f92672;">return</span> [response_body]

    httpd = make_server(<span  style="color: #e6db74;">'localhost'</span>, <span  style="color: #ae81ff;">8051</span>, application)
    <span  style="color: #75715e;"># 这里我们改为调用serve_forever()而不是原来的handle_request()，以保持服务器不停监听。</span>
    <span  style="color: #75715e;"># 在Windows中你可以在任务管理器中kill掉python.exe进程来结束运行。</span>
    <span  style="color: #75715e;"># 在Linux/Mac OS系统中按下CTRL+C来终止运行。</span>
    httpd.serve_forever()
</div><div ></div></div><center style='display:none'>@%28%u6536%u96C6%29%5B%u7FFB%u8BD1%7Cpython%7Ceat.wordpress.post%5D%0A%23Python%20WSGI%u6559%u7A0B%28%u4E94%29%u2014%u2014%u89E3%u6790Get%u8BF7%u6C42%0A**%u89E3%u6790Get%u8BF7%u6C42%uFF1AParsing%20the%20Request%20-%20Get**%0A%u518D%u6B21%u8FD0%u884Cenvironment.py%uFF0C%u8FD9%u4E00%u6B21%u5728%u6D4F%u89C8%u5668%u4E2D%u8F93%u5165%u4E0B%u9762%u7684%u5730%u5740%uFF1A%0A%0A%20%20%20%20http%3A//localhost%3A8051/%3Fage%3D10%26hobbies%3Dsoftware%26hobbies%3Dtunning%0A%0A%u8BF7%u6CE8%u610F%u8FD9%u4E00%u6B21%u5728%u73AF%u5883%u5B57%u5178%u4E2D%u8F93%u51FA%u7684%u53D8%u91CF%uFF1A*QUERY_STRING*%20%u548C%20*REQUEST_METHOD%20*%u3002%u5F53%u8BF7%u6C42%u65B9%u6CD5%u662FGET%u65F6%uFF0C%u8868%u5355%u7684%u53D8%u91CF%u90FD%u4F1A%u9644%u52A0%u5728URL%u4E2D%u88AB%u79F0%u4E3A%u67E5%u8BE2%u5B57%u7B26%u4E32%u7684%u90E8%u5206%u6765%u53D1%u9001%u3002%u6240%u8C13%u67E5%u8BE2%u5B57%u7B26%u4E32%u5373URL%u4E2D%u95EE%u53F7%uFF08%uFF1F%uFF09%u4E4B%u540E%u7684%u5168%u90E8%u5185%u5BB9%u3002%u5728%u6B64%u4F8B%u4E2D%u67E5%u8BE2%u5B57%u7B26%u4E32%u7684%u503C%u5373%u4E3Aage%3D10%26hobbies%3Dsoftware%26hobbies%3Dtunning%u3002%u8BF7%u6CE8%u610Fhobbies%u53D8%u91CF%u51FA%u73B0%u4E86%u4E24%u6B21%uFF0C%u8FD9%u662F%u6709%u53EF%u80FD%u7684%uFF0C%u6BD4%u5982%u8868%u5355%u4E2D%u5B58%u5728%u590D%u9009%u6846%u6216%u8005%u7528%u6237%u76F4%u63A5%u5728URL%u4E2D%u6545%u610F%u8F93%u5165%u91CD%u590D%u7684%u67E5%u8BE2%u952E%u3002%0A%3C%21--more--%3E%0A%u6211%u4EEC%u53EF%u4EE5%u901A%u8FC7%u786C%u7F16%u7801%u7684%u5F62%u5F0F%u6765%u4ECE%u73AF%u5883%u53D8%u91CF%u4E2D%u53D6%u51FA%u67E5%u8BE2%u5B57%u7B26%u4E32%uFF0C%u83B7%u53D6%u53C2%u6570%u503C%u3002%u4E0D%u8FC7%u66F4%u7B80%u5355%u7684%u65B9%u6CD5%u662F%u4F7F%u7528CGI%u6A21%u5757%u7684parse_qs%u51FD%u6570%u6765%u76F4%u63A5%u83B7%u5F97%u4E00%u4E2A%u5B57%u5178%uFF0C%u5176%u4E2D%u952E%u4E3A%u67E5%u8BE2%u5B57%u7B26%u4E32%u4E2D%u7684%u952E%uFF0C%u503C%u4E3A%u5217%u8868%uFF0C%u5B58%u50A8%u4E86%u67E5%u8BE2%u5B57%u7B26%u4E32%u4E2D%u5BF9%u5E94%u67D0%u4E2A%u952E%u7684%u6240%u6709%u503C%u3002%0A%0A**%u6C38%u8FDC%u8981%u5F53%u5FC3%u7528%u6237%u7684%u8F93%u5165**%uFF0C%u5904%u7406%u7528%u6237%u8F93%u5165%u6765%u907F%u514D%u6F5C%u5728%u7684%u811A%u672C%u6CE8%u5165%u3002CGI%u7684%u8F6C%u4E49%uFF08escape%uFF09%u51FD%u6570%u53EF%u4EE5%u8FBE%u5230%u6B64%u76EE%u7684%u3002%0A%0A%u5982%u4E0B%u6240%u793A%u7684%u4EE3%u7801%u5C55%u793A%u4E86%u5BF9GET%u8BF7%u6C42%u7684%u89E3%u6790%u3002%u4E3A%u4E86%u8BA9%u5B83%u6B63%u5E38%u5DE5%u4F5C%uFF0C%u8BF7%u4FDD%u5B58%u6587%u4EF6%u540D%u4E3Aparsing_get.wsgi%uFF0C%u56E0%u4E3A%u8FD9%u662F%u6211%u4EEC%u7F16%u5199%u7684html%u8868%u5355%u4E2Daction%u7684%u503C%u3002%u5BF9%u4E8E%u8FD0%u884C%u5728%u4F7F%u7528%u4E86mod_wsgi%u6A21%u5757%u7684apache%u670D%u52A1%u5668%u4E0A%u7684%u4E3B%u7A0B%u5E8F%28main%29%u811A%u672C%u6765%u8BF4%uFF0Cwsgi%u6587%u4EF6%u6269%u5C55%u540D%u662F%u975E%u5E38%u5E38%u7528%u7684%u3002%0A%0A%60%60%60python%0A%23%21/usr/bin/env%20python%0A%0Afrom%20wsgiref.simple_server%20import%20make_server%0Afrom%20cgi%20import%20parse_qs%2C%20escape%0A%0Ahtml%20%3D%20%22%22%22%0A%3Chtml%3E%0A%3Cbody%3E%0A%20%20%20%3Cform%20method%3D%22get%22%20action%3D%22parsing_get.wsgi%22%3E%0A%20%20%20%20%20%20%3Cp%3E%0A%20%20%20%20%20%20%20%20%20Age%3A%20%3Cinput%20type%3D%22text%22%20name%3D%22age%22%3E%0A%20%20%20%20%20%20%20%20%20%3C/p%3E%0A%20%20%20%20%20%20%3Cp%3E%0A%20%20%20%20%20%20%20%20%20Hobbies%3A%0A%20%20%20%20%20%20%20%20%20%3Cinput%20name%3D%22hobbies%22%20type%3D%22checkbox%22%20value%3D%22software%22%3E%20Software%0A%20%20%20%20%20%20%20%20%20%3Cinput%20name%3D%22hobbies%22%20type%3D%22checkbox%22%20value%3D%22tunning%22%3E%20Auto%20Tunning%0A%20%20%20%20%20%20%20%20%20%3C/p%3E%0A%20%20%20%20%20%20%3Cp%3E%0A%20%20%20%20%20%20%20%20%20%3Cinput%20type%3D%22submit%22%20value%3D%22Submit%22%3E%0A%20%20%20%20%20%20%20%20%20%3C/p%3E%0A%20%20%20%20%20%20%3C/form%3E%0A%20%20%20%3Cp%3E%0A%20%20%20%20%20%20Age%3A%20%25s%3Cbr%3E%0A%20%20%20%20%20%20Hobbies%3A%20%25s%0A%20%20%20%20%20%20%3C/p%3E%0A%20%20%20%3C/body%3E%0A%3C/html%3E%22%22%22%0A%0Adef%20application%28environ%2C%20start_response%29%3A%0A%0A%20%20%20%23%20%u89E3%u6790%u540E%u76F4%u63A5%u8FD4%u56DE%u4E00%u4E2A%u5B57%u5178%uFF0C%u6BCF%u4E2A%u503C%u90FD%u662F%u4E00%u4E2A%u5217%u8868%uFF0C%u5305%u542B%u4E86%u67E5%u8BE2%u5B57%u7B26%u4E32%u4E2D%u6240%u6709%u5BF9%u5E94%u4E8E%u8BE5%u952E%u7684%u503C%0A%20%20%20d%20%3D%20parse_qs%28environ%5B%27QUERY_STRING%27%5D%29%0A%0A%20%20%20%23%20%u8C03%u7528%u5B57%u5178%u7684get%u65B9%u6CD5%u5E76%u4F20%u5165%u4E00%u4E2Akey%u4E0D%u5B58%u5728%u65F6%u8FD4%u56DE%u7684%u9ED8%u8BA4%u503C%uFF0C%u8FD9%u6837%u53EF%u4EE5%u5728%u7B2C%u4E00%u6B21%u663E%u793A%u8868%u5355%u65F6%u4E5F%u7ED9%u51FA%u5408%u7406%u7684%u503C%0A%20%20%20age%20%3D%20d.get%28%27age%27%2C%20%5B%27%27%5D%29%5B0%5D%20%23%20%u8FD4%u56DE%u7B2C%u4E00%u4E2Aage%u503C.%0A%20%20%20hobbies%20%3D%20d.get%28%27hobbies%27%2C%20%5B%5D%29%20%23%20%u8FD4%u56DE%u4E00%u4E2Ahobbies%u5217%u8868.%0A%0A%20%20%20%23%20%u603B%u662F%u5BF9%u7528%u6237%u8F93%u5165%u8FDB%u884C%u8F6C%u4E49%u6765%u907F%u514D%u811A%u672C%u6CE8%u5165%0A%20%20%20age%20%3D%20escape%28age%29%0A%20%20%20hobbies%20%3D%20%5Bescape%28hobby%29%20for%20hobby%20in%20hobbies%5D%0A%0A%20%20%20response_body%20%3D%20html%20%25%20%28age%20or%20%27Empty%27%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%27%2C%20%27.join%28hobbies%20or%20%5B%27No%20Hobbies%27%5D%29%29%0A%0A%20%20%20status%20%3D%20%27200%20OK%27%0A%0A%20%20%20%23%20%u4FEE%u6539%20content%20type%20%u4E3A%20text/html%0A%20%20%20response_headers%20%3D%20%5B%28%27Content-Type%27%2C%20%27text/html%27%29%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%28%27Content-Length%27%2C%20str%28len%28response_body%29%29%29%5D%0A%20%20%20start_response%28status%2C%20response_headers%29%0A%0A%20%20%20return%20%5Bresponse_body%5D%0A%0Ahttpd%20%3D%20make_server%28%27localhost%27%2C%208051%2C%20application%29%0A%23%20%u8FD9%u91CC%u6211%u4EEC%u6539%u4E3A%u8C03%u7528serve_forever%28%29%u800C%u4E0D%u662F%u539F%u6765%u7684handle_request%28%29%uFF0C%u4EE5%u4FDD%u6301%u670D%u52A1%u5668%u4E0D%u505C%u76D1%u542C%u3002%0A%23%20%u5728Windows%u4E2D%u4F60%u53EF%u4EE5%u5728%u4EFB%u52A1%u7BA1%u7406%u5668%u4E2Dkill%u6389python.exe%u8FDB%u7A0B%u6765%u7ED3%u675F%u8FD0%u884C%u3002%0A%23%20%u5728Linux/Mac%20OS%u7CFB%u7EDF%u4E2D%u6309%u4E0BCTRL+C%u6765%u7EC8%u6B62%u8FD0%u884C%u3002%0Ahttpd.serve_forever%28%29%0A%60%60%60%0A</center>