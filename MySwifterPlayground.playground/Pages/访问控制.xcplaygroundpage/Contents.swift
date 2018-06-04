//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 访问控制
/*
 1、访问控制可以限定其他源文件或模块中代码对你代码的访问级别。就是限制你代码的访问权限相关的设置。
 2、你可以明确地给单个类型（类、结构体、枚举）设置访问级别，也可以给这些类型的属性、函数、初始化方法、基本类型、下标索引等设置访问级别。
 3、协议也可以被限定在一定的范围内使用，包括协议里的全局常量、变量和函数。
 3、访问控制基于模块与源文件。
 4、模块指的是以独立单元构建和发布的Framework或Application。在Swift 中的一个模块可以使用import关键字引入另外一个模块。
 5、源文件是单个的源代码文件，他通常俗语一个模块，源文件可以包含多个类和函数的定义。
 6、swift 代码中的实体提供了三种不同的访问级别：public （公开） 、private （私有）、internal（内部）
 访问级别       定义
 Public       可以访问自己模块中源文件里的任何实体，别人也可以通过引入该模块来访问源文件里的       所有实体。
 Internal    ：可以访问自己模块中源文件里的任何实体，但是别人不能访问该模块中源文件里的实体。
 Private    只能在当前源文件中使用的实体，称为私有实体。
 
 */

// 语法：
/*
 通过修饰符 public 、private、internal 来声明实体的访问级别。
 public class SomePublicClass {}
 internal class SomeInternalClass {}
 private class SomePrivateClass {}
 
 public var somePublicVariable = 0
 internal let someInternalConstant = 0
 private func somePrivateFunction() {}
 除非有特殊的说明，否则实体都使用默认的访问级别internal。
 */

// 函数的类型访问权限
// 函数的访问级别需要根据该函数的参数类型和返回类型的访问级别得出。
// 下面的例子定义了一个名为someFunction全局函数，并且没有明确地申明其访问级别。
/*
 func someFunction() -> (SomeInternalClass, SomePrivateClass) {
 // 函数实现
 }
 
 函数中其中一个类 SomeInternalClass 的访问级别是internal，另一个 SomePrivateClass 的访问级别是private。所以根据元组访问级别的原则，该元组的访问级别是private。
 
 什么是 元组访问级别的原则 ？参考简书链接：http://www.jianshu.com/p/6daa3e309235
 貌似不知道啊！！！！⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 
 */


// 枚举类型的访问权限
// 枚举成员的访问级别继承自该枚举，你不能为枚举的成员单独申明不同的访问级别。
// 实例：如下面的例子枚举 Student 被明确的申明为 public 级别，那么他的成员 Name、Mark 也是 public 级别。
public enum Student{
    case Name(String)
    case Mark(Int,Int,Int)
}

var studDetails = Student.Name("Swift")
var studMarks = Student.Mark(98,97,95)

switch studMarks {
case .Name(let studName):
    print("学生名: \(studName).")
case .Mark(let Mark1, let Mark2, let Mark3):
    print("学生成绩: \(Mark1),\(Mark2),\(Mark3)")
}


// 子类的访问权限
//子类的访问级别不得高于父类的访问级别。比如说，父类的访问级别是 internal,子类的访问级别就不能申明为 public

/*  下面的代码会报红色错误，是什么原因？⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 
 public class SuperClass {
 private func show() {
 print("超类")
 }
 }
 
 // 访问级别不能低于超类 internal > public
 internal class SubClass: SuperClass  {
 override internal func show() {
 print("子类")
 }
 }
 
 let sup = SuperClass()
 sup.show()
 
 let sub = SubClass()
 sub.show()
 
 */

// 常量、变量、属性、下标访问权限
/*
 
 常量、变量、属性不能拥有比它们的类型更高的访问级别。
 比如说，你定义一个public级别的属性，但是它的类型是private级别的，这是编译器所不允许的。
 同样，下标也不能拥有比索引类型或返回类型更高的访问级别。
 如果常量、变量、属性、下标索引的定义类型是private级别的，那么它们必须要明确的申明访问级别为private:
 private var privateInstance = SomePrivateClass()
 
 */


// getter 和 setter 访问权限
/*
 常量、变量、属性、下标索引的 getter 和 setter 的访问级别继承自他们所属的成员的访问级别。
 Setter的访问级别可以低于对应的Getter的访问级别，这样就可以控制变量、属性或下标索引的读写权限。
 */

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        } }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
// 打印 “The number of edits is 3”





