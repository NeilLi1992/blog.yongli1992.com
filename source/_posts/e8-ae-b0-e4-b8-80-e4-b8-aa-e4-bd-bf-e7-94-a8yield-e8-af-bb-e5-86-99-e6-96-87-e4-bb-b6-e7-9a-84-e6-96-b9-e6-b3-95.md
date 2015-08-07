title: 记一个使用yield读写文件的方法
tags:
  - python
id: 104
categories:
  - Python
date: 2015-01-23 03:30:08
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=5c03c572-2b22-4aa1-8114-8fa67e16337a)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `python` `原创` `eat.wordpress.post` 
</div><div >

在学习yield的使用方法的时候遇到了一个非常实用的应用，记录如下。

在我们直接使用read()方法来读取一个文件的全部内容的时候，会导致不可预测的内存占用，即当文件很大时有可能直接内存不够用了。好的方法是利用一个指定长度的缓冲区配合yield来逐次返回文件内容，代码示例如下：

</div><div >

    <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">read_file</span><span  style="color: #f8f8f2;">(file_name)</span>:</span>
        BUFFER_SIZE = <span  style="color: #ae81ff;">1024</span>
        <span  style="color: #f92672;">with</span> open(file_name, <span  style="color: #e6db74;">'r+'</span>) <span  style="color: #f92672;">as</span> f:
            <span  style="color: #f92672;">while</span> <span  style="color: #f92672;">True</span>:
                block = f.read(BUFFER_SIZE) <span  style="color: #75715e;"># 读取文件内容至缓存区</span>
                <span  style="color: #f92672;">if</span> block:
                    <span  style="color: #f92672;">yield</span> block
                <span  style="color: #f92672;">else</span>:
                    <span  style="color: #f92672;">return</span> <span  style="color: #75715e;"># 退出生成器</span>
</div><div ></div></div><center style='display:none'>@%28%u5F52%u6863%29%5Bpython%7C%u539F%u521B%7Ceat.wordpress.post%5D%0A%23%u8BB0%u4E00%u4E2A%u4F7F%u7528yield%u8BFB%u5199%u6587%u4EF6%u7684%u65B9%u6CD5%0A%u5728%u5B66%u4E60yield%u7684%u4F7F%u7528%u65B9%u6CD5%u7684%u65F6%u5019%u9047%u5230%u4E86%u4E00%u4E2A%u975E%u5E38%u5B9E%u7528%u7684%u5E94%u7528%uFF0C%u8BB0%u5F55%u5982%u4E0B%u3002%0A%0A%u5728%u6211%u4EEC%u76F4%u63A5%u4F7F%u7528read%28%29%u65B9%u6CD5%u6765%u8BFB%u53D6%u4E00%u4E2A%u6587%u4EF6%u7684%u5168%u90E8%u5185%u5BB9%u7684%u65F6%u5019%uFF0C%u4F1A%u5BFC%u81F4%u4E0D%u53EF%u9884%u6D4B%u7684%u5185%u5B58%u5360%u7528%uFF0C%u5373%u5F53%u6587%u4EF6%u5F88%u5927%u65F6%u6709%u53EF%u80FD%u76F4%u63A5%u5185%u5B58%u4E0D%u591F%u7528%u4E86%u3002%u597D%u7684%u65B9%u6CD5%u662F%u5229%u7528%u4E00%u4E2A%u6307%u5B9A%u957F%u5EA6%u7684%u7F13%u51B2%u533A%u914D%u5408yield%u6765%u9010%u6B21%u8FD4%u56DE%u6587%u4EF6%u5185%u5BB9%uFF0C%u4EE3%u7801%u793A%u4F8B%u5982%u4E0B%uFF1A%0A%60%60%60python%0Adef%20read_file%28file_name%29%3A%0A%09BUFFER_SIZE%20%3D%201024%0A%09with%20open%28file_name%2C%20%27r+%27%29%20as%20f%3A%0A%09%09while%20True%3A%0A%09%09%09block%20%3D%20f.read%28BUFFER_SIZE%29%20%23%20%u8BFB%u53D6%u6587%u4EF6%u5185%u5BB9%u81F3%u7F13%u5B58%u533A%0A%09%09%09if%20block%3A%0A%09%09%09%09yield%20block%0A%09%09%09else%3A%0A%09%09%09%09return%20%23%20%u9000%u51FA%u751F%u6210%u5668%0A%60%60%60</center>