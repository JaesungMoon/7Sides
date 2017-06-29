//
//  ViewController.swift
//  EmptyApp
//
//  Created by 文 載盛(B04680) on 2017/06/21.
//  Copyright © 2017年 jaesung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let numviewPerRow = 15
    
    var cells = [String: UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let width = view.frame.width / CGFloat(numviewPerRow)
        
        for j in 0...30{
            for i in 0...numviewPerRow{
                let cellView = UIView()
                cellView.backgroundColor = randomColor()
                cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(cellView)
                
                let key = "\(i)|\(j)"
                cells[key] = cellView
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    func handlePan(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: view)
//        print(location)
        
        let width = view.frame.width / CGFloat(numviewPerRow)
        
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        
        print(i, j)
        let key = "\(i)|\(j)"
        let cellView = cells[key]
        cellView?.backgroundColor = .white
        
//        var loopCount = 0
//        for subview in view.subviews{
//            if subview.frame.contains(location){
//                subview.backgroundColor = .black
////                print("loopCount:", loopCount)
//            }
//            loopCount += 1
//        }
    }
    fileprivate func randomColor() ->  UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1);
    }

}

