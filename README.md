# PopViewDemo
参照网上实例写的popViewDemo，类似于QQ的+弹出视图
知识要点 打问号是原来不知道的地方
1.CGAffineTransformScale需要三个三处第一个为进行变换所需的矩阵，二三为x何y方向的缩放倍数
与CGAffineTransformMakeScale的区别 前者是对一个参数的矩阵进行缩放 而后者是对单位矩阵进行缩放
详细看该网站http://www.jianshu.com/p/0ee900339103
CGATranform的介绍 要主要是在原来基础上的变换 还是原来基础上的累加变化
http://blog.csdn.net/apple_app/article/details/38843357
CGAffineTransformIdentity代表的是原始图的最初位置
2.UIView的一些动画 usingSpringWithDamping 表示弹簧动画的阻尼值
详细可见这个网站
http://www.aiweibang.com/yuedu/36139429.html
3.#pragma mark - 约束子类 -
这个的作用就是为了标记明显用的 可以方便的定位到某个函数的位置
4.layoutSubviews的作用就是为了重新约束view的子view中的位置 除了设为CGRectZero的View都会调用这个方法 在initWithFrame等中都会调用该类
详细见此
http://www.360doc.com/content/16/0315/22/20679492_542519554.shtml
5.enumerateObjectsUsingBlock和for in forloop一样 都可以用来遍历数组 只不过对于不同的方法 时间快慢不同而已
详细见此http://www.jianshu.com/p/ef3f1731a353
6.在view没有调用initWithFrame的方法时，系统会自动调用drawRect这个方法用于进行绘制
重绘机制通过获取上下文context进行绘制
详细见此http://www.jcodecraeer.com/IOS/2015/0204/2414.html
7在本次实例中,没想到在一个.h文件中可以同时存在两个View,一个是主view，一个是画三角形随后突出的view，两者都可以兼容 这是之前没有想到的
 这就是对本次demo的总结
