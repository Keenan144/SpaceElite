//
//  Rock.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/6/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class Rock: SKSpriteNode {
    
    class func spawn() -> SKSpriteNode {
        let boostColor = UIColor.blueColor()
        let boostSize = CGSize(width: 30, height: 40)
        
        let boost = PhysicsHelper.setNodePhysics(boostSize, boostColor: boostColor, name: "Rock", velocity: -550)
        
        boost.texture = SKTexture(imageNamed: "Rock")
        boost.physicsBody = SKPhysicsBody(texture: boost.texture!, alphaThreshold: 0, size: boostSize)
        boost.physicsBody?.allowsRotation = false
        
        return boost
    }
}
