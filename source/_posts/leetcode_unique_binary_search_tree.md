title: LeetCode：唯一二叉搜索树的数量
id: 156
categories:
  - algorithm
date: 2015-02-22 07:26:40
tags:
  - 翻译
  - python
  - leetcode
  - algorithm
---

翻译一道在 LeetCode 上遇到的题目的解法。
原题：

    给定 n，找到存储着 1, 2, 3,..., n 的不同结构的二叉搜索树的数量。
    如：给定 n=3，有 5 种不同的 BST：
     1         3     3      2      1
      \       /     /      / \      \
       3     2     1      1   3      2
      /     /       \                 \
     2     1         2                 3
原文地址：[LeetCode Discussion](https://oj.leetcode.com/discuss/24282/dp-solution-in-6-lines-with-explanation-f-i-n-g-i-1-g-n-i)
翻译：YongLi1992
* * *

<!--more-->

该问题可以用动态规划解决。

给定数列 1...n，要从该数列构建 BST，我们可以枚举数列中的每一个数字 i，使用 i 来作为根节点，则数列中剩下的 1...(i-1) 位于左子树，(i+1)...n 位于右子树。然后就可以递归地构建左右子树。通过这一方法，我们可以确保构建地 BST 是唯一的，因为所有子树的根节点是唯一的。

我们定义两个函数：

- G(n)：从长度为 n 的数列构建的不同 BST 的数量。
- F(i, n), i <= i <= n：以 i 作为根节点，从数列 1 到 n 构建的不同 BST 的数量。

可见，G(n) 是真正要计算的函数。G(n) 可以从 F(i, n) 导出，而最终 F(i, n) 又可以递归地用 G(n) 来表示。

我们可以看到，根据上面两个函数的定义，G(n) 就是使用每一个 i 作为根节点后 F(i) 的总和，即：

    G(n) = F(1, n) + F(2, n) + ... + F(n, n)
而对于 G(n) 的基本解，是对于长度为 1 的数列只有一个 BST，对于长度为 0 的数列也只有一个 BST （空树）。

    G(0) = 1, G(1) = 1
给定数列 1...n，当选 i 为根节点时，唯一 BST 的数量 F(i, n) 即为左子树和右子树分别的唯一 BST 个数的乘积：

    F(i, n) = G(i-1) * G(n-i)  1 <= i <= n
综上所述，我们可以得到 G(n) 的递归表达式：

    G(n) = G(0) * G(n-1) + G(1) * G(n-2) + ... + G(n-1) * G(0)
下面是最终的 Python 代码：
```python
def numTrees(n):
	G = [1, 1]
	for i in xrange(2, n+1):
		G.append(0)
		for j in xrange(1, i+1):
			G[i] += G[j-1] * G[i-j]
	return G[n]
```
