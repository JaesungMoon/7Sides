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
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "gameBackground")
        background.size = self.size;
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = -1
        self.addChild(background)
        
        
    }
}
