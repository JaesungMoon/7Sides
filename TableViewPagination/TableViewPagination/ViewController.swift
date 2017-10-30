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
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let _ = loadMore()
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
    func loadMore() ->[IndexPath] {
        var paths = [IndexPath]()
        for _ in 0..<20 {
            count += 1
            data.append("items: \(count)")
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
