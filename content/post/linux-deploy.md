+++
date = "2016-03-26T18:58:03+08:00"
draft = false
slug = "linux-deploy"
tags = ["tech"]
title = "在Android上使用Linux图形界面"

+++
先上几张图
![XServer XSDL](https://dn-4679kun.qbox.me/pic/linux-deploy/1.jpg)


![i3wm](https://dn-4679kun.qbox.me/pic/linux-deploy/2.jpg)


![vim](https://dn-4679kun.qbox.me/pic/linux-deploy/3.jpg)


![mc](https://dn-4679kun.qbox.me/pic/linux-deploy/4.jpg)


具体步骤呢


1.先用[Linux Deploy](http://www.coolapk.com/apk/ru.meefik.linuxdeploy)安装好系统,这个很简单,装好Busybox,在设置里选好选项一键安装就行


2.安装好[XServer XSDL](https://play.google.com/store/apps/details?id=x.org.server),Android上的X服务器,效率比用VNC好多了


3.通过ssh连接到装好的系统,客户端我推荐[JuiceSSH](http://www.coolapk.com/apk/com.sonelli.juicessh)


4.安装好你要使用的桌面,我选择的是i3wm


5.打开XServer XSDL,配置好分辨率和字体缩放,分辨率我选的原生,字体缩放0.5x,然后就会看到图1的界面了


6.进入终端,输入 export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1:4712


7.启动桌面,比如我用i3就输入i3wm,xfce就是startxfce,lxde就是startlxde,等等


8.切换回XServer XSDL,不出意外的话你就能看到桌面了,随意折腾吧～


PS:图中i3的配置来自于[oh-my-i3](https://github.com/ID1258/oh-my-i3),很好看,赞一个