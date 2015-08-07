title: Python代码计时模块timeite学习笔记
id: 134
categories:
  - 未分类
date: 2015-01-27 19:46:18
tags:
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=25467de9-8069-4f72-a649-140f2bab8afe)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `python` `原创` `eat.wordpress.post` 
</div><div >

timeit模块提供了一种简便的方法来为Python中的小块代码进行计时。它有三种使用方式，从命令行调用，从Python交互解释器调用，或者直接在脚本代码中进行调用。下面仅仅简略记述一下该模块在交互解释器以及脚本中的基础使用方法。
</div><div >

### 在Python交互解释器中的使用

**timeit函数** 

最基本的使用方法是直接调用timeit函数。
</div><div >

    <span  style="color: #f92672;">import</span> timeit
    timeit.timeit(stmt=<span  style="color: #e6db74;">'pass'</span>, setup=<span  style="color: #e6db74;">'pass'</span>, timer=&lt;default timer&gt;, number=<span  style="color: #ae81ff;">1000000</span>)`</pre>

    <!--more--> 

    模块的第一个参数为要执行计时的语句（statement）。按字符串的形式传入要执行的代码。第二个参数setup用于构建代码环境，可以用来导入需要的模块。最后的number指定了运行的次数。

    使用示例如下：
    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`&gt;&gt;&gt;<span  style="color: #f92672;">import</span> timeit
    &gt;&gt;&gt;timeit.timeit(<span  style="color: #e6db74;">'"-".join(str(n) for n in range(100))'</span>, number=<span  style="color: #ae81ff;">10000</span>)
    <span  style="color: #ae81ff;">0.21051692962646484</span>`</pre>

    **repeat函数** 

    另一个可供使用的函数是repeat函数，指定整个试验的重复次数，返回一个包含了每次试验的执行时间的列表。

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #e6db74;">&gt;&gt;&gt; </span>timeit.repeat(<span  style="color: #e6db74;">'"-".join(str(n) for n in range(100))'</span>,repeat=<span  style="color: #ae81ff;">3</span>, number=<span  style="color: #ae81ff;">10000</span>)
    [<span  style="color: #ae81ff;">0.21938705444335938</span>, <span  style="color: #ae81ff;">0.21767210960388184</span>, <span  style="color: #ae81ff;">0.21688294410705566</span>]`</pre>

    利用这一函数可以很方便得实现多次试验取平均的方法。
    </div><div >

    #### 在脚本程序中的使用

    timeit模块同样可以在脚本中直接使用。使用方法还是调用上述的函数。但是在脚本中时需要为setup传入一条字符串形式的语句，用于构建执行环境，示例如下：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">test</span><span  style="color: #f8f8f2;">()</span>:</span>
        L = []
        <span  style="color: #f92672;">for</span> i <span  style="color: #f92672;">in</span> range(<span  style="color: #ae81ff;">100</span>):
            L.append(i)

    <span  style="color: #f92672;">if</span> __name__ == <span  style="color: #e6db74;">'__main__'</span>:
        <span  style="color: #f92672;">import</span> timeit
        <span  style="color: #f92672;">print</span> timeit.timeit(<span  style="color: #e6db74;">"test()"</span>, setup=<span  style="color: #e6db74;">"from __main__ import test"</span>))
