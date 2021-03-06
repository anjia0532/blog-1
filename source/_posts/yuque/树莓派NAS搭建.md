
---

title: 树莓派NAS搭建

urlname: cgm3ug

date: 2015-10-18 19:25:42 +0800

tags: [linux,树莓派,nas]

categories: []

---

初探树莓派，便可知道其用途广泛，本篇博文将介绍如何使用树莓派搭建基于Linux和SMB协议的NAS服务器。

<a name="el9zps"></a>
### 树莓派简介

树莓派（Raspberry pi，简写为RPi，或者RasPi/RPi）是目前比较常见的卡片电脑，为学生计算机编程教育而设计。其系统基于Linux(或者最新发布的Windows 10 IoT)。仅有巴掌大小的PCB板可谓麻雀虽小五脏俱全，可以像普通的PC那样工作。树莓派型号目前分为A\B型，其中A型的配置较低，不适合生产环境，本人以B+ model为例讲解后面的内容。树莓派目前主要被用于一些简单的WEB服务以及智能设备、由于Python强大的底层库支持，树莓派也常常被用极客们用于改装各种电子元件。

<!-- more -->

_基本配置：5V2A Micro USB接口、512MB内存、HDMI视频输出口、音频叔叔、26针GPIO_

推荐链接：[树莓派入门须知](http://www.shumeipai.net/thread-21180-1-1.html?_dsign=81e52e75)

<a name="ecixgc"></a>
### 系统安装

略。

<a name="rg8qig"></a>
### 入门基础

首先，你必须学会使用简单的linux命令以及工具，从上面的系统安装教程我们可以了解到树莓派一般都会带上一个debian系列的linux系统。下面是常用的linux命令和工具：

- ssh：(Secure Shell)顾名思义，在缺少一套完整的键盘鼠标和HDMI显示器的条件下，我们只能通过SSH（当然其他RPC也是被支持的，如telnet，不过树莓派官方提供的系统已自动为我们启动ssh的服务）连接并操作树莓派。

- 简单的文件操作命令：`mkdir`,`rmdir`,`rm`,`cd`,`ls`,`cp`,`mv`等

- 终端文本编辑器：`vi`,`vim`等

- 基本的系统指令：`exit`,`reboot`,`init 0`,`ps`,`ifconfig`等

- 包管理（debian系统为例）：apt-get

- 如果需要远程桌面图形化操作，请安装VNC


<a name="4786hc"></a>
### NAS大致构架简介

- 简介


NAS（Network Attached Storage：网络附属存储）即是在网络上提供数据储存的装置，因此也称为“网络存储器”。它是一种专用数据存储服务器。它以数据为中心，将存储设备与服务器彻底分离，集中管理数据，从而释放带宽、提高性能、降低总拥有成本、保护投资。本次设计的NAS主要用于公司内文件共享以及定时备份到远端服务器。

- 硬件架构

  1. 树莓派B+*1

  2. 立式硬盘盒子*1

  3. 1TB HDD 3.5inch*1

- 软件和网络环境

  1. os：debian

  2. 基于协议：SMB

  3. 依赖服务：smaba

  4. 基本模块：ntfs-3g、rsync、ssh、crontab

  5. 网络环境：内网静态IP、可访问远端备份服务器



