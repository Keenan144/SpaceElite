//
//  Boundaries.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 7/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class Boundaries: SKNode {
    
    let shipCategory: UInt32 = 0x1 << 1
    let rockCategory: UInt32 = 0x1 << 2
    let boundaryCategory: UInt32 = 0x1 << 3
    let healthCategory: UInt32 = 0x2 << 4
    
    var Background: SKScene?
    var size: CGSize
    
    init (GameScene:SKScene) {
        Background = GameScene
        size = GameScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBoundaries() {
    
    }
    
    func setBottomBoundary() {
        let boundary = setBottomBoundary(boundaryCategory, rockCategory: rockCategory, frame: self.frame)
        self.addChild(boundary)
    }
    
    func setRightSideBoundry() {
        let boundary = setRightSideBoundary(boundaryCategory, rockCategory: rockCategory, frame: self.frame)
        self.addChild(boundary)
        
    }
    
    func setLeftSideBoundry() {
        let boundary = setLeftSideBoundary(boundaryCategory, rockCategory: rockCategory, frame: self.frame)
        self.addChild(boundary)
        
    }
    
    func setBottomBoundary(boundaryCategory: UInt32, rockCategory: UInt32, frame: CGRect) -> SKSpriteNode {
        var boundary = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: frame.width, height: 1))
        boundary.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: frame.width, height: 1))
        boundary.position = CGPoint(x: frame.midX, y: frame.minY)
        boundary = setBoundary(boundary, boundaryCategory: boundaryCategory, rockCategory: rockCategory)
        print("Boundary.setBottom")
        return boundary
    }
    
    func setRightSideBoundary(boundaryCategory: UInt32, rockCategory: UInt32, frame: CGRect) -> SKSpriteNode {
        var boundary = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: 1, height: frame.height))
        boundary.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 1, height: frame.height))
        boundary.position = CGPoint(x: frame.maxX, y: frame.midY)
        boundary = setBoundary(boundary, boundaryCategory: boundaryCategory, rockCategory: rockCategory)
        print("Boundary.setRightSide")
        return boundary
    }
    
    func setLeftSideBoundary(boundaryCategory: UInt32, rockCategory: UInt32, frame: CGRect) -> SKSpriteNode {
        var boundary = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: 1, height: frame.height))
        boundary.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 1, height: frame.height))
        boundary.position = CGPoint(x: frame.minX, y: frame.midY)
        boundary = setBoundary(boundary, boundaryCategory: boundaryCategory, rockCategory: rockCategory)
        print("Boundary.setLeftSide")
        return boundary
    }
    
    func setBoundary(boundary: SKSpriteNode, boundaryCategory: UInt32, rockCategory: UInt32) -> SKSpriteNode {
        boundary.physicsBody?.dynamic = false
        boundary.physicsBody?.categoryBitMask = boundaryCategory
        boundary.physicsBody?.contactTestBitMask = rockCategory
        boundary.physicsBody?.collisionBitMask = 0;
        boundary.physicsBody?.usesPreciseCollisionDetection = true
        print("Boundary.set")
        return boundary
    }
}