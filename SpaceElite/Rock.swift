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
        let boostColor = UIColor.blue
        let boostSize = CGSize(width: 20, height: 20)

        let boost = PhysicsHelper.setNodePhysics(boostSize, boostColor: boostColor, name: "Rock", velocity: -550)
        
//        boost.texture = SKTexture(imageNamed: "Spaceship")
//        boost.physicsBody = SKPhysicsBody(rectangleOfSize: boostSize)
//        boost.physicsBody?.allowsRotation = false
        
        boost.zPosition = 20
        
        return boost
    }
}
