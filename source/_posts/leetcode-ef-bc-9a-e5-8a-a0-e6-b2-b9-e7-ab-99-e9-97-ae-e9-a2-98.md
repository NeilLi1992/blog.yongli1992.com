title: LeetCode：加油站问题
id: 161
categories:
  - 未分类
date: 2015-03-13 19:17:55
tags:
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=012d01d3-2b52-4073-95ef-e29b1e831678)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `python` `原创` `leetCodeOJ` `算法` `贪心算` `eat.wordpress.post` 
</div><div >

原题地址：[Gas Station](https://leetcode.com/problems/gas-station/)

题目翻译如下：

> 在环形回路上有 N 个加油站，在加油站 i 处有油 gas[i]。你现在有一辆油箱可以装无限多油的车，从加油站 i 开到加油站 i+1 耗油 cost[i]。你以空的邮箱从某一加油站出发。 
> 
>   如果从某一个加油站出发你可以绕环路走一圈，则返回该加油站的位置 i，若不存在这样的加油站，则返回 -1。 
> 
>   注：假设有唯一解 
> 
>   <!--more-->

</div><div >

#### 解法一：穷举法

代码如下：

</div><div >

    <span ><span  style="color: #66d9ef;">class</span> <span  style="color: #a6e22e; font-style: italic;">Solution</span>:</span>
        <span  style="color: #75715e;"># @param gas, a list of integers</span>
        <span  style="color: #75715e;"># @param cost, a list of integers</span>
        <span  style="color: #75715e;"># @return an integer</span>
        <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">canCompleteCircuit</span><span  style="color: #f8f8f2;">(self, gas, cost)</span>:</span>
            <span  style="color: #f92672;">for</span> start <span  style="color: #f92672;">in</span> range(len(gas)):
                tank = <span  style="color: #ae81ff;">0</span>
                travel_list = range(len(gas))[start:] + range(len(gas))[:start]
                can_travel = <span  style="color: #f92672;">True</span>
                <span  style="color: #f92672;">for</span> from_pos <span  style="color: #f92672;">in</span> travel_list:
                    tank += gas[from_pos]
                    <span  style="color: #f92672;">if</span> tank &lt; cost[from_pos]:
                        can_travel = <span  style="color: #f92672;">False</span>
                        <span  style="color: #f92672;">break</span>
                    <span  style="color: #f92672;">else</span>:
                        tank -= cost[from_pos]
                <span  style="color: #f92672;">if</span> can_travel:
                    <span  style="color: #f92672;">return</span> start
            <span  style="color: #f92672;">else</span>:
                <span  style="color: #f92672;">return</span> -<span  style="color: #ae81ff;">1</span>`</pre>

    我们可以穷举所有可能的起始位置 start。在每次开始时邮箱 tank 都为0。生成循环一圈的位置索引列表 travel_list，然后就一直计算，如果 travel_list 中某个位置有 tank + gas[from_pos] &lt; cost[from_pos]，则表明无法从 from_pos 加油站走到 from_pos+1 油站，此时就不能再继续了。

    该方法的算法复杂度为 O(n)。其问题在于：在测试从 i 作为起始点的遍历过程中，如果在 i 之后的某个 j 位置发现无法走到 j+1 位置，则实际上 i+1 到 j 均不可能作为起始位置，下一个探测的起始位置直接是 j + 1。
    </div><div >

    #### 解法二
    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span ><span  style="color: #66d9ef;">class</span> <span  style="color: #a6e22e; font-style: italic;">Solution2</span>:</span>
        <span  style="color: #75715e;"># @param gas, a list of integers</span>
        <span  style="color: #75715e;"># @param cost, a list of integers</span>
        <span  style="color: #75715e;"># @return an integer</span>
        <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">canCompleteCircuit</span><span  style="color: #f8f8f2;">(self, gas, cost)</span>:</span>
            N = len(gas)
            travel_list = <span  style="color: #ae81ff;">2</span> * range(N)
            start = tank = <span  style="color: #ae81ff;">0</span>
            <span  style="color: #f92672;">for</span> i, station <span  style="color: #f92672;">in</span> enumerate(travel_list):
                tank += gas[station]
                tank -= cost[station]
                <span  style="color: #f92672;">if</span> tank &gt;= <span  style="color: #ae81ff;">0</span> <span  style="color: #f92672;">and</span> travel_list[i+<span  style="color: #ae81ff;">1</span>] == start:
                    <span  style="color: #75715e;"># Find the start index</span>
                    <span  style="color: #f92672;">return</span> start
                <span  style="color: #f92672;">elif</span> tank &lt; <span  style="color: #ae81ff;">0</span>:
                    <span  style="color: #f92672;">if</span> i+<span  style="color: #ae81ff;">1</span> &gt; travel_list[i+<span  style="color: #ae81ff;">1</span>]:
                        <span  style="color: #75715e;"># Won't find any more</span>
                        <span  style="color: #f92672;">return</span> -<span  style="color: #ae81ff;">1</span>
                    <span  style="color: #f92672;">else</span>:
                        tank = <span  style="color: #ae81ff;">0</span>
                        start = travel_list[i+<span  style="color: #ae81ff;">1</span>]

在这里我们先用 2 * range(N) 构造 travel_list，只要把这个 list 遍历一遍即可。起始时 tank = 0。在每到一个 station 时，都先计算前往下一个 station 后 tank 中的油量，若 tank &gt;= 0 的同时发现 travel_list 中存储的下一个位置已经是我们标记的 start 位置，则表明完成了循环遍历，也就找到了出口。如果 tank &lt; 0，则表明无法前往下一个 station。若发现 travel_list 的下一个油站坐标小于它在该 list 中的索引坐标，则表明已经到了 travel_list 的后半部分，也表明我们已经将每一个位置都作为 start 位置测试过了，再往后不可能再找到出口，直接返回 -1。否则的话，油箱置零，继续测试下一个 start 位置。

这样的话，算法复杂度为 O(n)，只要一个外循环就可以搞定。
</div><div ></div></div><center style='display:none'>@%28%u5F52%u6863%29%5Bpython%7C%u539F%u521B%7CleetCodeOJ%7C%u7B97%u6CD5%7C%u8D2A%u5FC3%u7B97%7Ceat.wordpress.post%5D%0A%23LeetCode%uFF1A%u52A0%u6CB9%u7AD9%u95EE%u9898%0A%u539F%u9898%u5730%u5740%uFF1A%5BGas%20Station%5D%28https%3A//leetcode.com/problems/gas-station/%29%0A%0A%u9898%u76EE%u7FFB%u8BD1%u5982%u4E0B%uFF1A%0A%3E%u5728%u73AF%u5F62%u56DE%u8DEF%u4E0A%u6709%20N%20%u4E2A%u52A0%u6CB9%u7AD9%uFF0C%u5728%u52A0%u6CB9%u7AD9%20i%20%u5904%u6709%u6CB9%20gas%5Bi%5D%u3002%u4F60%u73B0%u5728%u6709%u4E00%u8F86%u6CB9%u7BB1%u53EF%u4EE5%u88C5%u65E0%u9650%u591A%u6CB9%u7684%u8F66%uFF0C%u4ECE%u52A0%u6CB9%u7AD9%20i%20%u5F00%u5230%u52A0%u6CB9%u7AD9%20i+1%20%u8017%u6CB9%20cost%5Bi%5D%u3002%u4F60%u4EE5%u7A7A%u7684%u90AE%u7BB1%u4ECE%u67D0%u4E00%u52A0%u6CB9%u7AD9%u51FA%u53D1%u3002%0A%3E%u5982%u679C%u4ECE%u67D0%u4E00%u4E2A%u52A0%u6CB9%u7AD9%u51FA%u53D1%u4F60%u53EF%u4EE5%u7ED5%u73AF%u8DEF%u8D70%u4E00%u5708%uFF0C%u5219%u8FD4%u56DE%u8BE5%u52A0%u6CB9%u7AD9%u7684%u4F4D%u7F6E%20i%uFF0C%u82E5%u4E0D%u5B58%u5728%u8FD9%u6837%u7684%u52A0%u6CB9%u7AD9%uFF0C%u5219%u8FD4%u56DE%20-1%u3002%0A%3E%u6CE8%uFF1A%u5047%u8BBE%u6709%u552F%u4E00%u89E3%0A%3C%21--more--%3E%0A%23%23%23%23%u89E3%u6CD5%u4E00%uFF1A%u7A77%u4E3E%u6CD5%0A%u4EE3%u7801%u5982%u4E0B%uFF1A%0A%60%60%60python%0Aclass%20Solution%3A%0A%20%20%20%20%23%20@param%20gas%2C%20a%20list%20of%20integers%0A%20%20%20%20%23%20@param%20cost%2C%20a%20list%20of%20integers%0A%20%20%20%20%23%20@return%20an%20integer%0A%20%20%20%20def%20canCompleteCircuit%28self%2C%20gas%2C%20cost%29%3A%0A%20%20%20%20%20%20%20%20for%20start%20in%20range%28len%28gas%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tank%20%3D%200%0A%20%20%20%20%20%20%20%20%20%20%20%20travel_list%20%3D%20range%28len%28gas%29%29%5Bstart%3A%5D%20+%20range%28len%28gas%29%29%5B%3Astart%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20can_travel%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20for%20from_pos%20in%20travel_list%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tank%20+%3D%20gas%5Bfrom_pos%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20tank%20%3C%20cost%5Bfrom_pos%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20can_travel%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tank%20-%3D%20cost%5Bfrom_pos%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20can_travel%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20start%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20-1%0A%60%60%60%0A%u6211%u4EEC%u53EF%u4EE5%u7A77%u4E3E%u6240%u6709%u53EF%u80FD%u7684%u8D77%u59CB%u4F4D%u7F6E%20start%u3002%u5728%u6BCF%u6B21%u5F00%u59CB%u65F6%u90AE%u7BB1%20tank%20%u90FD%u4E3A0%u3002%u751F%u6210%u5FAA%u73AF%u4E00%u5708%u7684%u4F4D%u7F6E%u7D22%u5F15%u5217%u8868%20travel_list%uFF0C%u7136%u540E%u5C31%u4E00%u76F4%u8BA1%u7B97%uFF0C%u5982%u679C%20travel_list%20%u4E2D%u67D0%u4E2A%u4F4D%u7F6E%u6709%20tank%20+%20gas%5Bfrom_pos%5D%20%3C%20cost%5Bfrom_pos%5D%uFF0C%u5219%u8868%u660E%u65E0%u6CD5%u4ECE%20from_pos%20%u52A0%u6CB9%u7AD9%u8D70%u5230%20from_pos+1%20%u6CB9%u7AD9%uFF0C%u6B64%u65F6%u5C31%u4E0D%u80FD%u518D%u7EE7%u7EED%u4E86%u3002%0A%0A%u8BE5%u65B9%u6CD5%u7684%u7B97%u6CD5%u590D%u6742%u5EA6%u4E3A%20O%28n%29%u3002%u5176%u95EE%u9898%u5728%u4E8E%uFF1A%u5728%u6D4B%u8BD5%u4ECE%20i%20%u4F5C%u4E3A%u8D77%u59CB%u70B9%u7684%u904D%u5386%u8FC7%u7A0B%u4E2D%uFF0C%u5982%u679C%u5728%20i%20%u4E4B%u540E%u7684%u67D0%u4E2A%20j%20%u4F4D%u7F6E%u53D1%u73B0%u65E0%u6CD5%u8D70%u5230%20j+1%20%u4F4D%u7F6E%uFF0C%u5219%u5B9E%u9645%u4E0A%20i+1%20%u5230%20j%20%u5747%u4E0D%u53EF%u80FD%u4F5C%u4E3A%u8D77%u59CB%u4F4D%u7F6E%uFF0C%u4E0B%u4E00%u4E2A%u63A2%u6D4B%u7684%u8D77%u59CB%u4F4D%u7F6E%u76F4%u63A5%u662F%20j%20+%201%u3002%0A%0A%23%23%23%23%u89E3%u6CD5%u4E8C%0A%60%60%60python%0Aclass%20Solution2%3A%0A%20%20%20%20%23%20@param%20gas%2C%20a%20list%20of%20integers%0A%20%20%20%20%23%20@param%20cost%2C%20a%20list%20of%20integers%0A%20%20%20%20%23%20@return%20an%20integer%0A%20%20%20%20def%20canCompleteCircuit%28self%2C%20gas%2C%20cost%29%3A%0A%20%20%20%20%20%20%20%20N%20%3D%20len%28gas%29%0A%20%20%20%20%20%20%20%20travel_list%20%3D%202%20*%20range%28N%29%0A%20%20%20%20%20%20%20%20start%20%3D%20tank%20%3D%200%0A%20%20%20%20%20%20%20%20for%20i%2C%20station%20in%20enumerate%28travel_list%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tank%20+%3D%20gas%5Bstation%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20tank%20-%3D%20cost%5Bstation%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20tank%20%3E%3D%200%20and%20travel_list%5Bi+1%5D%20%3D%3D%20start%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Find%20the%20start%20index%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20start%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20tank%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20i+1%20%3E%20travel_list%5Bi+1%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Won%27t%20find%20any%20more%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tank%20%3D%200%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20start%20%3D%20travel_list%5Bi+1%5D%0A%60%60%60%0A%u5728%u8FD9%u91CC%u6211%u4EEC%u5148%u7528%202%20*%20range%28N%29%20%u6784%u9020%20travel_list%uFF0C%u53EA%u8981%u628A%u8FD9%u4E2A%20list%20%u904D%u5386%u4E00%u904D%u5373%u53EF%u3002%u8D77%u59CB%u65F6%20tank%20%3D%200%u3002%u5728%u6BCF%u5230%u4E00%u4E2A%20station%20%u65F6%uFF0C%u90FD%u5148%u8BA1%u7B97%u524D%u5F80%u4E0B%u4E00%u4E2A%20station%20%u540E%20tank%20%u4E2D%u7684%u6CB9%u91CF%uFF0C%u82E5%20tank%20%3E%3D%200%20%u7684%u540C%u65F6%u53D1%u73B0%20travel_list%20%u4E2D%u5B58%u50A8%u7684%u4E0B%u4E00%u4E2A%u4F4D%u7F6E%u5DF2%u7ECF%u662F%u6211%u4EEC%u6807%u8BB0%u7684%20start%20%u4F4D%u7F6E%uFF0C%u5219%u8868%u660E%u5B8C%u6210%u4E86%u5FAA%u73AF%u904D%u5386%uFF0C%u4E5F%u5C31%u627E%u5230%u4E86%u51FA%u53E3%u3002%u5982%u679C%20tank%20%3C%200%uFF0C%u5219%u8868%u660E%u65E0%u6CD5%u524D%u5F80%u4E0B%u4E00%u4E2A%20station%u3002%u82E5%u53D1%u73B0%20travel_list%20%u7684%u4E0B%u4E00%u4E2A%u6CB9%u7AD9%u5750%u6807%u5C0F%u4E8E%u5B83%u5728%u8BE5%20list%20%u4E2D%u7684%u7D22%u5F15%u5750%u6807%uFF0C%u5219%u8868%u660E%u5DF2%u7ECF%u5230%u4E86%20travel_list%20%u7684%u540E%u534A%u90E8%u5206%uFF0C%u4E5F%u8868%u660E%u6211%u4EEC%u5DF2%u7ECF%u5C06%u6BCF%u4E00%u4E2A%u4F4D%u7F6E%u90FD%u4F5C%u4E3A%20start%20%u4F4D%u7F6E%u6D4B%u8BD5%u8FC7%u4E86%uFF0C%u518D%u5F80%u540E%u4E0D%u53EF%u80FD%u518D%u627E%u5230%u51FA%u53E3%uFF0C%u76F4%u63A5%u8FD4%u56DE%20-1%u3002%u5426%u5219%u7684%u8BDD%uFF0C%u6CB9%u7BB1%u7F6E%u96F6%uFF0C%u7EE7%u7EED%u6D4B%u8BD5%u4E0B%u4E00%u4E2A%20start%20%u4F4D%u7F6E%u3002%0A%0A%u8FD9%u6837%u7684%u8BDD%uFF0C%u7B97%u6CD5%u590D%u6742%u5EA6%u4E3A%20O%28n%29%uFF0C%u53EA%u8981%u4E00%u4E2A%u5916%u5FAA%u73AF%u5C31%u53EF%u4EE5%u641E%u5B9A%u3002</center>