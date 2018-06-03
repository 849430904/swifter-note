//: [Previous](@previous)

import Foundation
import UIKit
//如何[]定义数组

//[String]表示数组是存放字符串的数组
let array = ["zhang","lisi"]
//swift中，可以直接将数组放到数组中，不需要包装，可以放任何类型
//如果数组中存在的数据类型不一致，自动推导的格式是 NSObject
//let array1 = ["zhangsan",10,UIView()]//swift3中不能这样写
let array1:[Any] = ["zhangsan",10,UIView()]

//遍历数组
for item in array {
    print(item)
}


//可变 var ，不可变 let
var list = ["zhang","list"]//可变数组
list.append("wang")

//删除
//list.removeFirst()
//list
//list.removeLast()
//list
list.removeAll()
list
print(list.capacity)
//list.removeAll(keepCapacity: true)
print(list.capacity)

//数组容量的调试
//1，定义数组
var arrayM = [String]()
//2,追加内容
for i in 0..<16 {//如果数组的容易不够，再添加元素的时候，会在当前容量的基础上*2
    arrayM.append("hello \(i)")
    print("\(i) ====> \(arrayM.capacity)")
}


//定义数组，指定数组能够保存整数，并且实例化数组
var arrayM2 = [Int]()
//定义数组，指定数组能够保存整数,但没有被实例化
var arrayM3:[Int]
arrayM3 = [Int]()//实例化数组，容量为0
print(arrayM3.capacity)
arrayM3.append(1)

//定义数组，并且指定容量
var arrayM4 = [Int](repeating: 0, count: 32)//count数组容量 repeatValue填充的数组的内容

//数组的拼接
var arr1 = [1,2]
var arr2 = [3,4]
var arr3 = ["12","13"]
arr1 += arr2

//注意：在拼接的时候，数组的类型必须是一样的，否则无法拼接
//arr2 += arr3 //error

