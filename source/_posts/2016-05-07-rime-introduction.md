title: Rime 输入法介绍，以及基于 Rime 输入法在纯文本环境下快速输入希腊字符，和以 latex 命令输入 Unicode 数学符号的方法
date: 2016-05-07 00:06:34
tags:
    - tool
    - ime
    - rime
categories:
    - tool
---

很长一段时间没有来写博文，最近准备重新继续。介绍一下最近入坑的 Rime 输入法，顺便也介绍一下自己基于 Rime 输入法而实现的快速输入 Unicode 字符集中的希腊字母，以及在纯文本环境下，以 latex 命令输入 Unicode 字符集中相近的数学符号的功能。

# 实现效果
最终实现的一些有用的效果大概如下。如果这里面有你想要的效果的话，那欢迎往下阅读，Rime 很可能就是你需要的输入法。


古诗词输入：
{% asset_img gsc.jpg %}

emoji 直接输入，可以联想相关的表情：
{% asset_img emoji.jpg %}

自定义缩写词典之后，实现缩写输入：
{% asset_img abbr.jpg %}

多种输入方案切换，其中有粤拼的输入方案是个惊喜：
{% asset_img switch.jpg %}

自定义词典后实现快速希腊字母与 latex 符号输入：
{% asset_img symbol.jpg %}

# 问题与适用情景
我使用的是 Macbook，之前一直用的是搜狗输入法。后来想要换成 Rime 是基于两个原因。

* 最近在学粤语，想找一款粤拼输入法。只找到 Google 的广东话输入法，可惜只能作为 Chrome 的一个扩展插件在 Chrome 内部使用，没有找到系统输入法。后来发现 Rime 中实现了粤拼输入方案。而且更惊喜的是具有输入普通话拼音，实现粤拼反查的功能。
* 平时上课的 notes 上需要做注释的时候，只有纯文本的输入框可用，这个时候想要输入希腊字母就很不方便。同时在纯文本输入框中同样很怀念 latex 方便的输入命令。其实 latex 的许多数学符号，例如 ≤，¬，∧，∫ 等等其实在 Unicode 字符集中都有对应相似的符号存在，这些 Unicode 字符是可以直接在纯文本的地方输入的，如 Word，pdf 注释等等，只不过一直以来缺少可以快速输入它们的办法，所以通常想要输入它们的话，在 Mac
里要打开“表情与符号”对话框进行选择，非常不方便。后来发现通过 Rime 的用户词典，可以自己实现这一功能，非常方便。

