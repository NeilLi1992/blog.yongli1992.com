title: '使用 git log、git diff 命令时出现 ESC[33 和 ESC[m 乱码的解决办法'
tags:
  - git
  - terminal
  - problem
categories:
  - problem
date: 2015-08-14 11:38:54
---


# 问题
最近一段时间在使用 git log 和 git diff 命令的时候一直有乱码出现，具体表现为在行首出现 ESC[33，而在行尾出现 ESC[m，如下图所示：
{% asset_img git_log_diff_garbled.png %}
虽然 git log 和 git diff 的内容还能分辨，但是可读性一下子变的很差。

# 解决
经过搜索之后了解到，出现该问题的原因是 git 使用的默认分页程序是 less，而默认的直接运行 less 的话，会无法正确解析转义字符。但是如果以 -r 命令来运行 less 的话，就可以解决了。故解决办法就是将 git 的默认分页程序改为 "less -r" 来运行，如下：

```bash
git config --global core.pager "less -r"
```

问题解决：
{% asset_img git_log_diff_solved.png %}
