//
//  GamesceneButtons.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 7/29/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GamesceneButtons: SKNode {
    var Background: SKScene?
    var size: CGSize
    
    init (Gamescene:SKScene) {
        Background = Gamescene
        size = Gamescene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtons() {
        addBackButton()
    }
    
    func addHUD() {
        addSettingsButton()
        addLeaderboardsButton()
        addStartGameButton()
    }
    
    private func addBackButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "||"
        label.name = "BTN-pause"
        label.position = CGPoint(x: (size.width / 4), y: (0 - (size.height / 2.5)))
        label.fontSize = (size.width / 12)
        label.zPosition = 20
        Background?.addChild(label)
    }
    
    private func addSettingsButton() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Exit"
        label.name = "BTN-loadMenuScene"
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
        label.text = "Resume"
        label.name = "BTN-resume"
        label.position = CGPoint(x: (size.width / 4), y: (0 - (size.height / 2.5)))
        label.fontSize = (size.width / 12)
        label.zPosition = 20
        Background?.addChild(label)
    }
}
