title: 爱拉托撒尼筛法：找出小于 n 的所有质数
id: 168
categories:
  - algorithm
date: 2015-04-28 07:10:49
tags:
  - leetCodeOJ
  - 算法
---

Sieve of Eratostheness，爱拉托撒尼筛法，是一种可以快速找出小于 n 的所有质数的算法。其基本思想是：

> 给出要筛选数值的范围 n，找出{% math \sqrt{n} %}以内的质数 p1, p2, p3 ... pk。先用 2 去筛选，即把 2 留下，把 2 的倍数全部剔除；再用下一个质数 3 去筛选，再用 5， 7... 不断重复。

实际实现的时候，在用 pk 去筛选的时候，实际上只要从 $pk^2$ 开始筛选即可，因为小于 $ pk^2 $ 的已经被 pk 之前的其他质数给筛掉了。

在 LeetCode 上有一题类似的，但是问的是小于 n 的所有质数的个数，也可以用这个办法来求。
原题链接：[Count Primes](https://leetcode.com/problems/count-primes/)

{% codeblock Python代码 lang:python %}
class Solution:
    # @param {integer}
    # @return {integer}
    def countPrimes(self, n):
        if n < 2:
            return 0

        isPrime = [True for i in xrange(n)]
        isPrime[0] = isPrime[1] = False

        # Test all Primes less than sqrt(n)
        i = 2
        while i ** 2 < n:
            if isPrime[i]:
                multiplier = 0
                while i ** 2 + i * multiplier < n:
                    isPrime[i ** 2 + i * multiplier] = False
                    multiplier += 1
            i += 1

        return sum(isPrime)
{% endcodeblock %}
