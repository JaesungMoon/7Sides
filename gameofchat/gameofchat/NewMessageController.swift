//
//  NewMessageController.swift
//  gameofchat
//
//  Created by JaesungMoon on 2017/07/17.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NewMessageController: UITableViewController {
    let cellId = "cellId"
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Calcel", style: .plain, target: self, action: #selector(handleCancel))
        
        fetchUser()
    }
    
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
        
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User()
                
                // if use this setter, your app will crash if your 
                user.setValuesForKeys(dictionary)
                print("name = \(String(describing: user.name)), email = \(String(describing: user.email))")
            }
            
            print("user found")
            
            print(snapshot)
            
        }, withCancel: nil)
    }
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let use a hack for now
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "Dummy"
        
        return cell
    }
    
}