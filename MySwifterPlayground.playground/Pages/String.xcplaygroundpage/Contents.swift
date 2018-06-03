//: [Previous](@previous)

import Foundation
import UIKit

/*
    String 结构体 ，效率比对象高，一般推荐使用String  , 支持遍历
 
    NSString  继承自NSObject
 */
var str:String = "Hello, playground"


//支持遍历
for c in str.characters {
    print(c)
}

//字符串拼接
let name = "老王"
let age = 90
let title = "小张"

print(name + String(age) + title)
// \(变量名)就会自动拼接
print("\(name)\(age)\(title)")

//格式化怎么办？
let h = 9
let m = 5
let s = 8
let timeStr = "\(h)\(m)\(s)"
//注意参数以数组的形式输入
let timeStr1 = String(format: "%02d:%02d:%02d",arguments:[h,m,s])


//在swift语法变迁中，Range的变化非常大,最好把string修改为了NSString
(str as NSString).substring(with: NSMakeRange(0, 2))

//如果遇到简单的取值可以如下：
str.substring(from: "H".endIndex)




