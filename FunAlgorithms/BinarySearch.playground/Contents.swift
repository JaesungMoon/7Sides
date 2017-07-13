//: Playground - noun: a place where people can play

import UIKit

let numbers = [1, 2, 4, 5, 6, 8, 9, 11, 13, 16, 17, 20]


func binarySearchForsearchValue(searchValue: Int, array: [Int]) -> Bool{
    
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        print("middleValue: \(middleValue), leftIndex: \(leftIndex), rightIndex: \(rightIndex) rightValue: \(array[rightIndex]), leftValue: \(array[leftIndex])")
        
        if middleValue == searchValue {
            return true
        }
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if searchValue > middleValue {
            leftIndex = middleIndex + 1
        }
    }
    
    return false
}

print(binarySearchForsearchValue(searchValue: 17, array: numbers))

//func linearSearchForsearchValue(searchValue: Int, array: [Int]) -> Bool{
//    for num in array {
//        if num == searchValue {
//            return true
//        }
//    }
//    return false
//}
//
//
//print(linearSearchForsearchValue(searchValue: 5, array: numbers))

