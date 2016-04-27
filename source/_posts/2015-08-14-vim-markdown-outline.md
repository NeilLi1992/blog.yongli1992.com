title: 在 vim 中显示 markdown 结构大纲
date: 2015-08-14 06:16:53
categories:
    - tool
tags:
    - vim
    - tool
    - markdown
---

# 简介
可能许多人都知道利用 ctags 工具和 tagbar 插件可以在 vim 中显示侧边栏，列出代码文件的结构、类和函数等。实际上在写 markdown 文本时，如果也能在 tagbar 中显示文本大纲，那么显然可以帮助我们理清写作思路，也能快速定位到相关的段落进行修改。
实际上，因为 markdown 文件是高度结构化的，所以很容易就能让 ctags 识别 markdown 的文本结构，从而为我们提取出大纲。在 github 上已经有人分享了这一工具：[markdown2ctags](https://github.com/jszakmeister/markdown2ctags)


# 需要的工具
1. [Excuberant Ctags](http://ctags.sourceforge.net/) 该工具通过提取关键字等方式，为不同语言生成 index 目录文件。这些 index 文件可以被用来索引大纲并实现快速跳转。
2. [easytags](https://github.com/xolox/vim-easytags) Ctags 虽然本身能够生成索引文件，但是每次都要手动去生成、更新，比较麻烦。安装 easytags 插件之后可以实习自动在保存时更新 ctags 索引文件，非常方便。
3. [tagbar](https://github.com/majutsushi/tagbar) tagbar 也是一款 vim 插件，安装之后能够利用 ctags 索引文件，在窗口的右侧生成一个侧边窗口，显示文本的结构，默认使用 <F8> 来打开/关闭该窗口。
4. [markdown2ctags](https://github.com/jszakmeister/markdown2ctags) 该工具可以用来为 markdown 生成 ctags 可以识别的索引文件。在使用这一工具的时候，需要在 .vimrc 中加入其 github 页面上所展示的一段代码。需要特别注意的是，g:tagbar_type_markdown 和 'ctagstype': 'markdown' 这两个地方需要和你的 vim 所识别的 markdown 格式匹配。检测自己的 vim 所识别的 markdown 文本的格式的方式是在 vim 中输入 :set filetype? ，所显示的 filetype= 后面的内容如果不是
markdown，则需要用来替换上面两个地方。

# 效果
显示效果如下：
{% asset_img markdown2ctags.png %}
