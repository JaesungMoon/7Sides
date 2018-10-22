//
//  ViewController.swift
//  AutoLayoutAnimation
//
//  Created by JaesungMoon on 2018/03/23.
//  Copyright © 2018年 jaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "my_profile"))
        // this enables autolayout
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAnimate)))
        return iv
    }()
    
    @objc func handleAnimate() {
        print("handleAnimate")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }


}