</div><div ></div></div><center style='display:none'>@%28%u5F52%u6863%29%5Bpython%7C%u539F%u521B%7Ceat.wordpress.post%5D%0A%23Python%u4EE3%u7801%u8BA1%u65F6%u6A21%u5757timeite%u5B66%u4E60%u7B14%u8BB0%0Atimeit%u6A21%u5757%u63D0%u4F9B%u4E86%u4E00%u79CD%u7B80%u4FBF%u7684%u65B9%u6CD5%u6765%u4E3APython%u4E2D%u7684%u5C0F%u5757%u4EE3%u7801%u8FDB%u884C%u8BA1%u65F6%u3002%u5B83%u6709%u4E09%u79CD%u4F7F%u7528%u65B9%u5F0F%uFF0C%u4ECE%u547D%u4EE4%u884C%u8C03%u7528%uFF0C%u4ECEPython%u4EA4%u4E92%u89E3%u91CA%u5668%u8C03%u7528%uFF0C%u6216%u8005%u76F4%u63A5%u5728%u811A%u672C%u4EE3%u7801%u4E2D%u8FDB%u884C%u8C03%u7528%u3002%u4E0B%u9762%u4EC5%u4EC5%u7B80%u7565%u8BB0%u8FF0%u4E00%u4E0B%u8BE5%u6A21%u5757%u5728%u4EA4%u4E92%u89E3%u91CA%u5668%u4EE5%u53CA%u811A%u672C%u4E2D%u7684%u57FA%u7840%u4F7F%u7528%u65B9%u6CD5%u3002%0A%0A%23%23%23%20%u5728Python%u4EA4%u4E92%u89E3%u91CA%u5668%u4E2D%u7684%u4F7F%u7528%0A**timeit%u51FD%u6570**%0A%u6700%u57FA%u672C%u7684%u4F7F%u7528%u65B9%u6CD5%u662F%u76F4%u63A5%u8C03%u7528timeit%u51FD%u6570%u3002%0A%60%60%60python%0Aimport%20timeit%0Atimeit.timeit%28stmt%3D%27pass%27%2C%20setup%3D%27pass%27%2C%20timer%3D%3Cdefault%20timer%3E%2C%20number%3D1000000%29%0A%60%60%60%0A%3C%21--more--%3E%0A%u6A21%u5757%u7684%u7B2C%u4E00%u4E2A%u53C2%u6570%u4E3A%u8981%u6267%u884C%u8BA1%u65F6%u7684%u8BED%u53E5%uFF08statement%uFF09%u3002%u6309%u5B57%u7B26%u4E32%u7684%u5F62%u5F0F%u4F20%u5165%u8981%u6267%u884C%u7684%u4EE3%u7801%u3002%u7B2C%u4E8C%u4E2A%u53C2%u6570setup%u7528%u4E8E%u6784%u5EFA%u4EE3%u7801%u73AF%u5883%uFF0C%u53EF%u4EE5%u7528%u6765%u5BFC%u5165%u9700%u8981%u7684%u6A21%u5757%u3002%u6700%u540E%u7684number%u6307%u5B9A%u4E86%u8FD0%u884C%u7684%u6B21%u6570%u3002%0A%0A%u4F7F%u7528%u793A%u4F8B%u5982%u4E0B%uFF1A%0A%60%60%60python%0A%3E%3E%3Eimport%20timeit%0A%3E%3E%3Etimeit.timeit%28%27%22-%22.join%28str%28n%29%20for%20n%20in%20range%28100%29%29%27%2C%20number%3D10000%29%0A0.21051692962646484%0A%60%60%60%0A**repeat%u51FD%u6570**%0A%u53E6%u4E00%u4E2A%u53EF%u4F9B%u4F7F%u7528%u7684%u51FD%u6570%u662Frepeat%u51FD%u6570%uFF0C%u6307%u5B9A%u6574%u4E2A%u8BD5%u9A8C%u7684%u91CD%u590D%u6B21%u6570%uFF0C%u8FD4%u56DE%u4E00%u4E2A%u5305%u542B%u4E86%u6BCF%u6B21%u8BD5%u9A8C%u7684%u6267%u884C%u65F6%u95F4%u7684%u5217%u8868%u3002%0A%60%60%60python%0A%3E%3E%3E%20timeit.repeat%28%27%22-%22.join%28str%28n%29%20for%20n%20in%20range%28100%29%29%27%2Crepeat%3D3%2C%20number%3D10000%29%0A%5B0.21938705444335938%2C%200.21767210960388184%2C%200.21688294410705566%5D%0A%60%60%60%0A%u5229%u7528%u8FD9%u4E00%u51FD%u6570%u53EF%u4EE5%u5F88%u65B9%u4FBF%u5F97%u5B9E%u73B0%u591A%u6B21%u8BD5%u9A8C%u53D6%u5E73%u5747%u7684%u65B9%u6CD5%u3002%0A%0A%23%23%23%23%20%u5728%u811A%u672C%u7A0B%u5E8F%u4E2D%u7684%u4F7F%u7528%0Atimeit%u6A21%u5757%u540C%u6837%u53EF%u4EE5%u5728%u811A%u672C%u4E2D%u76F4%u63A5%u4F7F%u7528%u3002%u4F7F%u7528%u65B9%u6CD5%u8FD8%u662F%u8C03%u7528%u4E0A%u8FF0%u7684%u51FD%u6570%u3002%u4F46%u662F%u5728%u811A%u672C%u4E2D%u65F6%u9700%u8981%u4E3Asetup%u4F20%u5165%u4E00%u6761%u5B57%u7B26%u4E32%u5F62%u5F0F%u7684%u8BED%u53E5%uFF0C%u7528%u4E8E%u6784%u5EFA%u6267%u884C%u73AF%u5883%uFF0C%u793A%u4F8B%u5982%u4E0B%uFF1A%0A%0A%60%60%60python%0Adef%20test%28%29%3A%0A%09L%20%3D%20%5B%5D%0A%09for%20i%20in%20range%28100%29%3A%0A%09%09L.append%28i%29%0A%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%09import%20timeit%0A%09print%20timeit.timeit%28%22test%28%29%22%2C%20setup%3D%22from%20__main__%20import%20test%22%29%29%0A%60%60%60%0A</center>