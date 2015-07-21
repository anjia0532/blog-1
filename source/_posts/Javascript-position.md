title: JavaScript的一些定位属性
date: 2015-1-24
tags: [js,html,css]
categories: javascript
---
### Javascript 定位属性

+ clientHeight\clientWidth
	可见窗口除去margin和border之后的高度\宽度

+ offsetHeight\offsetWidth
	clientHeight的基础上加border和滚动条的高度\宽度

+ scrollHeight\scrollWidth
	元素内容的实际高度（内容多了可能会改变对象的实际宽度）

+ clientTop\clientLeft
	子元素margin之后父元素padding之前的高度\宽度

+ offsetTop\offsetLeft
	该元素的上border的上边缘到该元素的offsetParent的上border内边缘的垂直\水平距离

+ scrollTop\scrollLeft
	对象的最顶部（左侧）到对象在当前窗口显示的范围内的顶边（左边）的距离，即是在出现了纵向滚动条的情况下，滚动条拉动的距离

<!--more-->
关于offsetParent，不同的浏览器有不同的实现算法，其中一种常见布局在各种浏览器中 offsetParent 是一样的：
外层元素div的position计算值是relative、absolute时，内层元素div的offsetParent 总是外层元素div。

### 下面是一个简单的demo页面

<a class="btn" href="http://7u2liq.com1.z0.glb.clouddn.com/blog/demo/JS定位属性/">查看demo</a>