//
//  LeaderboardsLabels.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class LeaderboardsLabels: SKLabelNode {
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
    
    func addTitle() {
        addTitleLabel()
    }
    
    fileprivate func addTitleLabel() {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = "Leaderboards"
        label.name = "LBL-Title"
        label.position = CGPoint(x: (0), y: (0 + (size.height / 2.5)))
        label.fontSize = (size.width / 14)
        label.zPosition = 20
        //        label.fontColor = UIColor(red: 3.0, green: 169.0, blue: 244.0, alpha: 1.0)
        Background?.addChild(label)
    }
}
