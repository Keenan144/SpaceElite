//
//  LeaderboardsBackground.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class LeaderboardsBackground: SKNode {
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
    
    func addBackground() {
        let bg = SKSpriteNode(imageNamed: "Background")
        bg.size = size
        bg.zPosition = 10
        Background!.addChild(bg)
    }
    
    func addGlitter() {
        //        TODO: Need images for circles, set rotate animation
        //        addCircles()
    }
    
    fileprivate func addCircles() {
        let Circle1 = SKShapeNode(circleOfRadius: 500 ) // Size of Circle = Radius setting.
        let Circle2 = SKShapeNode(circleOfRadius: 500 ) // Size of Circle = Radius setting.
        Circle1.position = CGPoint(x: 400, y: -50)  //touch location passed from touchesBegan.
        Circle2.position = CGPoint(x: 200, y: -500)  //touch location passed from touchesBegan.
        Circle1.name = "Circle1"
        Circle2.name = "Circle2"
        Circle1.strokeColor = SKColor.white
        Circle1.glowWidth = 1.0
        Circle1.fillColor = SKColor.clear
        Circle1.zPosition = 20
        Circle2.strokeColor = SKColor.white
        Circle2.glowWidth = 1.0
        Circle2.fillColor = SKColor.clear
        Circle2.zPosition = 20
        Background!.addChild(Circle1)
        Background!.addChild(Circle2)
    }
}

