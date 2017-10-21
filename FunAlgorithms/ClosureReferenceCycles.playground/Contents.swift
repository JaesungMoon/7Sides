//: Playground - noun: a place where people can play

import UIKit

// Closure Strong Reference Cycles

class HTMLElement {
    let name: String
    let text: String
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    
    lazy var asHTML: () -> String = {  [weak self] in
        guard let this = self else { return "" }
        return "<\(this.name)>\(this.text)<\(this.name)>"
    }
    
    deinit {
        print("HTMLElement \(name) is being dellocated")
    }
    
}

//
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Some sample paragraph body text")

paragraph?.asHTML()

paragraph = nil
var hello = "hello workd"
print(hello)




