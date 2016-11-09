//
//  ChooseShipBackground.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class ChooseShipBackground: SKNode {
    var Background: SKScene?
    var size: CGSize
    
    init (ChooseShipScene:SKScene) {
        Background = ChooseShipScene
        size = ChooseShipScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBackground() {
        let bg = SKSpriteNode(imageNamed: "Background")
        bg.size = size
        bg.zPosition = 10
        Background!.addChild(bg)
    }
}
