//
//  GameBackground.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 7/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GameBackground: SKNode {
    var Background: SKScene?
    var size: CGSize
    
    init (GameScene:SKScene) {
        Background = GameScene
        size = GameScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBackground() {
        let bg = SKSpriteNode(imageNamed: "bg_stars_01")
        bg.size = size
        bg.zPosition = 10
        Background!.addChild(bg)
    }
}
