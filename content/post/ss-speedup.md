+++
author = "4679kun"
comments = true
date = "2015-12-03T20:09:44+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "ss-speedup"
tags = ["tech"]
title = "利用阿里的免费服务器中转SS加速"

+++
**转载 [原文](http://xuqk.tk/251)** 

在国外的vps上架设的SS 难免会掉包 高延迟  目前比较不错的解决办法是用国内的高质量服务器进行转发
财大气粗的阿里为我们提供了免费的服务器

前面的步骤直接看原文吧

需要说明的地方是配置文件那部分

```cfg
global
	ulimit-n 51200
defaults
	log global
	mode tcp
	option dontlognull
	timeout connect 1000
	timeout client 150000
	timeout server 150000
frontend ss-in
	bind *:8080
	default_backend ss-out
backend ss-out
	server server1 SS服务器IP:SS端口号 maxconn 20480
```


