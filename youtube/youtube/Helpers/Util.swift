//
//  Util.swift
//

import UIKit

public func LOG_TRACE<T>(_ message: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        var logMessage = ""
        if let stringObject = message as? String {
            logMessage = stringObject
        } else {
            let stringObject = String(describing: message)
            logMessage = stringObject
        }
        
        let fileExtension = file.ns.lastPathComponent.ns.pathExtension
        let fileName = file.ns.lastPathComponent.ns.deletingPathExtension
        
        print(fileName + "." + fileExtension + ":\(line) " + function + ": " + logMessage)
    #else
        
    #endif
}

private extension String {
    var ns: NSString { return self as NSString }
}
