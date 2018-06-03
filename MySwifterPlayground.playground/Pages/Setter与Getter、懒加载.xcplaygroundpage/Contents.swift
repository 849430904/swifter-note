//: [Previous](@previous)

import Foundation


class Person:NSObject{
    
    //属性 OC中还有一个_成员变量，负责记录属性内容
    //重写getter（懒加载） & setter(给cell设置模型，在模型的setter方法中设置UIl界面)
    //以上两个常见功能，在swift中是有特殊写法的
    //以下代码只供参考
    var _name: String?
    var name: String?{
        
        get{
            return _name
        }
        set{
            //用一个新值设置成员变量
            _name = newValue
        }
    }
    
    //懒加载，swift中有特殊的写法,懒加载是一个闭包，
    lazy var dataList: [String] = {
        print("你懒了吗？")
        return ["zhang","li"]
    }()
    //dataList能够存储字符串数组
    //当调用dataList的时候，如果没有值，会执行后面的闭包
    //如果会保存到dataList中，下次调用就直接返回，不会再执行后面的闭包
    
    //懒加载的简单写法  如果直接返回结果，懒加载可以简化
    lazy var list: [String] = ["zhang","li"]
    
    
    //重写Setter方法
    var model: String? {
        didSet {
            //可以直接使用Model,再也不用都开_mode = model
            //一般情况下，不会用一个nil给对象设置数值，didSet的时候，如果小心，可以直接解包
            if let m = model{
               print("更新UI....")
            }
        }
        
    }
    
    
    //只读属性，根据条件计算出来，不允许修改
    var title: String?{//title只读，只能取值不能修改
        return "Mr." + (name ?? "")
    }
}

let p = Person()
p.name = "zhang"

print("\(p.dataList)")
print(p.title)


