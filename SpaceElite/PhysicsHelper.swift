//
//  PhysicsHelper.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/6/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit


class PhysicsHelper: SKNode {
    class func setNodePhysics(_ boostSize: CGSize, boostColor: UIColor, name: String, velocity: CGFloat ) -> SKSpriteNode {
        let boost = SKSpriteNode(color: boostColor, size: boostSize)
    
        boost.physicsBody = SKPhysicsBody(rectangleOf: boostSize)
        boost.physicsBody?.isDynamic = true
        boost.physicsBody?.usesPreciseCollisionDetection = true
        boost.physicsBody?.affectedByGravity = false
        boost.name = name
        
        return boost
    }
}
