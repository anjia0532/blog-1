title: 批处理文本连接
date: 2015-1-21
tags: cmd
categories: cmd
---
![title](/img/title/2.jpg)
### 使用批处理进行多个文本内容的筛选及合并
_案例为连接文本1的奇数行，文本2的行数对2整除的行及行数对3整除的行_

### 用法：

命令格式: [this text1 text2 destText]
例子：this 1.txt 2.txt 3.txt    (其中this为下面的代码保存后的文件名)
<!--more-->

```Bash
@echo off
title 文本连接
setlocal enabledelayedexpansion
cd. > %3
set line1 = 0
set line2 = 0
set line3 = 0
for /f "delims=" %%i in (%1) do (
	set /a line1 += 1 && set /a flag = !line1!%%2 && if "!flag!"=="1" (set /a n+=1&call,set "_%%n%%=%%i")
	)
for /f "delims=" %%i in (%1) do (
	set /a line2 += 1 && set /a flag1 = !line2!%%2 && if "!flag1!"=="0" (set /a t+=1&call,set ",%%t%%=%%i")
	)
for /f "delims=" %%i in (%2) do (
	set /a line3 += 1 && set /a flag2 = !line3!%%3 && if "!flag2!"=="0" (set /a m+=1&call,set ".%%m%%=%%i")
	)

if %n% gtr %m% (set "num=%n%") else (set "num=%m%") 
(for /l %%i in (1,1,%num%) do ( 
if defined _%%i call,echo %%_%%i%%
if defined _%%i call,echo %%,%%i%%
if defined .%%i call,echo %%.%%i%%
)) >> %3

endlocal
notepad %3
pause
```