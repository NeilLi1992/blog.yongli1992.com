title: 使用 hexo-admin UI 界面来管理 hexo
author: yongli1992
tags:
  - hexo
  - blog
  - technology
categories:
  - tool
date: 2018-09-13 22:47:00
---
准备重新开始写博客。

之前使用 terminal 命令来管理 hexo 的方式虽然很 hacky，但是使用久了依然感到繁琐不便，也间接降低了写博客的兴致。最近知道了 hexo 原来可以安装 admin UI 界面来进行管理，github 项目的名字就叫 [hexo-admin](https://github.com/jaredly/hexo-admin).

![upload successful](/images/pasted-1.png)


安装的方式也非常简单，只要在自己的 hexo 博客项目的目录内使用 `npm` 进行安装即可，然后再次使用 `hexo server -d` 运行 hexo 自带的服务器使，就可以在 `http://localhost:4000/admin/` 的位置得到一个 admin UI 界面。

在这个界面可以创建/发布 post，可以有左右两栏可以预览的 markdown 编辑器，可以方便地输入标签，进行分类等等。甚至在编辑器内支持直接复制进图片，不用再像之前需要自己手动保存图片，workflow 得到了极大的简化。

![upload successful](/images/pasted-2.png)

如果你的 hexo 不是静态部署，而是利用 Heroku、DigitalOcean 等进行部署的话，甚至可以在线的访问这个 admin 界面，但是不要忘记在 settings 中设置密码，否则任何人都可以编辑修改内容了。

仅此小记，以重整博客~