//: [Previous](@previous)

import Foundation

//格式func 函数名(形参列表) -> 返回类型 { //代码实现}
func sum(x: Int,y: Int) -> Int{
    return x + y
}

//函数函数：函数名（值1,函数名：值2）
sum(x: 10, y: 20)

//外部参数 num1 num2外部参数，是供外部调用的程序员参考的，保证函数的语义更加清晰
//x ,y 为内部参数，函数内部使用
func sum1(num1 x: Int,num2 y: Int) -> Int{//n
    return x + y
}

sum1(num1: 2, num2: 4)

//返回值 ->
/*
 
 没有返回值，有三种写法，主要是为了闭包
 1，直接省略
 2，->Void
 3 ->()
 */
func demo() ->Void{
    print("xx")
}


