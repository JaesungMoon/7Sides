//
//  ViewController.swift
//  MyFirstFirestore
//
//  Created by JaesungMoon on 2017/10/13.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    var db: Firestore!
    
    var sweatArray = [Sweat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
        loadData()
        checkForUpdate()
    }
    
    func loadData() {
        db.collection("sweats").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                self.sweatArray = querySnapshot!.documents.flatMap({Sweat(dictionary: $0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func checkForUpdate() {
        db.collection("sweats").whereField("timeStamp", isGreaterThan: Date()).addSnapshotListener { (querySnapshot, error) in
            guard let snapshot = querySnapshot else { return }
            
            snapshot.documentChanges.forEach({ (diff) in
                if diff.type == .added {
                    self.sweatArray.append(Sweat(dictionary: diff.document.data())!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
        }
    }
    
    @IBAction func handleAdd(_ sender: Any) {
        let composeAlert = UIAlertController(title: "New Sweat", message: "Enter your name and message", preferredStyle: .alert)
        composeAlert.addTextField { (textField) in
            textField.placeholder = "Your name"
        }
        composeAlert.addTextField { (textField) in
            textField.placeholder = "Your message"
        }
        composeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        composeAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action) in
            
            if let name = composeAlert.textFields?.first?.text, let content = composeAlert.textFields?.last?.text {
                let newSweat = Sweat(name: name, content: content, timeStamp: Date())
                
                var ref: DocumentReference? = nil
                ref = self.db.collection("sweats").addDocument(data: newSweat.dictionary) {
                    error in
                    
                    if let error = error {
                        print(error)
                    } else {
                        print("Document added whie ID: \(ref!.documentID)")
                    }
                    
                }
            }
            
        }))
        
        present(composeAlert, animated: true, completion: nil)
    }

}
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sweatArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        let sweat = sweatArray[indexPath.row]
        cell.textLabel?.text = "\(sweat.name): \(sweat.content)"
        cell.detailTextLabel?.text = "\(sweat.timeStamp)"
        return cell
    }
}

