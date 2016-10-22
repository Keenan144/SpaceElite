//
//  LeaderboardsButtons.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class LeaderboardsButtons: SKNode {
    var Background: SKScene?
    var size: CGSize
    
    init (LeaderboardsScene:SKScene) {
        Background = LeaderboardsScene
        size = LeaderboardsScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtons() {
        addBackButton()
    }
    
    fileprivate func addBackButton() {
        let label = ViewHelper.createButton("Back", name: "BTN-loadMenuScene", xCord: (size.width / 4), yChord: (0 - (size.height / 2.5)), fontSize: (size.width / 12), zPosition: 20)

        Background?.addChild(label)
    }
}
