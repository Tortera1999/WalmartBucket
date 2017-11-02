//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var arr = [String]()
arr.append("hi")
arr.append("end")
arr.append("bye")
arr.append("in the end")

for element in arr {
    print(element)
}

print(arr[2])

for i in 0..<arr.count {
    print(arr[i])
    print("")
}



var dictionary = [String: String]()

dictionary["Hey"] = "Bye"
dictionary["Nikhil"] = "Freshman"

for (key, value) in dictionary{
    print("The value is \(value) for the key \(key)")
}



var opt:Int? = 4

if let value = opt {
    print(value)
}
else{
    print("Nill")
}
print("")