# Rime 输入法介绍
[Rime 输入法官网](http://rime.im/)
{% asset_img rime.jpg %}

Rime 输入法是一款出现多年的开源的全平台输入框架。在不同平台上有着不同的名称，分别是 Windows 下的“小狼毫”，Mac OSX 下的“鼠须管”，Linux 下的“中州韵”。之所以说它是一个输入框架，是因为它提供的是构建输入法的一套基础设施，以及一个统一的用户界面。而里面具体的输入方案，以及用户词典，则是可以自定义，甚至自己实现的。这更得益于它在 Github 上的开源（[Repository](https://github.com/rime )）。

Rime 输入法的优点在于以下几点。
* **安全性：**输入法作为很私人的工具，安全性与私密性是至关重要的，谁都不希望自己无意间在输入法中敲出的密码或者是对话信息被上传到大公司的服务器上。作为一款开源输入法，Rime 保证了绝对的安全性。

* **简洁轻便：** Rime 没有任何的广告，新闻之类的弹出窗口，干干净净、本本分分做一个输入法应该做的事。而且 Rime 输入法的速度非常快，据称快过系统原生输入法。虽然未见实测数据，但是实际体验确实响应很快速，没有任何迟钝现象。

* **优秀的中文输入方案：** 从官网，以及文档的行文中，就能感觉到作者是一位对于汉语输入有着长期的研究和执着的人。Rime 输入法的输入方案包含全拼，双拼，五笔，仓颉，注音，粤拼，吴语等等，对中文输入有着强大的支持，即使不需要自己定制，也已经能找到称心如意的输入方案了。

* **强大的自定义：** 从输入法外观，按键设置，再到方案选择和自定义，以及用户词典设置等等，Rime 有着很多可以自定义的地方。

然而同时，Rime 输入法也具有许多开源软件都不可避免的缺点。
* **安装与调试的门槛高：** 因为默认直接安装好的 Rime 输入法似乎是不带用户设置界面的，所以许多配置都需要在命令行下借助文本编辑器来完成，这对于没有 CS 背景的许多小白用户来说是一道门槛。

* **文档不清：** 文档写的似乎不算非常的结构清晰。至少我自己在刚开始阅读文档的时候常找不到北，花了很久才弄明白一些。

* **个人词库问题：** 相信每一个之前使用了别的输入法的人都积累了不小的个人词库，如果直接切换到 Rime 的话会面类个人词库丢失的问题。这一问题通过“深蓝词库转换工具”可以一定程度得到解决。然而 Rime 目前还不具备像搜狗那样的云词库以及网络热词更新功能，多少算一个缺憾。Rime 的个人词库可能更多的需要靠每个用户在输入过程中积累沉淀出自己的词库。

# Rime 设置与定制
有很多文章已经提供了 Rime 的设置与定制的参考，在之类不做过多赘述，引用一些资料以供方便检阅。

关于基本的操作请参考[说明书](https://github.com/rime/home/wiki/UserGuide)。

关于定制 Rime 的一些基本知识，包括用户设置的文件组织结构，以及对于每个输入方案的自定义，参考[定制指南](https://github.com/rime/home/wiki/CustomizationGuide)。

关于外观自定义，可以参考[这里](http://www.dreamxu.com/install-config-squirrel/)。

关于添加明月拼音的扩展词库，可以参考[「鼠須管」的调教笔记](https://medium.com/@scomper/%E9%BC%A0%E9%A0%88%E7%AE%A1-%E7%9A%84%E8%B0%83%E6%95%99%E7%AC%94%E8%AE%B0-3fdeb0e78814#.lc5kdev98)。

# 希腊字母与 latex 字符的输入
最后介绍一下我自己基于用户词典实现的希腊字母和 latex 字符的输入。
方法也非常简单，就是在 ~/Library/Rime 下新建了两个用户词典文件，我称之为 greeks.yongli1992.dict.yaml 和 maths.yongli1992.dict.yaml，里面的内容部分截图如下：

greeks.yongli1992.dict.yaml:
```bash
# Rime dictionary
# encoding: utf-8
---
name: greeks.yongli1992
version: "2016.4.30"
sort: by_weight
use_preset_vocabulary: true
...
α	alpha
Α	alpha
β	beta
Β	beta
γ	gamma
Γ	gamma
```

maths.yongli1992.dict.yaml:
```bash
# Rime dictionary
# encoding: utf-8
# 参考使用 latex 的命令
# reference: http://web.ift.uib.no/Teori/KURS/WRK/TeX/symALL.html
# greek letters are included in a separate dictionary file
---
name: maths.yongli1992
version: "2016.4.30"
sort: by_weight
use_preset_vocabulary: true
...
# binary operation symbols
±	pm
∓	mp
×	times
÷	div
∗	ast
⋆	star
∘	circ
∙	bullet
⋅	cdot
∩	cap
∪	cup
⊎	uplus
⊓	sqcap
⊔	sqcup
∨	vee
```

在第一个希腊字母的词典中，为同一个希腊字母的大小写对应到相同的编码上。然后在 math 词典中，每一个编码都使用的是 latex 命令，然后输出的字符就是 Unicode 字符集中尽量寻找到相似的字符即可。

完整的这两个文件可以在这里找到：
https://github.com/NeilLi1992/RimeSettings/blob/master/greeks.yongli1992.dict.yaml
https://github.com/NeilLi1992/RimeSettings/blob/master/maths.yongli1992.dict.yaml

下载之后只要复制到你自己的用户资料文件夹下（Mac 系统下的 ~/Library/Rime），然后记得在你要使用这个词典的输入方案设置文件中添加。具体操作请参照上面给的[「鼠須管」的调教笔记](https://medium.com/@scomper/%E9%BC%A0%E9%A0%88%E7%AE%A1-%E7%9A%84%E8%B0%83%E6%95%99%E7%AC%94%E8%AE%B0-3fdeb0e78814#.lc5kdev98)。

