+++
author = "4679kun"
comments = true
date = "2015-11-05T23:19:11+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "vps2arch"
tags = ["vps"]
title = "用黑魔法把任意系统的vps变成Arch"

+++
  作为一个有信仰的人 当然在哪都要用Arch vps也是 然而大部分vps提供商都不会有Arch这种“不稳定”的系统供我们选择 这怎么能忍
于是我找啊找 没想到真找到了办法

[https://github.com/drizzt/vps2arch][1]

就是它 使用方法很简单

**注意！这会清除vps上的所有数据**

    wget http://git.io/vps2arch
    chmod +x vps2arch
    su
    ./vps2arch

就这四条命令 经过一小会等待之后 安装就完成了

然后配置好软件源 执行

    sync ; reboot -f

vps就会重启 然后再次连上ssh 就能享受Arch啦


PS:
1. 不保证一切顺利
2. 这是一份测试过的vps的列表 [这里][3] 我在CheapVZ的vps里也测试过了
3. ipv6暂时还不能自动配置 有需要的请手动配置
4. base-devel组不会自动安装 需要自己装
5. 觉得棒的话 可以考虑捐助作者
6. 没了


  [1]: https://github.com/drizzt/vps2arch
  [2]: https://github.com/K-Guan/vps2arch/blob/master/README.md
  [3]: https://github.com/drizzt/vps2arch/wiki/Tested-VPS-Providers

