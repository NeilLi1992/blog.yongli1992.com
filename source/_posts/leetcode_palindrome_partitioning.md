title: LeetCode：字符串的回文划分
id: 136
categories:
  - algorithm
date: 2015-01-28 08:33:41
tags:
  - algorithm
  - leetcode
---

记录一道在LeetCode上做到的个人感觉很精彩的题目：字符串的回文划分问题。
原题地址：[palindrome partitioning](https://oj.leetcode.com/problems/palindrome-partitioning/)

题目翻译如下：
>给定字符串s，对s进行分割，使得到的每一个子字符串都是回文。返回s所有可能的分割。例如：给定字符串s="aab"，返回结果如下：

> [["aa","b"], ["a", "a", "b"]]

<!--more-->

### 解法一：深度优先搜索
第一种方法是采用深度优先法来进行递归搜索。定义一个名为**partition(s)**的函数用于递归。其基本解的形式是s的长度仅为1的时候。此时认为s是回文字符串，并且返回对s的划分结果，即直接返回**[[s]]**。

当s的长度大于1的时候，我们用一个名为**partition_list**的列表变量来存储所有对s的回文划分的结果。在Python中判断一个字符串s是否是回文可以有非常简便的方法，用下面的一行语句就可以实现，当然效率上可能会差一点:

    s == s[::-1]
若s自身是一个回文，则将s添加到**partition_list**中。然后对1到len(s)-1的每一个位置，都尝试将字符串分为前后两个字字符串s1和s2。若s1不是回文划分，则忽略。若s1是一个回文划分，则对s2部分递归调用**partition(s2)**，获得s2的所有回文划分结果。此处对s2的划分至少会有一个结果，即每个单个字符被分割的情形。最后对于s2的回文划分的每种可能，我们都将s1放在最前面，即可得到对字符串s的全部划分结果。代码如下所示：

```python
class Solution:
    # @param s, a string
    # @return a list of lists of string
    def partition(self, s):
        if len(s) == 1:
            # This is a single-character palindrome string
            return [[s]]
        else:
            partition_list = []

            if s == s[::-1]:
                partition_list.append([s])

            for i in range(1,len(s)):
                s1 = s[0:i]
                s2 = s[i:len(s)]

                if s1 != s1[::-1]: # s1 is not palindrome, this partition failed
                    continue
                else: # The first substring is a palindrom
                    substr_par_list = self.partition(s2)
                    for substr_par in substr_par_list:
                        substr_par.insert(0, s1)
                        partition_list.append(substr_par)
            return partition_list
```

### 解法二：动态规划
解法一的效率较差。动态规划的方法在这里可以更加高效。

试想我们可以构建一个NxN的二维矩阵，N是字符串s的长度，我们先用两个循环变量i，j遍历字符串s，对于任何一个是回文的子字符串s[i : j+1]，都将矩阵的[i, j]位置标记为1，最后我们只要找到所有的从头到尾的标记路径即可找出所有的回文划分。

对于题目中的例子s="aab”来说，构建出的矩阵形式如下：

> 1 1 0
> 0 1 0
> 0 0 1

在下面的代码示例中，二维列表实际上表示的是矩阵的稀疏形式，即对于列表的第i个子列表，里面存储的是矩阵i上的有标记的列的索引。

最终的路径回溯实际上还是一个深度搜索，但是这里的工作量就小的多了。最后的实际结果也比方法一快了很多。示例代码如下：

```python
# Second solution uses DP+dfs
class Solution2:
    # @param s, a string
    # @return a list of lists of string
    def partition(self, s):
        index_list = [[] for i in range(len(s))]
        for i in range(len(s)):
            for j in range(i, len(s)):
                if s[i:j+1] == s[i:j+1][::-1]:
                    index_list[i].append(j)

        partition_list = []
        self.search_path(0, [], index_list, s, partition_list)
        return partition_list

    def search_path(self, start, current_partition, index_list, s, partition_list):
        for end in index_list[start]:
            new_partition = current_partition[:]
            new_partition.append(s[start:end+1])

            if end + 1 == len(s):
                partition_list.append(new_partition)
            else:
                self.search_path(end+1, new_partition, index_list, s, partition_list)

```
