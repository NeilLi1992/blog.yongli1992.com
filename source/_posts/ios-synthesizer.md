title: iOS开发中的TTS语音合成功能的实现：AVSynthesizer类的使用
tags:
  - ios
  - development
date: 2015-08-09 06:23:54
---


### 简介
在开发一款跑步类 APP 的过程中需要实现语音播报功能。最初的设想是找人录制需要的播报音频，后来考虑到录制太麻烦，自己录效果也未必理想，遂考虑采用 TTS(text-to-speech) 语音合成功能来做。起初想到使用第三方 SDK，科大讯飞，百度，高德都有相关的 SDK。科大讯飞要付费，而且价格奇高无比，直接放弃。后来发现 Apple 本身也提供了 TTS 的原生支持，试了以后效果还不错，记录如下。

从 iOS 7.0 以后， AVFoundation 框架提供了 [AVSpeechSynthesizer](https://developer.apple.com/library/prerelease/ios/documentation/AVFoundation/Reference/AVSpeechSynthesizer_Ref/index.html) 类，可以原生支持语音合成，支持包括中文在内的多种语言，发音效果也不错，而且是离线不需要网络连接的。

### 使用
**Step1**: 创建一个 AVSpeechUtterance 对象，构造的时候传入要读的 NSString 字符串对象。AVSpeechUtterance 对象构建之后不能更改读的文字，每读一次都要构建一个该对象。

**Step2**: 设置 AVSpeechUtterance 的属性，调整发音的细节。主要设置的属性有：
(AVSpeechSynthesisVoice \*)voice属性，中文发音可以设置为 utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh_CN"];
(float)rate属性，调整发音速度，数值越大读的越快。经测试 0.1~0.2 之间比较合适。
还有一些别的属性可以调，比如音调什么的。

**Step3**: 创建一个 AVSpeechSynthesizer 对象，调用实例方法 speakUtterance:(AVSpeechUtterance \*)方法，就可以出声音了。synthesizer对象还可以用来控制播放的其它细节，比如暂停什么的。

### 代码
{% codeblock lang:objc %}
#import <AVFoundation/AVFoundation.h>

- (void)speak:(NSString *)text {
    float rate = 0.18;
    NSString *lang = @"zh_CN";

    // get an AVSpeechSynthesizer object
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];

    // get an AVSpeechUtterance object, and configure it
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:language];
    utterance.rate = rate;

    // now speak
    [synthesizer speakUtterance:utterance];

}
{% endcodeblock %}

