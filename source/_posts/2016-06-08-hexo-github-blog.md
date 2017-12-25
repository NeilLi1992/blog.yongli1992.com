title: 使用 hexo 框架在 github 上部署个人博客
tags:
  - blog
  - life
  - 博客
category:
  - tool
date: 2016-06-08 22:53:50
---

简单介绍一下如何使用 hexo 框架并且配合 github 来部署个人博客。

# Hexo
[Hexo](https://hexo.io/zh-cn/) 是一个基于 Node.js 的博客框架，使用 Markdown 格式来写博客，之后生成静态文件，然后可以直接部署到 Github Pages, Heroku 等网站上。能够部署到 Github Pages 是其一大优点，这是因为它生成的文件全部都是静态文件，而 Github Pages 的部署只支持静态文件，而类似 wordpress 的方案则需要使用支持 PHP 的服务器。

# 安装
Hexo 是基于 Node.js 的，使用 npm 来进行安装，安装命令如下：
```bash
npm install hexo-cli -g
```
安装完之后在命令行中再输入：
```bash
hexo -v
```
会提示相关版本信息的话，就证明安装成功。

# 创建本地存储的目录
使用 hexo 创建的博客的所有相关文件都是首先要存储于本地的，之后再选择部署到服务器上。我们需要在本地有一个对应的文件夹存储所有的生成文件，使用如下命令新建一个名为 **blog** 的文件夹，来存储个人博客站点。
```bash
hexo init blog
cd blog
npm install
hexo server
```
第一条 **init** 命令只是创建了基本的目录结构，之后不要忘记 cd 进这个目录，再使用 **npm install** 命令来安装剩下的依赖。最后一条命令是让 hexo 启动一个本地的 web server，启动之后可以看到提示，在浏览器输入 http://0.0.0:4000 就可以在本地预览自己的站点了。

# 基本的写作命令
使用 hexo 写一些文章是非常简单的。可以采用 Markdown 格式进行写作，这样所有的博客 文章在本地都是以纯文本的形式存储，又方便配合版本管理，如果能使用 Vim 或者 Emacs 在终端进行写作的话，更有满满的 Geek 风。

要创建一篇新的博文，只要使用命令：
```bash
hexo new [draft] title
```

title 部分替换为文章的标题，这里可以暂时起一个英文字符的临时标题，这会作为最终部署之后的文章链接名称，实际的文字标题可以在 Markdown 文件中再更改。draft 是可选的，这里的作用是指定一个 layout，而 draft 是默认自带的一种 layout。如果指定 draft 的话，效果是部署的时候这篇博文不会出现在站点上。而当你在本地使用 **hexo server** 命令的时候，如果配合 --draft 参数，如下：
```bash
hexo server --draft
```
那么才会在预览的时候看到这篇博文。直到你使用 **hexo publish** 命令，它才会在下次部署的时候，出现在站点上。

在存储你的博文的目录（blog）之下，有一个 source 文件夹，里面还有 _posts 和 _drafts 文件夹，实际的博文 Markdown 文件都存储在这两个目录中。前者是已经 publish 的博文，会在部署的时候出现在站点上，后者就是刚才提到的 draft 草稿，部署之后不会出现在站点上。

更多的写作命令以及相关设置（标题，标签，分类）请参考 hexo [文档](https://hexo.io/zh-cn/docs/writing.html)。

# 生成与发布
在本地完成写作之后，要使用：
```bash
hexo generate
```
来生成新的静态文件，之后再使用：
```bash
hexo deploy
```
来发布到你设置的站点上。

# 站点
Hexo 提供一键部署功能，要使用这一功能，必须先配置博客目录下的 *_config.yml* 目录中的参数，以发布到 github pages 上为例，在 deployment 那里应该修改为：
```bash
deploy:
    type: git
    repo: 这里填 github pages 仓库的 git 位置
```
当然，你需要现在 Github 上创建一个 repository，专门用来存放这个站点。
这样子发布以后的站点就可以通过 Github pages 提供的域名来进行访问了。如果想通过自己的域名访问，请参考 Github pages 的域名设置，这里不表。

更多关于部署的文档，包括如何部署到 Heroku/Openshift 上，请参考[部署文档](https://hexo.io/zh-cn/docs/deployment.html)。
