title: Python爬虫模块Scrapy学习笔记
id: 146
categories:
  - python
date: 2015-02-08 21:16:34
tags:
  - python
---

### Scrapy爬虫模块简介
爬虫的主要目的是为了获取没有开放API的网站上的非结构化数据。即按照给定的规则我们平时看到的网页，并从中抽取出需要的信息。这些信息可以应用在数据挖掘，信息处理等一系列程序中。

简单的爬虫设计主要是确定以下几个问题：
1. 指定访问的起始地址（starting_urls）。
2. 从获得的response中如何解析出我们想要的内容。
3. 在获得的response中如何发现后续要访问的地址。
4. 如何处理我们解析出的内容。

高级爬虫应用还会涉及到许多其它的问题。

Scrapy是一个主流的Python爬虫框架，设计好了爬虫应用的基本骨架结构，也为了实现不同的应用目的留下了灵活的设计余地。使用一些其它的模块，或者配合一些中间件，也可以将Scrapy扩展成为很复杂的高级爬虫程序。

<!--more-->

### Scrapy架构图示
![Scrapy架构说明](http://scrapy-chs.readthedocs.org/zh_CN/latest/_images/scrapy_architecture.png)

这里是一张Scrapy架构图的展示。Scrapy Engine负责整个程序的运行。Scheduler负责调度要访问的网址。Downloader负责从网络获取响应。Spider负责分析响应，从响应中解析出我们要的数据，同时也负责找出接下来要访问的后续网址。Item是将我们需要抓取的数据做一个结构化的定义并实现为一个类。Pipeline负责对抓取到的item做后续处理，包括过滤，持久化存储等任务。

绿色箭头表示网络请求与响应的流动。Spider将需要访问的（初始+后续）请求提交给调度器，调度器再将请求分发给Downloader，downloader完成下载后，通过回调函数的形式交由Spider进一步处理，Spider抽取出需要的数据，实例化一个item对象，将数据赋值为item的具体属性。item接下来将经过pipeline，由pipeline实现后续处理。

在一个较为简单的应用中，真正需要我们实现的部分只有定义item，实现spider，实现pipeline。

### 项目示例
接下来用一个例子来展示一个简单Scrapy爬虫的设计过程。

在这个例子中我们要抓取的目标网站是[Scrapy的中文文档](http://scrapy-chs.readthedocs.org/zh_CN/0.24/index.html)。
{% asset_img 1.png %}

如图所示，我们的目标是访问左侧列出的每一篇文章的网页，然后将右边正文部分的**HTML格式**保存下来。保存之后的html文档打开来是下面这样的。虽然样式比较丑陋，但是保存html而不是抽取出纯文本的目的在于保留网页的语义结构，这样为以后潜在的处理留下了可能。

{% asset_img 2.png %}

#### 新建项目
推荐使用pip来安装Scrapy：

    pip install Scrapy
安装完成后，Scrapy提供了一个命令行工具，使用scrapy命令可以提供非常强大的功能，比如：
- 创建项目
- 提供交互shell，在真实的爬虫环境中测试数据提取
- 控制管理爬虫程序，包括启动，停止，查看可用爬虫等
- 展现爬虫真实获取到的response，有时候程序拿到的响应和用户通过浏览器看到的并不相同

我们把这个示例项目叫做crawl_scrapy_docs，用下面的命令来新建项目

    scrapy startproject crawl_scrapy_docs
运行以后的目录结构是：

    crawl_scrapy_docs/
		    scrapy.cfg
		    crawl_scrapy_docs/
		        __init__.py
		        items.py
		        pipelines.py
		        settings.py
		        spiders/
		            __init__.py
		            ...
其中items.py中定义我们的item类，pipelines实现抓取后的处理管道，spiders/文件夹存放spider的实现。

####定义抓取实例：item
在这个项目里，我们感兴趣的数据有两项：
1. 正文部分的html文本，我们叫做html_content
2. 用于保存文件的文件名，我们叫做filename

这个filename我们就取正文的第一行h1标签中的标题文字。

items.py中的代码如下：
```python
import scrapy
class CrawlScrapyDocsItem(scrapy.Item):
    html_content = scrapy.Field()
    filename = scrapy.Field()
```
只要给我们的变量赋值成一个scrapy.Field()对象即可。这样在后续spider中处理时，就可以将item作为字典的形式来进行访问，如：

    item["html_content"] = "some value..."

####定义抓取过程：spider
实现spider需要在项目文件夹中的spiders目录下来创建。将这里要用到的spider叫做doc_crawler。Scrapy提供的命令行工具直接提供了创建spider的命令genspider：

    scrapy genspider doc_crawler scrapy-chs.readthedocs.org

使用该命令时必须提供两个位置参数。第一个是spider的名字，在之后启动爬虫时，需要提供该名称。第二个是限制爬虫访问的域名，这里我们把它设置成scrapy中文文档的二级域名。

运行完命令后，在spiders目录下会创建好doc_crawler.py文件。打开我们可以看到，一个类的基本结构已经写好了。我们实现一个spider就是实现一个scrapy.Spider的子类。必须要提供的三个属性就是name，allowed_domains，start_urls。下面的parse方法是默认用来处理response的回调函数。由downloader获取到的每一个response都会交由这个方法来处理。

下面是该类的代码实现：
```python
import scrapy
from crawl_scrapy_docs.items import CrawlScrapyDocsItem

class DocCrawlerSpider(scrapy.Spider):
    name = "doc_crawler"
    allowed_domains = ["scrapy-chs.readthedocs.org"]
    start_urls = ('http://scrapy-chs.readthedocs.org/zh_CN/0.24/index.html',)

    def parse(self, response):
        item = CrawlScrapyDocsItem()
        item['html_content'] = response.xpath("//div[@class='document']/*[1]").extract()[0]
        item['filename'] = response.xpath('//div[@class="document"]/descendant::h1/text()').extract()[0]
        yield item

        next_path = response.xpath("//div[@role='navigation'][@class='rst-footer-buttons']/a[contains(concat(' ', @class, ' '), ' float-right ')]/@href").extract()[0]

        if next_path:
            next_url = response.url[:response.url.rfind("/")] + "/" + next_path
            yield scrapy.Request(next_url, callback=self.parse)
```

导入了我们的CrawlScrapyDocsItem类之后，在parse方法中就可以实例化一个item对象。为我们要的html_contnet和filename赋值。Scrapy框架默认提供了xpath和css两种选择器。xpath方法调用之后返回的仍然是一个选择器，因此支持链式操作。当我们最终要从xpath中提取出真正的字符串时，需要调用extract()方法。返回的是一个列表值，取出这个唯一的字符串即可。

文档中提到可以用yield关键字来返回item以及request，即可以把parse实现为生成器的形式。这里我猜测在downloader下载完毕后调用parse的时候，可能是采用迭代的for语句进行的。并且在parse中返回item，request时我们不需要做区分，这个区分应该是在调用的时候来区分的。

如果不采用生成器的形式的话，也可以把item和request混合放入一个可迭代对象中，比如全部放入一个列表，最后统一返回。

下面的next_path是用来找到下一篇文章的页面的，在文章的底部我们看到有这样一个链接：
{% asset_img 3.png %}

这个地址就是我们要抓的了。因为抓到的是一个相对地址，所以后面的语句是用来拼接出一个绝对url，然后通过scrapy.Request(url, callback)来构造一个请求对象，仍然指定这个parse方法为回调方法，最后一样通过yield来返回请求，这样我们就指定了下一个要访问的请求。

####定义实例处理：item_pipeline
从spider中抓取到item之后我们需要一个一个pipeline来进行后续处理。在这个示例中我们把抓到的文件以item['filename']为文件名进行保存即可。下面是pipeline的代码：

```python
class CrawlScrapyDocsPipeline(object):
    def process_item(self, item, spider):
        f = file('files/%s.html' % item['filename'].encode('utf-8'), 'wb')
        f.write(item['html_content'])
        f.close()
        return item
```
这个类是自动生成好的，在类中有一个process_item方法，我们只要把它实现出来即可。该方法接收一个item对象和一个spider对象，我们处理完之后再把item对象返回出去，这样如果定义了多个管道的话，就可以依次处理item。

写完pipeline之后不会立即生效，需要我们进行配置。具体配置方法是在settings.py中写入一个ITEM_PIPELINES字典变量。如果有多个pipeline的话，依次写在这里面，后面的数值表示pipeline处理的优先级顺序。
```python
ITEM_PIPELINES = {
    'crawl_scrapy_docs.pipelines.CrawlScrapyDocsPipeline':300
}
```

