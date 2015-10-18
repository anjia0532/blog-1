title: powershell测试服务器请求时间
date: 2015-5-27
tags: powershell
categories: powershell
---
![title](/img/title/4.jpg)

#### 1、使用基本的cmdlet
+ Invoke-WebRequest进行HTTP请求测试

```Bash
# 关于Invoke-WebRequest基本用法
PS > Invoke-WebRequest -Uri "http://www.baidu.com"

```

+ Measure-Command对上面的命令进行"计时"

```Bash
PS > Measure-Command -Expression {Invoke-WebRequest -Uri "http://www.baidu.com"}
```

<!--more-->

#### 2、源代码：

```Bash
$url = "http://www.baidu.com"
# 追踪执行命令耗时
$timeTaken = Measure-Command -Expression {
  # 保留请求信息，可用于网络爬虫的实现
  $site = Invoke-WebRequest -Uri $url
}

# 获取毫秒数
$milliseconds = $timeTaken.TotalMilliseconds
$milliseconds = [Math]::Round($milliseconds, 1)

Write-Host "It took $milliseconds ms!"
```

#### 3、小结

PowerShell获取网页信息个人建议的三种解决方案：

+ Web-Client

+ Invoke-WebRequest

+ COM组件"InternetExplorer.Application"