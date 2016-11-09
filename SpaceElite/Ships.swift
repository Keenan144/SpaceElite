//
//  Ships.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 10/28/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class Ships: SKNode {
    
    var Background: SKScene?
    var size: CGSize
    
    init (ChooseShipScene:SKScene) {
        Background = ChooseShipScene
        size = ChooseShipScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func chooseThisShip(ship: SKNode) {
        GameState().setUserShip(value: ship.name!)
    }
    
    func renderShipsForSelection() {
        let ship00 = self.defaultShip()
        ship00.position = CGPoint(x: (0 - size.height / 5.5), y: 0)
        ship00.name = "Ship00"
        Background?.addChild(ship00)
        
        let ship01 = self.ship01()
        ship01.position = CGPoint(x: (0 - size.height / 15), y: 0)
        ship01.name = "Ship01"
        Background?.addChild(ship01)
        
        let ship02 = self.ship02()
        ship02.position = CGPoint(x: (0 + size.height / 5.5), y: 0)
        ship02.name = "Ship02"
        Background?.addChild(ship02)
        
        let ship03 = self.ship03()
        ship03.position = CGPoint(x: (0 + size.height / 15), y: 0)
        ship03.name = "Ship03"
        Background?.addChild(ship03)
    }
    
    func defaultShip() -> SKNode {
        let shipSize = CGSize(width: 60, height: 60)
        let ship = SKSpriteNode(color: UIColor.gray, size: shipSize)
        
        ship.texture = SKTexture(imageNamed: "Spaceship")
        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, alphaThreshold: 0, size: shipSize)
        
        return shipWithPhysics(ship: ship)
    }
    
    func ship01() -> SKNode {
        let shipSize = CGSize(width: 60, height: 60)
        let ship = SKSpriteNode(color: UIColor.gray, size: shipSize)
        
        ship.texture = SKTexture(imageNamed: "NODE_ship_01")
        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, alphaThreshold: 0, size: shipSize)
        
        return shipWithPhysics(ship: ship)
    }
    
    func ship02() -> SKNode {
        let shipSize = CGSize(width: 80, height: 60)
        let ship = SKSpriteNode(color: UIColor.gray, size: shipSize)
        
        ship.texture = SKTexture(imageNamed: "NODE_ship_02")
        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, alphaThreshold: 0, size: shipSize)
        
        return shipWithPhysics(ship: ship)
    }
    
    func ship03() -> SKNode {
        let shipSize = CGSize(width: 60, height: 60)
        let ship = SKSpriteNode(color: UIColor.gray, size: shipSize)
        
        ship.texture = SKTexture(imageNamed: "NODE_ship_03")
        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, alphaThreshold: 0, size: shipSize)
        
        return shipWithPhysics(ship: ship)
    }
    
    func shipWithPhysics(ship: SKNode) -> SKNode {
        ship.physicsBody?.isDynamic = false
        ship.physicsBody?.collisionBitMask = 1;
        ship.physicsBody?.usesPreciseCollisionDetection = true
        ship.physicsBody?.categoryBitMask = 0x1 << 1
        ship.physicsBody?.contactTestBitMask = 0x1 << 2
        //        ship.position = CGPoint(x: 0, y: (0 - size.height / 4))
        ship.zPosition = 20
        
        return ship
    }
}

