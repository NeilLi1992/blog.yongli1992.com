title: LeetCode：寻找列表中的唯一数字
id: 140
categories:
  - 未分类
date: 2015-02-03 20:09:08
tags:
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=bb032023-2e04-4463-ade3-d3e4ac432525)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `python` `原创` `leetCodeOJ` `算法` `eat.wordpress.post` 
</div><div >

原题地址：[single-number](https://oj.leetcode.com/problems/single-number/)

题目翻译如下：

> 给定一个整数数组，其中有一个整数仅出现一次，其余每一个整数都恰好出现了两次。找出这一整数。 
> 
>   注：算法要求线性时间复杂度，不使用额外的存储空间。

一个最初的想法是，利用列表的sort方法来将列表进行排序，之后遍历列表，判断已排序的列表中每一个元素的前后是否存在相同元素，若都不存在，则为我们要找的数。

实际提交时，运行时间超出限制。后来想起来列表的sort方法是O(nlogn)复杂度的，故不行。

在此找到一篇wiki：[Time Complexity](https://wiki.python.org/moin/TimeComplexity)，列出了CPython（即常见官方实现）中各种内置数据结构的方法的复杂度。

后来从讨论区看了别人的实现，才学到可以用按位操作符XOR来实现。这里采用的主要想法是：我们可以用一个初始值为0的变量r来作记录，与列表中的每一个数都做异或运算。对于存在两次的数，做了两次异或后相互作用抵消，仍能将变量r恢复为原来的值。这样当所有数都与r做过异或运算后，r最后的值就记录了那个仅仅出现一次的数。

用规范化的说法，算法可行的原因是基于异或位运算的两条基本原理：

> 自反律：(a ⊕ b) ⊕ b = a 
> 
>   交换律：a ⊕ b ⊕ c = a ⊕ c ⊕ b

第一条自反律保证了，只要两个相同的数都与r做异或，r不受影响。第二条交换律保证了这两个数不必先后紧跟着与r做运算，中间夹杂别的数先来运算也是可以的，只要在整个运算过程中这两个相同的数都算过，第一条的结果仍不受影响。

代码实现如下，A是整数列表。代码非常简洁：
</div><div >

    <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">singleNumber</span><span  style="color: #f8f8f2;">(A)</span>:</span>
            r = <span  style="color: #ae81ff;">0</span>
            <span  style="color: #f92672;">for</span> i <span  style="color: #f92672;">in</span> A:
                r ^= i
            <span  style="color: #f92672;">return</span> r
</div><div ></div></div><center style='display:none'>@%28%u5F52%u6863%29%5Bpython%7C%u539F%u521B%7CleetCodeOJ%7C%u7B97%u6CD5%7Ceat.wordpress.post%5D%0A%23LeetCode%uFF1A%u5BFB%u627E%u5217%u8868%u4E2D%u7684%u552F%u4E00%u6570%u5B57%0A%u539F%u9898%u5730%u5740%uFF1A%5Bsingle-number%5D%28https%3A//oj.leetcode.com/problems/single-number/%29%0A%0A%u9898%u76EE%u7FFB%u8BD1%u5982%u4E0B%uFF1A%0A%3E%u7ED9%u5B9A%u4E00%u4E2A%u6574%u6570%u6570%u7EC4%uFF0C%u5176%u4E2D%u6709%u4E00%u4E2A%u6574%u6570%u4EC5%u51FA%u73B0%u4E00%u6B21%uFF0C%u5176%u4F59%u6BCF%u4E00%u4E2A%u6574%u6570%u90FD%u6070%u597D%u51FA%u73B0%u4E86%u4E24%u6B21%u3002%u627E%u51FA%u8FD9%u4E00%u6574%u6570%u3002%0A%3E%u6CE8%uFF1A%u7B97%u6CD5%u8981%u6C42%u7EBF%u6027%u65F6%u95F4%u590D%u6742%u5EA6%uFF0C%u4E0D%u4F7F%u7528%u989D%u5916%u7684%u5B58%u50A8%u7A7A%u95F4%u3002%0A%0A%u4E00%u4E2A%u6700%u521D%u7684%u60F3%u6CD5%u662F%uFF0C%u5229%u7528%u5217%u8868%u7684sort%u65B9%u6CD5%u6765%u5C06%u5217%u8868%u8FDB%u884C%u6392%u5E8F%uFF0C%u4E4B%u540E%u904D%u5386%u5217%u8868%uFF0C%u5224%u65AD%u5DF2%u6392%u5E8F%u7684%u5217%u8868%u4E2D%u6BCF%u4E00%u4E2A%u5143%u7D20%u7684%u524D%u540E%u662F%u5426%u5B58%u5728%u76F8%u540C%u5143%u7D20%uFF0C%u82E5%u90FD%u4E0D%u5B58%u5728%uFF0C%u5219%u4E3A%u6211%u4EEC%u8981%u627E%u7684%u6570%u3002%0A%0A%u5B9E%u9645%u63D0%u4EA4%u65F6%uFF0C%u8FD0%u884C%u65F6%u95F4%u8D85%u51FA%u9650%u5236%u3002%u540E%u6765%u60F3%u8D77%u6765%u5217%u8868%u7684sort%u65B9%u6CD5%u662FO%28nlogn%29%u590D%u6742%u5EA6%u7684%uFF0C%u6545%u4E0D%u884C%u3002%0A%0A%u5728%u6B64%u627E%u5230%u4E00%u7BC7wiki%uFF1A%5BTime%20Complexity%5D%28https%3A//wiki.python.org/moin/TimeComplexity%29%uFF0C%u5217%u51FA%u4E86CPython%uFF08%u5373%u5E38%u89C1%u5B98%u65B9%u5B9E%u73B0%uFF09%u4E2D%u5404%u79CD%u5185%u7F6E%u6570%u636E%u7ED3%u6784%u7684%u65B9%u6CD5%u7684%u590D%u6742%u5EA6%u3002%0A%0A%u540E%u6765%u4ECE%u8BA8%u8BBA%u533A%u770B%u4E86%u522B%u4EBA%u7684%u5B9E%u73B0%uFF0C%u624D%u5B66%u5230%u53EF%u4EE5%u7528%u6309%u4F4D%u64CD%u4F5C%u7B26XOR%u6765%u5B9E%u73B0%u3002%u8FD9%u91CC%u91C7%u7528%u7684%u4E3B%u8981%u60F3%u6CD5%u662F%uFF1A%u6211%u4EEC%u53EF%u4EE5%u7528%u4E00%u4E2A%u521D%u59CB%u503C%u4E3A0%u7684%u53D8%u91CFr%u6765%u4F5C%u8BB0%u5F55%uFF0C%u4E0E%u5217%u8868%u4E2D%u7684%u6BCF%u4E00%u4E2A%u6570%u90FD%u505A%u5F02%u6216%u8FD0%u7B97%u3002%u5BF9%u4E8E%u5B58%u5728%u4E24%u6B21%u7684%u6570%uFF0C%u505A%u4E86%u4E24%u6B21%u5F02%u6216%u540E%u76F8%u4E92%u4F5C%u7528%u62B5%u6D88%uFF0C%u4ECD%u80FD%u5C06%u53D8%u91CFr%u6062%u590D%u4E3A%u539F%u6765%u7684%u503C%u3002%u8FD9%u6837%u5F53%u6240%u6709%u6570%u90FD%u4E0Er%u505A%u8FC7%u5F02%u6216%u8FD0%u7B97%u540E%uFF0Cr%u6700%u540E%u7684%u503C%u5C31%u8BB0%u5F55%u4E86%u90A3%u4E2A%u4EC5%u4EC5%u51FA%u73B0%u4E00%u6B21%u7684%u6570%u3002%0A%0A%u7528%u89C4%u8303%u5316%u7684%u8BF4%u6CD5%uFF0C%u7B97%u6CD5%u53EF%u884C%u7684%u539F%u56E0%u662F%u57FA%u4E8E%u5F02%u6216%u4F4D%u8FD0%u7B97%u7684%u4E24%u6761%u57FA%u672C%u539F%u7406%uFF1A%0A%0A%3E%u81EA%u53CD%u5F8B%uFF1A%28a%20%u2295%20b%29%20%u2295%20b%20%3D%20a%0A%3E%u4EA4%u6362%u5F8B%uFF1Aa%20%u2295%20b%20%u2295%20c%20%3D%20a%20%u2295%20c%20%u2295%20b%0A%0A%u7B2C%u4E00%u6761%u81EA%u53CD%u5F8B%u4FDD%u8BC1%u4E86%uFF0C%u53EA%u8981%u4E24%u4E2A%u76F8%u540C%u7684%u6570%u90FD%u4E0Er%u505A%u5F02%u6216%uFF0Cr%u4E0D%u53D7%u5F71%u54CD%u3002%u7B2C%u4E8C%u6761%u4EA4%u6362%u5F8B%u4FDD%u8BC1%u4E86%u8FD9%u4E24%u4E2A%u6570%u4E0D%u5FC5%u5148%u540E%u7D27%u8DDF%u7740%u4E0Er%u505A%u8FD0%u7B97%uFF0C%u4E2D%u95F4%u5939%u6742%u522B%u7684%u6570%u5148%u6765%u8FD0%u7B97%u4E5F%u662F%u53EF%u4EE5%u7684%uFF0C%u53EA%u8981%u5728%u6574%u4E2A%u8FD0%u7B97%u8FC7%u7A0B%u4E2D%u8FD9%u4E24%u4E2A%u76F8%u540C%u7684%u6570%u90FD%u7B97%u8FC7%uFF0C%u7B2C%u4E00%u6761%u7684%u7ED3%u679C%u4ECD%u4E0D%u53D7%u5F71%u54CD%u3002%0A%0A%u4EE3%u7801%u5B9E%u73B0%u5982%u4E0B%uFF0CA%u662F%u6574%u6570%u5217%u8868%u3002%u4EE3%u7801%u975E%u5E38%u7B80%u6D01%uFF1A%0A%60%60%60python%0Adef%20singleNumber%28A%29%3A%0A%20%20%20%20%20%20%20%20r%20%3D%200%0A%20%20%20%20%20%20%20%20for%20i%20in%20A%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20r%20%5E%3D%20i%0A%20%20%20%20%20%20%20%20return%20r%0A%60%60%60</center>