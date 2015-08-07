title: 什么是鸭子类型（duck typing）
id: 150
categories:
  - 未分类
date: 2015-02-09 22:59:50
tags:
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=3df39a6e-21d9-42fa-88b9-8ef10f73771c)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `python` `原创` `编程语言` `eat.wordpress.post` 
</div><div >

鸭子类型是动态语言的一种设计风格。提到鸭子类型就不得不提它的名称由来：如果像鸭子一样走路，像鸭子一样呱呱叫，那它就是一只鸭子。

鸭子类型本质体现的是面向接口的编程。相比之下，传统的静态OO语言如java等的多态思想，体现的是面向继承的编程。

简单来说，动态语言因为运行前不需要确定变量类型，故对对象的方法调用，只要对象拥有这一名称的方法，就一定能调用成功。

如：

</div><div >

    <span ><span  style="color: #66d9ef;">class</span> <span  style="color: #a6e22e; font-style: italic;">A</span>:</span>
        <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">say</span><span  style="color: #f8f8f2;">(self)</span>:</span>
            <span  style="color: #f92672;">print</span> <span  style="color: #e6db74;">"Called as A's instance"</span>

    <span ><span  style="color: #66d9ef;">class</span> <span  style="color: #a6e22e; font-style: italic;">B</span>:</span>
        <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">say</span><span  style="color: #f8f8f2;">(self)</span>:</span>
            <span  style="color: #f92672;">print</span> <span  style="color: #e6db74;">"Called as B's instance"</span>

    <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">process</span><span  style="color: #f8f8f2;">(obj)</span>:</span>
        obj.say()

    a = A()
    b = B()
    process(a)
    process(b)

这个例子里我们看到，process处理函数要求接受到的参数对象具有一个say方法，则 a 和 b 都具有这个方法，它们都被视作合法的输入，而不关心它们具体是什么类型。

而在静态语言里，必须指明参数obj的类型。即使使用多态的思想，合法的输入参数也至少要是指明的obj类型的子类型，其他的类型就算实现了 say 方法，也是无法调用的。使用反射可以做到类似的实现，但是相对欠灵活。
</div><div ></div></div><center style='display:none'>@%28%u5F52%u6863%29%5Bpython%7C%u539F%u521B%7C%u7F16%u7A0B%u8BED%u8A00%7Ceat.wordpress.post%5D%0A%23%23%20%u4EC0%u4E48%u662F%u9E2D%u5B50%u7C7B%u578B%uFF08duck%20typing%uFF09%0A%u9E2D%u5B50%u7C7B%u578B%u662F%u52A8%u6001%u8BED%u8A00%u7684%u4E00%u79CD%u8BBE%u8BA1%u98CE%u683C%u3002%u63D0%u5230%u9E2D%u5B50%u7C7B%u578B%u5C31%u4E0D%u5F97%u4E0D%u63D0%u5B83%u7684%u540D%u79F0%u7531%u6765%uFF1A%u5982%u679C%u50CF%u9E2D%u5B50%u4E00%u6837%u8D70%u8DEF%uFF0C%u50CF%u9E2D%u5B50%u4E00%u6837%u5471%u5471%u53EB%uFF0C%u90A3%u5B83%u5C31%u662F%u4E00%u53EA%u9E2D%u5B50%u3002%0A%0A%u9E2D%u5B50%u7C7B%u578B%u672C%u8D28%u4F53%u73B0%u7684%u662F%u9762%u5411%u63A5%u53E3%u7684%u7F16%u7A0B%u3002%u76F8%u6BD4%u4E4B%u4E0B%uFF0C%u4F20%u7EDF%u7684%u9759%u6001OO%u8BED%u8A00%u5982java%u7B49%u7684%u591A%u6001%u601D%u60F3%uFF0C%u4F53%u73B0%u7684%u662F%u9762%u5411%u7EE7%u627F%u7684%u7F16%u7A0B%u3002%0A%0A%u7B80%u5355%u6765%u8BF4%uFF0C%u52A8%u6001%u8BED%u8A00%u56E0%u4E3A%u8FD0%u884C%u524D%u4E0D%u9700%u8981%u786E%u5B9A%u53D8%u91CF%u7C7B%u578B%uFF0C%u6545%u5BF9%u5BF9%u8C61%u7684%u65B9%u6CD5%u8C03%u7528%uFF0C%u53EA%u8981%u5BF9%u8C61%u62E5%u6709%u8FD9%u4E00%u540D%u79F0%u7684%u65B9%u6CD5%uFF0C%u5C31%u4E00%u5B9A%u80FD%u8C03%u7528%u6210%u529F%u3002%0A%0A%u5982%uFF1A%0A%60%60%60python%0Aclass%20A%3A%0A%09def%20say%28self%29%3A%0A%09%09print%20%22Called%20as%20A%27s%20instance%22%0A%0Aclass%20B%3A%0A%09def%20say%28self%29%3A%0A%09%09print%20%22Called%20as%20B%27s%20instance%22%0A%0Adef%20process%28obj%29%3A%0A%09obj.say%28%29%0A%0Aa%20%3D%20A%28%29%0Ab%20%3D%20B%28%29%0Aprocess%28a%29%0Aprocess%28b%29%0A%0A%60%60%60%0A%u8FD9%u4E2A%u4F8B%u5B50%u91CC%u6211%u4EEC%u770B%u5230%uFF0Cprocess%u5904%u7406%u51FD%u6570%u8981%u6C42%u63A5%u53D7%u5230%u7684%u53C2%u6570%u5BF9%u8C61%u5177%u6709%u4E00%u4E2Asay%u65B9%u6CD5%uFF0C%u5219%20a%20%u548C%20b%20%u90FD%u5177%u6709%u8FD9%u4E2A%u65B9%u6CD5%uFF0C%u5B83%u4EEC%u90FD%u88AB%u89C6%u4F5C%u5408%u6CD5%u7684%u8F93%u5165%uFF0C%u800C%u4E0D%u5173%u5FC3%u5B83%u4EEC%u5177%u4F53%u662F%u4EC0%u4E48%u7C7B%u578B%u3002%0A%0A%u800C%u5728%u9759%u6001%u8BED%u8A00%u91CC%uFF0C%u5FC5%u987B%u6307%u660E%u53C2%u6570obj%u7684%u7C7B%u578B%u3002%u5373%u4F7F%u4F7F%u7528%u591A%u6001%u7684%u601D%u60F3%uFF0C%u5408%u6CD5%u7684%u8F93%u5165%u53C2%u6570%u4E5F%u81F3%u5C11%u8981%u662F%u6307%u660E%u7684obj%u7C7B%u578B%u7684%u5B50%u7C7B%u578B%uFF0C%u5176%u4ED6%u7684%u7C7B%u578B%u5C31%u7B97%u5B9E%u73B0%u4E86%20say%20%u65B9%u6CD5%uFF0C%u4E5F%u662F%u65E0%u6CD5%u8C03%u7528%u7684%u3002%u4F7F%u7528%u53CD%u5C04%u53EF%u4EE5%u505A%u5230%u7C7B%u4F3C%u7684%u5B9E%u73B0%uFF0C%u4F46%u662F%u76F8%u5BF9%u6B20%u7075%u6D3B%u3002</center>