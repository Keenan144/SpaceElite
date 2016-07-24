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
        label.name = "BTN-loadSettingsScene"
        label.position = CGPoint(x: (size.width / 5), y: (0 - (size.height / 10)))
        label.fontSize = (size.width / 18)
        label.zPosition = 20
        Background?.addChild(label)
    }
    
    private func addLeaderboardsButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Top Scores"
        label.name = "BTN-loadLeaderboardsScene"
        label.position = CGPoint(x: (size.width / 4), y: (0 - (size.height / 5)))
        label.fontSize = (size.width / 18)
        label.zPosition = 20
        Background?.addChild(label)
    }
    
    private func addStartGameButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Launch"
        label.name = "BTN-loadGame"
        label.position = CGPoint(x: (size.width / 4), y: (0 - (size.height / 2.5)))
        label.fontSize = (size.width / 12)
        label.zPosition = 20
        Background?.addChild(label)
    }
}
