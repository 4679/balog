+++
author = "4679kun"
comments = true
date = "2015-12-22T18:32:31+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "storage-space-running-out"
tags = ["tech"]
title = "干掉安卓烦人的 存储空间不足 的通知"

+++
这个通知真是太烦人了 于是干掉他

***需要ROOT权限***

安卓5.x及以下

 - 下载SQLite编辑器
 
 ```
 打开 /data/data/com.android.providers.settings/databases/settings.db
 打开 secure
 编辑 sys_storage_threshold_percentage的值 改为0
 重启
 ```
 
 安卓6.x
 
  - 下载终端模拟器 或者直接用adb shell
  
  ```
  执行
  su
  settings put global sys_storage_threshold_percentage 0
  重启
  ```
  
  原理就是 这个值控制空间不足多少时提示空间不足 默认是10 也就是空间不足10%的时候提示 把它修改成0 就没有提示了
