title: Python存储模块shelve学习笔记
tags:
  - python
id: 85
categories:
  - Python
date: 2015-01-20 15:06:18
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=a5a6baef-4e38-4d48-ac73-65d7d5be0093)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `eat.wordpress.post` `python` `原创` 

</div><div >

Shelve是python中一个用于持久化存储的模块，采用字典的存储形式。Shelve模块的好处是，基本上任何python对象都可以作为存储的键。

</div><div >

#### 创建

调用shelve.open()方法来创建存储对象。传入字符串作为文件名。这里传入的字符串无须加后缀，但是shelve模块底层在写入文件的时候可能会自动为其加上后缀名<a title="See footnote"  style="background: transparent; color: #1980e6; text-decoration: none; vertical-align: top; position: relative; top: -0.5em; font-size: .8em;">1</a>。 

调用方法时还可以为一个参数writeback指定一个布尔值，其默认值为False。若指定writeback为True，则对存储对象的操作将缓存在内存中，只有当调用存储对象的sync方法和close方法时才会写回文件。当存储的操作很多时，会影响内存性能并导致close过程的速度很慢。

</div><div >

    <span  style="color: #f92672;">import</span> shelve
    s = shelve.open(<span  style="color: #e6db74;">"filename"</span>)`</pre>

    <!--more--></div><div >

    #### 使用

    打开存储对象s后，使用的过程非常简单，视为操作一个字典即可。下面为一些操作的例子

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`s[key] = data <span  style="color: #75715e;"># 若key已存在，则覆盖</span>
    data = s[key] <span  style="color: #75715e;"># 取回数据</span>
    <span  style="color: #f92672;">del</span> s[key]    <span  style="color: #75715e;"># 删除</span>

    flag = s.has_key(key) <span  style="color: #75715e;"># 检测是否含有键</span>
    key_list = s.keys() <span  style="color: #75715e;"># 返回所有键的列表</span>`</pre>

    </div><div >

    #### 可变对象的更新问题

    使用shelve过程中存在一个易错的陷进，即当我们已经从存储对象s中取出某个可变数据对象data之后，data在内存中发生更改时，s是无法知道这个更改的，也无法将这个更改自动写回存储文件。如下：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`&gt;&gt;&gt;s[<span  style="color: #e6db74;">'my_list'</span>] = [<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>] <span  style="color: #75715e;"># 放入一个可变对象，列表变量my_list</span>
    &gt;&gt;&gt;s
    &gt;{<span  style="color: #e6db74;">'my_list'</span>: [<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>]}
    &gt;&gt;&gt;data = s[<span  style="color: #e6db74;">'my_list'</span>] <span  style="color: #75715e;"># 取出可变对象</span>
    &gt;&gt;&gt;data.append(<span  style="color: #ae81ff;">4</span>) <span  style="color: #75715e;"># 做出更改</span>
    &gt;&gt;&gt;s
    &gt;{<span  style="color: #e6db74;">'my_list'</span>: [<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>]} <span  style="color: #75715e;"># 存储对象无法知道发生了更改，存储数据不变</span>`</pre>

    为了避免该问题，我们应始终牢记： 

    _仅当对存储对象进行了**赋值**操作时，才算真正存储了。_

    故，对可变对象的正确更新应按如下方式进行：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`temp = s[<span  style="color: #e6db74;">'my_list'</span>] <span  style="color: #75715e;"># 取出可变对象</span>
    temp.append(<span  style="color: #ae81ff;">4</span>) <span  style="color: #75715e;"># 进行更改</span>
    s[<span  style="color: #e6db74;">'my_list'</span>] = temp <span  style="color: #75715e;"># 赋值操作发生，进行存储</span>
    &gt;&gt;&gt;s
    &gt;{<span  style="color: #e6db74;">'my_list'</span>: [<span  style="color: #ae81ff;">1</span>,<span  style="color: #ae81ff;">2</span>,<span  style="color: #ae81ff;">3</span>,<span  style="color: #ae81ff;">4</span>]} <span  style="color: #75715e;"># 存储成功</span>`</pre>

    最后，对本地文件的操作完成后不要忘记关闭它：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`s.close() <span  style="color: #75715e;"># 关闭存储对象</span>

</div><div ><div >

* * *

1.  [官方文档](https://docs.python.org/2/library/shelve.html)是这么写的，但是实测的时候没有加后缀，暂不确定具体是何因素决定了后缀的添加与否。 <a title="Return to article"  style="background: transparent; color: #1980e6; text-decoration: none;">↩</a></div></div></div><center style='display:none'>@%28%u5F52%u6863%29%5Beat.wordpress.post%7Cpython%7C%u539F%u521B%5D%0A%23%23%20Python%u5B58%u50A8%u6A21%u5757shelve%u5B66%u4E60%u7B14%u8BB0%0AShelve%u662Fpython%u4E2D%u4E00%u4E2A%u7528%u4E8E%u6301%u4E45%u5316%u5B58%u50A8%u7684%u6A21%u5757%uFF0C%u91C7%u7528%u5B57%u5178%u7684%u5B58%u50A8%u5F62%u5F0F%u3002Shelve%u6A21%u5757%u7684%u597D%u5904%u662F%uFF0C%u57FA%u672C%u4E0A%u4EFB%u4F55python%u5BF9%u8C61%u90FD%u53EF%u4EE5%u4F5C%u4E3A%u5B58%u50A8%u7684%u952E%u3002%0A%23%23%23%23%20%u521B%u5EFA%0A%u8C03%u7528shelve.open%28%29%u65B9%u6CD5%u6765%u521B%u5EFA%u5B58%u50A8%u5BF9%u8C61%u3002%u4F20%u5165%u5B57%u7B26%u4E32%u4F5C%u4E3A%u6587%u4EF6%u540D%u3002%u8FD9%u91CC%u4F20%u5165%u7684%u5B57%u7B26%u4E32%u65E0%u987B%u52A0%u540E%u7F00%uFF0C%u4F46%u662Fshelve%u6A21%u5757%u5E95%u5C42%u5728%u5199%u5165%u6587%u4EF6%u7684%u65F6%u5019%u53EF%u80FD%u4F1A%u81EA%u52A8%u4E3A%u5176%u52A0%u4E0A%u540E%u7F00%u540D%5B%5E1%5D%u3002%0A%u8C03%u7528%u65B9%u6CD5%u65F6%u8FD8%u53EF%u4EE5%u4E3A%u4E00%u4E2A%u53C2%u6570writeback%u6307%u5B9A%u4E00%u4E2A%u5E03%u5C14%u503C%uFF0C%u5176%u9ED8%u8BA4%u503C%u4E3AFalse%u3002%u82E5%u6307%u5B9Awriteback%u4E3ATrue%uFF0C%u5219%u5BF9%u5B58%u50A8%u5BF9%u8C61%u7684%u64CD%u4F5C%u5C06%u7F13%u5B58%u5728%u5185%u5B58%u4E2D%uFF0C%u53EA%u6709%u5F53%u8C03%u7528%u5B58%u50A8%u5BF9%u8C61%u7684sync%u65B9%u6CD5%u548Cclose%u65B9%u6CD5%u65F6%u624D%u4F1A%u5199%u56DE%u6587%u4EF6%u3002%u5F53%u5B58%u50A8%u7684%u64CD%u4F5C%u5F88%u591A%u65F6%uFF0C%u4F1A%u5F71%u54CD%u5185%u5B58%u6027%u80FD%u5E76%u5BFC%u81F4close%u8FC7%u7A0B%u7684%u901F%u5EA6%u5F88%u6162%u3002%0A%60%60%60python%0Aimport%20shelve%0As%20%3D%20shelve.open%28%22filename%22%29%0A%60%60%60%0A%0A%3C%21--more--%3E%0A%0A%23%23%23%23%u4F7F%u7528%0A%u6253%u5F00%u5B58%u50A8%u5BF9%u8C61s%u540E%uFF0C%u4F7F%u7528%u7684%u8FC7%u7A0B%u975E%u5E38%u7B80%u5355%uFF0C%u89C6%u4E3A%u64CD%u4F5C%u4E00%u4E2A%u5B57%u5178%u5373%u53EF%u3002%u4E0B%u9762%u4E3A%u4E00%u4E9B%u64CD%u4F5C%u7684%u4F8B%u5B50%0A%60%60%60python%0As%5Bkey%5D%20%3D%20data%20%23%20%u82E5key%u5DF2%u5B58%u5728%uFF0C%u5219%u8986%u76D6%0Adata%20%3D%20s%5Bkey%5D%20%23%20%u53D6%u56DE%u6570%u636E%0Adel%20s%5Bkey%5D%20%20%20%20%23%20%u5220%u9664%0A%0Aflag%20%3D%20s.has_key%28key%29%20%23%20%u68C0%u6D4B%u662F%u5426%u542B%u6709%u952E%0Akey_list%20%3D%20s.keys%28%29%20%23%20%u8FD4%u56DE%u6240%u6709%u952E%u7684%u5217%u8868%0A%60%60%60%0A%0A%23%23%23%23%20%u53EF%u53D8%u5BF9%u8C61%u7684%u66F4%u65B0%u95EE%u9898%0A%u4F7F%u7528shelve%u8FC7%u7A0B%u4E2D%u5B58%u5728%u4E00%u4E2A%u6613%u9519%u7684%u9677%u8FDB%uFF0C%u5373%u5F53%u6211%u4EEC%u5DF2%u7ECF%u4ECE%u5B58%u50A8%u5BF9%u8C61s%u4E2D%u53D6%u51FA%u67D0%u4E2A%u53EF%u53D8%u6570%u636E%u5BF9%u8C61data%u4E4B%u540E%uFF0Cdata%u5728%u5185%u5B58%u4E2D%u53D1%u751F%u66F4%u6539%u65F6%uFF0Cs%u662F%u65E0%u6CD5%u77E5%u9053%u8FD9%u4E2A%u66F4%u6539%u7684%uFF0C%u4E5F%u65E0%u6CD5%u5C06%u8FD9%u4E2A%u66F4%u6539%u81EA%u52A8%u5199%u56DE%u5B58%u50A8%u6587%u4EF6%u3002%u5982%u4E0B%uFF1A%0A%60%60%60python%0A%3E%3E%3Es%5B%27my_list%27%5D%20%3D%20%5B1%2C2%2C3%5D%20%23%20%u653E%u5165%u4E00%u4E2A%u53EF%u53D8%u5BF9%u8C61%uFF0C%u5217%u8868%u53D8%u91CFmy_list%0A%3E%3E%3Es%0A%3E%7B%27my_list%27%3A%20%5B1%2C2%2C3%5D%7D%0A%3E%3E%3Edata%20%3D%20s%5B%27my_list%27%5D%20%23%20%u53D6%u51FA%u53EF%u53D8%u5BF9%u8C61%0A%3E%3E%3Edata.append%284%29%20%23%20%u505A%u51FA%u66F4%u6539%0A%3E%3E%3Es%0A%3E%7B%27my_list%27%3A%20%5B1%2C2%2C3%5D%7D%20%23%20%u5B58%u50A8%u5BF9%u8C61%u65E0%u6CD5%u77E5%u9053%u53D1%u751F%u4E86%u66F4%u6539%uFF0C%u5B58%u50A8%u6570%u636E%u4E0D%u53D8%0A%60%60%60%0A%u4E3A%u4E86%u907F%u514D%u8BE5%u95EE%u9898%uFF0C%u6211%u4EEC%u5E94%u59CB%u7EC8%u7262%u8BB0%uFF1A%0A*%u4EC5%u5F53%u5BF9%u5B58%u50A8%u5BF9%u8C61%u8FDB%u884C%u4E86**%u8D4B%u503C**%u64CD%u4F5C%u65F6%uFF0C%u624D%u7B97%u771F%u6B63%u5B58%u50A8%u4E86%u3002*%0A%0A%u6545%uFF0C%u5BF9%u53EF%u53D8%u5BF9%u8C61%u7684%u6B63%u786E%u66F4%u65B0%u5E94%u6309%u5982%u4E0B%u65B9%u5F0F%u8FDB%u884C%uFF1A%0A%60%60%60python%0Atemp%20%3D%20s%5B%27my_list%27%5D%20%23%20%u53D6%u51FA%u53EF%u53D8%u5BF9%u8C61%0Atemp.append%284%29%20%23%20%u8FDB%u884C%u66F4%u6539%0As%5B%27my_list%27%5D%20%3D%20temp%20%23%20%u8D4B%u503C%u64CD%u4F5C%u53D1%u751F%uFF0C%u8FDB%u884C%u5B58%u50A8%0A%3E%3E%3Es%0A%3E%7B%27my_list%27%3A%20%5B1%2C2%2C3%2C4%5D%7D%20%23%20%u5B58%u50A8%u6210%u529F%0A%60%60%60%0A%u6700%u540E%uFF0C%u5BF9%u672C%u5730%u6587%u4EF6%u7684%u64CD%u4F5C%u5B8C%u6210%u540E%u4E0D%u8981%u5FD8%u8BB0%u5173%u95ED%u5B83%uFF1A%0A%60%60%60python%0As.close%28%29%20%23%20%u5173%u95ED%u5B58%u50A8%u5BF9%u8C61%0A%60%60%60%0A%5B%5E1%5D%3A%5B%u5B98%u65B9%u6587%u6863%5D%28https%3A//docs.python.org/2/library/shelve.html%29%u662F%u8FD9%u4E48%u5199%u7684%uFF0C%u4F46%u662F%u5B9E%u6D4B%u7684%u65F6%u5019%u6CA1%u6709%u52A0%u540E%u7F00%uFF0C%u6682%u4E0D%u786E%u5B9A%u5177%u4F53%u662F%u4F55%u56E0%u7D20%u51B3%u5B9A%u4E86%u540E%u7F00%u7684%u6DFB%u52A0%u4E0E%u5426%u3002%0A</center>