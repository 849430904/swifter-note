//: [Previous](@previous)

import Foundation
import UIKit


class ViewController : UIViewController{
    
    //用属性记录闭包回调
   // var finishedCallBack: (_ msg:String) ->()?//闭包的返回值是可选
    var finishedCallBack: ((_ msg:String) ->())?//闭包是可选的
    //闭包是可选项 属性默认是强引用 ，控制器对闭包进行了强引用
    
    
    //问题？如果函数当前不能执行闭包，需要将闭包传递走
    //1,参数传递
    //2,使用属性记录，在需要的时候执行
    func loadData(finished:@escaping (_ msg:String) -> ()){
        
        // Swift3.0 or swift4.0
        DispatchQueue.global().async {
            print("async do something\(Thread.current)")
            DispatchQueue.main.async {
                print("come back to main thread\(Thread.current)")
               // finished("hello")//finished执行完就结束，其间所有强引用对象，都会被释放，
                self.finishedCallBack = finished
            }
        }
    }
    
    
    func working() {
        //执行闭包
       // finishedCallBack!("hello")//finishedCallBack可选，！表示这个闭包一定存在
        finishedCallBack?("hello")//? 如果finishedCallBack不存在，就不执行
    }
    
    override func viewDidLoad() {
        
//        //写法1
//        weak var weakSelf = self;//弱引用的self
//        loadData { (msg) in//闭包是准备好的代码，在它里面必须要使用self. ，
//            //print(msg + "\(self.view)")//闭包会对self做引用
//            print(msg + "\(weakSelf?.view)")//
//
//
//            //print(msg + "\(self.view)")//闭包会对self做引用
//            //闭包对self进行了强引用，self也对finishedCallBack进行了强引用
//        }
        
        //写法2  [weak self]表示block中不对self 进行强引用，self可以随时被释放
        //里面需要使用self?
        loadData {[weak self] (msg) in//闭包是准备好的代码，在它里面必须要使用self.
            //print(msg + "\(self.view)")//闭包会对self做引用
            print(msg + "\(self?.view)")//
            
            //闭包对self进行了强引用，self也对finishedCallBack进行了强引用
        }
        
        //写法3  [unowned self]
        //会记录self的地址（地址是始终存在的），但 是不会做强引用
        //风险：一旦self真的被释放了，程序会崩溃
        //特点：对象被释放，地址不改变
        loadData {[unowned self] (msg) in//闭包是准备好的代码，在它里面必须要使用self.
            //print(msg + "\(self.view)")//闭包会对self做引用
            print(msg + "\(self.view)")//
            
            //闭包对self进行了强引用，self也对finishedCallBack进行了强引用
        }
    }
    
    
    
    deinit {
      print("666...")//如果执行了这一行，就说明没有发生循环引用
    }
}


//OC中解决循环引用 的方法
// __weak typeof(self) weakSelf  = self

