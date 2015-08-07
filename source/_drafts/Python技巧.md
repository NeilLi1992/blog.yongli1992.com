title: Python技巧
tags:
  - python
id: 77
categories:
  - Python
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=c2b3a8ae-919f-47ca-b2f0-1c6ffc5c9bd3)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`收集` `python` `TO-DO` `原创` `eat.wordpress.draft` 
</div><div >

</div><div >

### 二维矩阵一维化

将二维矩阵扁平化的单行写法：

</div><div >

    a = [[<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>],[<span  style="color: #ae81ff;">4</span>,<span  style="color: #ae81ff;">5</span>,<span  style="color: #ae81ff;">6</span>],[<span  style="color: #ae81ff;">7</span>,<span  style="color: #ae81ff;">8</span>,<span  style="color: #ae81ff;">9</span>]]
    b = [item <span  style="color: #f92672;">for</span> sublist <span  style="color: #f92672;">in</span> a <span  style="color: #f92672;">for</span> item <span  style="color: #f92672;">in</span> sublist]
    <span  style="color: #e6db74;">&gt;&gt;&gt; </span>b
    &gt;[<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>,<span  style="color: #ae81ff;">5</span>,<span  style="color: #ae81ff;">6</span>,<span  style="color: #ae81ff;">7</span>,<span  style="color: #ae81ff;">8</span>,<span  style="color: #ae81ff;">9</span>]`</pre>

    </div><div >

    ### 从列表中去除指定元素

    给定一个列表a_list，指定一个元素x。调用列表的remove方法可以删除列表第一个出现的x。但是如果要清楚列表中所有的x的话，可以用filter函数。 

    需要注意的是，filter不是一个原地方法，调用后返回新的列表，原列表不变。

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`&gt;&gt;&gt;a_list = [<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>]
    &gt;&gt;&gt;x = <span  style="color: #ae81ff;">1</span>
    &gt;&gt;&gt;filter(<span  style="color: #f92672;">lambda</span> e: e!= x, a_list)
    &gt;[<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>] <span  style="color: #75715e;"># 返回新的列表对象，去除了所有指定元素x</span>
    &gt;&gt;&gt;a_list
    &gt;[<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>] <span  style="color: #75715e;"># 原列表不变</span>
</div><div ></div></div><center style='display:none'>@%28%u6536%u96C6%29%5Bpython%7CTO-DO%7C%u539F%u521B%7Ceat.wordpress.draft%5D%0A%23%20Python%u6280%u5DE7%0A%23%23%23%20%u4E8C%u7EF4%u77E9%u9635%u4E00%u7EF4%u5316%0A%u5C06%u4E8C%u7EF4%u77E9%u9635%u6241%u5E73%u5316%u7684%u5355%u884C%u5199%u6CD5%uFF1A%0A%60%60%60python%0Aa%20%3D%20%5B%5B1%2C2%2C3%5D%2C%5B4%2C5%2C6%5D%2C%5B7%2C8%2C9%5D%5D%0Ab%20%3D%20%5Bitem%20for%20sublist%20in%20a%20for%20item%20in%20sublist%5D%0A%3E%3E%3E%20b%0A%3E%5B1%2C2%2C3%2C5%2C6%2C7%2C8%2C9%5D%0A%60%60%60%0A%0A%23%23%23%u4ECE%u5217%u8868%u4E2D%u53BB%u9664%u6307%u5B9A%u5143%u7D20%0A%u7ED9%u5B9A%u4E00%u4E2A%u5217%u8868a_list%uFF0C%u6307%u5B9A%u4E00%u4E2A%u5143%u7D20x%u3002%u8C03%u7528%u5217%u8868%u7684remove%u65B9%u6CD5%u53EF%u4EE5%u5220%u9664%u5217%u8868%u7B2C%u4E00%u4E2A%u51FA%u73B0%u7684x%u3002%u4F46%u662F%u5982%u679C%u8981%u6E05%u695A%u5217%u8868%u4E2D%u6240%u6709%u7684x%u7684%u8BDD%uFF0C%u53EF%u4EE5%u7528filter%u51FD%u6570%u3002%0A%u9700%u8981%u6CE8%u610F%u7684%u662F%uFF0Cfilter%u4E0D%u662F%u4E00%u4E2A%u539F%u5730%u65B9%u6CD5%uFF0C%u8C03%u7528%u540E%u8FD4%u56DE%u65B0%u7684%u5217%u8868%uFF0C%u539F%u5217%u8868%u4E0D%u53D8%u3002%0A%60%60%60python%0A%3E%3E%3Ea_list%20%3D%20%5B1%2C1%2C1%2C2%2C3%5D%0A%3E%3E%3Ex%20%3D%201%0A%3E%3E%3Efilter%28lambda%20e%3A%20e%21%3D%20x%2C%20a_list%29%0A%3E%5B2%2C3%5D%20%23%20%u8FD4%u56DE%u65B0%u7684%u5217%u8868%u5BF9%u8C61%uFF0C%u53BB%u9664%u4E86%u6240%u6709%u6307%u5B9A%u5143%u7D20x%0A%3E%3E%3Ea_list%0A%3E%5B1%2C1%2C1%2C2%2C3%5D%20%23%20%u539F%u5217%u8868%u4E0D%u53D8%0A%60%60%60%0A</center>