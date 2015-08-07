title: Python 命令行解析模块argparse使用学习
tags:
  - python
id: 72
categories:
  - Python
date: 2015-01-20 16:08:42
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=7895b5bd-4312-4cff-ab2b-4f97eaae0a04)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `原创` `python` `eat.wordpress.post` 

</div><div >

argparse在Python2.7中引入，是用于替代原来的optparse模块的。

</div><div >

## 基本知识

导入模块后，获得一个parser对象。通过调用其add_argument()方法来设置程序可接受的命令行参数。 

调用其parse_args方法来获取一个收集了所有参数的args对象。此时从命令行得到的参数可以由args对象的属性来获取。 

基本过程如下：

</div><div >

    <span  style="color: #f92672;">import</span> argparse
    parser = argparse.ArgumentParser()
    args = paresr.parse_args()`</pre>

    <!--more--></div><div >

    ## 添加参数

    通过parser对象的add_argument方法来添加。调用的时候可以指定以下属性（仅列出部分）： 

    help：指定一个字符串，在命令行中使用-h，–help参数时可以详细解释你设置的该命令的作用，类似文档。 

    type：指定该参数的类型，这样由args的属性获取的该参数直接为正确的类型，免去类型转换。如不指定，默认为字符串。 

    default：默认值。 

    choice：有效值范围。

    </div><div >

    ### 位置参数

    调用parser对象的add_argument方法并传入一个字符串参数，指定从命令行接收的参数名。如果字符串不以”-”开头，则为必须的位置参数。 

    如下：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f92672;">import</span> argparse
    parser = argparse.ArgumentParser()
    parser.add_argument(<span  style="color: #e6db74;">"echo"</span>) <span  style="color: #75715e;"># 添加名为echo的参数</span>
    args = paresr.parse_args()
    <span  style="color: #f92672;">print</span> args.echo <span  style="color: #75715e;"># 参数解析之后可以调用args对象的同名属性来获取参数</span>`</pre>

    添加的时候为help参数指定一个字符串的话，在命令行中使用-h时候，该字符串就会作为文档列在你给的参数后面了。

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`parser.add_argument(<span  style="color: #e6db74;">"echo"</span>, help=<span  style="color: #e6db74;">"echo the string you use here"</span>)`</pre>

    添加的时候为type参数指定指定一个type对象的话，解析出来的参数直接是对应的类型，免去类型转换。否则解析出来默认为字符串。

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`parser.add_argument(<span  style="color: #e6db74;">"square"</span>, type=int)
    args = parser.parse_args()
    <span  style="color: #f92672;">print</span> args.square ** <span  style="color: #ae81ff;">2</span> <span  style="color: #75715e;"># 解析出出来的square就是整数类型，直接参与运算</span>`</pre>

    命令行中运行如下：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f8f8f2;">$python</span> test.py <span  style="color: #ae81ff;">4</span>
    <span  style="color: #ae81ff;">16</span>`</pre>

    </div><div >

    ### 可选参数

    调用parser对象的add_argument方法时若传入的字符串是以”-“开头的，则该参数为可选参数。在命令行中运行的时候可以提供也可以不提供。 

    如下：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`parser.add_argument(<span  style="color: #e6db74;">"-v"</span>, action=<span  style="color: #e6db74;">"store_true"</span>, default=<span  style="color: #f92672;">False</span>)
    args = parser.parse_args()
    <span  style="color: #f92672;">if</span> args.v:
        <span  style="color: #f92672;">print</span> <span  style="color: #e6db74;">"More information"</span>

