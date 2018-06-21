//: [Previous](@previous)

import Foundation

//1.1 普通if与if let的比较
//1> 如果常量是可选项（Optional），if判断后仍然需要解包（!）
let name: String? = "老王"
let age: Int? = 10

if name != nil && age != nil {
    print(name! + String(age!))     // 输出:老王10
}


//2> 如果常量是可选项（Optional），if let判断后不需要解包（!），{ }内一定有值

let name2: String? = "老王"
let age2: Int? = 10

// if let 连用,判断对象的值是否为'nil'
if let nameNew = name2,
    let ageNew = age2 {
    
    // 进入分支后,nameNew 和 ageNew 一定有值
    print(nameNew + String(ageNew)) // 输出:老王10
}//nameNew和 ageNew的作用域仅在{}中


//guard
/*
1> guard let和if let刚好相反，guard let守护一定有值。如果没有，直接返回。
2> 通常判断是否有值之后，会做具体的逻辑实现，通常代码多
3> 如果用 if let凭空多了一层分支，guard let是降低分支层次的办法
4> guard let语法是 Swift 2.0 推出的
*/

func demo(name: String?, age: Int?) {
    guard let name = name,
        let age = age else {
            print("姓名或年龄为nil")
            return
    }
    /**
     * 'name'至此会有两个
     * 1.String  name('guard let'守护,等号右边的'name')
     * 2.String? name('guard let'守护,等号右边的'name')
     * 3.这里正常应该选择不带'?'的'name',但是即便是选择了('Optional'的'name'),编译器也会帮你更正过来,这就是取名的技巧
     */
    print(name + String(age))   // 输出:老王11('name'和'age'为不带'Optional'的)
}
demo(name: "老王", age: 11)


// if let演示
func demo2(name: String?, age: Int?) {
    if let name = name,
        let age = age {
        /**
         * 'name'至此只会有两个
         * 1.String  name('if let'守护,等号右边的'name',仅在'{}'作用域内有效)
         * 2.String? name('if let'守护,等号右边的'name')
         * 3.这里正常应该选择不带'?'的'name',但是即便是选择了('Optional'的'name'),编译器也会帮你更正过来,这就是取名的技巧
         * 4.如果'name'或'age'中有一个为'nil',或者都为'nil',下面就不会输出
         */
        print(name + String(age))   // 输出:老王11('name'和'age'为不带'Optional'的)
    }
    /**
     * 'name'至此只会有一个
     * 2.String? name(demo(name: String?)中的'name')
     * 3.这里正常应该选择不带'?'的'name',但是即便是选择了('Optional'的'name'),编译器也会帮你更正过来,这就是取名的技巧
     */
    print("demo(name: String?)中的'name'")
}
demo2(name: "老王", age: 11)

