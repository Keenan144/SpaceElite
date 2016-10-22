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
    var movementTimer = Timer()
    
    init (GameScene:SKScene) {
        Background = GameScene
        size = GameScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var health = Int()
    
    func spawn(_ shipCategory: UInt32, rockCategory: UInt32) -> SKNode {
        let shipSize = CGSize(width: 60, height: 60)
        let ship = SKSpriteNode(color: UIColor.gray, size: shipSize)
        
//        ship.texture = SKTexture(imageNamed: "Spaceship")
        
//        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, alphaThreshold: 0, size: shipSize)
        ship.physicsBody?.isDynamic = false
        ship.physicsBody?.collisionBitMask = 1;
        ship.physicsBody?.usesPreciseCollisionDetection = true
        ship.physicsBody?.categoryBitMask = shipCategory
        ship.physicsBody?.contactTestBitMask = rockCategory
        ship.position = CGPoint(x: 0, y: ((size.height / 2) + size.height))
        ship.zPosition = 20
        ship.name = "Ship"
        
        print("ENEMY: spawn")
        Background!.addChild(ship)
        let action = SKAction.moveTo(y: (0 + size.height / 4), duration: 2.0)
        ship.run(action)
        return ship
    }
    
    func move(_ enemy: SKNode) {
        if enemy.position.x > 1 {
            let cord = FunctionHelper().randomInRange(1, hi: 200) * -1
            let location = CGPoint(x: cord, y: FunctionHelper().randomInRange(size.height / 4, hi: size.height / 3))
            let moveAction = SKAction.move(to: location, duration: 1.5)
            enemy.run(moveAction)
        } else {
            let cord = FunctionHelper().randomInRange(1, hi: 200)
            let location = CGPoint(x: cord, y: FunctionHelper().randomInRange(size.height / 4, hi: size.height / 3))
            let moveAction = SKAction.move(to: location, duration: 1.5)
            enemy.run(moveAction)
        }
    }
    
    class func deductHealth(_ damage: Int) {
        health = health - damage
    }
    
    class func shipHealth() -> Int {
        return health
    }
    
    class func dead() -> Bool {
        return checkHealth(health)
    }
    
    static func checkHealth(_ health: Int) -> Bool {
        if health > 1 {
            return false
        }
        return true
    }
    
    static func setShipHealth(_ newHealth: Int) {
        health = newHealth
    }
}
