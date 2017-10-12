//
//  AppDelegate.swift
//  MyFirstFirestore
//
//  Created by JaesungMoon on 2017/10/13.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit
import Firebase



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        let db = Firestore.firestore()
        
        db.collection("cities").document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA"
        ]) { (error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("Document was successfully created")
            }
        }
        
        return true
    }

}

