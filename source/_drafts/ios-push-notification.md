title: iOS push notification 推送服务学习笔记
tags:
---

注意事项：需要用真机进行测试，不能用模拟器

三个部分：
1. Device: 即手机部分
2. APNS: 由苹果提供的推送服务器，与 Device 直接通讯
2. Provider: 由我们提供的服务器，负责和 APNS通讯

步骤：
Step1: 拥有 Apple Developer ID
Step2: 在 Apple Developer 中的 Provisioning Portal 功能中下载 Push Service 需要的连接认证 SSL Push Certificate （分为 Development 和 Productiono）

Step3: 在应用启动后需要进行 register，获取 device token，并将 device token 发送回自己的 provider 以保存。

Step4: Provider需要发送推送消息时与APNS进行SSL连接，完成后便可以向APNS发送消息（Payload）。APNS 将会对收到的消息进行管理，并且负责处理设备不在线时的存储。

分两种 notificaiton
1. simple notification
当 Device 不在线的时候不能收到通知，该通知将直接被 APNS 丢弃。

2. enhanced notification
发送时可以定义存活时间，如果在该时间内 Device 上线，就可以收到通知。如果在 Device 离线的时候有多条消息推送到 APNS，则只有最后一条会被保留，并在 Device 下次上线的时候推送给 Device。


Notification Payload 格式
Provider 要发送讯息时，要传送一个特别格式的数据给 APNS，称为 Payload。格式规范如下：
```javascript
{
    "aps": {
        "alert": "Hello World.",
        "badge": 9,
        "sound": "default"
    },
    "custom_key": "custom_value"
}

