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
    
    var selectedCell: UIView?
    
    func handlePan(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: view)
//        print(location)
        
        let width = view.frame.width / CGFloat(numviewPerRow)
        
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        
        print(i, j)
        let key = "\(i)|\(j)"
        
        guard let cellView = cells[key] else{ return }
        
        if selectedCell != cellView{
            view.bringSubview(toFront: cellView)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.selectedCell?.layer.transform = CATransform3DIdentity
                cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)
            }, completion: nil)
        }

        selectedCell = cellView
        
        if gesture.state == .ended {
            
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                cellView.layer.transform = CATransform3DIdentity
            }, completion: { (_) in
            })
        }
        
        
    }
    fileprivate func randomColor() ->  UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1);
    }

}

