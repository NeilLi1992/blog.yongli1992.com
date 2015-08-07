title: LeetCode：判断单链列表是否存在环
tags:
  - LeetCode
  - python
id: 74
categories:
  - Python
date: 2015-01-20 16:12:03
---

<del style="position: relative; display: block;">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=5bcf8a4e-24c2-4085-90b6-8032de225b06)</del>
<div style="line-height: 1.5; color: #2c3f51;">
<div>

判断单链列表是否存在环，即某个节点的next指向链表中在它前面的节点，这样在链表尾部形成一环。

</div>
<div>

#### 判断是否存在环

用一个fast指针，一个slow指针，slow每次移动1，fast每次移动2.
若链表存在环，移动快的fast指针一定在环内追赶上移动慢的slow指针，则相遇

</div>
<div>

#### 找到环的入口

当两指针第一次相遇后，证明存在环。现在将fast指针重新设为head，slow指针不变。
接下来fast和slow都每次移动1。两指针在此相遇的位置即为环的入口。

</div>
<!--more-->

<div>

#### 证明

设初次相遇时循环运行n次。设初次相遇为M点，head到环入口距离为a，环入口到M点距离为b。环路周长为L。第一次相遇时fast已经走了k圈（不能保证相遇时fast只多走1圈）。
slow走的距离为d1 = a + b = n
fast走的距离为d2 = a + b+ k*L = 2n
d2 - d1 = n = k*L，可知长度n恰好为环周长的整数倍。
此时slow从相遇点M再走n步，可以回到相遇点M。
此时fast从head出发走n步，也可到达M。
实际上两者在走完a步后就相遇了，此处即为环的入口。

</div>
<div>

#### Python实现

</div>
<div>

    slow = fast = head
    <span style="color: #f92672;">while</span> <span style="color: #f92672;">True</span>:
         <span style="color: #f92672;">if</span> <span style="color: #f92672;">not</span> fast.next <span style="color: #f92672;">or</span> <span style="color: #f92672;">not</span> fast.next.next:
              <span style="color: #75715e;"># No loop</span>
              <span style="color: #f92672;">return</span> <span style="color: #f92672;">None</span>
         <span style="color: #f92672;">else</span>:
              slow = slow.next
              fast = fast.next.next
              <span style="color: #f92672;">if</span> slow == fast:
                   <span style="color: #f92672;">break</span>

    <span style="color: #75715e;"># Encountered for 1st time. Now set out again</span>
    <span style="color: #f92672;">while</span> fast != slow:
         fast = fast.next
         slow = slow.next

    <span style="color: #75715e;"># Now both fast and slow point to the loop entrance</span>
    <span style="color: #f92672;">return</span> fast

</div>
<div>

#### 应用

可以用来解决两个单链表是否存在交点的问题，如下：

给定两个单链表A，B，问A，B是否存在某个相交节点，若存在则返回该节点。应用我们的方法，可以在O(n)时间，O(1)空间内求解。
方法是先遍历A找到尾节点tailA，设置tailA.next = headB。若A与B有交点，则从headA再出发使用我们的算法找到环，环路入口即为链表交点。

