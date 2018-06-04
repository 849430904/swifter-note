//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 枚举

/*
 枚举简单的说也是一种数据类型，只不过是这种数据类型只包含自定义的特定数据，它是一组有共同特性的数据的集合。
 
 Swift 的枚举类似于 Objective C 和 C 的结构，枚举的功能为:
 
 它声明在类中，可以通过实例化类来访问它的值。
 
 枚举也可以定义构造函数（initializers）来提供一个初始成员值；可以在原始的实现基础上扩展它们的功能。
 
 可以遵守协议（protocols）来提供标准的功能。
 
 语法
 
 Swift 中使用 enum 关键词来创建枚举并且把它们的整个定义放在一对大括号内：
 
 enum enumname {
 // 枚举定义放在这里
 }
 */

enum dayOfWeek{
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Firday
    case Saturday
}

var oneday = dayOfWeek.Firday
oneday = .Saturday //这样写是非常简单的

switch oneday {
case .Sunday:
    print("周日")
case .Monday:
    print("周1")
case .Tuesday:
    print("周2")
case .Wednesday:
    print("周3")
case .Thursday:
    print("周4")
case .Firday:
    print("周5")
case .Saturday:
    print("周6")
}

/*
 枚举中定义的值（如 Sunday，Monday，……和Saturday）是这个枚举的成员值（或成员）。case关键词表示一行新的成员值将被定义。
 
 注意： 和 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的dayOfWeek例子中，Sunday，Monday，……和Saturday不会隐式地赋值为0，1，……和6。相反，这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型。
 
 oneday 的类型可以在它被dayOfWeek的一个可能值初始化时推断出来。一旦weekDay被声明为一个dayOfWeek，你可以使用一个缩写语法（.）将其设置为另一个dayOfWeek的值：
 
 var weekDay = .THURSDAY
 
 当weekDay的类型已知时，再次为其赋值可以省略枚举名。使用显式类型的枚举值可以让代码具有更好的可读性。
 
 枚举可分为相关值与原始值。
 
 */


// 相关值与原始值的区别
/*
 以下实例中我们定义一个名为 Student 的枚举类型，它可以是 Name 的一个相关值（Int，Int，Int，Int），或者是 Mark 的一个字符串类型（String）相关值。
 */
enum student {
    case Name(String)
    case Mark(Int,Int,Int)
}

var stuName = student.Name("Jick")
var stuMarks = student.Mark(98, 99, 100)

switch stuName {
case .Name(let stuName):
    
    print("学生的名字是 \(stuName)")
case .Mark(let mark1,let mark2,let mark3):
    
    print("学生的成绩是\(mark1) \(mark2) \(mark3)")
}


// 原始值
/*
 原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。
 
 在原始值为整数的枚举时，不需要显式的为每一个成员赋值，Swift会自动为你赋值。
 
 例如，当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个值没有被赋初值，将会被自动置为0。
 
 */

enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

let yearMonth = Month.May.rawValue
print("数字月份为: \(yearMonth)。")




