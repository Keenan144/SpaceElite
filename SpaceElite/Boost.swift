//
//  Boost.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/26/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class Boost: SKSpriteNode {
    
    class func spawn() -> SKSpriteNode {
        let boostColor = UIColor.green
        let boostSize = CGSize(width: 35, height: 35)
        
        let boost = PhysicsHelper.setNodePhysics(boostSize, boostColor: boostColor, name: "Health", velocity: -550)
        
        //        boost.texture = SKTexture(imageNamed: "Spaceship")
        //        boost.physicsBody = SKPhysicsBody(rectangleOfSize: boostSize)
        //        boost.physicsBody?.allowsRotation = false
        
        boost.zPosition = 20
        
        return boost
    }
}
