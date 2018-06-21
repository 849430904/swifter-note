//: [Previous](@previous)

import Foundation

//以下这种写法在swift3中已经被废弃了
/*
for var i = 0; i < 10; i++ {
    print(i)
}
*/

//从0-9
for i in 0..<10 {
    print(i)
}

print("------")
let range = 0...10
for i in 0...10 {//0-10
    print(i)
}
print("------")
for i in range {//0-10
    print(i)
}

var datalist = ["a","b"]
for _ in 0..<datalist.count {
   
}

for index in 0..<datalist.count {
    
}




