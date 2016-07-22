//
//  MenuButtons.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/22/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class MenuButtons: SKNode {
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
    
    func addButtons() {
        addSettingsButton()
        addLeaderboardsButton()
        addStartGameButton()
    }
    
    private func addSettingsButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Manage Hanger"
        label.name = "BTN-GoSettings"
        label.position = CGPoint(x: 90, y: 20)
        label.zPosition = 20
        label.fontSize = 22
        Background?.addChild(label)
    }
    
    private func addLeaderboardsButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Top Scores"
        label.name = "BTN-GoLeaderboards"
        label.position = CGPoint(x: 110, y: -32)
        label.zPosition = 20
        label.fontSize = 22
        Background?.addChild(label)
    }
    
    private func addStartGameButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Launch"
        label.name = "BTN-StartGame"
        label.position = CGPoint(x: 110, y: -160)
        label.zPosition = 20
        label.fontSize = 35
        Background?.addChild(label)
    }
}
