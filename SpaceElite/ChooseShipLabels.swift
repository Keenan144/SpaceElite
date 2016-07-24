//
//  ChooseShipLabels.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class ChooseShipLabels: SKLabelNode {
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
    
    func addTitle() {
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "ChooseShip"
        label.name = "LBL-Title"
        label.position = CGPoint(x: 10, y: 100)
        label.zPosition = 20
        label.fontSize = 30
        //        label.fontColor = UIColor(red: 3.0, green: 169.0, blue: 244.0, alpha: 1.0)
        Background?.addChild(label)
    }
}
