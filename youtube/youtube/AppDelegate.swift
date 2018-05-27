//
//  AppDelegate.swift
//  youtube
//
//  Created by JaesungMoon on 2017/08/02.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    enum CommandType {
        case add
        case get
        case remove
        case evict
        case invalid // 無効なパラメーター
    }
    struct CommandStruct {
        var commandType: CommandType = .invalid
        var commandKey: Int?
        var commandValue: Int?
    }
    struct ValueAndUpdateTime {
        let value: Int
        let updateTime: TimeInterval
    }
var cacheMap = [Int: ValueAndUpdateTime]()
    
    func handleCommand(src: CommandStruct) -> String {
        var resultValue = ""
        switch(src.commandType) {
        case .add:
            if let key = src.commandKey, let value = src.commandValue {
                let today = Date();
                let now = today.timeIntervalSince1970
                cacheMap[key] = ValueAndUpdateTime(value: value, updateTime: now)
            }
        case .get:
            if let key = src.commandKey, let value = cacheMap[key]?.value {
                resultValue = "\(value)"
                let today = Date();
                let now = today.timeIntervalSince1970
                cacheMap[key] = ValueAndUpdateTime(value: value, updateTime: now)
            } else {
                resultValue = "-1"
            }
        case .remove:
            if let key = src.commandKey {
                if (cacheMap.removeValue(forKey: key) != nil) {
                } else {
                    resultValue = "-1"
                }
            }
        case .evict:
            let cacheArray = cacheMap.sorted() { $0.value.updateTime < $1.value.updateTime}
            if let lastItem = cacheArray.last {
                if (cacheMap.removeValue(forKey: lastItem.key)) != nil {
                } else {
                    resultValue = "-1"
                }
            }
            break
        default:
            assert(false)
            break
            
        }
        return resultValue
    }

    func parseCommand(inputs: [String]) -> CommandStruct {
        var result = CommandStruct()
        if let cmd = inputs.first {
            switch cmd {
            case "add":
                if inputs.count == 3, let key = Int(inputs[1]), let value = Int(inputs[2]) {
                    result.commandType = .add
                    result.commandKey = key
                    result.commandValue = value
                } else {
                    result.commandType = .invalid
                }
            case "get":
                if inputs.count == 2, let key = Int(inputs[1]) {
                    result.commandType = .get
                    result.commandKey = key
                } else {
                    result.commandType = .invalid
                }
                print("get")
            case "remove":
                if inputs.count == 2, let key = Int(inputs[1]) {
                    result.commandType = .remove
                    result.commandKey = key
                } else {
                    result.commandType = .invalid
                }
                print("remove")
            default:
                result.commandType = .invalid
            }
        }
        return result
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        var cmd: String? = "add 4 3"
        
        
        
//        while true {
            if let inputCommand = cmd {
                let inputs = inputCommand.components(separatedBy: " ")
                let command = parseCommand(inputs: inputs)
                let result = handleCommand(src: command)
                print("result = \(result)")
//                if commandType = .exit {
//                    print("stop")
//                    break
//                }
                
            
            }
//            break
//        }


            
        

        
        return true
//
//        var dupulicateList = [Character : Int]()
//        var sumCount = 0
////        if let input = readLine() {
//        let input = "foobarbaz"
//            for char in input {
//                if let count = dupulicateList[char], count == 1 {
//                    dupulicateList[char] = count + 1
//                } else {
//                    dupulicateList[char] = 1
//                }
//            }
////        }
        
        
//        var str = "124"
//        print("str.count = \(str.count)")
        
//        for char in str {
//             char
//        }
        
        if let name = readLine() {
            
            print("Hello \(name)!")
        }
//        for _ in 0..<10 {
//            print("hello")
//        }
        return true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        
        //get rid of black bar underneath navbar
        UINavigationBar.appearance().shadowImage = UIImage()
        //not work for current status
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        application.statusBarStyle = .lightContent
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)

        window?.addSubview(statusBarBackgroundView)
        window?.addConstraintWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
        window?.addConstraintWithFormat(format: "V:|[v0(20)]", views: statusBarBackgroundView)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

