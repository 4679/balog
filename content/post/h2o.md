+++
author = "4679kun"
comments = true
date = "2015-12-05T12:20:53+08:00"
draft = false
image = ""
menu = ""
share = true
slug = "h2o"
tags = ["blog"]
title = "服务器后端切换到H2O"

+++
H2O是一款轻量 配置简单的HTTP服务器 特色就是HTTP/2

Archlinux用户直接从AUR安装就可以了 
其他系统请自行寻找源或者编译安装

下面是我的配置文件 可以当个示范
```YAML
access-log: /dev/null 
error-log: /dev/null 
pid-file: /var/run/h2o.pid
max-connections: 51200
file.send-gzip: ON 
tcp-fastopen: 3 
user: www
http2-reprioritize-blocking-assets: ON 
file.index: [ 'index.php', 'index.html' ]
file.mime.addtypes: 
    text/html: .html .htm .shtml
    text/css: .css
    text/xml: .xml
    image/gif: .gif
    image/jpeg: .jpeg .jpg
    application/javascript: .js
    application/atom+xml: .atom
    application/rss+xml: .rss

    text/mathml: .mml
    text/plain: .txt
    text/vnd.sun.j2me.app-descriptor: .jad
    text/vnd.wap.wml: .wml
    text/x-component: .htc

    image/png: .png
    image/tiff: .tif .tiff
    image/vnd.wap.wbmp: .wbmp
    image/x-icon: .ico
    image/x-jng: .jng
    image/x-ms-bmp: .bmp
    image/svg+xml: .svg .svgz
    image/webp: .webp

    application/font-woff: .woff
    application/java-archive: .jar .war .ear
    application/json: .json
    application/mac-binhex40: .hqx
    application/msword: .doc
    application/pdf: .pdf
    application/postscript: .ps .eps .ai
    application/rtf: .rtf
    application/vnd.apple.mpegurl: .m3u8
    application/vnd.ms-excel: .xls
    application/vnd.ms-fontobject: .eot
    application/vnd.ms-powerpoint: .ppt
    application/vnd.wap.wmlc: .wmlc
    application/vnd.google-earth.kml+xml: .kml
    application/vnd.google-earth.kmz: .kmz
    application/x-7z-compressed: .7z
    application/x-cocoa: .cco
    application/x-java-archive-diff: .jardiff
    application/x-java-jnlp-file: .jnlp
    application/x-makeself: .run
    application/x-perl: .pl .pm
    application/x-pilot: .prc .pdb
    application/x-rar-compressed: .rar
    application/x-redhat-package-manager: .rpm
    application/x-sea: .sea
    application/x-shockwave-flash: .swf
    application/x-stuffit: .sit
    application/x-tcl: .tcl .tk
    application/x-x509-ca-cert: .der .pem .crt
    application/x-xpinstall: .xpi
    application/xhtml+xml: .xhtml
    application/xspf+xml: .xspf
    application/zip: .zip

    application/octet-stream: .bin .exe .dll
    application/octet-stream: .deb
    application/octet-stream: .dmg
    application/octet-stream: .iso .img
    application/octet-stream: .msi .msp .msm

    application/vnd.openxmlformats-officedocument.wordprocessingml.document: .docx
    application/vnd.openxmlformats-officedocument.spreadsheetml.sheet: .xlsx
    application/vnd.openxmlformats-officedocument.presentationml.presentation: .pptx

    audio/midi: .mid .midi .kar
    audio/mpeg: .mp3
    audio/ogg: .ogg
    audio/x-m4a: .m4a
    audio/x-realaudio: .ra

    video/3gpp: .3gpp .3gp
    video/mp2t: .ts
    video/mp4: .mp4
    video/mpeg: .mpeg .mpg
    video/quicktime: .mov
    video/webm: .webm
    video/x-flv: .flv
    video/x-m4v: .m4v
    video/x-mng: .mng
    video/x-ms-asf: .asx .asf
    video/x-ms-wmv: .wmv
    video/x-msvideo: .avi

hosts:
  "4679.space:443": 
    header.add: "strict-transport-security: max-age=39420000; includesubdomains; preload" 
    header.add: "X-Frame-Options: SAMEORIGIN"
    header.add: "X-Content-Type-Options: nosniff"
    header.add: "X-XSS-Protection: 1; mode=block"
    listen:
      port: 443
      ssl:
        certificate-file: /etc/letsencrypt/live/4679.space/fullchain.pem
        key-file: /etc/letsencrypt/live/4679.space/privkey.pem
        dh-file: /etc/ssl/certs/dhparam2048.pem
        minimum-version: TLSv1
        cipher-preference: server
        cipher-suite: CHACHA20 EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS !RC4
    paths:
      /:
        file.dir: /home/www/

  "4679.space:80":
    listen:
      port: 80
    paths:
      /:
        redirect:
          status: 301
          url: "https://4679.space/"

```


