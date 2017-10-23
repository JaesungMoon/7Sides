//
//  Data.swift
//  SwiftThreading
//
//  Created by JaesungMoon on 2017/10/23.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit

struct ModelData {
    let name: String
    let image: UIImage
    let info: String
}

class Data {
    // parameter -> return
    // () -> ()
    
    // A closure is said to escape a function when the closure is passed as an argument to the function, BUT it is called after the function returns.
    
    static func getData(completion: ([ModelData]) -> Void) {
        var data: [ModelData] = []
        
        let info = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        data.append(ModelData(name: "会社員", image: #imageLiteral(resourceName: "icon_salary_man"), info: info))
        data.append(ModelData(name: "ドクター男子", image: #imageLiteral(resourceName: "icon_doctor_male"), info: info))
        data.append(ModelData(name: "ドクター女子", image: #imageLiteral(resourceName: "icon_doctor_female"), info: info))
        data.append(ModelData(name: "会社員", image: #imageLiteral(resourceName: "icon_salary_man"), info: info))
        data.append(ModelData(name: "ドクター男子", image: #imageLiteral(resourceName: "icon_doctor_male"), info: info))
        data.append(ModelData(name: "ドクター女子", image: #imageLiteral(resourceName: "icon_doctor_female"), info: info))
        data.append(ModelData(name: "会社員", image: #imageLiteral(resourceName: "icon_salary_man"), info: info))
        data.append(ModelData(name: "ドクター男子", image: #imageLiteral(resourceName: "icon_doctor_male"), info: info))
        data.append(ModelData(name: "ドクター女子", image: #imageLiteral(resourceName: "icon_doctor_female"), info: info))
        data.append(ModelData(name: "会社員", image: #imageLiteral(resourceName: "icon_salary_man"), info: info))
        data.append(ModelData(name: "ドクター男子", image: #imageLiteral(resourceName: "icon_doctor_male"), info: info))
        data.append(ModelData(name: "ドクター女子", image: #imageLiteral(resourceName: "icon_doctor_female"), info: info))
        
        sleep(2)
        completion(data)

    }
    
//    func completion(data: [ModelData]) {
//        
//    }
    
}
