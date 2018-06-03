//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//构造函数是一种特殊的函数，主要用于创建对象时初始化对象
//作用：分配空间  设备初始值
//类中的所有存储属性（非可选）需要在构造函数中赋初值

//如果没有实现构造函数，会执行父类的构造函数
class Person : NSObject{
    var name : String//存储属性需要设置初始值（在构造函数中设置初始值）
    var age : Int
    var name2 : String?//可选，不需要在构造中初始化

    override init(){//没有func ,override重写父类的构造函数
        print("Person init...")
        name = "zhang"
        age = 18
        super.init()//这一行要放在最后
    }

    //重载构造函数，指定参数
    //如果没有实现init()构造函数，一旦实现了其他的构造函数，默认的init()构造函数将无法访问
    
//    init(name:String,age:Int){
//        self.name = name//如果参数名称与属性相同，需要添加self.区分
//        self.age = age
//    }
    //构造函数需要给非可选项的属性设置初始值
    //完成构造之后，每一个属性（非可选）都有值
    
    
    //构造函数KVC设置初始值
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)//调用KVC方法之前，必须要调用super.init()
        //注意：如果用KVC给对象设置初始修士，基本数据类型的属性，必须 设置初始值
        //在使用KVC的时候，如果值没有分配空间，如果是结构体/类，会先调用默认的构造函数分配空间，然后再设置数值
        //如果父类实现了KVC的方法，子类就不再需要单独实现
        
    }
    /*
      1,setValuesForKeys会遍历字典中所有的值对，依次调用setVaule函数
    2，函数默认会给各个属性设置数值
     3，如果没有key对应的属性，会调用 setValue forUndefinedKey 方法，过滤掉不需要的属性
     4，如果没有实现setValue forUndefinedKey 方法，会直接崩溃
    */
    override func setValuesForKeys(_ keyedValues: [String : Any]) {
        print("=====>>>>>\(key)")
        //非常重要的调试技巧！！！
        super.setValuesForKeys(keyedValues)
    }
    //
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("=====\(key)")
    }
    
    //便利的构造函数
    //1,作用：判断参数条件是否合法
    //2,传递重要/常用参数
    //3，如果条件不满足，可以返回nil,只有便利的构造函数，才允许返回nil
    //4,指定的构造函数不允许返回nil,必须要返回一个对象
    convenience init(name:String,age:Int){
    
        //判断年龄
        if age<0 || age >100{
          return nil//如果没有convenience关键字，这里会报错
        }
        //调用默认的构造函数设置初始值
        self.name = name
        self.age = age
    }
    
    //没有func
    //没有()
    //不能被重载
    //不能直接调用，被自动调用
    deinit {//析构函数
        print("person deinit")
    }
    //析构函数：释放子类的属性；释放父类的属性
    /*
     
     析构函数类似于OC中的dealloc,对象被释放之前调用，可以用于释放资源
     举个例子：某一个类中，开启了一个时间，在构造函数中设置初始值
     */
    
    

}

class Student : Person{
    var no: String
    override init(){
        print("student init...")
        no = "121"
        super.init()//建议写上这一句，让代码变得更加清晰
    }
}

//在swift中，默认所有类都是全局共享的，不需要任何引用，就可以直接使用
//在同一个全名空间下全局共享，默认情况下，命名空间就是项目名称




