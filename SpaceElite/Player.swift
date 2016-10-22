//
//  Player.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 7/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class Player: SKNode {
    
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
    
    func spawn(_ shipCategory: UInt32, rockCategory: UInt32) -> SKNode {
        let shipSize = CGSize(width: 60, height: 60)
        let ship = SKSpriteNode(color: UIColor.gray, size: shipSize)
        
        ship.texture = SKTexture(imageNamed: "Spaceship")
        
        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, alphaThreshold: 0, size: shipSize)
        ship.physicsBody?.isDynamic = false
        ship.physicsBody?.collisionBitMask = 1;
        ship.physicsBody?.usesPreciseCollisionDetection = true
        ship.physicsBody?.categoryBitMask = shipCategory
        ship.physicsBody?.contactTestBitMask = rockCategory
        ship.position = CGPoint(x: 0, y: (0 - size.height / 4))
        ship.zPosition = 20
        ship.name = "Ship"
        
        print("SPACESHIP: spawn")
        Background!.addChild(ship)
        return ship
    }
    
    class func deductHealth(_ damage: Int) {
        health = health - damage
        print("Ship health --> {\(health)}")
    }
    
    class func shipHealth() -> Int {
        print("SPACESHIP: shiphealth")
        return health
    }
    
    class func dead() -> Bool {
        print("SPACESHIP: dead")
        return checkHealth(health)
    }
    
    static func checkHealth(_ health: Int) -> Bool {
        if health > 1 {
            print("SPACESHIP: checkHealth [FALSE]")
            return false
        }
        print("SPACESHIP: checkHealth [TRUE]")
        return true
    }
    
    static func setShipHealth(_ newHealth: Int) {
        print("SPACESHIP: setShipHealth")
        health = newHealth
    }
}
