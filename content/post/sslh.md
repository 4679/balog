+++
author = "4679kun"
comments = true
date = "2015-12-16T21:29:18+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "sslh"
tags = ["vps"]
title = "利用sslh在同一个端口运行nginx openvpn xmpp ssh等服务"

+++
  这有什么用呢？ 某些运营商或者学校可能屏蔽了一些服务的默认端口 比如屏蔽了22端口 你就只能把ssh的监听端口改成其他的 要是更变态 开启了白名单模式呢 那样就只能通过某些端口访问了 443就是其中一个 正常人一般不会屏蔽它 但是如果通过22端口访问vps的话 启用了TLS的http服务器怎么办呢 这时候就要用到sslh了
  sslh的原理很简单 通过分析数据包的特征辨别是什么协议的访问 把对同一端口不同协议的访问分流到不同的端口上

首先是安装
对于Archlinux用户
```bash
yaourt -S sslh
```
通用方法 (我没测试)
```bash
#首先安装依赖
#Debian
apt-get install -y libwrap0-dev libconfig8-dev
#RPM系
yum install libconfig libconfig-devel

#获取源码
git clone https://github.com/yrutschle/sslh
cd sslh

#编译
make

#安装（Debian）
make install
cp scripts/etc.init.d.sslh /etc/init.d/sslh
update-rc.d sslh defaults

#安装（CentOS）
make install
cp scripts/etc.rc.d.init.d.sslh.centos /etc/rc.d/init.d/sslh
```

之后修改位于/etc/sslh.conf或者/etc/sslh.cfg的配置文件
以下是我的 也是Arch的默认配置
```cfg
# Default Arch configuration
# You can find more examples in /usr/share/doc/sslh

verbose: false;
foreground: true;
inetd: false;
numeric: false;
transparent: false;
timeout: 2;
user: "sslh";
pidfile: "/run/sslh.pid";


listen:
(
    { host: "::0"; port: "443"; }
);

protocols:
(
     { name: "ssh"; service: "ssh"; host: "localhost"; port: "22"; probe: "builtin"; },
     { name: "http"; host: "localhost"; port: "80"; probe: "builtin"; },     { name: "ssl"; host: "localhost"; port: "8443"; probe: "builtin"; },
     { name: "anyprot"; host: "localhost"; port: "8443"; probe: "builtin"; }
);
```
然后 把占用了443端口的服务的监听端口改到8443 或者配置文件里定义的地址

然后启动sslh
```bash
#Archlinux
systemctl start sslh-fork

#Debian
service sslh start
```

最后测试一下通过443端口来进行ssh连接
```bash
ssh 127.0.0.1 -p 443
```
没问题的话就成功了

之后就可以禁止从外网访问22端口来提高安全性啦
标题中的openvpn xmpp也可以 按照格式添加进配置文件就行


PS:我一开始其实在想 shadowsocks能不能用 后来想到 shadowsocks能不被gfw封杀 其中一个原因不就是因为没有流量特征吗 所以sslh是不能识别ss的流量的

