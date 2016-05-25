+++
author = "4679kun"
comments = true
date = "2015-11-05T23:24:52+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "ss"
tags = ["vps"]
title = "自购VPS搭建Shadowsocks服务器"

+++
好多丧尸都在求指导 我觉得还是写一篇教程比较好(=ﾟωﾟ)=

首先是vps的购买 网上有很多指导挑选vps的网站 丧尸们可以挑选一款适合自己的 我用的是cheapvz的洛杉矶vps 年付75人民币 支持支付宝付款

 1. 单核cpu
 2. 256mb内存 15G硬盘
 3. 100Mbps带宽
 4. 每月500G流量

这个价格能买到这种配置也不错了 架个ss 开个小网站还是没问题的

下面是购买的步骤

首先麻烦丧尸们先访问一下我的推荐链接 这样你们购买了之后我还能获得一点佣金
[https://www.cheapvz.com/aff.php?aff=42][2]

然后这是选购的链接 先把币种切换成CNY 也就是人民币 然后点击立即购买就行啦
[https://www.cheapvz.com/cart.php?gid=2][3]

之后就是填写一些表格 这里我只对某些选项说明一下 其他的大家一看就懂
首先是
![1.jpg](https://dn-4679kun.qbox.me/pic/ss/1.jpg)
第一项是服务器名 大家随便取一个就行 我的是4679-vps
第二项和第三项就填 ns1 ns2
第四项root密码 之后登录服务器的时候会用到

之后是选择操作系统
![2.jpg](https://dn-4679kun.qbox.me/pic/ss/2.jpg)
第二项就是选择操作系统了 我用的是ubuntu_14.04 x86_64
建议大家也选择这个 因为下文用到的一键安装脚本是用于ubuntu和debian的

其他填好之后就是结账了
![3.jpg](https://dn-4679kun.qbox.me/pic/ss/3.jpg)
付款完成以后
![4.jpg](https://dn-4679kun.qbox.me/pic/ss/4.jpg)
稍等一会 你的邮箱里就会收到一封邮件 里面就有你的vps的ip地址啦

接下来下载putty 用来连接服务器
[https://github.com/larryli/PuTTY/releases/download/putty-0.65cn/putty-0.65cn.zip][8]
下载完成后解压 打开putty.exe
![5.jpg](https://dn-4679kun.qbox.me/pic/ss/5.jpg)
在主机名称处填入ip 然后点击打开
之后会出现一个命令行窗口 显示 login as:
输入root 回车 之后是输入刚才设定的root密码 输入的时候是没有显示的 输入完回车就行

不出意外的话 就能连接上服务器了
![6.jpg](https://dn-4679kun.qbox.me/pic/ss/6.jpg)

现在就可以安装shadowsocks了
我使用的是秋水逸冰大大的一键安装脚本 [原文地址][11]

首先安装依赖（复制之后点击右键就是粘贴）
```bash
apt-get install build-essential autoconf libtool libssl-dev gawk debhelper
```
输入y 确认安装

然后输入第一条命令
```bash
wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev-debian.sh
```
完成以后输入第二条
```bash
chmod +x shadowsocks-libev-debian.sh
```
之后是第三条
```bash
./shadowsocks-libev-debian.sh 2>&1 | tee shadowsocks-libev-debian.log
```
输入第三条命令以后 会提示设置ss的密码
![7.jpg](https://dn-4679kun.qbox.me/pic/ss/7.jpg)
输入密码然后回车
之后是设置端口
输入要设置的端口号然后回车

之后就会开始安装了
![8.jpg](https://dn-4679kun.qbox.me/pic/ss/8.jpg)

等待 安装完成后系统就会给出服务器的地址 端口 密码 加密方式 你就有属于自己的ss服务器了

完结撒花(＾o＾)ﾉ请原谅我全程没用一个标点


  [1]: https://dn-4679kun.qbox.me/2015/10/3036577624.png?imageView2/2/q/85/format/jpg
  [2]: https://www.cheapvz.com/aff.php?aff=42
  [3]: https://www.cheapvz.com/cart.php?gid=2
  [4]: https://dn-4679kun.qbox.me/2015/10/3544733802.png?imageView2/2/q/85/format/jpg
  [5]: https://dn-4679kun.qbox.me/2015/10/230150148.png?imageView2/2/q/85/format/jpg
  [6]: https://dn-4679kun.qbox.me/2015/10/2193416289.png?imageView2/2/q/85/format/jpg
  [7]: https://dn-4679kun.qbox.me/2015/10/1113179179.png?imageView2/2/q/85/format/jpg
  [8]: https://github.com/larryli/PuTTY/releases/download/putty-0.65cn/putty-0.65cn.zip
  [9]: https://dn-4679kun.qbox.me/2015/10/3378522319.png?imageView2/2/q/85/format/jpg
  [10]: https://dn-4679kun.qbox.me/2015/10/23040430.png?imageView2/2/q/85/format/jpg
  [11]: https://teddysun.com/358.html
  [12]: https://dn-4679kun.qbox.me/2015/10/3543099494.png?imageView2/2/q/85/format/jpg
  [13]: https://dn-4679kun.qbox.me/2015/10/3798456288.png?imageView2/2/q/85/format/jpg

