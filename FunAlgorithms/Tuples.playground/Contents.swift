//: Playground - noun: a place where people can play

import UIKit

// What are tuples?
let regularVariable = 1

let person = ("Billy", "Bob", "Joshnson")
print(person.0, person.1, person.2)

let p = (firstName: "Billy", middleName: "Bob", lastName: "Johnson")
print(p.firstName, p.middleName, p.lastName)

func multipy(x: Int, y: Int) -> Int {
    return x * y
}

multipy(x: 4, y: 3)

// will use a tuple as a return value

func divide(x: Int, y: Int) -> Int {
    return x / y
}

divide(x: 6, y: 2)



