//
//  MenuLabels.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/22/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class MenuLabels: SKLabelNode {
    var Background: SKScene?
    var size: CGSize
    
    init (MenuScene:SKScene) {
        Background = MenuScene
        size = MenuScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTitle() {
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "International Space Elite"
        label.name = "LBL-Title"
        label.position = CGPoint(x: (size.width / 35), y: (0 + (size.height / 20)))
        label.fontSize = (size.width / 14)
        label.zPosition = 20
//        label.fontColor = UIColor(red: 3.0, green: 169.0, blue: 244.0, alpha: 1.0)
        Background?.addChild(label)
    }
}
