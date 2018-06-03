//: [Previous](@previous)

import Foundation

/*
 OC中switch的特点：
   表示达是一个整数
 如果内部定义变量，需要使用{}指明作用域
 每一个case都需要break
 
 
 swift switch特点
 1,值可以是任何类型
 2,作用域仅在case内部
 3，每一个case都需要有代码
 */


let name = "老王"
switch name {
    case "老王":
        let age = 80
    case "老李","老张":
        print("朋友")
    default:
        print("other")
}
