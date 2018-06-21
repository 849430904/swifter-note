//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// Optional 可选 可以有值，可以为nil

//init? 说明可能无法实例化 url
let url = URL(string:"http://www.baidu.com")
//let nsUrl = NSURL(string:"http://www.baidu.com/中国")
//! 强行解包 ，程序员认为这里url一定有值，一旦程序崩溃，就会停止此处
//错误提示是让程序员思考一下,代码的安全性更好
//let request = NSURLRequest(URL: url!)

if url != nil {
   let request = NSURLRequest(url: url!)//swift3的写法
   // let request = NSURLRequest(URL: nsUrl!)//swift2的写法
}

//提示：可选项是所有OC程序员开始最痛苦的一关

// if let 判断并且赋值

if let myURL = url {//确保myURL一定有值，才会进入分支
    print(myURL)//myURL一定有值
}

var name : String? = "李四"//?可以为空
//var age : Int? = 18
var age : Int? = nil
if let oName = name,let oAge = age {//同时有值才进入分支
    print(oName + String(oAge))
}


//  ??  操作符 ,常见的运行场景，表格要返回数据数量
var dataList: [String]?
//dataList? 表示datalist可能为nil,如果为nil，.count不会报错，仍然返因nil；如果不为Nil就返回count计数
let count = dataList?.count ?? 0 //如果dataList为nil，就使用??后面的字符串，否则使用dataList的结果

// ！表示程序员承诺dataList一定有值，如果为nil，程序就崩
// 每一次写!强制解包，一定要思考
var count1 = dataList?.count

let cName = name ?? "abc"//如果name为nil，就使用??后面的字符串，否则使用name的结果


