title: 什么是鸭子类型（duck typing）
id: 150
categories:
  - programming
date: 2015-02-09 22:59:50
tags:
- python
- 原创
- programming
---

鸭子类型是动态语言的一种设计风格。提到鸭子类型就不得不提它的名称由来：如果像鸭子一样走路，像鸭子一样呱呱叫，那它就是一只鸭子。

鸭子类型本质体现的是面向接口的编程。相比之下，传统的静态OO语言如java等的多态思想，体现的是面向继承的编程。

简单来说，动态语言因为运行前不需要确定变量类型，故对对象的方法调用，只要对象拥有这一名称的方法，就一定能调用成功。

如：

```python
class A:
	def say(self):
		print "Called as A's instance"

class B:
	def say(self):
		print "Called as B's instance"

def process(obj):
	obj.say()

a = A()
b = B()
process(a)
process(b)
```

这个例子里我们看到，process处理函数要求接受到的参数对象具有一个say方法，则 a 和 b 都具有这个方法，它们都被视作合法的输入，而不关心它们具体是什么类型。

而在静态语言里，必须指明参数obj的类型。即使使用多态的思想，合法的输入参数也至少要是指明的obj类型的子类型，其他的类型就算实现了 say 方法，也是无法调用的。使用反射可以做到类似的实现，但是相对欠灵活。
