//: [Previous](@previous)

import Foundation

let num = 20
/*
 
   1,没有()
 2，必须有{}
 3,没有非0即真。swift中中有true / flase
 */
if num > 10 {//条件必须指明逻辑
    print("大于10")
}


/*
 
 if (!dataList){//oc中写法
 
 }
 if _datalist == nil{//swift中写法
 
 
 }
 */

//三目
//swift中三目用的非常多
let a = 10
let b = 20

let c = a > b ? 100 : 100;

//在swift中，如果不注意，会让代码写的非常丑陋


