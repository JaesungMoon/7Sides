//: Playground - noun: a place where people can play

import UIKit

func filterLessThanValue(value: Int, numbers: [Int]) -> [Int] {
    var filteredSetOfNumbers = [Int]()
    for num in numbers {
        if num < value {
            filteredSetOfNumbers.append(num)
        }
    }
    return filteredSetOfNumbers
}

func filterWithPredicateClosure(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filteredSetOfNumbers = [Int]()
    for num in numbers {
        //preform some condition check here
        if closure(num) {
            filteredSetOfNumbers.append(num)
        }
    }
    return filteredSetOfNumbers
}
//let myClosure = (Int) -> Bool { (num) -> Bool in
//    return num < 5
//}

func greaterThanThree(value: Int) -> Bool {
    return value > 3
}

func divisibleByFive(value: Int) -> Bool {
    return value % 5 == 0
}

let filteredList = filterWithPredicateClosure(closure: divisibleByFive, numbers: [1,2,3,4,16,15,30,30])

print(filteredList)

//let filteredList = filterWithPredicateClosure(closure: greaterThanThree, numbers: [1, 2, 3, 4, 5, 10])


//let filteredList = filterWithPredicateClosure(closure: { (num) -> Bool in
//    return num < 5
//}, numbers: [1, 2, 3, 4, 5, 10])

//let filteredList = filterLessThanValue(value: 3, numbers: [1, 2, 3, 4, 5, 10])
//print(filteredList)
