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
        addBackButton()
    }
    
    private func addDifficultyButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Difficulty"
        label.name = "BTN-difficulty"
        label.position = CGPoint(x: 110, y: -32)
        label.zPosition = 20
        label.fontSize = 22
        Background?.addChild(label)
    }
    
    private func addAccountSettingsButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Account Settings"
        label.name = "BTN-accountSettings"
        label.position = CGPoint(x: 90, y: 20)
        label.zPosition = 20
        label.fontSize = 22
        Background?.addChild(label)
    }
    
    private func addBackButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Back"
        label.name = "BTN-loadMenuScene"
        label.position = CGPoint(x: 115, y: -160)
        label.zPosition = 20
        label.fontSize = 35
        Background?.addChild(label)
    }
}

