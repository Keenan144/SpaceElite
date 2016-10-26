//
//  ViewHelper.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class ViewHelper: SKScene {
    class func skviewSettings(_ skView: SKView) {
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
    }
    
    class func sceneViewSettings(_ scene: SKScene, skView: SKView) {
        scene.scaleMode = .resizeFill
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.size = skView.bounds.size
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
    
    class func createSKSpriteNode(xCord: CGFloat, yCord: CGFloat, color: UIColor, width: CGFloat, height: CGFloat, zPosition: CGFloat, name: String, texture: SKTexture) -> SKNode {
        let nodeSize = CGSize(width: width, height: height)
        let node = SKSpriteNode(color: color, size: nodeSize)
        node.zPosition = zPosition
        node.position = CGPoint(x: (xCord), y: (yCord))
        node.name = name
        node.texture = texture
        
        return node
    }
}
