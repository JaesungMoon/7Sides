//
//  ViewController.swift
//  FirestoreTutorial
//
//  Created by JaesungMoon on 2017/11/05.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let db = Firestore.firestore()
        db.collection("users").whereField("name", isEqualTo: "Moon").order(by: "age", descending: true).getDocuments { (snapshot, error) in
            if error != nil {
                print(error)
            } else {
                for document in (snapshot?.documents)! {
                    
                    if let name = document.data()["name"] as? String {
                        print("name = \(name)")
                        if let age = document.data()["age"] as? Int {
                            print(age)
                        }
                    }
                    
                    
                    
                    
                    
                }
            }
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

