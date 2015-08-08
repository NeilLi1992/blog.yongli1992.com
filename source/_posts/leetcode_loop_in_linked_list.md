title: LeetCode：判断单链列表是否存在环
tags:
  - leetcode
  - python
id: 74
categories:
  - algorithm
date: 2015-01-20 16:12:03
---

判断单链列表是否存在环，即某个节点的next指向链表中在它前面的节点，这样在链表尾部形成一环。

####判断是否存在环
用一个fast指针，一个slow指针，slow每次移动1，fast每次移动2.
若链表存在环，移动快的fast指针一定在环内追赶上移动慢的slow指针，则相遇

#### 找到环的入口
当两指针第一次相遇后，证明存在环。现在将fast指针重新设为head，slow指针不变。
接下来fast和slow都每次移动1。两指针在此相遇的位置即为环的入口。

#### 证明
设初次相遇时循环运行n次。设初次相遇为M点，head到环入口距离为a，环入口到M点距离为b。环路周长为L。第一次相遇时fast已经走了k圈（不能保证相遇时fast只多走1圈）。
slow走的距离为d1 = a + b = n
fast走的距离为d2 = a + b+ k*L = 2n
d2 - d1 = n = k*L，可知长度n恰好为环周长的整数倍。
此时slow从相遇点M再走n步，可以回到相遇点M。
此时fast从head出发走n步，也可到达M。
实际上两者在走完a步后就相遇了，此处即为环的入口。

#### Python实现
```python
slow = fast = head
while True:
     if not fast.next or not fast.next.next:
          # No loop
          return None
     else:
          slow = slow.next
          fast = fast.next.next
          if slow == fast:
               break

# Encountered for 1st time. Now set out again
while fast != slow:
     fast = fast.next
     slow = slow.next

# Now both fast and slow point to the loop entrance
return fast
```

#### 应用
可以用来解决两个单链表是否存在交点的问题，如下：

$A:       a1 → a2$
$                ↘$
$                 c1 → c2 → c3$
$                ↗$
$B:   b1 → b2 → b3$
给定两个单链表A，B，问A，B是否存在某个相交节点，若存在则返回该节点。应用我们的方法，可以在O(n)时间，O(1)空间内求解。
方法是先遍历A找到尾节点tailA，设置tailA.next = headB。若A与B有交点，则从headA再出发使用我们的算法找到环，环路入口即为链表交点。
