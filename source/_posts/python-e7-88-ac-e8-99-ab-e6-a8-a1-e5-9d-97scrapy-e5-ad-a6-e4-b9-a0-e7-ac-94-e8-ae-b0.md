title: Python爬虫模块Scrapy学习笔记
id: 146
categories:
  - 未分类
date: 2015-02-08 21:16:34
tags:
---

<del style="position:relative;display:block">[Edit](http://maxiang.info/#/?provider=evernote_int&amp;guid=44ec2982-dfbd-4540-a53a-675b53610818)</del><div  style="line-height: 1.5; color: #2c3f51; font-family: Helvetica Neue, Arial, Hiragino Sans GB, STHeiti, Microsoft YaHei, WenQuanYi Micro Hei, SimSun, Song, sans-serif;">
                        <div ></div>
                    <div >

`归档` `python` `爬虫` `eat.wordpress.post` 
</div><div >

<div><div ><div >

*   *   <a style="background: transparent; color: #1980e6; text-decoration: none;">Python爬虫模块Scrapy学习笔记</a>

                *   <a style="background: transparent; color: #1980e6; text-decoration: none;">Scrapy爬虫模块简介</a>
        *   <a style="background: transparent; color: #1980e6; text-decoration: none;">Scrapy架构图示</a>
        *   <a style="background: transparent; color: #1980e6; text-decoration: none;">项目示例</a>

                        *   <a style="background: transparent; color: #1980e6; text-decoration: none;">新建项目</a>
            *   <a style="background: transparent; color: #1980e6; text-decoration: none;">定义抓取实例：item</a>
            *   <a style="background: transparent; color: #1980e6; text-decoration: none;">定义抓取过程：spider</a>
            *   <a style="background: transparent; color: #1980e6; text-decoration: none;">定义实例处理：item_pipeline</a>
</div>
</div>
</div>

</div><div >

### Scrapy爬虫模块简介

爬虫的主要目的是为了获取没有开放API的网站上的非结构化数据。即按照给定的规则我们平时看到的网页，并从中抽取出需要的信息。这些信息可以应用在数据挖掘，信息处理等一系列程序中。

简单的爬虫设计主要是确定以下几个问题：

1.  指定访问的起始地址（starting_urls）。
2.  从获得的response中如何解析出我们想要的内容。
3.  在获得的response中如何发现后续要访问的地址。
4.  如何处理我们解析出的内容。

高级爬虫应用还会涉及到许多其它的问题。

Scrapy是一个主流的Python爬虫框架，设计好了爬虫应用的基本骨架结构，也为了实现不同的应用目的留下了灵活的设计余地。使用一些其它的模块，或者配合一些中间件，也可以将Scrapy扩展成为很复杂的高级爬虫程序。

<!--more-->

</div><div >

### Scrapy架构图示

![](http://yongli1992.com/wp-content/uploads/2015/02/1423430175.png)

这里是一张Scrapy架构图的展示。Scrapy Engine负责整个程序的运行。Scheduler负责调度要访问的网址。Downloader负责从网络获取响应。Spider负责分析响应，从响应中解析出我们要的数据，同时也负责找出接下来要访问的后续网址。Item是将我们需要抓取的数据做一个结构化的定义并实现为一个类。Pipeline负责对抓取到的item做后续处理，包括过滤，持久化存储等任务。

绿色箭头表示网络请求与响应的流动。Spider将需要访问的（初始+后续）请求提交给调度器，调度器再将请求分发给Downloader，downloader完成下载后，通过回调函数的形式交由Spider进一步处理，Spider抽取出需要的数据，实例化一个item对象，将数据赋值为item的具体属性。item接下来将经过pipeline，由pipeline实现后续处理。

在一个较为简单的应用中，真正需要我们实现的部分只有定义item，实现spider，实现pipeline。

</div><div >

### 项目示例

接下来用一个例子来展示一个简单Scrapy爬虫的设计过程。

在这个例子中我们要抓取的目标网站是[Scrapy的中文文档](http://scrapy-chs.readthedocs.org/zh_CN/0.24/index.html)。 

![](http://yongli1992.com/wp-content/uploads/2015/02/1423430180.png)

如图所示，我们的目标是访问左侧列出的每一篇文章的网页，然后将右边正文部分的**HTML格式**保存下来。保存之后的html文档打开来是下面这样的。虽然样式比较丑陋，但是保存html而不是抽取出纯文本的目的在于保留网页的语义结构，这样为以后潜在的处理留下了可能。

![](http://yongli1992.com/wp-content/uploads/2015/02/1423430186.png)

</div><div >

#### 新建项目

推荐使用pip来安装Scrapy：

    pip install Scrapy
    `</pre>

    安装完成后，Scrapy提供了一个命令行工具，使用scrapy命令可以提供非常强大的功能，比如：

*   创建项目
*   提供交互shell，在真实的爬虫环境中测试数据提取
*   控制管理爬虫程序，包括启动，停止，查看可用爬虫等
*   展现爬虫真实获取到的response，有时候程序拿到的响应和用户通过浏览器看到的并不相同

    我们把这个示例项目叫做crawl_scrapy_docs，用下面的命令来新建项目

    <pre style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 10px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start;">`scrapy startproject crawl_scrapy_docs
    `</pre>

    运行以后的目录结构是：

    <pre style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 10px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start;">`crawl_scrapy_docs/
            scrapy.cfg
            crawl_scrapy_docs/
                __init__.py
                items.py
                pipelines.py
                settings.py
                spiders/
                    __init__.py
                    ...
    `</pre>

    其中items.py中定义我们的item类，pipelines实现抓取后的处理管道，spiders/文件夹存放spider的实现。

    </div><div >

    #### 定义抓取实例：item

    在这个项目里，我们感兴趣的数据有两项：

1.  正文部分的html文本，我们叫做html_content
2.  用于保存文件的文件名，我们叫做filename

    这个filename我们就取正文的第一行h1标签中的标题文字。

    items.py中的代码如下：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f92672;">import</span> scrapy
    <span ><span  style="color: #66d9ef;">class</span> <span  style="color: #f8f8f2;">CrawlScrapyDocsItem</span><span  style="color: #f8f8f2;">(scrapy.Item)</span>:</span>
        html_content = scrapy.Field()
        filename = scrapy.Field()`</pre>

    只要给我们的变量赋值成一个scrapy.Field()对象即可。这样在后续spider中处理时，就可以将item作为字典的形式来进行访问，如：

    <pre style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 10px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start;">`item["html_content"] = "some value..."
    `</pre>

    </div><div >

    #### 定义抓取过程：spider

    实现spider需要在项目文件夹中的spiders目录下来创建。将这里要用到的spider叫做doc_crawler。Scrapy提供的命令行工具直接提供了创建spider的命令genspider：

    <pre style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 10px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start;">`scrapy genspider doc_crawler scrapy-chs.readthedocs.org
    `</pre>

    使用该命令时必须提供两个位置参数。第一个是spider的名字，在之后启动爬虫时，需要提供该名称。第二个是限制爬虫访问的域名，这里我们把它设置成scrapy中文文档的二级域名。

    运行完命令后，在spiders目录下会创建好doc_crawler.py文件。打开我们可以看到，一个类的基本结构已经写好了。我们实现一个spider就是实现一个scrapy.Spider的子类。必须要提供的三个属性就是name，allowed_domains，start_urls。下面的parse方法是默认用来处理response的回调函数。由downloader获取到的每一个response都会交由这个方法来处理。

    下面是该类的代码实现：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span  style="color: #f92672;">import</span> scrapy
    <span  style="color: #f92672;">from</span> crawl_scrapy_docs.items <span  style="color: #f92672;">import</span> CrawlScrapyDocsItem

    <span ><span  style="color: #66d9ef;">class</span> <span  style="color: #f8f8f2;">DocCrawlerSpider</span><span  style="color: #f8f8f2;">(scrapy.Spider)</span>:</span>
        name = <span  style="color: #e6db74;">"doc_crawler"</span>
        allowed_domains = [<span  style="color: #e6db74;">"scrapy-chs.readthedocs.org"</span>]
        start_urls = (<span  style="color: #e6db74;">'http://scrapy-chs.readthedocs.org/zh_CN/0.24/index.html'</span>,)

        <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">parse</span><span  style="color: #f8f8f2;">(self, response)</span>:</span>
            item = CrawlScrapyDocsItem()
            item[<span  style="color: #e6db74;">'html_content'</span>] = response.xpath(<span  style="color: #e6db74;">"//div[@class='document']/*[1]"</span>).extract()[<span  style="color: #ae81ff;">0</span>]
            item[<span  style="color: #e6db74;">'filename'</span>] = response.xpath(<span  style="color: #e6db74;">'//div[@class="document"]/descendant::h1/text()'</span>).extract()[<span  style="color: #ae81ff;">0</span>]
            <span  style="color: #f92672;">yield</span> item

            next_path = response.xpath(<span  style="color: #e6db74;">"//div[@role='navigation'][@class='rst-footer-buttons']/a[contains(concat(' ', @class, ' '), ' float-right ')]/@href"</span>).extract()[<span  style="color: #ae81ff;">0</span>]

            <span  style="color: #f92672;">if</span> next_path:
                next_url = response.url[:response.url.rfind(<span  style="color: #e6db74;">"/"</span>)] + <span  style="color: #e6db74;">"/"</span> + next_path
                <span  style="color: #f92672;">yield</span> scrapy.Request(next_url, callback=self.parse)`</pre>

    导入了我们的CrawlScrapyDocsItem类之后，在parse方法中就可以实例化一个item对象。为我们要的html_contnet和filename赋值。Scrapy框架默认提供了xpath和css两种选择器。xpath方法调用之后返回的仍然是一个选择器，因此支持链式操作。当我们最终要从xpath中提取出真正的字符串时，需要调用extract()方法。返回的是一个列表值，取出这个唯一的字符串即可。

    文档中提到可以用yield关键字来返回item以及request，即可以把parse实现为生成器的形式。这里我猜测在downloader下载完毕后调用parse的时候，可能是采用迭代的for语句进行的。并且在parse中返回item，request时我们不需要做区分，这个区分应该是在调用的时候来区分的。

    如果不采用生成器的形式的话，也可以把item和request混合放入一个可迭代对象中，比如全部放入一个列表，最后统一返回。

    下面的next_path是用来找到下一篇文章的页面的，在文章的底部我们看到有这样一个链接： 

    ![](http://yongli1992.com/wp-content/uploads/2015/02/1423430190.png)

    这个地址就是我们要抓的了。因为抓到的是一个相对地址，所以后面的语句是用来拼接出一个绝对url，然后通过scrapy.Request(url, callback)来构造一个请求对象，仍然指定这个parse方法为回调方法，最后一样通过yield来返回请求，这样我们就指定了下一个要访问的请求。

    </div><div >

    #### 定义实例处理：item_pipeline

    从spider中抓取到item之后我们需要一个一个pipeline来进行后续处理。在这个示例中我们把抓到的文件以item[‘filename’]为文件名进行保存即可。下面是pipeline的代码：

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`<span ><span  style="color: #66d9ef;">class</span> <span  style="color: #f8f8f2;">CrawlScrapyDocsPipeline</span><span  style="color: #f8f8f2;">(object)</span>:</span>
        <span  style="color: #f92672;"><span  style="color: #66d9ef;">def</span> <span  style="color: #a6e22e;">process_item</span><span  style="color: #f8f8f2;">(self, item, spider)</span>:</span>
            f = file(<span  style="color: #e6db74;">'files/%s.html'</span> % item[<span  style="color: #e6db74;">'filename'</span>].encode(<span  style="color: #e6db74;">'utf-8'</span>), <span  style="color: #e6db74;">'wb'</span>)
            f.write(item[<span  style="color: #e6db74;">'html_content'</span>])
            f.close()
            <span  style="color: #f92672;">return</span> item`</pre>

    这个类是自动生成好的，在类中有一个process_item方法，我们只要把它实现出来即可。该方法接收一个item对象和一个spider对象，我们处理完之后再把item对象返回出去，这样如果定义了多个管道的话，就可以依次处理item。

    写完pipeline之后不会立即生效，需要我们进行配置。具体配置方法是在settings.py中写入一个ITEM_PIPELINES字典变量。如果有多个pipeline的话，依次写在这里面，后面的数值表示pipeline处理的优先级顺序。

    </div><div >

    <pre  style="font-family: Source Code Pro,monospace; font-size: .9em; white-space: pre-wrap; display: block; padding: 2px; margin: 0 0 1.1em; line-height: 1.45; word-break: break-word; word-wrap: break-word; color: #333; background-color: rgba(102,128,153,0.05); border: 0; border-radius: 5px; text-align: start; background: #f6f6f6;">`ITEM_PIPELINES = {
        <span  style="color: #e6db74;">'crawl_scrapy_docs.pipelines.CrawlScrapyDocsPipeline'</span>:<span  style="color: #ae81ff;">300</span>
    }
</div><div ></div></div><center style='display:none'>@%28%u5F52%u6863%29%5Bpython%7C%u722C%u866B%7Ceat.wordpress.post%5D%0A%23%23%20Python%u722C%u866B%u6A21%u5757Scrapy%u5B66%u4E60%u7B14%u8BB0%0A%5BTOC%5D%0A%0A%23%23%23%20Scrapy%u722C%u866B%u6A21%u5757%u7B80%u4ECB%0A%u722C%u866B%u7684%u4E3B%u8981%u76EE%u7684%u662F%u4E3A%u4E86%u83B7%u53D6%u6CA1%u6709%u5F00%u653EAPI%u7684%u7F51%u7AD9%u4E0A%u7684%u975E%u7ED3%u6784%u5316%u6570%u636E%u3002%u5373%u6309%u7167%u7ED9%u5B9A%u7684%u89C4%u5219%u6211%u4EEC%u5E73%u65F6%u770B%u5230%u7684%u7F51%u9875%uFF0C%u5E76%u4ECE%u4E2D%u62BD%u53D6%u51FA%u9700%u8981%u7684%u4FE1%u606F%u3002%u8FD9%u4E9B%u4FE1%u606F%u53EF%u4EE5%u5E94%u7528%u5728%u6570%u636E%u6316%u6398%uFF0C%u4FE1%u606F%u5904%u7406%u7B49%u4E00%u7CFB%u5217%u7A0B%u5E8F%u4E2D%u3002%0A%0A%u7B80%u5355%u7684%u722C%u866B%u8BBE%u8BA1%u4E3B%u8981%u662F%u786E%u5B9A%u4EE5%u4E0B%u51E0%u4E2A%u95EE%u9898%uFF1A%0A1.%20%u6307%u5B9A%u8BBF%u95EE%u7684%u8D77%u59CB%u5730%u5740%uFF08starting_urls%uFF09%u3002%0A2.%20%u4ECE%u83B7%u5F97%u7684response%u4E2D%u5982%u4F55%u89E3%u6790%u51FA%u6211%u4EEC%u60F3%u8981%u7684%u5185%u5BB9%u3002%0A3.%20%u5728%u83B7%u5F97%u7684response%u4E2D%u5982%u4F55%u53D1%u73B0%u540E%u7EED%u8981%u8BBF%u95EE%u7684%u5730%u5740%u3002%0A4.%20%u5982%u4F55%u5904%u7406%u6211%u4EEC%u89E3%u6790%u51FA%u7684%u5185%u5BB9%u3002%0A%0A%u9AD8%u7EA7%u722C%u866B%u5E94%u7528%u8FD8%u4F1A%u6D89%u53CA%u5230%u8BB8%u591A%u5176%u5B83%u7684%u95EE%u9898%u3002%0A%0AScrapy%u662F%u4E00%u4E2A%u4E3B%u6D41%u7684Python%u722C%u866B%u6846%u67B6%uFF0C%u8BBE%u8BA1%u597D%u4E86%u722C%u866B%u5E94%u7528%u7684%u57FA%u672C%u9AA8%u67B6%u7ED3%u6784%uFF0C%u4E5F%u4E3A%u4E86%u5B9E%u73B0%u4E0D%u540C%u7684%u5E94%u7528%u76EE%u7684%u7559%u4E0B%u4E86%u7075%u6D3B%u7684%u8BBE%u8BA1%u4F59%u5730%u3002%u4F7F%u7528%u4E00%u4E9B%u5176%u5B83%u7684%u6A21%u5757%uFF0C%u6216%u8005%u914D%u5408%u4E00%u4E9B%u4E2D%u95F4%u4EF6%uFF0C%u4E5F%u53EF%u4EE5%u5C06Scrapy%u6269%u5C55%u6210%u4E3A%u5F88%u590D%u6742%u7684%u9AD8%u7EA7%u722C%u866B%u7A0B%u5E8F%u3002%0A%0A%3C%21--more--%3E%0A%0A%23%23%23%20Scrapy%u67B6%u6784%u56FE%u793A%0A%21%5BScrapy%u67B6%u6784%u8BF4%u660E%5D%28http%3A//scrapy-chs.readthedocs.org/zh_CN/latest/_images/scrapy_architecture.png%29%0A%0A%u8FD9%u91CC%u662F%u4E00%u5F20Scrapy%u67B6%u6784%u56FE%u7684%u5C55%u793A%u3002Scrapy%20Engine%u8D1F%u8D23%u6574%u4E2A%u7A0B%u5E8F%u7684%u8FD0%u884C%u3002Scheduler%u8D1F%u8D23%u8C03%u5EA6%u8981%u8BBF%u95EE%u7684%u7F51%u5740%u3002Downloader%u8D1F%u8D23%u4ECE%u7F51%u7EDC%u83B7%u53D6%u54CD%u5E94%u3002Spider%u8D1F%u8D23%u5206%u6790%u54CD%u5E94%uFF0C%u4ECE%u54CD%u5E94%u4E2D%u89E3%u6790%u51FA%u6211%u4EEC%u8981%u7684%u6570%u636E%uFF0C%u540C%u65F6%u4E5F%u8D1F%u8D23%u627E%u51FA%u63A5%u4E0B%u6765%u8981%u8BBF%u95EE%u7684%u540E%u7EED%u7F51%u5740%u3002Item%u662F%u5C06%u6211%u4EEC%u9700%u8981%u6293%u53D6%u7684%u6570%u636E%u505A%u4E00%u4E2A%u7ED3%u6784%u5316%u7684%u5B9A%u4E49%u5E76%u5B9E%u73B0%u4E3A%u4E00%u4E2A%u7C7B%u3002Pipeline%u8D1F%u8D23%u5BF9%u6293%u53D6%u5230%u7684item%u505A%u540E%u7EED%u5904%u7406%uFF0C%u5305%u62EC%u8FC7%u6EE4%uFF0C%u6301%u4E45%u5316%u5B58%u50A8%u7B49%u4EFB%u52A1%u3002%0A%0A%u7EFF%u8272%u7BAD%u5934%u8868%u793A%u7F51%u7EDC%u8BF7%u6C42%u4E0E%u54CD%u5E94%u7684%u6D41%u52A8%u3002Spider%u5C06%u9700%u8981%u8BBF%u95EE%u7684%uFF08%u521D%u59CB+%u540E%u7EED%uFF09%u8BF7%u6C42%u63D0%u4EA4%u7ED9%u8C03%u5EA6%u5668%uFF0C%u8C03%u5EA6%u5668%u518D%u5C06%u8BF7%u6C42%u5206%u53D1%u7ED9Downloader%uFF0Cdownloader%u5B8C%u6210%u4E0B%u8F7D%u540E%uFF0C%u901A%u8FC7%u56DE%u8C03%u51FD%u6570%u7684%u5F62%u5F0F%u4EA4%u7531Spider%u8FDB%u4E00%u6B65%u5904%u7406%uFF0CSpider%u62BD%u53D6%u51FA%u9700%u8981%u7684%u6570%u636E%uFF0C%u5B9E%u4F8B%u5316%u4E00%u4E2Aitem%u5BF9%u8C61%uFF0C%u5C06%u6570%u636E%u8D4B%u503C%u4E3Aitem%u7684%u5177%u4F53%u5C5E%u6027%u3002item%u63A5%u4E0B%u6765%u5C06%u7ECF%u8FC7pipeline%uFF0C%u7531pipeline%u5B9E%u73B0%u540E%u7EED%u5904%u7406%u3002%0A%0A%u5728%u4E00%u4E2A%u8F83%u4E3A%u7B80%u5355%u7684%u5E94%u7528%u4E2D%uFF0C%u771F%u6B63%u9700%u8981%u6211%u4EEC%u5B9E%u73B0%u7684%u90E8%u5206%u53EA%u6709%u5B9A%u4E49item%uFF0C%u5B9E%u73B0spider%uFF0C%u5B9E%u73B0pipeline%u3002%0A%0A%23%23%23%20%u9879%u76EE%u793A%u4F8B%0A%u63A5%u4E0B%u6765%u7528%u4E00%u4E2A%u4F8B%u5B50%u6765%u5C55%u793A%u4E00%u4E2A%u7B80%u5355Scrapy%u722C%u866B%u7684%u8BBE%u8BA1%u8FC7%u7A0B%u3002%0A%0A%u5728%u8FD9%u4E2A%u4F8B%u5B50%u4E2D%u6211%u4EEC%u8981%u6293%u53D6%u7684%u76EE%u6807%u7F51%u7AD9%u662F%5BScrapy%u7684%u4E2D%u6587%u6587%u6863%5D%28http%3A//scrapy-chs.readthedocs.org/zh_CN/0.24/index.html%29%u3002%0A%21%5BAlt%20text%5D%28./1422907372405.png%29%0A%0A%u5982%u56FE%u6240%u793A%uFF0C%u6211%u4EEC%u7684%u76EE%u6807%u662F%u8BBF%u95EE%u5DE6%u4FA7%u5217%u51FA%u7684%u6BCF%u4E00%u7BC7%u6587%u7AE0%u7684%u7F51%u9875%uFF0C%u7136%u540E%u5C06%u53F3%u8FB9%u6B63%u6587%u90E8%u5206%u7684**HTML%u683C%u5F0F**%u4FDD%u5B58%u4E0B%u6765%u3002%u4FDD%u5B58%u4E4B%u540E%u7684html%u6587%u6863%u6253%u5F00%u6765%u662F%u4E0B%u9762%u8FD9%u6837%u7684%u3002%u867D%u7136%u6837%u5F0F%u6BD4%u8F83%u4E11%u964B%uFF0C%u4F46%u662F%u4FDD%u5B58html%u800C%u4E0D%u662F%u62BD%u53D6%u51FA%u7EAF%u6587%u672C%u7684%u76EE%u7684%u5728%u4E8E%u4FDD%u7559%u7F51%u9875%u7684%u8BED%u4E49%u7ED3%u6784%uFF0C%u8FD9%u6837%u4E3A%u4EE5%u540E%u6F5C%u5728%u7684%u5904%u7406%u7559%u4E0B%u4E86%u53EF%u80FD%u3002%0A%0A%21%5BAlt%20text%5D%28./1422907469954.png%29%0A%0A%23%23%23%23%20%u65B0%u5EFA%u9879%u76EE%0A%u63A8%u8350%u4F7F%u7528pip%u6765%u5B89%u88C5Scrapy%uFF1A%0A%20%20%20%20%0A%20%20%20%20pip%20install%20Scrapy%0A%u5B89%u88C5%u5B8C%u6210%u540E%uFF0CScrapy%u63D0%u4F9B%u4E86%u4E00%u4E2A%u547D%u4EE4%u884C%u5DE5%u5177%uFF0C%u4F7F%u7528scrapy%u547D%u4EE4%u53EF%u4EE5%u63D0%u4F9B%u975E%u5E38%u5F3A%u5927%u7684%u529F%u80FD%uFF0C%u6BD4%u5982%uFF1A%0A-%20%u521B%u5EFA%u9879%u76EE%0A-%20%u63D0%u4F9B%u4EA4%u4E92shell%uFF0C%u5728%u771F%u5B9E%u7684%u722C%u866B%u73AF%u5883%u4E2D%u6D4B%u8BD5%u6570%u636E%u63D0%u53D6%0A-%20%u63A7%u5236%u7BA1%u7406%u722C%u866B%u7A0B%u5E8F%uFF0C%u5305%u62EC%u542F%u52A8%uFF0C%u505C%u6B62%uFF0C%u67E5%u770B%u53EF%u7528%u722C%u866B%u7B49%0A-%20%u5C55%u73B0%u722C%u866B%u771F%u5B9E%u83B7%u53D6%u5230%u7684response%uFF0C%u6709%u65F6%u5019%u7A0B%u5E8F%u62FF%u5230%u7684%u54CD%u5E94%u548C%u7528%u6237%u901A%u8FC7%u6D4F%u89C8%u5668%u770B%u5230%u7684%u5E76%u4E0D%u76F8%u540C%0A%0A%u6211%u4EEC%u628A%u8FD9%u4E2A%u793A%u4F8B%u9879%u76EE%u53EB%u505Acrawl_scrapy_docs%uFF0C%u7528%u4E0B%u9762%u7684%u547D%u4EE4%u6765%u65B0%u5EFA%u9879%u76EE%0A%20%20%20%20%0A%20%20%20%20scrapy%20startproject%20crawl_scrapy_docs%0A%u8FD0%u884C%u4EE5%u540E%u7684%u76EE%u5F55%u7ED3%u6784%u662F%uFF1A%0A%20%20%20%20%0A%20%20%20%20crawl_scrapy_docs/%0A%09%09%20%20%20%20scrapy.cfg%0A%09%09%20%20%20%20crawl_scrapy_docs/%0A%09%09%20%20%20%20%20%20%20%20__init__.py%0A%09%09%20%20%20%20%20%20%20%20items.py%0A%09%09%20%20%20%20%20%20%20%20pipelines.py%0A%09%09%20%20%20%20%20%20%20%20settings.py%0A%09%09%20%20%20%20%20%20%20%20spiders/%0A%09%09%20%20%20%20%20%20%20%20%20%20%20%20__init__.py%0A%09%09%20%20%20%20%20%20%20%20%20%20%20%20...%0A%u5176%u4E2Ditems.py%u4E2D%u5B9A%u4E49%u6211%u4EEC%u7684item%u7C7B%uFF0Cpipelines%u5B9E%u73B0%u6293%u53D6%u540E%u7684%u5904%u7406%u7BA1%u9053%uFF0Cspiders/%u6587%u4EF6%u5939%u5B58%u653Espider%u7684%u5B9E%u73B0%u3002%0A%0A%23%23%23%23%u5B9A%u4E49%u6293%u53D6%u5B9E%u4F8B%uFF1Aitem%0A%u5728%u8FD9%u4E2A%u9879%u76EE%u91CC%uFF0C%u6211%u4EEC%u611F%u5174%u8DA3%u7684%u6570%u636E%u6709%u4E24%u9879%uFF1A%0A1.%20%u6B63%u6587%u90E8%u5206%u7684html%u6587%u672C%uFF0C%u6211%u4EEC%u53EB%u505Ahtml_content%0A2.%20%u7528%u4E8E%u4FDD%u5B58%u6587%u4EF6%u7684%u6587%u4EF6%u540D%uFF0C%u6211%u4EEC%u53EB%u505Afilename%0A%0A%u8FD9%u4E2Afilename%u6211%u4EEC%u5C31%u53D6%u6B63%u6587%u7684%u7B2C%u4E00%u884Ch1%u6807%u7B7E%u4E2D%u7684%u6807%u9898%u6587%u5B57%u3002%0A%0Aitems.py%u4E2D%u7684%u4EE3%u7801%u5982%u4E0B%uFF1A%0A%60%60%60python%0Aimport%20scrapy%0Aclass%20CrawlScrapyDocsItem%28scrapy.Item%29%3A%0A%20%20%20%20html_content%20%3D%20scrapy.Field%28%29%0A%20%20%20%20filename%20%3D%20scrapy.Field%28%29%0A%60%60%60%0A%u53EA%u8981%u7ED9%u6211%u4EEC%u7684%u53D8%u91CF%u8D4B%u503C%u6210%u4E00%u4E2Ascrapy.Field%28%29%u5BF9%u8C61%u5373%u53EF%u3002%u8FD9%u6837%u5728%u540E%u7EEDspider%u4E2D%u5904%u7406%u65F6%uFF0C%u5C31%u53EF%u4EE5%u5C06item%u4F5C%u4E3A%u5B57%u5178%u7684%u5F62%u5F0F%u6765%u8FDB%u884C%u8BBF%u95EE%uFF0C%u5982%uFF1A%0A%0A%20%20%20%20item%5B%22html_content%22%5D%20%3D%20%22some%20value...%22%0A%0A%23%23%23%23%u5B9A%u4E49%u6293%u53D6%u8FC7%u7A0B%uFF1Aspider%0A%u5B9E%u73B0spider%u9700%u8981%u5728%u9879%u76EE%u6587%u4EF6%u5939%u4E2D%u7684spiders%u76EE%u5F55%u4E0B%u6765%u521B%u5EFA%u3002%u5C06%u8FD9%u91CC%u8981%u7528%u5230%u7684spider%u53EB%u505Adoc_crawler%u3002Scrapy%u63D0%u4F9B%u7684%u547D%u4EE4%u884C%u5DE5%u5177%u76F4%u63A5%u63D0%u4F9B%u4E86%u521B%u5EFAspider%u7684%u547D%u4EE4genspider%uFF1A%0A%0A%20%20%20%20scrapy%20genspider%20doc_crawler%20scrapy-chs.readthedocs.org%0A%0A%u4F7F%u7528%u8BE5%u547D%u4EE4%u65F6%u5FC5%u987B%u63D0%u4F9B%u4E24%u4E2A%u4F4D%u7F6E%u53C2%u6570%u3002%u7B2C%u4E00%u4E2A%u662Fspider%u7684%u540D%u5B57%uFF0C%u5728%u4E4B%u540E%u542F%u52A8%u722C%u866B%u65F6%uFF0C%u9700%u8981%u63D0%u4F9B%u8BE5%u540D%u79F0%u3002%u7B2C%u4E8C%u4E2A%u662F%u9650%u5236%u722C%u866B%u8BBF%u95EE%u7684%u57DF%u540D%uFF0C%u8FD9%u91CC%u6211%u4EEC%u628A%u5B83%u8BBE%u7F6E%u6210scrapy%u4E2D%u6587%u6587%u6863%u7684%u4E8C%u7EA7%u57DF%u540D%u3002%0A%0A%u8FD0%u884C%u5B8C%u547D%u4EE4%u540E%uFF0C%u5728spiders%u76EE%u5F55%u4E0B%u4F1A%u521B%u5EFA%u597Ddoc_crawler.py%u6587%u4EF6%u3002%u6253%u5F00%u6211%u4EEC%u53EF%u4EE5%u770B%u5230%uFF0C%u4E00%u4E2A%u7C7B%u7684%u57FA%u672C%u7ED3%u6784%u5DF2%u7ECF%u5199%u597D%u4E86%u3002%u6211%u4EEC%u5B9E%u73B0%u4E00%u4E2Aspider%u5C31%u662F%u5B9E%u73B0%u4E00%u4E2Ascrapy.Spider%u7684%u5B50%u7C7B%u3002%u5FC5%u987B%u8981%u63D0%u4F9B%u7684%u4E09%u4E2A%u5C5E%u6027%u5C31%u662Fname%uFF0Callowed_domains%uFF0Cstart_urls%u3002%u4E0B%u9762%u7684parse%u65B9%u6CD5%u662F%u9ED8%u8BA4%u7528%u6765%u5904%u7406response%u7684%u56DE%u8C03%u51FD%u6570%u3002%u7531downloader%u83B7%u53D6%u5230%u7684%u6BCF%u4E00%u4E2Aresponse%u90FD%u4F1A%u4EA4%u7531%u8FD9%u4E2A%u65B9%u6CD5%u6765%u5904%u7406%u3002%0A%0A%u4E0B%u9762%u662F%u8BE5%u7C7B%u7684%u4EE3%u7801%u5B9E%u73B0%uFF1A%0A%60%60%60python%0Aimport%20scrapy%0Afrom%20crawl_scrapy_docs.items%20import%20CrawlScrapyDocsItem%0A%0Aclass%20DocCrawlerSpider%28scrapy.Spider%29%3A%0A%20%20%20%20name%20%3D%20%22doc_crawler%22%0A%20%20%20%20allowed_domains%20%3D%20%5B%22scrapy-chs.readthedocs.org%22%5D%0A%20%20%20%20start_urls%20%3D%20%28%27http%3A//scrapy-chs.readthedocs.org/zh_CN/0.24/index.html%27%2C%29%0A%0A%20%20%20%20def%20parse%28self%2C%20response%29%3A%0A%20%20%20%20%20%20%20%20item%20%3D%20CrawlScrapyDocsItem%28%29%0A%20%20%20%20%20%20%20%20item%5B%27html_content%27%5D%20%3D%20response.xpath%28%22//div%5B@class%3D%27document%27%5D/*%5B1%5D%22%29.extract%28%29%5B0%5D%0A%20%20%20%20%20%20%20%20item%5B%27filename%27%5D%20%3D%20response.xpath%28%27//div%5B@class%3D%22document%22%5D/descendant%3A%3Ah1/text%28%29%27%29.extract%28%29%5B0%5D%0A%20%20%20%20%20%20%20%20yield%20item%0A%0A%20%20%20%20%20%20%20%20next_path%20%3D%20response.xpath%28%22//div%5B@role%3D%27navigation%27%5D%5B@class%3D%27rst-footer-buttons%27%5D/a%5Bcontains%28concat%28%27%20%27%2C%20@class%2C%20%27%20%27%29%2C%20%27%20float-right%20%27%29%5D/@href%22%29.extract%28%29%5B0%5D%0A%0A%20%20%20%20%20%20%20%20if%20next_path%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20next_url%20%3D%20response.url%5B%3Aresponse.url.rfind%28%22/%22%29%5D%20+%20%22/%22%20+%20next_path%0A%20%20%20%20%20%20%20%20%20%20%20%20yield%20scrapy.Request%28next_url%2C%20callback%3Dself.parse%29%0A%60%60%60%0A%0A%u5BFC%u5165%u4E86%u6211%u4EEC%u7684CrawlScrapyDocsItem%u7C7B%u4E4B%u540E%uFF0C%u5728parse%u65B9%u6CD5%u4E2D%u5C31%u53EF%u4EE5%u5B9E%u4F8B%u5316%u4E00%u4E2Aitem%u5BF9%u8C61%u3002%u4E3A%u6211%u4EEC%u8981%u7684html_contnet%u548Cfilename%u8D4B%u503C%u3002Scrapy%u6846%u67B6%u9ED8%u8BA4%u63D0%u4F9B%u4E86xpath%u548Ccss%u4E24%u79CD%u9009%u62E9%u5668%u3002xpath%u65B9%u6CD5%u8C03%u7528%u4E4B%u540E%u8FD4%u56DE%u7684%u4ECD%u7136%u662F%u4E00%u4E2A%u9009%u62E9%u5668%uFF0C%u56E0%u6B64%u652F%u6301%u94FE%u5F0F%u64CD%u4F5C%u3002%u5F53%u6211%u4EEC%u6700%u7EC8%u8981%u4ECExpath%u4E2D%u63D0%u53D6%u51FA%u771F%u6B63%u7684%u5B57%u7B26%u4E32%u65F6%uFF0C%u9700%u8981%u8C03%u7528extract%28%29%u65B9%u6CD5%u3002%u8FD4%u56DE%u7684%u662F%u4E00%u4E2A%u5217%u8868%u503C%uFF0C%u53D6%u51FA%u8FD9%u4E2A%u552F%u4E00%u7684%u5B57%u7B26%u4E32%u5373%u53EF%u3002%0A%0A%u6587%u6863%u4E2D%u63D0%u5230%u53EF%u4EE5%u7528yield%u5173%u952E%u5B57%u6765%u8FD4%u56DEitem%u4EE5%u53CArequest%uFF0C%u5373%u53EF%u4EE5%u628Aparse%u5B9E%u73B0%u4E3A%u751F%u6210%u5668%u7684%u5F62%u5F0F%u3002%u8FD9%u91CC%u6211%u731C%u6D4B%u5728downloader%u4E0B%u8F7D%u5B8C%u6BD5%u540E%u8C03%u7528parse%u7684%u65F6%u5019%uFF0C%u53EF%u80FD%u662F%u91C7%u7528%u8FED%u4EE3%u7684for%u8BED%u53E5%u8FDB%u884C%u7684%u3002%u5E76%u4E14%u5728parse%u4E2D%u8FD4%u56DEitem%uFF0Crequest%u65F6%u6211%u4EEC%u4E0D%u9700%u8981%u505A%u533A%u5206%uFF0C%u8FD9%u4E2A%u533A%u5206%u5E94%u8BE5%u662F%u5728%u8C03%u7528%u7684%u65F6%u5019%u6765%u533A%u5206%u7684%u3002%0A%0A%u5982%u679C%u4E0D%u91C7%u7528%u751F%u6210%u5668%u7684%u5F62%u5F0F%u7684%u8BDD%uFF0C%u4E5F%u53EF%u4EE5%u628Aitem%u548Crequest%u6DF7%u5408%u653E%u5165%u4E00%u4E2A%u53EF%u8FED%u4EE3%u5BF9%u8C61%u4E2D%uFF0C%u6BD4%u5982%u5168%u90E8%u653E%u5165%u4E00%u4E2A%u5217%u8868%uFF0C%u6700%u540E%u7EDF%u4E00%u8FD4%u56DE%u3002%0A%0A%u4E0B%u9762%u7684next_path%u662F%u7528%u6765%u627E%u5230%u4E0B%u4E00%u7BC7%u6587%u7AE0%u7684%u9875%u9762%u7684%uFF0C%u5728%u6587%u7AE0%u7684%u5E95%u90E8%u6211%u4EEC%u770B%u5230%u6709%u8FD9%u6837%u4E00%u4E2A%u94FE%u63A5%uFF1A%0A%21%5BAlt%20text%5D%28./1422996462810.png%29%0A%0A%u8FD9%u4E2A%u5730%u5740%u5C31%u662F%u6211%u4EEC%u8981%u6293%u7684%u4E86%u3002%u56E0%u4E3A%u6293%u5230%u7684%u662F%u4E00%u4E2A%u76F8%u5BF9%u5730%u5740%uFF0C%u6240%u4EE5%u540E%u9762%u7684%u8BED%u53E5%u662F%u7528%u6765%u62FC%u63A5%u51FA%u4E00%u4E2A%u7EDD%u5BF9url%uFF0C%u7136%u540E%u901A%u8FC7scrapy.Request%28url%2C%20callback%29%u6765%u6784%u9020%u4E00%u4E2A%u8BF7%u6C42%u5BF9%u8C61%uFF0C%u4ECD%u7136%u6307%u5B9A%u8FD9%u4E2Aparse%u65B9%u6CD5%u4E3A%u56DE%u8C03%u65B9%u6CD5%uFF0C%u6700%u540E%u4E00%u6837%u901A%u8FC7yield%u6765%u8FD4%u56DE%u8BF7%u6C42%uFF0C%u8FD9%u6837%u6211%u4EEC%u5C31%u6307%u5B9A%u4E86%u4E0B%u4E00%u4E2A%u8981%u8BBF%u95EE%u7684%u8BF7%u6C42%u3002%0A%0A%23%23%23%23%u5B9A%u4E49%u5B9E%u4F8B%u5904%u7406%uFF1Aitem_pipeline%0A%u4ECEspider%u4E2D%u6293%u53D6%u5230item%u4E4B%u540E%u6211%u4EEC%u9700%u8981%u4E00%u4E2A%u4E00%u4E2Apipeline%u6765%u8FDB%u884C%u540E%u7EED%u5904%u7406%u3002%u5728%u8FD9%u4E2A%u793A%u4F8B%u4E2D%u6211%u4EEC%u628A%u6293%u5230%u7684%u6587%u4EF6%u4EE5item%5B%27filename%27%5D%u4E3A%u6587%u4EF6%u540D%u8FDB%u884C%u4FDD%u5B58%u5373%u53EF%u3002%u4E0B%u9762%u662Fpipeline%u7684%u4EE3%u7801%uFF1A%0A%0A%60%60%60python%0Aclass%20CrawlScrapyDocsPipeline%28object%29%3A%0A%20%20%20%20def%20process_item%28self%2C%20item%2C%20spider%29%3A%0A%20%20%20%20%20%20%20%20f%20%3D%20file%28%27files/%25s.html%27%20%25%20item%5B%27filename%27%5D.encode%28%27utf-8%27%29%2C%20%27wb%27%29%0A%20%20%20%20%20%20%20%20f.write%28item%5B%27html_content%27%5D%29%0A%20%20%20%20%20%20%20%20f.close%28%29%0A%20%20%20%20%20%20%20%20return%20item%0A%60%60%60%0A%u8FD9%u4E2A%u7C7B%u662F%u81EA%u52A8%u751F%u6210%u597D%u7684%uFF0C%u5728%u7C7B%u4E2D%u6709%u4E00%u4E2Aprocess_item%u65B9%u6CD5%uFF0C%u6211%u4EEC%u53EA%u8981%u628A%u5B83%u5B9E%u73B0%u51FA%u6765%u5373%u53EF%u3002%u8BE5%u65B9%u6CD5%u63A5%u6536%u4E00%u4E2Aitem%u5BF9%u8C61%u548C%u4E00%u4E2Aspider%u5BF9%u8C61%uFF0C%u6211%u4EEC%u5904%u7406%u5B8C%u4E4B%u540E%u518D%u628Aitem%u5BF9%u8C61%u8FD4%u56DE%u51FA%u53BB%uFF0C%u8FD9%u6837%u5982%u679C%u5B9A%u4E49%u4E86%u591A%u4E2A%u7BA1%u9053%u7684%u8BDD%uFF0C%u5C31%u53EF%u4EE5%u4F9D%u6B21%u5904%u7406item%u3002%0A%0A%u5199%u5B8Cpipeline%u4E4B%u540E%u4E0D%u4F1A%u7ACB%u5373%u751F%u6548%uFF0C%u9700%u8981%u6211%u4EEC%u8FDB%u884C%u914D%u7F6E%u3002%u5177%u4F53%u914D%u7F6E%u65B9%u6CD5%u662F%u5728settings.py%u4E2D%u5199%u5165%u4E00%u4E2AITEM_PIPELINES%u5B57%u5178%u53D8%u91CF%u3002%u5982%u679C%u6709%u591A%u4E2Apipeline%u7684%u8BDD%uFF0C%u4F9D%u6B21%u5199%u5728%u8FD9%u91CC%u9762%uFF0C%u540E%u9762%u7684%u6570%u503C%u8868%u793Apipeline%u5904%u7406%u7684%u4F18%u5148%u7EA7%u987A%u5E8F%u3002%0A%60%60%60python%0AITEM_PIPELINES%20%3D%20%7B%0A%20%20%20%20%27crawl_scrapy_docs.pipelines.CrawlScrapyDocsPipeline%27%3A300%0A%7D%0A%60%60%60%0A%0A</center>