其中在添加时设置default参数，为v添加默认值。设置action为”store_true”表明在命令行中运行时若有-v则将其设置为true。
</div><div ></div></div><center style='display:none'>@%28%u5F52%u6863%29%5B%u539F%u521B%7Cpython%7Ceat.wordpress.post%5D%0A%23%20Python%20%u547D%u4EE4%u884C%u89E3%u6790%u6A21%u5757argparse%u4F7F%u7528%u5B66%u4E60%0Aargparse%u5728Python2.7%u4E2D%u5F15%u5165%uFF0C%u662F%u7528%u4E8E%u66FF%u4EE3%u539F%u6765%u7684optparse%u6A21%u5757%u7684%u3002%0A%23%23%20%u57FA%u672C%u77E5%u8BC6%0A%u5BFC%u5165%u6A21%u5757%u540E%uFF0C%u83B7%u5F97%u4E00%u4E2Aparser%u5BF9%u8C61%u3002%u901A%u8FC7%u8C03%u7528%u5176add_argument%28%29%u65B9%u6CD5%u6765%u8BBE%u7F6E%u7A0B%u5E8F%u53EF%u63A5%u53D7%u7684%u547D%u4EE4%u884C%u53C2%u6570%u3002%0A%u8C03%u7528%u5176parse_args%u65B9%u6CD5%u6765%u83B7%u53D6%u4E00%u4E2A%u6536%u96C6%u4E86%u6240%u6709%u53C2%u6570%u7684args%u5BF9%u8C61%u3002%u6B64%u65F6%u4ECE%u547D%u4EE4%u884C%u5F97%u5230%u7684%u53C2%u6570%u53EF%u4EE5%u7531args%u5BF9%u8C61%u7684%u5C5E%u6027%u6765%u83B7%u53D6%u3002%0A%u57FA%u672C%u8FC7%u7A0B%u5982%u4E0B%uFF1A%0A%60%60%60python%0Aimport%20argparse%0Aparser%20%3D%20argparse.ArgumentParser%28%29%0Aargs%20%3D%20paresr.parse_args%28%29%0A%60%60%60%0A%3C%21--more--%3E%0A%23%23%20%u6DFB%u52A0%u53C2%u6570%0A%u901A%u8FC7parser%u5BF9%u8C61%u7684add_argument%u65B9%u6CD5%u6765%u6DFB%u52A0%u3002%u8C03%u7528%u7684%u65F6%u5019%u53EF%u4EE5%u6307%u5B9A%u4EE5%u4E0B%u5C5E%u6027%uFF08%u4EC5%u5217%u51FA%u90E8%u5206%uFF09%uFF1A%0Ahelp%uFF1A%u6307%u5B9A%u4E00%u4E2A%u5B57%u7B26%u4E32%uFF0C%u5728%u547D%u4EE4%u884C%u4E2D%u4F7F%u7528-h%uFF0C--help%u53C2%u6570%u65F6%u53EF%u4EE5%u8BE6%u7EC6%u89E3%u91CA%u4F60%u8BBE%u7F6E%u7684%u8BE5%u547D%u4EE4%u7684%u4F5C%u7528%uFF0C%u7C7B%u4F3C%u6587%u6863%u3002%0Atype%uFF1A%u6307%u5B9A%u8BE5%u53C2%u6570%u7684%u7C7B%u578B%uFF0C%u8FD9%u6837%u7531args%u7684%u5C5E%u6027%u83B7%u53D6%u7684%u8BE5%u53C2%u6570%u76F4%u63A5%u4E3A%u6B63%u786E%u7684%u7C7B%u578B%uFF0C%u514D%u53BB%u7C7B%u578B%u8F6C%u6362%u3002%u5982%u4E0D%u6307%u5B9A%uFF0C%u9ED8%u8BA4%u4E3A%u5B57%u7B26%u4E32%u3002%0Adefault%uFF1A%u9ED8%u8BA4%u503C%u3002%0Achoice%uFF1A%u6709%u6548%u503C%u8303%u56F4%u3002%0A%0A%23%23%23%20%u4F4D%u7F6E%u53C2%u6570%0A%u8C03%u7528parser%u5BF9%u8C61%u7684add_argument%u65B9%u6CD5%u5E76%u4F20%u5165%u4E00%u4E2A%u5B57%u7B26%u4E32%u53C2%u6570%uFF0C%u6307%u5B9A%u4ECE%u547D%u4EE4%u884C%u63A5%u6536%u7684%u53C2%u6570%u540D%u3002%u5982%u679C%u5B57%u7B26%u4E32%u4E0D%u4EE5%27%27-%27%27%u5F00%u5934%uFF0C%u5219%u4E3A%u5FC5%u987B%u7684%u4F4D%u7F6E%u53C2%u6570%u3002%0A%u5982%u4E0B%uFF1A%0A%60%60%60python%0Aimport%20argparse%0Aparser%20%3D%20argparse.ArgumentParser%28%29%0Aparser.add_argument%28%22echo%22%29%20%23%20%u6DFB%u52A0%u540D%u4E3Aecho%u7684%u53C2%u6570%0Aargs%20%3D%20paresr.parse_args%28%29%0Aprint%20args.echo%20%23%20%u53C2%u6570%u89E3%u6790%u4E4B%u540E%u53EF%u4EE5%u8C03%u7528args%u5BF9%u8C61%u7684%u540C%u540D%u5C5E%u6027%u6765%u83B7%u53D6%u53C2%u6570%0A%60%60%60%0A%u6DFB%u52A0%u7684%u65F6%u5019%u4E3Ahelp%u53C2%u6570%u6307%u5B9A%u4E00%u4E2A%u5B57%u7B26%u4E32%u7684%u8BDD%uFF0C%u5728%u547D%u4EE4%u884C%u4E2D%u4F7F%u7528-h%u65F6%u5019%uFF0C%u8BE5%u5B57%u7B26%u4E32%u5C31%u4F1A%u4F5C%u4E3A%u6587%u6863%u5217%u5728%u4F60%u7ED9%u7684%u53C2%u6570%u540E%u9762%u4E86%u3002%0A%60%60%60python%0Aparser.add_argument%28%22echo%22%2C%20help%3D%22echo%20the%20string%20you%20use%20here%22%29%0A%60%60%60%0A%u6DFB%u52A0%u7684%u65F6%u5019%u4E3Atype%u53C2%u6570%u6307%u5B9A%u6307%u5B9A%u4E00%u4E2Atype%u5BF9%u8C61%u7684%u8BDD%uFF0C%u89E3%u6790%u51FA%u6765%u7684%u53C2%u6570%u76F4%u63A5%u662F%u5BF9%u5E94%u7684%u7C7B%u578B%uFF0C%u514D%u53BB%u7C7B%u578B%u8F6C%u6362%u3002%u5426%u5219%u89E3%u6790%u51FA%u6765%u9ED8%u8BA4%u4E3A%u5B57%u7B26%u4E32%u3002%0A%60%60%60python%0Aparser.add_argument%28%22square%22%2C%20type%3Dint%29%0Aargs%20%3D%20parser.parse_args%28%29%0Aprint%20args.square%20**%202%20%23%20%u89E3%u6790%u51FA%u51FA%u6765%u7684square%u5C31%u662F%u6574%u6570%u7C7B%u578B%uFF0C%u76F4%u63A5%u53C2%u4E0E%u8FD0%u7B97%0A%60%60%60%0A%u547D%u4EE4%u884C%u4E2D%u8FD0%u884C%u5982%u4E0B%uFF1A%0A%60%60%60bash%0A%24python%20test.py%204%0A16%0A%60%60%60%0A%0A%23%23%23%20%u53EF%u9009%u53C2%u6570%0A%u8C03%u7528parser%u5BF9%u8C61%u7684add_argument%u65B9%u6CD5%u65F6%u82E5%u4F20%u5165%u7684%u5B57%u7B26%u4E32%u662F%u4EE5%22-%22%u5F00%u5934%u7684%uFF0C%u5219%u8BE5%u53C2%u6570%u4E3A%u53EF%u9009%u53C2%u6570%u3002%u5728%u547D%u4EE4%u884C%u4E2D%u8FD0%u884C%u7684%u65F6%u5019%u53EF%u4EE5%u63D0%u4F9B%u4E5F%u53EF%u4EE5%u4E0D%u63D0%u4F9B%u3002%0A%u5982%u4E0B%uFF1A%0A%60%60%60python%0Aparser.add_argument%28%22-v%22%2C%20action%3D%22store_true%22%2C%20default%3DFalse%29%0Aargs%20%3D%20parser.parse_args%28%29%0Aif%20args.v%3A%0A%09print%20%22More%20information%22%0A%60%60%60%0A%u5176%u4E2D%u5728%u6DFB%u52A0%u65F6%u8BBE%u7F6Edefault%u53C2%u6570%uFF0C%u4E3Av%u6DFB%u52A0%u9ED8%u8BA4%u503C%u3002%u8BBE%u7F6Eaction%u4E3A%22store_true%22%u8868%u660E%u5728%u547D%u4EE4%u884C%u4E2D%u8FD0%u884C%u65F6%u82E5%u6709-v%u5219%u5C06%u5176%u8BBE%u7F6E%u4E3Atrue%u3002%0A</center>