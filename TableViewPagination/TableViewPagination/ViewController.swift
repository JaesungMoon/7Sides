//
//  ViewController.swift
//  TableViewPagination
//
//  Created by JaesungMoon on 2017/10/31.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var data = [String]()
    
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let _ = loadMore()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(populate), for: .valueChanged)
        tableView.addSubview(refresher)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        if indexPath.row < data.count {
            cell.textLabel?.text = data[indexPath.row]
        } else {
            cell.textLabel?.text = "Loading..."
            insertMore()
        }
        return cell
    }
    
    func populate() {
        DispatchQueue.global().async {
            sleep(2)
            self.data.removeAll()
            for i in 1...100 {
                self.data.append("refresh item: \(i)")
            }
            DispatchQueue.main.async {// what's diffrents between OperationQueue.main.addOperation
                self.refresher.endRefreshing()
                self.tableView.reloadData()
            }
            
        }
    }
    
    func loadMore() ->[IndexPath] {
        var paths = [IndexPath]()
        for _ in 0..<20 {
            
            data.append("load more items: \(data.count)")
            paths.append(IndexPath(row: data.count - 1, section: 0))
        }
        return paths
    }
    
    func insertMore() {
        DispatchQueue.global().async {
            sleep(2)
            let paths = self.loadMore()
            OperationQueue.main.addOperation {
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: paths, with: .top)
                self.tableView.endUpdates()
            }
        }
    }
}
