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
        let boostSize = CGSize(width: 33, height: 33)
        
        let boost = PhysicsHelper.setNodePhysics(boostSize, boostColor: boostColor, name: "Health")
        
        boost.texture = SKTexture(imageNamed: "NODE_health_pack_01")

        boost.zPosition = 20
        
        return boost
    }
}
