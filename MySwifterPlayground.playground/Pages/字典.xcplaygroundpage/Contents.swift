//: Playground - noun: a place where people can play
import Foundation
import UIKit


//定义字典 [String:NSObject]
//key是字符串， value任意类型
//var dict = ["name":"zhang","age":18]//swift3中这样写是错误的


var dict = ["name":"zhang","age":18] as [String : Any]//swift3中要声明类型
//如果key存在，会覆盖原来的值
dict["name"] = "lisi"
//如果key不存在，会新建一个Key
dict["height"] = 190


//字典的遍历
for (k,v) in dict {//k,v可以随便写，前面是key,后面是value
    print("\(k) = \(v)")
}


//字典的合并
let dict2 = ["title":"老板","name":"老王"]//let
for (k,v) in dict2 {//k,v可以随便写，前面是key,后面是value
    dict[k] = v
}

dict


