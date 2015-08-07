title: Python WSGI教程(一)——介绍
tags:
  - python
  - 翻译
id: 117
categories:
  - Python
date: 2015-01-23 16:54:37
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=af85d231-21a2-4675-910d-a7b12a6285c1)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`收集` `翻译` `python` `eat.wordpress.post` 
</div><div >

**前言** 

在学习python wsgi规范的时候读到了一篇介绍的很好的入门教程。内容不长，尝试将其翻译，希望对需要的人有一些帮助。 

原文地址：[Web Python](http://webpython.codepoint.net/wsgi_tutorial) 

翻译：YongLi1992

* * *

</div><div >

### WSGI教程

WSGI<a title="See footnote"  style="background: transparent; color: #1980e6; text-decoration: none; vertical-align: top; position: relative; top: -0.5em; font-size: .8em;">1</a>不是服务器，不是python模块，不是框架或API或任何一种软件。WSGI是一套服务器和应用程序共同遵守以供通讯的接口规范。服务器端和应用程序端的接口都在WSGI被规范定义了。WSGI的唯一官方描述仅以[PEP 3333提案](http://www.python.org/dev/peps/pep-3333/)为准。如果一个应用程序（或框架，工具包）是遵从WSGI规范编写的，则它可以运行于同样遵从WSGI规范的任何服务器之上。 

<!--more--> 

WSGI应用（遵守它的程序）是可以堆叠的（stacked）。在堆叠时处于中间位置的成为中间件，必须同时遵循WSIG规范的应用端和服务端的两个接口。在其上层的应用看来，中间件等同于服务器。在其下层的服务器（或其它低层应用）看来，中间件等同于应用。

一个遵循WSGI规范的服务器做的全部工作可以理解为从客户端接收一个请求，传递给应用程序，然后将应用返回的响应发送回客户端。其抽象的工作逻辑就是这么简单，而所有复杂的细节工作应交由接口另一侧的应用程序或是中间件去完成。

对于仅仅是使用框架或者工具包而言，学习WSGI规范不是必须的。但是，除非应用程序已经完全集成在框架内，为了使用中间件还是应有一些关于如何堆叠不同层次的基本知识。

Python 2.5及之后的版本都内置了一个WSGI服务器，在这个教程中我们将使用它。2.4及之前的版本也可以手动安装它。而除了学习以外的任何实用场景，我都推荐使用Apache服务器配合以mod_wsgi模块。

该教程的所有代码都是较为底层的，并且唯一的目的只是以边写边运行的教学方式来展示WSGI规范。它不是为真实使用情景写的。对于生产代码，建议直接使用工具包，框架和中间件。

</div><div ><div >

* * *

1.  Web Server Gateway Interface：Web服务器网关接口 <a title="Return to article"  style="background: transparent; color: #1980e6; text-decoration: none;">↩</a></div></div></div><center style='display:none'>@%28%u6536%u96C6%29%5B%u7FFB%u8BD1%7Cpython%7Ceat.wordpress.post%5D%0A%23Python%20WSGI%u6559%u7A0B%28%u4E00%29%u2014%u2014%u4ECB%u7ECD%0A**%u524D%u8A00**%0A%u5728%u5B66%u4E60python%20wsgi%u89C4%u8303%u7684%u65F6%u5019%u8BFB%u5230%u4E86%u4E00%u7BC7%u4ECB%u7ECD%u7684%u5F88%u597D%u7684%u5165%u95E8%u6559%u7A0B%u3002%u5185%u5BB9%u4E0D%u957F%uFF0C%u5C1D%u8BD5%u5C06%u5176%u7FFB%u8BD1%uFF0C%u5E0C%u671B%u5BF9%u9700%u8981%u7684%u4EBA%u6709%u4E00%u4E9B%u5E2E%u52A9%u3002%0A%u539F%u6587%u5730%u5740%uFF1A%5BWeb%20Python%5D%28http%3A//webpython.codepoint.net/wsgi_tutorial%29%0A%u7FFB%u8BD1%uFF1AYongLi1992%0A***%0A%23%23%23%20WSGI%u6559%u7A0B%0AWSGI%5B%5E1%5D%u4E0D%u662F%u670D%u52A1%u5668%uFF0C%u4E0D%u662Fpython%u6A21%u5757%uFF0C%u4E0D%u662F%u6846%u67B6%u6216API%u6216%u4EFB%u4F55%u4E00%u79CD%u8F6F%u4EF6%u3002WSGI%u662F%u4E00%u5957%u670D%u52A1%u5668%u548C%u5E94%u7528%u7A0B%u5E8F%u5171%u540C%u9075%u5B88%u4EE5%u4F9B%u901A%u8BAF%u7684%u63A5%u53E3%u89C4%u8303%u3002%u670D%u52A1%u5668%u7AEF%u548C%u5E94%u7528%u7A0B%u5E8F%u7AEF%u7684%u63A5%u53E3%u90FD%u5728WSGI%u88AB%u89C4%u8303%u5B9A%u4E49%u4E86%u3002WSGI%u7684%u552F%u4E00%u5B98%u65B9%u63CF%u8FF0%u4EC5%u4EE5%5BPEP%203333%u63D0%u6848%5D%28http%3A//www.python.org/dev/peps/pep-3333/%29%u4E3A%u51C6%u3002%u5982%u679C%u4E00%u4E2A%u5E94%u7528%u7A0B%u5E8F%uFF08%u6216%u6846%u67B6%uFF0C%u5DE5%u5177%u5305%uFF09%u662F%u9075%u4ECEWSGI%u89C4%u8303%u7F16%u5199%u7684%uFF0C%u5219%u5B83%u53EF%u4EE5%u8FD0%u884C%u4E8E%u540C%u6837%u9075%u4ECEWSGI%u89C4%u8303%u7684%u4EFB%u4F55%u670D%u52A1%u5668%u4E4B%u4E0A%u3002%0A%3C%21--more--%3E%0AWSGI%u5E94%u7528%uFF08%u9075%u5B88%u5B83%u7684%u7A0B%u5E8F%uFF09%u662F%u53EF%u4EE5%u5806%u53E0%u7684%uFF08stacked%uFF09%u3002%u5728%u5806%u53E0%u65F6%u5904%u4E8E%u4E2D%u95F4%u4F4D%u7F6E%u7684%u6210%u4E3A%u4E2D%u95F4%u4EF6%uFF0C%u5FC5%u987B%u540C%u65F6%u9075%u5FAAWSIG%u89C4%u8303%u7684%u5E94%u7528%u7AEF%u548C%u670D%u52A1%u7AEF%u7684%u4E24%u4E2A%u63A5%u53E3%u3002%u5728%u5176%u4E0A%u5C42%u7684%u5E94%u7528%u770B%u6765%uFF0C%u4E2D%u95F4%u4EF6%u7B49%u540C%u4E8E%u670D%u52A1%u5668%u3002%u5728%u5176%u4E0B%u5C42%u7684%u670D%u52A1%u5668%uFF08%u6216%u5176%u5B83%u4F4E%u5C42%u5E94%u7528%uFF09%u770B%u6765%uFF0C%u4E2D%u95F4%u4EF6%u7B49%u540C%u4E8E%u5E94%u7528%u3002%0A%0A%u4E00%u4E2A%u9075%u5FAAWSGI%u89C4%u8303%u7684%u670D%u52A1%u5668%u505A%u7684%u5168%u90E8%u5DE5%u4F5C%u53EF%u4EE5%u7406%u89E3%u4E3A%u4ECE%u5BA2%u6237%u7AEF%u63A5%u6536%u4E00%u4E2A%u8BF7%u6C42%uFF0C%u4F20%u9012%u7ED9%u5E94%u7528%u7A0B%u5E8F%uFF0C%u7136%u540E%u5C06%u5E94%u7528%u8FD4%u56DE%u7684%u54CD%u5E94%u53D1%u9001%u56DE%u5BA2%u6237%u7AEF%u3002%u5176%u62BD%u8C61%u7684%u5DE5%u4F5C%u903B%u8F91%u5C31%u662F%u8FD9%u4E48%u7B80%u5355%uFF0C%u800C%u6240%u6709%u590D%u6742%u7684%u7EC6%u8282%u5DE5%u4F5C%u5E94%u4EA4%u7531%u63A5%u53E3%u53E6%u4E00%u4FA7%u7684%u5E94%u7528%u7A0B%u5E8F%u6216%u662F%u4E2D%u95F4%u4EF6%u53BB%u5B8C%u6210%u3002%0A%0A%u5BF9%u4E8E%u4EC5%u4EC5%u662F%u4F7F%u7528%u6846%u67B6%u6216%u8005%u5DE5%u5177%u5305%u800C%u8A00%uFF0C%u5B66%u4E60WSGI%u89C4%u8303%u4E0D%u662F%u5FC5%u987B%u7684%u3002%u4F46%u662F%uFF0C%u9664%u975E%u5E94%u7528%u7A0B%u5E8F%u5DF2%u7ECF%u5B8C%u5168%u96C6%u6210%u5728%u6846%u67B6%u5185%uFF0C%u4E3A%u4E86%u4F7F%u7528%u4E2D%u95F4%u4EF6%u8FD8%u662F%u5E94%u6709%u4E00%u4E9B%u5173%u4E8E%u5982%u4F55%u5806%u53E0%u4E0D%u540C%u5C42%u6B21%u7684%u57FA%u672C%u77E5%u8BC6%u3002%0A%0APython%202.5%u53CA%u4E4B%u540E%u7684%u7248%u672C%u90FD%u5185%u7F6E%u4E86%u4E00%u4E2AWSGI%u670D%u52A1%u5668%uFF0C%u5728%u8FD9%u4E2A%u6559%u7A0B%u4E2D%u6211%u4EEC%u5C06%u4F7F%u7528%u5B83%u30022.4%u53CA%u4E4B%u524D%u7684%u7248%u672C%u4E5F%u53EF%u4EE5%u624B%u52A8%u5B89%u88C5%u5B83%u3002%u800C%u9664%u4E86%u5B66%u4E60%u4EE5%u5916%u7684%u4EFB%u4F55%u5B9E%u7528%u573A%u666F%uFF0C%u6211%u90FD%u63A8%u8350%u4F7F%u7528Apache%u670D%u52A1%u5668%u914D%u5408%u4EE5mod_wsgi%u6A21%u5757%u3002%0A%0A%u8BE5%u6559%u7A0B%u7684%u6240%u6709%u4EE3%u7801%u90FD%u662F%u8F83%u4E3A%u5E95%u5C42%u7684%uFF0C%u5E76%u4E14%u552F%u4E00%u7684%u76EE%u7684%u53EA%u662F%u4EE5%u8FB9%u5199%u8FB9%u8FD0%u884C%u7684%u6559%u5B66%u65B9%u5F0F%u6765%u5C55%u793AWSGI%u89C4%u8303%u3002%u5B83%u4E0D%u662F%u4E3A%u771F%u5B9E%u4F7F%u7528%u60C5%u666F%u5199%u7684%u3002%u5BF9%u4E8E%u751F%u4EA7%u4EE3%u7801%uFF0C%u5EFA%u8BAE%u76F4%u63A5%u4F7F%u7528%u5DE5%u5177%u5305%uFF0C%u6846%u67B6%u548C%u4E2D%u95F4%u4EF6%u3002%0A%0A%5B%5E1%5D%3A%20Web%20Server%20Gateway%20Interface%uFF1AWeb%u670D%u52A1%u5668%u7F51%u5173%u63A5%u53E3</center>