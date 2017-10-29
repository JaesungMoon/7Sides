//
//  Sweat.swift
//  MyFirstFirestore
//
//  Created by JaesungMoon on 2017/10/30.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import Foundation
import Firebase

protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}

struct Sweat {
    var name: String
    var content: String
    var timeStamp: Date
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "content": content,
            "timeStamp": timeStamp]
    }
}

extension Sweat: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String
            , let content = dictionary["content"] as? String
            , let timeStamp = dictionary["timeStamp"] as? Date else { return nil }
        self.init(name: name, content: content, timeStamp: timeStamp)
    }
}