</div>
<div></div>
</div>
<center style="display: none;">@%28%u6280%u672F%u5B66%u4E60%29%5Bpython%7C%u539F%u521B%7CleetCodeOJ%7Ceat.wordpress.post%5D%0A%23LeetCode%uFF1A%u5224%u65AD%u5355%u94FE%u5217%u8868%u662F%u5426%u5B58%u5728%u73AF%0A%u5224%u65AD%u5355%u94FE%u5217%u8868%u662F%u5426%u5B58%u5728%u73AF%uFF0C%u5373%u67D0%u4E2A%u8282%u70B9%u7684next%u6307%u5411%u94FE%u8868%u4E2D%u5728%u5B83%u524D%u9762%u7684%u8282%u70B9%uFF0C%u8FD9%u6837%u5728%u94FE%u8868%u5C3E%u90E8%u5F62%u6210%u4E00%u73AF%u3002%0A%0A%23%23%23%23%u5224%u65AD%u662F%u5426%u5B58%u5728%u73AF%0A%u7528%u4E00%u4E2Afast%u6307%u9488%uFF0C%u4E00%u4E2Aslow%u6307%u9488%uFF0Cslow%u6BCF%u6B21%u79FB%u52A81%uFF0Cfast%u6BCF%u6B21%u79FB%u52A82.%0A%u82E5%u94FE%u8868%u5B58%u5728%u73AF%uFF0C%u79FB%u52A8%u5FEB%u7684fast%u6307%u9488%u4E00%u5B9A%u5728%u73AF%u5185%u8FFD%u8D76%u4E0A%u79FB%u52A8%u6162%u7684slow%u6307%u9488%uFF0C%u5219%u76F8%u9047%0A%0A%23%23%23%23%20%u627E%u5230%u73AF%u7684%u5165%u53E3%0A%u5F53%u4E24%u6307%u9488%u7B2C%u4E00%u6B21%u76F8%u9047%u540E%uFF0C%u8BC1%u660E%u5B58%u5728%u73AF%u3002%u73B0%u5728%u5C06fast%u6307%u9488%u91CD%u65B0%u8BBE%u4E3Ahead%uFF0Cslow%u6307%u9488%u4E0D%u53D8%u3002%0A%u63A5%u4E0B%u6765fast%u548Cslow%u90FD%u6BCF%u6B21%u79FB%u52A81%u3002%u4E24%u6307%u9488%u5728%u6B64%u76F8%u9047%u7684%u4F4D%u7F6E%u5373%u4E3A%u73AF%u7684%u5165%u53E3%u3002%0A%0A%23%23%23%23%20%u8BC1%u660E%0A%u8BBE%u521D%u6B21%u76F8%u9047%u65F6%u5FAA%u73AF%u8FD0%u884Cn%u6B21%u3002%u8BBE%u521D%u6B21%u76F8%u9047%u4E3AM%u70B9%uFF0Chead%u5230%u73AF%u5165%u53E3%u8DDD%u79BB%u4E3Aa%uFF0C%u73AF%u5165%u53E3%u5230M%u70B9%u8DDD%u79BB%u4E3Ab%u3002%u73AF%u8DEF%u5468%u957F%u4E3AL%u3002%u7B2C%u4E00%u6B21%u76F8%u9047%u65F6fast%u5DF2%u7ECF%u8D70%u4E86k%u5708%uFF08%u4E0D%u80FD%u4FDD%u8BC1%u76F8%u9047%u65F6fast%u53EA%u591A%u8D701%u5708%uFF09%u3002%0Aslow%u8D70%u7684%u8DDD%u79BB%u4E3Ad1%20%3D%20a%20+%20b%20%3D%20n%0Afast%u8D70%u7684%u8DDD%u79BB%u4E3Ad2%20%3D%20a%20+%20b+%20k*L%20%3D%202n%0Ad2%20-%20d1%20%3D%20n%20%3D%20k*L%uFF0C%u53EF%u77E5%u957F%u5EA6n%u6070%u597D%u4E3A%u73AF%u5468%u957F%u7684%u6574%u6570%u500D%u3002%0A%u6B64%u65F6slow%u4ECE%u76F8%u9047%u70B9M%u518D%u8D70n%u6B65%uFF0C%u53EF%u4EE5%u56DE%u5230%u76F8%u9047%u70B9M%u3002%0A%u6B64%u65F6fast%u4ECEhead%u51FA%u53D1%u8D70n%u6B65%uFF0C%u4E5F%u53EF%u5230%u8FBEM%u3002%0A%u5B9E%u9645%u4E0A%u4E24%u8005%u5728%u8D70%u5B8Ca%u6B65%u540E%u5C31%u76F8%u9047%u4E86%uFF0C%u6B64%u5904%u5373%u4E3A%u73AF%u7684%u5165%u53E3%u3002%0A%0A%23%23%23%23%20Python%u5B9E%u73B0%0A%60%60%60python%0Aslow%20%3D%20fast%20%3D%20head%0Awhile%20True%3A%0A%20%20%20%20%20if%20not%20fast.next%20or%20not%20fast.next.next%3A%0A%20%20%20%20%20%20%20%20%20%20%23%20No%20loop%0A%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20slow%20%3D%20slow.next%0A%20%20%20%20%20%20%20%20%20%20fast%20%3D%20fast.next.next%0A%20%20%20%20%20%20%20%20%20%20if%20slow%20%3D%3D%20fast%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%0A%23%20Encountered%20for%201st%20time.%20Now%20set%20out%20again%0Awhile%20fast%20%21%3D%20slow%3A%0A%20%20%20%20%20fast%20%3D%20fast.next%0A%20%20%20%20%20slow%20%3D%20slow.next%0A%0A%23%20Now%20both%20fast%20and%20slow%20point%20to%20the%20loop%20entrance%0Areturn%20fast%0A%60%60%60%0A%0A%23%23%23%23%20%u5E94%u7528%0A%u53EF%u4EE5%u7528%u6765%u89E3%u51B3%u4E24%u4E2A%u5355%u94FE%u8868%u662F%u5426%u5B58%u5728%u4EA4%u70B9%u7684%u95EE%u9898%uFF0C%u5982%u4E0B%uFF1A%0A%0A%24A%3A%20%7E%7E%7E%7E%7E%7E%7E%7E%7Ea1%20%u2192%20a2%24%0A%24%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%u2198%24%0A%24%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7Ec1%20%u2192%20c2%20%u2192%20c3%24%0A%24%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%7E%u2197%24%0A%24B%3A%20%20%20%20%20b1%20%u2192%20b2%20%u2192%20b3%24%0A%u7ED9%u5B9A%u4E24%u4E2A%u5355%u94FE%u8868A%uFF0CB%uFF0C%u95EEA%uFF0CB%u662F%u5426%u5B58%u5728%u67D0%u4E2A%u76F8%u4EA4%u8282%u70B9%uFF0C%u82E5%u5B58%u5728%u5219%u8FD4%u56DE%u8BE5%u8282%u70B9%u3002%u5E94%u7528%u6211%u4EEC%u7684%u65B9%u6CD5%uFF0C%u53EF%u4EE5%u5728O%28n%29%u65F6%u95F4%uFF0CO%281%29%u7A7A%u95F4%u5185%u6C42%u89E3%u3002%0A%u65B9%u6CD5%u662F%u5148%u904D%u5386A%u627E%u5230%u5C3E%u8282%u70B9tailA%uFF0C%u8BBE%u7F6EtailA.next%20%3D%20headB%u3002%u82E5A%u4E0EB%u6709%u4EA4%u70B9%uFF0C%u5219%u4ECEheadA%u518D%u51FA%u53D1%u4F7F%u7528%u6211%u4EEC%u7684%u7B97%u6CD5%u627E%u5230%u73AF%uFF0C%u73AF%u8DEF%u5165%u53E3%u5373%u4E3A%u94FE%u8868%u4EA4%u70B9%u3002</center>