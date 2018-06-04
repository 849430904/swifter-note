//: [Previous](@previous)

import Foundation
import UIKit

/*
 扩展:就是为一个已有的类、结构体、枚举类型或者协议类型添加新功能
 功能或用途：
     添加计算型属性和计算型类型属性
     定义实例方法和类型方法
     提供新的构造器
     定义下标
     定义和使用新的嵌套类型
     使一个已有类型符合某个协议
 */

class MyViewController: UIViewController {
    
}
extension MyViewController: UITableViewDelegate {//协议
    
}

extension UIImage {//为UIImage添加新功能
    static func imageWithColor(color: UIColor) -> UIImage? {//提供新的构造器|定义新的类方法
        return self.imageWithColor(color: color, size: CGSize.init(width: 1, height: 1))
    }
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage? {
        if size.width <= 0 || size.height <= 0 { return nil }
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension Double {//添加计算属性
    var km: Double { return self * 1_000.0 }
}
let oneInch = 25.4.km





