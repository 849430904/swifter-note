//: [Previous](@previous)

import Foundation
import UIKit

//闭包
//可以暂理解成OC的block
/*
 1，一组预先准备好的代码
 2，可以当做参数传递
 3，在需要的时候执行
 
 oc中的block类似于匿名函数
 */

//定义
func sum(num1 x:Int ,num2 y:Int) -> Int{
    return x+y
}
sum(num1: 1, num2: 3)

//在swift中的，可以变量能够直接记录函数
let sumFunc = sum
sumFunc(1, 3)

//闭包的定义
/*
 1,行参 ，返回值 代码都包含在{}中
 2，
 
 */

let demoFunc = {//最简单的闭包，没有参数与返回值，参数、返回值可以全部省略
    print("hello")
}

//执行闭包
demoFunc()

//带参数、返回值的闭包
//格式: {(带外部参数的列表) -> 返回类型 in 代码实现 }
let demoFunc2 = {( x:Int ,y:Int) -> Int in //与函数比，多了一个in
    return x+y
}
demoFunc2(2,3)



//尾随闭包
/*
1,闭包是最后一个参数
 2，函数的()可以提前关闭
 3，最后一个参数直接使用（代码实现）
 
 dispatch_async(dispatch_get_global_queue(0, 0), ^{//oc
 //
 });
 */


//闭包异步执行回调参数

// Swift3.0 or swift4.0
//DispatchQueue.global().async {
//    print("async do something\(Thread.current)")
//    DispatchQueue.main.async {
//        print("come back to main thread\(Thread.current)")
//    }
//}


//闭包的返回值演练
func scrollView(frame:CGRect,numberOfLabel:()->Int,lableOfIndex:(_ index:Int)->UILabel) -> UIScrollView {
    //1,实例化scrollView,并且定位
    let sv = UIScrollView(frame: frame);
    sv.backgroundColor = UIColor.lightGray;
    //2,知道标签的数量,执行闭包，获取标签数量
    let count = numberOfLabel();
    //3,知道标签的内容，添加到scrollView
    for i in 0..<count {
        let lable = lableOfIndex(i)
        sv.addSubview(lable)
    }
    //4，返回scrollView
    
    return sv;
}


//自定义视图的构造函数介绍
class HMLableScrollView: UIScrollView {
    
    //在swift中，函数支持重载，函数名一样，参数的数量和类型不同
    //initWithFrame函数，使用纯代码开发的时候，会被调用
    init(frame: CGRect,numberOfLabel:()->Int,numberOfIndex:(_ index:Int)->UILabel) {
        super.init(frame: frame)
    }
    
    //自定义视图中，必须要实现的方法
    //使用storyboard xib开发的时候，会被调用
    required init?(coder aDecoder: NSCoder) {
        //fatalError 函数会让用storyboard  开发直接删掉
        fatalError("init(coder:) has not been implemented")
    }
}

