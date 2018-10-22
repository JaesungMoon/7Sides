//
//  GameScene.swift
//  7 Sides
//
//  Created by 文 載盛(B04680) on 2017/05/30.
//  Copyright © 2017年 jaesung. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var colorWheelBase = SKShapeNode()
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "gameBackground")
        background.size = self.size;
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = -1
        self.addChild(background)
        
        colorWheelBase = SKShapeNode(rectOf: CGSize(width: self.size.width*0.8, height: self.size.width*0.8))
        colorWheelBase.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        colorWheelBase.fillColor = SKColor.red
        colorWheelBase.strokeColor = SKColor.red
        self.addChild(colorWheelBase)
        
        prepColorWheel()
        
    }
    func prepColorWheel(){
        
        for _ in 0 ... 6 {
            let side = SKSpriteNode(imageNamed: "side_Blue")
            let basePosition = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
            side.position = convert(basePosition, to: colorWheelBase)
            side.zRotation = -colorWheelBase.zRotation;
            colorWheelBase.addChild(side)
            
            colorWheelBase.zRotation += convertDegreeToRadians(degress: 360/7)
        }
        
        
        
    }
}
