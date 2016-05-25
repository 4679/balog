+++
author = "4679kun"
comments = true
date = "2015-12-04T10:50:51+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "net-speeder"
tags = ["vps"]
title = "使用net-speeder缓解vps高延迟 高丢包率"

+++
net-speeder是一款开源软件 能显著降低丢包率 原理简单粗暴 就是每个包发两遍 所以 使用的流量也会翻一倍 这就要靠大家取舍了

[项目地址](https://github.com/snooda/net-speeder) 

首先安装依赖 libnet， libpcap 
```bash
sudo pacman -Sy libnet libpcap
```
每个发行版安装方法都不同 就不一一说明了

之后就是获取源代码了
```bash
git clone https://github.com/snooda/net-speeder
cd net-speeder
```

然后编译

vps架构是openvz的
```bash
sh build.sh -DCOOKED
```
vps是Xen,KVM或者是物理机的
```bash
sh build.sh
```

编译完成后 就可以运行了

首先获取root权限
```bash
su
```
使用方法
```bash
./net_speeder 网卡名 加速规则（bpf规则)
```

最简单的使用方法（对于OpenVZ）
```bash
 ./net_speeder venet0 "ip"
```

ping一下看看效果吧:-)

PS:对SS也有效哦

