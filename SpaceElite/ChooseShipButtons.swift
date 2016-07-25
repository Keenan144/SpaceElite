//
//  ChooseShipButtons.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class ChooseShipButtons: SKNode {
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
    
    func addButtons() {
        addBackButton()
    }
    
    private func addBackButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Back"
        label.name = "BTN-loadSettingsScene"
        label.position = CGPoint(x: (size.width / 4), y: (0 - (size.height / 2.5)))
        label.fontSize = (size.width / 12)
        label.zPosition = 20
        Background?.addChild(label)
    }
}
