+++
author = "4679kun"
comments = true
date = "2015-12-04T13:27:52+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "lets-encrypt"
tags = ["tech"]
title = "Let's Encrypt试用笔记"

+++
昨天 也就是12月3日 Let's Encrypt项目正式启动了Public Beta 这意味着以后每个人都能用上免费的SSL证书这实在是一件大好事 下面是我的试用体验

首先 我们要获取Let's Encrypt的客户端
```bash
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
```

之后就可以签发证书了

首先 获得root权限
```bash
su
```

之后 停掉占用了80和443端口的web服务器
这里取决于各位使用的操作系统与web服务器 我用的是Archlinux+Nginx
```bash
systemctl stop nginx
```

然后就是签发证书了 （不支持泛域名）
```bash
./letsencrypt-auto -d 你的域名 certonly
```

等待一阵过后 你的证书就在
```bash
/etc/letsencrypt/live/你的域名/
```
里面等着你了 赶快修改你的服务器配置文件来使用它吧

最后上一张效果图
![效果图](https://dn-4679kun.qbox.me/pic/lets-encrypt/1.jpg)

PS:证书的有效期是3个月 记得续签哦

感谢Mozilla以及项目赞助者还有开发者们为了给我们带来更安全的互联网所做出的贡献！

本文是我在午睡的时候睡不着用48元包邮的渣想BKC600蓝牙键盘写下的 手感还不错:-)
![BKC600](https://dn-4679kun.qbox.me/pic/lets-encrypt/2.jpg)


