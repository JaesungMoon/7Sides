//
//  ViewController.swift
//  FBStreamAnimation
//
//  Created by JaesungMoon on 2017/10/17.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let curvedView = CurvedView(frame: CGRect(x: -view.frame.width, y: 0, width: view.frame.width*2, height: view.frame.height))
        LOG_TRACE(view.frame)
        curvedView.backgroundColor = .yellow
        view.addSubview(curvedView)

        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.repeat, .curveLinear,], animations: {
            LOG_TRACE("anim curvedView.center.x = \(curvedView.center.x)")
            curvedView.center.x += self.view.frame.width
            curvedView.path = customPath(x: curvedView.frame.width)
        }, completion: { result in
            LOG_TRACE("cimp curvedView.center.x = \(curvedView.center.x)")
        })
        
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    func handleTap() {
        (0...1).forEach{ (_) in
            generateAnimatedViews()
        }
    }
    
    fileprivate func generateAnimatedViews() {
        LOG_TRACE("")
        let imageView = UIImageView(image: #imageLiteral(resourceName: "facebook"))
        let dimension = 20 + drand48() * 10
        
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        view.addSubview(imageView)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath(x: 375).cgPath
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation, forKey: nil)
    }

}

func customPath(x: CGFloat) -> UIBezierPath {
    let path = UIBezierPath()
    let y: CGFloat = CGFloat((arc4random() % 5) * 100)
    LOG_TRACE("y = \(y)")
    path.move(to: CGPoint(x: 0, y: y))

    let endPoint = CGPoint(x: x/2, y: y)
    let cp1 = CGPoint(x: x / 2 / 3, y: y - 100)
    let cp2 = CGPoint(x: x / 2 / 3 * 2, y: y + 100)
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    
    let endPoint2 = CGPoint(x: x, y: y)
    let cp21 = CGPoint(x: x / 2 + x / 2 / 3, y: y - 100)
    let cp22 = CGPoint(x: x / 2 + x / 2 / 3 * 2, y: y + 100)
    path.addCurve(to: endPoint2, controlPoint1: cp21, controlPoint2: cp22)
    
    return path
}

class CurvedView: UIView {
    var path: UIBezierPath!
    var width: CGFloat!
    override func draw(_ rect: CGRect) {
        //do some fancy curve drawing
        width = rect.width
        
        path = customPath(x: rect.width)
        path.lineWidth = 3
        path.stroke()
        
    }
    func setPath(y: CGFloat) {
        LOG_TRACE("y = \(y)")
        path = customPath(x: width)
        path.lineWidth = 3
        path.stroke()
    }
}
