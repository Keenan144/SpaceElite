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
    
    fileprivate func addSettingsButton() {
        let label = ViewHelper.createButton("Manage Hanger", name: "BTN-loadSettingsScene", xCord: (size.width / 5), yChord: (0 - (size.height / 10)), fontSize: (size.width / 18), zPosition: 20)

        Background?.addChild(label)
    }
    
    fileprivate func addLeaderboardsButton() {
        let label = ViewHelper.createButton("Top Scores", name: "BTN-loadLeaderboardsScene", xCord: (size.width / 4), yChord: (0 - (size.height / 5)), fontSize: (size.width / 18), zPosition: 20)

        Background?.addChild(label)
    }
    
    fileprivate func addStartGameButton() {
        let label = ViewHelper.createButton("Launch", name: "BTN-loadGame", xCord: (size.width / 4), yChord: (0 - (size.height / 2.5)), fontSize: (size.width / 12), zPosition: 20)

        Background?.addChild(label)
    }
}
