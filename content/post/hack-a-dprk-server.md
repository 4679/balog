+++
date = "2016-04-06T14:55:00+08:00"
draft = false
slug = "hack-a-dprk-server"
tags = ["tech"]
title = "记一次拿下一台朝鲜服务器"

+++
### 4月7日更新: 三胖把网线拔了|∀ﾟ


昨晚在V2ex看到[一篇帖子](https://www.v2ex.com/t/268389) 当时我就震惊了


然后我就看到了楼主发的ip段 我就决定自己动手玩玩


楼主提到了他开启了3389端口 我就以这个为目标开始扫描


我用到的端口扫描工具是[masscan](https://github.com/robertdavidgraham/masscan)


```
masscan 175.45.176.0/24 -p3389
```


有结果了 直接访问扫出来的ip 看到了老版本的XAMPP


查看phpinfo页面 看到了文件实际地址 


之后进入phpmyadmin 一句话webshell 开启telnet 修改admin密码 开启3389 拿下


于是我开了个ss


![朝鲜SS](https://dn-4679kun.qbox.me/pic/hack-a-dprk-server/1.jpg)


三胖会不会用大浦洞轰我呢😊