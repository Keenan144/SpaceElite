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
        let boostSize = CGSize(width: 40, height: 40)

        let boost = PhysicsHelper.setNodePhysics(boostSize, boostColor: boostColor, name: "Rock")
        
        boost.texture = SKTexture(imageNamed: "NODE_rock_02")
        boost.physicsBody = SKPhysicsBody(rectangleOf: boostSize)
        boost.physicsBody?.allowsRotation = false
        
        boost.zPosition = 20
        
        return boost
    }
}
