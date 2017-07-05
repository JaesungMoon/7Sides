//
//  ViewController.swift
//  gameofchat
//
//  Created by JaesungMoon on 2017/07/03.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ref = FIRDatabase.database().reference(fromURL: "https://gameofchat-995de.firebaseio.com/")
        ref.updateChildValues(["someValue": 123123])
        //認証してないためpermission_denied
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        
    }
    func handleLogout(){
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
 
}

