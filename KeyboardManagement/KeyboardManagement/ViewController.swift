//
//  ViewController.swift
//  KeyboardManagement
//
//  Created by moon_jaesung on 2018/04/11.
//  Copyright © 2018年 moon_jaesung. All rights reserved.
// https://medium.com/@abhimuralidharan/ios-swift-3-0-keyboard-management-f3c35950b806

import UIKit

class ViewController: UIViewController {
    var scrollView: UIScrollView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let sc = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(sc)
        sc.backgroundColor = .yellow
        scrollView = sc
        
        let v1 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        sc.addSubview(v1)
        v1.backgroundColor = .green
        
    }
}

extension ViewController: UITextFieldDelegate {
        
}
