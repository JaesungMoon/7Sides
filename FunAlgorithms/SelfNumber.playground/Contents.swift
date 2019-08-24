//: Playground - noun: a place where people can play

import UIKit

extension Int {
    var array: [Int] {
        return String(self).compactMap{ Int(String($0)) }
    }
}

func calcGenerate(x: Int) -> Int {
    var sum = x
    for val in x.array {
//        print("value = \(val)")
        sum += val
    }
//    print("sum = \(sum)")
    return sum
}
var list = [Int]()
for x in 1..<5001 {
    list.append(calcGenerate(x: x))
}
print("list.count = \(list.count)")

let unique = Array(Set(list))
var sum = 0
for value in unique {
    sum += value
}
print("sum = \(sum)")

