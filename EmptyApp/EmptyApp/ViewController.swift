//
//  ViewController.swift
//  EmptyApp
//
//  Created by 文 載盛(B04680) on 2017/06/21.
//  Copyright © 2017年 jaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numviewPerRow = 15
        let width = view.frame.width / CGFloat(numviewPerRow)
        
        for j in 0...30{
            for i in 0...numviewPerRow{
                let cellView = UIView()
                cellView.backgroundColor = randomColor()
                cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(cellView)
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    func handlePan(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: view)
        print(location)
    }
    fileprivate func randomColor() ->  UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1);
    }

}

