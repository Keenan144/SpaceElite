//
//  Enemy.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 7/29/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class Enemy: SKNode {
    
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
    
    static var health = Int()
    
    func spawn(shipCategory: UInt32, rockCategory: UInt32) -> SKNode {
        let shipSize = CGSize(width: 60, height: 60)
        let ship = SKSpriteNode(color: UIColor.grayColor(), size: shipSize)
        
//        ship.texture = SKTexture(imageNamed: "Spaceship")
        
//        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, alphaThreshold: 0, size: shipSize)
        ship.physicsBody?.dynamic = false
        ship.physicsBody?.collisionBitMask = 1;
        ship.physicsBody?.usesPreciseCollisionDetection = true
        ship.physicsBody?.categoryBitMask = shipCategory
        ship.physicsBody?.contactTestBitMask = rockCategory
        ship.position = CGPoint(x: 0, y: ((size.height / 2) + size.height))
        ship.zPosition = 20
        ship.name = "Ship"
        
        print("SPACESHIP: spawn")
        Background!.addChild(ship)
        let action = SKAction.moveToY((0 + size.height / 4), duration: 2.0)
        ship.runAction(action)
        return ship
    }
    
    func move(enemy: SKNode) {
        if enemy.position.x > 1 {
            let cord = FunctionHelper().randomInRange(1, hi: 200) * -1
            let location = CGPoint(x: cord, y: FunctionHelper().randomInRange(size.height / 4, hi: size.height / 3))
            let moveAction = SKAction.moveTo(location, duration: 1.5)
            enemy.runAction(moveAction)
        } else {
            let cord = FunctionHelper().randomInRange(1, hi: 200)
            let location = CGPoint(x: cord, y: FunctionHelper().randomInRange(size.height / 4, hi: size.height / 3))
            let moveAction = SKAction.moveTo(location, duration: 1.5)
            enemy.runAction(moveAction)
        }
    }
    
    class func deductHealth(damage: Int) {
        health = health - damage
    }
    
    class func shipHealth() -> Int {
        return health
    }
    
    class func dead() -> Bool {
        return checkHealth(health)
    }
    
    static func checkHealth(health: Int) -> Bool {
        if health > 1 {
            return false
        }
        return true
    }
    
    static func setShipHealth(newHealth: Int) {
        health = newHealth
    }
}
