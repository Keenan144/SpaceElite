//
//  ViewHelper.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class ViewHelper: SKScene {
    class func skviewSettings(_ skView: SKView) -> SKView {
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        return skView
    }
    
    class func sceneViewSettings(_ scene: SKScene, skView: SKView) -> SKScene {
        scene.scaleMode = .resizeFill
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.size = skView.bounds.size
        return scene
    }
    
    class func createButton(_ text: String, name: String, xCord: CGFloat, yChord: CGFloat, fontSize: CGFloat, zPosition: CGFloat) -> SKLabelNode {
        let label = SKLabelNode(fontNamed: "Arial")
        label.text = text
        label.name = name
        label.position = CGPoint(x: (xCord), y: (yChord))
        label.fontSize = fontSize
        label.zPosition = zPosition
        return label
    }
    
    class func createExitButton(xCord: CGFloat, yChord: CGFloat) -> SKNode {
        let buttonSize = CGSize(width: 30, height: 30)
        let button = SKSpriteNode(color: UIColor.gray, size: buttonSize)
        button.zPosition = 100
        button.position = CGPoint(x: (xCord), y: (yChord))
        button.name = "BTN-resume"
        button.texture = SKTexture(imageNamed: "BTN_exit_01")
        return button
    }
}
