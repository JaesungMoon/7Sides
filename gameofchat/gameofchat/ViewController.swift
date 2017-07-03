//
//  ViewController.swift
//  gameofchat
//
//  Created by JaesungMoon on 2017/07/03.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        
    }
    func handleLogout(){
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
 
}

