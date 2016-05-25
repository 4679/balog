+++
author = "4679kun"
comments = true
date = "2015-12-09T18:51:30+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "port-forwarding"
tags = ["tech"]
title = "用阿里云的免费主机转发任意端口"

+++
上次用了阿里云的免费主机转发了SS 其实转发任何端口都是可以的 这次就以SSH的默认端口22来做示范

首先 来到TAE的控制台
![1](https://dn-4679kun.qbox.me/pic/port-forwarding/1.jpg)

点击配置管理
![2](https://dn-4679kun.qbox.me/pic/port-forwarding/2.jpg)

添加一个端口 最好访问端口和监听端口保持一致 然后记住它 （别用22 因为已经被占用了） 会提示重启 报错也没关系 手动点击重启就行

之后进入WebSSH

我们用到的软件是rinetd 简单好用

首先安装一个screen 这样才能保证WebSSH关闭之后rinetd的进程不被杀死

```bash
yum install screen
```

然后下载解压编译rinetd
```bash
wget http://www.boutell.com/rinetd/http/rinetd.tar.gz
tar zxvf rinetd.tar.gz
cd rinetd
make
make install
```

编辑配置文件
```bash
vim /etc/rinetd.conf
```
vim的用法我就不说了 网上都有

填入
```cfg
0.0.0.0 刚才添加的端口号 VPS的IP 22
```

然后开启screen 启动rinetd
```bash
screen
rinetd -c /etc/rinetd.conf
```

这样就完成了 ssh连接vps的时候 IP和端口都用刚才才在配置管理里面看到的就行

重启之后 之前开启的SS转发也被关了 再开启一遍就行

这个方法可以用于转发任何端口


