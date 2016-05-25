+++
date = "2016-03-01T08:59:03+08:00"
draft = false
slug = "certificate-transparency"
tags = ["blog"]
title = "博客启用Certificate Transparency"

+++
谷歌爸爸的东西 当然要兹磁啦


参考了这两篇文章


[为 SSL 站点启用 Certificate Transparency 功能](http://blog.eqoe.cn/posts/enable-certificate-transparency-for-nginx.html)


[Certificate Transparency 那些事](https://imququ.com/post/certificate-transparency.html)


你们现在看到的服务器信息应该是这样


![info](https://dn-4679kun.qbox.me/pic/certificate-transparency/1.jpg)


这是我用的服务端 [nginx-mainline-mod4679](https://aur.archlinux.org/packages/nginx-mainline-mod4679/)


nginx+OpenSSL(Cloudflare的补丁)+google反代模块+Certificate Transparency模块


另外婊一下cloudflare在国内的速度 现在直连比之前走cloudflare快多了
