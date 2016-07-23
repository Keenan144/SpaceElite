//
//  ViewHelper.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class ViewHelper: SKScene {
    class func skviewSettings(skView: SKView) -> SKView {
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        return skView
    }
    
    class func sceneViewSettings(scene: SKScene, skView: SKView) -> SKScene {
        scene.scaleMode = .AspectFill
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.size = skView.bounds.size
        return scene
    }
}