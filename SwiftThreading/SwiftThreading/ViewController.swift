//
//  ViewController.swift
//  SwiftThreading
//
//  Created by JaesungMoon on 2017/10/23.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableData: [ModelData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let start = Date()
        
        // DispatchQoS.userInteractive
        // DispatchQoS.userInitiated
        // DispatchQoS.background
        
        //async: your program doesn't wait for code to finish
        //sync: your program waits for code/task to finsh before countiuning to the next task
        
        
        //closure: Closures are self-contained blocks of functionality that cna be passed around and used in your code.
        DispatchQueue.global(qos: .userInteractive).async {
            Data.getData(completion: { (data) in
                self.tableData = data
                self.tableView.reloadData()
            })
            
        }
        
        let end = Date()
        print("Elapsed Time: \(end.timeIntervalSince(start))")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let data = tableData[indexPath.row]
        cell.textLabel?.text = data.name
        return cell
    }
}

