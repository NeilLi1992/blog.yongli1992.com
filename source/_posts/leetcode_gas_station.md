title: LeetCode：加油站问题
id: 161
categories:
  - algorithm
date: 2015-03-13 19:17:55
tags:
  - algorithm
  - python
  - leetcode
---

原题地址：[Gas Station](https://leetcode.com/problems/gas-station/)

题目翻译如下：
{% blockquote %}
在环形回路上有 N 个加油站，在加油站 i 处有油 gas[i]。你现在有一辆油箱可以装无限多油的车，从加油站 i 开到加油站 i+1 耗油 cost[i]。你以空的邮箱从某一加油站出发。
如果从某一个加油站出发你可以绕环路走一圈，则返回该加油站的位置 i，若不存在这样的加油站，则返回 -1。
注：假设有唯一解
{% endblockquote %}

<!--more-->

#### 解法一：穷举法
代码如下：

```python
class Solution:
    # @param gas, a list of integers
    # @param cost, a list of integers
    # @return an integer
    def canCompleteCircuit(self, gas, cost):
        for start in range(len(gas)):
            tank = 0
            travel_list = range(len(gas))[start:] + range(len(gas))[:start]
            can_travel = True
            for from_pos in travel_list:
                tank += gas[from_pos]
                if tank < cost[from_pos]:
                    can_travel = False
                    break
                else:
                    tank -= cost[from_pos]
            if can_travel:
                return start
        else:
            return -1
```
我们可以穷举所有可能的起始位置 start。在每次开始时邮箱 tank 都为0。生成循环一圈的位置索引列表 travel_list，然后就一直计算，如果 travel_list 中某个位置有 tank + gas[from_pos] < cost[from_pos]，则表明无法从 from_pos 加油站走到 from_pos+1 油站，此时就不能再继续了。

该方法的算法复杂度为 O(n)。其问题在于：在测试从 i 作为起始点的遍历过程中，如果在 i 之后的某个 j 位置发现无法走到 j+1 位置，则实际上 i+1 到 j 均不可能作为起始位置，下一个探测的起始位置直接是 j + 1。

#### 解法二
```python
class Solution2:
    # @param gas, a list of integers
    # @param cost, a list of integers
    # @return an integer
    def canCompleteCircuit(self, gas, cost):
        N = len(gas)
        travel_list = 2 * range(N)
        start = tank = 0
        for i, station in enumerate(travel_list):
            tank += gas[station]
            tank -= cost[station]
            if tank >= 0 and travel_list[i+1] == start:
                # Find the start index
                return start
            elif tank < 0:
                if i+1 > travel_list[i+1]:
                    # Won't find any more
                    return -1
                else:
                    tank = 0
                    start = travel_list[i+1]
```
在这里我们先用 2 * range(N) 构造 travel_list，只要把这个 list 遍历一遍即可。起始时 tank = 0。在每到一个 station 时，都先计算前往下一个 station 后 tank 中的油量，若 tank >= 0 的同时发现 travel_list 中存储的下一个位置已经是我们标记的 start 位置，则表明完成了循环遍历，也就找到了出口。如果 tank < 0，则表明无法前往下一个 station。若发现 travel_list 的下一个油站坐标小于它在该 list 中的索引坐标，则表明已经到了 travel_list 的后半部分，也表明我们已经将每一个位置都作为 start 位置测试过了，再往后不可能再找到出口，直接返回 -1。否则的话，油箱置零，继续测试下一个 start 位置。

这样的话，算法复杂度为 O(n)，只要一个外循环就可以搞定。
