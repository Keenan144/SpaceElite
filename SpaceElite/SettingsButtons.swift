//
//  SettingsButtons.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class SettingsButtons: SKNode {
    var Background: SKScene?
    var size: CGSize
    
    init (SettingsScene:SKScene) {
        Background = SettingsScene
        size = SettingsScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtons() {
        addDifficultyButton()
        addAccountSettingsButton()
        addChooseShipButton()
        addBackButton()
    }
    
    private func addDifficultyButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Difficulty"
        label.name = "BTN-difficulty"
        label.position = CGPoint(x: (size.width / 3.4), y: (0 - (size.height / 3.9)))
        label.fontSize = (size.width / 18)
        label.zPosition = 20
        Background?.addChild(label)
    }
    
    private func addAccountSettingsButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Account Settings"
        label.name = "BTN-accountSettings"
        label.position = CGPoint(x: (size.width / 5), y: (0 - (size.height / 12)))
        label.fontSize = (size.width / 18)
        label.zPosition = 20
        Background?.addChild(label)
    }
    
    private func addChooseShipButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Choose Ship"
        label.name = "BTN-chooseShip"
        label.position = CGPoint(x: (size.width / 4), y: (0 - (size.height / 5.8)))
        label.fontSize = (size.width / 18)
        label.zPosition = 20
        Background?.addChild(label)
    }
    
    private func addBackButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Back"
        label.name = "BTN-loadMenuScene"
        label.position = CGPoint(x: (size.width / 4), y: (0 - (size.height / 2.5)))
        label.fontSize = (size.width / 12)
        label.zPosition = 20
        Background?.addChild(label)
    }
}

