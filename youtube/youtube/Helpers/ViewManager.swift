//
//  ViewManager.swift
//  youtube
//
//  Created by JaesungMoon on 2017/08/06.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import Foundation
import UIKit

struct ViewManager {
    
    static let rootViewController = UIApplication.shared.keyWindow?.rootViewController
    
    static let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
    
    static var currentWindow: UIWindow? {
        if let window = UIApplication.shared.keyWindow {
            return window
        } else {
            return UIApplication.shared.windows[0]
        }
    }
    
    // デフォルトFloat(44)としてUnwrap
    static func navigationBarHeight(callFrom: UIViewController) -> CGFloat {
        return callFrom.navigationController?.navigationBar.frame.size.height ?? 44
    }
}
