title: Python：__init__.py 详解
id: 153
categories:
  - 未分类
date: 2015-02-14 09:28:08
tags:
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=caa1bf58-8011-48a7-875c-13dd22ff0406)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `翻译` `python` `eat.wordpress.post` 
</div><div >

翻译一篇介绍 __init__.py 的好文。 

原文地址：[Be Pythnoic: **init**.py](http://mikegrouchy.com/blog/2012/05/be-pythonic-__init__py.html) 

翻译：YongLi1992

* * *

</div><div >

### __init__.py 是什么？

__init__.py 文件的主要用处是用来初始化 Python 包（packages）的。我们以下面的一个标准 Python 模块结构来展示这一用处。

    package/
    __init__<span >.py</span>
    file<span >.py</span>
    file2<span >.py</span>
    file3<span >.py</span>
    subpackage/
        __init__<span >.py</span>
        submodule1<span >.py</span>
        submodule2<span >.py</span>
    `</pre>

    如你所见，在上述目录结构中包含 __init__.py 文件可以告知 Python 解释器，该目录应被作为一个 Python 包来处理。

    <!--more-->

    </div><div >

    ### __init__.py 中有什么

    __init__.py 可以是一个空文件。但它也可以为包做一些设置工作，如 import 其它文件，加载路径等等。

    一种常见的做法是在 __init__.py 中把同级 python 文件中的类，函数等 import 到包的顶级，以方从包的外部使用。

    在上述的例子中假定我们的 file.py 文件中有一个 File 类。如果 __init__.py 为空的话，从包的外部导入 File 类你需要这样做：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f92672;">from</span> package.file <span  style="color: #f92672;">import</span> File`</pre>

    然而，你可以在 __init__.py 文件中先 import 这个类，从而把它提升到包的顶级：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #75715e;"># 在 \__init__.py 文件中这样写</span>
    <span  style="color: #f92672;">from</span> file <span  style="color: #f92672;">import</span> File

    <span  style="color: #75715e;"># 从包的外面可以更方便地导入 File 类了</span>
    <span  style="color: #f92672;">from</span> package <span  style="color: #f92672;">import</span> File`</pre>

    另外一件在 __init**.py 中可以做的事情是用 __all** 变量来控制使用 import * 语句时要导入的文件。当  __init**.py 中定义了 __all**  变量时，使用下面的语句将只导入指定的文件。

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f92672;">from</span> package <span  style="color: #f92672;">import</span> *`</pre>

    __all__ 是一个列表变量，放的是你希望导入的文件的名字。以我们之前的目录为例，如果我们希望导入 subpackage 中所有的 submodules，在 __init__.py 文件中可以这样写：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`__all__ = [<span  style="color: #e6db74;">'submodule1'</span>, <span  style="color: #e6db74;">'submodule2'</span>]`</pre>

    有了这一变量之后，当你使用：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f92672;">from</span> subpackage <span  style="color: #f92672;">import</span> *

subpackage 下的 submodule1，submodule2 都会被导入了。
</div><div ></div></div><center style='display:none'>@%28%u5F52%u6863%29%5B%u7FFB%u8BD1%7Cpython%7Ceat.wordpress.post%5D%0A%23%23%20Python%uFF1A%5C__init__.py%20%u8BE6%u89E3%0A%u7FFB%u8BD1%u4E00%u7BC7%u4ECB%u7ECD%20%5C__init__.py%20%u7684%u597D%u6587%u3002%0A%u539F%u6587%u5730%u5740%uFF1A%5BBe%20Pythnoic%3A%20__init__.py%5D%28http%3A//mikegrouchy.com/blog/2012/05/be-pythonic-__init__py.html%29%0A%u7FFB%u8BD1%uFF1AYongLi1992%0A***%0A%23%23%23%20%5C__init__.py%20%u662F%u4EC0%u4E48%uFF1F%0A%5C__init__.py%20%u6587%u4EF6%u7684%u4E3B%u8981%u7528%u5904%u662F%u7528%u6765%u521D%u59CB%u5316%20Python%20%u5305%uFF08packages%uFF09%u7684%u3002%u6211%u4EEC%u4EE5%u4E0B%u9762%u7684%u4E00%u4E2A%u6807%u51C6%20Python%20%u6A21%u5757%u7ED3%u6784%u6765%u5C55%u793A%u8FD9%u4E00%u7528%u5904%u3002%0A%0A%20%20%20%20package/%0A%20%20%20%20__init__.py%0A%20%20%20%20file.py%0A%20%20%20%20file2.py%0A%20%20%20%20file3.py%0A%20%20%20%20subpackage/%0A%20%20%20%20%20%20%20%20__init__.py%0A%20%20%20%20%20%20%20%20submodule1.py%0A%20%20%20%20%20%20%20%20submodule2.py%0A%20%20%20%20%20%20%20%20%0A%u5982%u4F60%u6240%u89C1%uFF0C%u5728%u4E0A%u8FF0%u76EE%u5F55%u7ED3%u6784%u4E2D%u5305%u542B%20%5C__init__.py%20%u6587%u4EF6%u53EF%u4EE5%u544A%u77E5%20Python%20%u89E3%u91CA%u5668%uFF0C%u8BE5%u76EE%u5F55%u5E94%u88AB%u4F5C%u4E3A%u4E00%u4E2A%20Python%20%u5305%u6765%u5904%u7406%u3002%0A%0A%3C%21--more--%3E%0A%0A%23%23%23%20%5C__init__.py%20%u4E2D%u6709%u4EC0%u4E48%0A%5C__init__.py%20%u53EF%u4EE5%u662F%u4E00%u4E2A%u7A7A%u6587%u4EF6%u3002%u4F46%u5B83%u4E5F%u53EF%u4EE5%u4E3A%u5305%u505A%u4E00%u4E9B%u8BBE%u7F6E%u5DE5%u4F5C%uFF0C%u5982%20import%20%u5176%u5B83%u6587%u4EF6%uFF0C%u52A0%u8F7D%u8DEF%u5F84%u7B49%u7B49%u3002%0A%0A%u4E00%u79CD%u5E38%u89C1%u7684%u505A%u6CD5%u662F%u5728%20%5C__init__.py%20%u4E2D%u628A%u540C%u7EA7%20python%20%u6587%u4EF6%u4E2D%u7684%u7C7B%uFF0C%u51FD%u6570%u7B49%20import%20%u5230%u5305%u7684%u9876%u7EA7%uFF0C%u4EE5%u65B9%u4ECE%u5305%u7684%u5916%u90E8%u4F7F%u7528%u3002%0A%0A%u5728%u4E0A%u8FF0%u7684%u4F8B%u5B50%u4E2D%u5047%u5B9A%u6211%u4EEC%u7684%20file.py%20%u6587%u4EF6%u4E2D%u6709%u4E00%u4E2A%20File%20%u7C7B%u3002%u5982%u679C%20%5C__init__.py%20%u4E3A%u7A7A%u7684%u8BDD%uFF0C%u4ECE%u5305%u7684%u5916%u90E8%u5BFC%u5165%20File%20%u7C7B%u4F60%u9700%u8981%u8FD9%u6837%u505A%uFF1A%0A%60%60%60python%0Afrom%20package.file%20import%20File%0A%60%60%60%0A%u7136%u800C%uFF0C%u4F60%u53EF%u4EE5%u5728%20%5C__init__.py%20%u6587%u4EF6%u4E2D%u5148%20import%20%u8FD9%u4E2A%u7C7B%uFF0C%u4ECE%u800C%u628A%u5B83%u63D0%u5347%u5230%u5305%u7684%u9876%u7EA7%uFF1A%0A%60%60%60python%0A%23%20%u5728%20%5C__init__.py%20%u6587%u4EF6%u4E2D%u8FD9%u6837%u5199%0Afrom%20file%20import%20File%0A%0A%23%20%u4ECE%u5305%u7684%u5916%u9762%u53EF%u4EE5%u66F4%u65B9%u4FBF%u5730%u5BFC%u5165%20File%20%u7C7B%u4E86%0Afrom%20package%20import%20File%0A%60%60%60%0A%0A%u53E6%u5916%u4E00%u4EF6%u5728%20%5C__init__.py%20%u4E2D%u53EF%u4EE5%u505A%u7684%u4E8B%u60C5%u662F%u7528%20%5C__all__%20%u53D8%u91CF%u6765%u63A7%u5236%u4F7F%u7528%20import%20*%20%u8BED%u53E5%u65F6%u8981%u5BFC%u5165%u7684%u6587%u4EF6%u3002%u5F53%20%20%5C__init__.py%20%u4E2D%u5B9A%u4E49%u4E86%20%5C__all__%20%20%u53D8%u91CF%u65F6%uFF0C%u4F7F%u7528%u4E0B%u9762%u7684%u8BED%u53E5%u5C06%u53EA%u5BFC%u5165%u6307%u5B9A%u7684%u6587%u4EF6%u3002%0A%60%60%60python%0Afrom%20package%20import%20*%0A%60%60%60%0A%5C__all__%20%u662F%u4E00%u4E2A%u5217%u8868%u53D8%u91CF%uFF0C%u653E%u7684%u662F%u4F60%u5E0C%u671B%u5BFC%u5165%u7684%u6587%u4EF6%u7684%u540D%u5B57%u3002%u4EE5%u6211%u4EEC%u4E4B%u524D%u7684%u76EE%u5F55%u4E3A%u4F8B%uFF0C%u5982%u679C%u6211%u4EEC%u5E0C%u671B%u5BFC%u5165%20subpackage%20%u4E2D%u6240%u6709%u7684%20submodules%uFF0C%u5728%20%5C__init__.py%20%u6587%u4EF6%u4E2D%u53EF%u4EE5%u8FD9%u6837%u5199%uFF1A%0A%60%60%60python%0A__all__%20%3D%20%5B%27submodule1%27%2C%20%27submodule2%27%5D%0A%60%60%60%0A%u6709%u4E86%u8FD9%u4E00%u53D8%u91CF%u4E4B%u540E%uFF0C%u5F53%u4F60%u4F7F%u7528%uFF1A%0A%60%60%60python%0Afrom%20subpackage%20import%20*%0A%60%60%60%0Asubpackage%20%u4E0B%u7684%20submodule1%uFF0Csubmodule2%20%u90FD%u4F1A%u88AB%u5BFC%u5165%u4E86%u3002</center>