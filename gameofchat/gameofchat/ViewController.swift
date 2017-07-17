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
import FirebaseAuth

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
        
    }
    func handleLogout(){
        do {
            try Auth.auth().signOut()
        }catch let logourError {
            print(logourError)
        }
        
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
 
}

