title: Objective-C 创建常量的最佳实践
categories:
  - programming
tags:
  - objective-c
  - translated
  - ios
date: 2015-08-21 06:32:54
---


原文地址：[What's the best way to create constants in Objective-C](http://stackoverflow.com/questions/17228334/what-is-the-best-way-to-create-constants-in-objective-c?lq=1)

# 常量定义
首先需要明确的是我们希望常量的作用范围，这就要考虑两个问题：
1. 常量是作用于一个特定的类，还是作用于整个应用？
2. 如果是作用于一个特定的类，我们是希望这些类的其它使用者（clients）也能使用这些常量，还是仅仅在该类的内部来使用？

如果常量仅针对特定的类，并且只在该类内部使用，则应在该类的 .m 文件的开头使用 static const 来声明，如：
{% codeblock lang:objc %}
static NSString * const MyThingNotificationKey = @"MyThingNotificationKey";
{% endcodeblock %}

如果常量针对一个特定的类，但是是公开的，会被该类的其他使用者使用，则应在 header 文件中用 extern 来声明，而在 .m 文件中来定义，如：
{% codeblock lang:objc %}
// .h
extern NSString * const MyThingNotificationKey;

// .m
NSString *const MyThingNotificationKey = @"MyThingNotificationKey";
{% endcodeblock %}

如果常量是整个应用都可见的，则应创建一个专门存储这些常量的类，然后在 header 中声明，在 .m 中定义。 你也可以根据常量的不同功能与种类，分开定义在不同的类中。

# 为何不使用 #define
过去的回答是：“宏不包含类型信息“，但是如今的编译器已经足够智能，可以像针对变量一样来对字面量（即宏的展开）来进行类型检查。
现在的回答应该是：因为 debugger 不会知道你使用了宏。如果 MyThingNotificationKey 是一条宏的话，你就不能在 debugger 命令中使用 [myThing addObserver:self forKey:MyThingNotificationKey]。

# 关于 enum 的使用
enum 只能用来定义整数常量（integer constants）。如果就是为了定义整数常量，enum 是很棒的选择，你应当使用它。（更好的选择是使用 [NS_ENUM 和 NS_OPTIONS 宏](http://nshipster.com/ns_enum-ns_options ) )。而对于整数常量之外的其他情况，你就无法使用 enum 了。

# 关于常量（博主加）
我在使用的时候发现，在上述方法在定义 NSString\* 类型的时候是可以的，但是如果尝试定义一些 NSArray 等其它引用类型的变量，编译器就会保存，提示 "initializer element is not a compile-time constant"。参考该 [SO提问](http://stackoverflow.com/questions/2436463/how-do-i-declare-an-array-as-a-constant-in-objective-c ) 后得知，除了 NSString* 是唯一的特例之外，在 Objective-C 中，所有的对象都必须在运行时创建，而不能在编译时创建。

对于该问题，我认为可以参考上面对于全应用可见的常量的做法，如创建一个辅助类（我的习惯是叫做 Util 类），将其实现为单例类，在 .m 的开头用 static 关键字来声明这些常量，然后在单例类的类初始化方法中进行定义，最后添加实例方法，来分别返回这些常量。
